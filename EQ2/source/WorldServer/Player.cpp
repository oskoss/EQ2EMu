/*  
    EQ2Emulator:  Everquest II Server Emulator
    Copyright (C) 2007  EQ2EMulator Development Team (http://www.eq2emulator.net)

    This file is part of EQ2Emulator.

    EQ2Emulator is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    EQ2Emulator is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with EQ2Emulator.  If not, see <http://www.gnu.org/licenses/>.
*/
#include "Player.h"
#include "../common/MiscFunctions.h"
#include "World.h"
#include "WorldDatabase.h"
#include <math.h>
#include "classes.h"
#include "LuaInterface.h"
#include "../common/Log.h"
#include "Rules/Rules.h"
#include "Titles.h"
#include "Languages.h"
#include "SpellProcess.h"
#include <algorithm>
#include <regex>
#include "ClientPacketFunctions.h"

extern Classes classes;
extern WorldDatabase database;
extern World world;
extern ConfigReader configReader;
extern MasterSkillList master_skill_list;
extern MasterSpellList master_spell_list;
extern MasterQuestList master_quest_list;
extern Variables variables;
extern LuaInterface* lua_interface;
extern MasterItemList master_item_list;
extern RuleManager rule_manager;
extern MasterTitlesList master_titles_list;
extern MasterLanguagesList master_languages_list;

Player::Player(){
	tutorial_step = 0;
	char_id = 0;
	group = 0;
	appearance.pos.grid_id = 0;
	spawn_index = 0;
	info = 0;
	movement_packet = 0;
	fully_logged_in = false;
	last_movement_activity = 0;
	//speed = 0;
	packet_num = 0;
	range_attack = false;
	old_movement_packet = 0;
	charsheet_changed = false;
	quickbar_updated = false;
	custNPC = false;
	spawn_tmp_vis_xor_packet = 0;
	spawn_tmp_pos_xor_packet = 0;
	spawn_tmp_info_xor_packet = 0;
	pending_collection_reward = 0;
	pos_packet_speed = 0;

	LogWrite(MISC__TODO, 1, "TODO", "Add player commands here\n\t(%s, function: %s, line #: %i)", __FILE__, __FUNCTION__, __LINE__);

	appearance.display_name = 1;
	appearance.show_command_icon = 1;
	appearance.player_flag = 1;
	appearance.targetable = 1;
	appearance.show_level = 1;
	spell_count = 0;
	spell_orig_packet = 0;
	spell_xor_packet = 0;
	resurrecting = false;
	spawn_id = 1;
	spawn_type = 4;
	player_spawn_id_map[1] = this;
	player_spawn_reverse_id_map[this] = 1;
	MPlayerQuests.SetName("Player::MPlayerQuests");
	test_time = 0;
	returning_from_ld = false;
	away_message = "Sorry, I am A.F.K. (Away From Keyboard)";
	AddSecondaryEntityCommand("Inspect", 10000, "inspect_player", "", 0, 0);
	AddSecondaryEntityCommand("Who", 10000, "who", "", 0, 0);
	//  commented out commands a player canNOT use on themselves... move these to Client::HandleVerbRequest()?
	//AddSecondaryEntityCommand("Assist", 10, "assist", "", 0, 0);
	//AddSecondaryEntityCommand("Duel", 10, "duel", "", 0, 0);
	//AddSecondaryEntityCommand("Duel Bet", 10, "duelbet", "", 0, 0);
	//AddSecondaryEntityCommand("Trade", 10, "trade", "", 0, 0);
	is_tracking = false;
	guild = 0;
	following = false;
	combat_target = 0;
	InitXPTable();
	pending_deletion = false;
	spawn_vis_struct = 0;
	spawn_pos_struct = 0;
	spawn_info_struct = 0;
	spawn_header_struct = 0;
	spawn_footer_struct = 0;
	widget_footer_struct = 0;
	sign_footer_struct = 0;
	pos_xor_size = 0;
	info_xor_size = 0;
	vis_xor_size = 0;
	pos_mutex.SetName("Player::pos_mutex");
	vis_mutex.SetName("Player::vis_mutex");
	info_mutex.SetName("Player::info_mutex");
	index_mutex.SetName("Player::index_mutex");
	m_playerSpawnQuestsRequired.SetName("Player::player_spawn_quests_required");
	m_playerSpawnHistoryRequired.SetName("Player::player_spawn_history_required");
	gm_vision = false;
	SetSaveSpellEffects(true);
	reset_mentorship = false;
	all_spells_locked = false;
}
Player::~Player(){
	SetSaveSpellEffects(true);
	DeleteSpellEffects();
	for(int32 i=0;i<spells.size();i++){
		safe_delete(spells[i]);
	}
	for(int32 i=0;i<quickbar_items.size();i++){
		safe_delete(quickbar_items[i]);
	}
	map<int32, vector<int32>*>::iterator itr;
	for (itr = player_spawn_quests_required.begin(); itr != player_spawn_quests_required.end(); itr++){
		safe_delete(itr->second);
	}
	for (itr = player_spawn_history_required.begin(); itr != player_spawn_history_required.end(); itr++){
		safe_delete(itr->second);
	}

	map<int8, map<int8, vector<HistoryData*> > >::iterator itr1;
	map<int8, vector<HistoryData*> >::iterator itr2;
	vector<HistoryData*>::iterator itr3;
	// Type
	for (itr1 = m_characterHistory.begin(); itr1 != m_characterHistory.end(); itr1++) {
		// Sub type
		for (itr2 = itr1->second.begin(); itr2 != itr1->second.end(); itr2++) {
			// vector of data
			for (itr3 = itr2->second.begin(); itr3 != itr2->second.end(); itr3++) {
				safe_delete(*itr3);
			}
		}
	}

	mLUAHistory.writelock();
	map<int32, LUAHistory*>::iterator itr4;
	for (itr4 = m_charLuaHistory.begin(); itr4 != m_charLuaHistory.end(); itr4++) {
		safe_delete(itr4->second);
	}
	m_charLuaHistory.clear();
	mLUAHistory.releasewritelock();

	safe_delete_array(movement_packet);
	safe_delete_array(old_movement_packet);
	safe_delete_array(spawn_tmp_info_xor_packet);
	safe_delete_array(spawn_tmp_vis_xor_packet);
	safe_delete_array(spawn_tmp_pos_xor_packet);
	safe_delete_array(spell_xor_packet);
	safe_delete_array(spell_orig_packet);
	DestroyQuests();
	WritePlayerStatistics();
	RemovePlayerStatistics();
	DeleteMail();
	world.RemoveLottoPlayer(GetCharacterID());
	safe_delete(info);
	index_mutex.writelock(__FUNCTION__, __LINE__);
	player_spawn_reverse_id_map.clear();
	player_removed_spawns.clear();
	player_spawn_id_map.clear();
	index_mutex.releasewritelock(__FUNCTION__, __LINE__);

	info_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_info_packet_list.clear();
	info_mutex.releasewritelock(__FUNCTION__, __LINE__);
	vis_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_vis_packet_list.clear();
	vis_mutex.releasewritelock(__FUNCTION__, __LINE__);
	pos_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_pos_packet_list.clear();
	pos_mutex.releasewritelock(__FUNCTION__, __LINE__);

	safe_delete(spawn_header_struct);
	safe_delete(spawn_footer_struct);
	safe_delete(sign_footer_struct);
	safe_delete(widget_footer_struct);
	safe_delete(spawn_info_struct);
	safe_delete(spawn_vis_struct);
	safe_delete(spawn_pos_struct);
	ClearPendingSelectableItemRewards(0, true);
	ClearPendingItemRewards();
}

EQ2Packet* Player::serialize(Player* player, int16 version){
	return spawn_serialize(player, version);
}

EQ2Packet* Player::Move(float x, float y, float z, int16 version, float heading){
	PacketStruct* packet = configReader.getStruct("WS_MoveClient", version);
	if(packet){
		packet->setDataByName("x", x);
		packet->setDataByName("y", y);
		packet->setDataByName("z", z);
		packet->setDataByName("unknown", 1);	// 1 seems to force the client to re-render the zone at the new location
		packet->setDataByName("location", 0xFFFFFFFF); //added in 869
		if (heading != -1.0f)
			packet->setDataByName("heading", heading);
		EQ2Packet* outapp = packet->serialize();
		safe_delete(packet);
		return outapp;
	}
	return 0;
}

void Player::DestroyQuests(){
	MPlayerQuests.lock();
	map<int32, Quest*>::iterator itr;
	for(itr = completed_quests.begin(); itr != completed_quests.end(); itr++){
		safe_delete(itr->second);
	}
	completed_quests.clear();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		safe_delete(itr->second);
	}
	player_quests.clear();
	for(itr = pending_quests.begin(); itr != pending_quests.end(); itr++){
		safe_delete(itr->second);
	}
	pending_quests.clear();
	MPlayerQuests.unlock();
}

PlayerInfo* Player::GetPlayerInfo(){
	if(info == 0)
		info = new PlayerInfo(this);
	return info;
}

void PlayerInfo::CalculateXPPercentages(){
	int32 xp_needed = info_struct->get_xp_needed();
	if(xp_needed > 0){
		float percentage = ((double)info_struct->get_xp() / xp_needed) * 1000;
		info_struct->set_xp_yellow((int16)percentage);
		info_struct->set_xp_blue((int16)(percentage-info_struct->get_xp_yellow())*1000);
		info_struct->set_xp_blue_vitality_bar(0);
		info_struct->set_xp_yellow_vitality_bar(0);
		if(player->GetXPVitality() > 0){
			float vitality_total = player->GetXPVitality()*10 + percentage;
			vitality_total -= ((int)(percentage/100)*100);
			if(vitality_total < 100){ //10%
				info_struct->set_xp_blue_vitality_bar(info_struct->get_xp_blue() + (int16)(player->GetXPVitality() *10));
			}
			else
				info_struct->set_xp_yellow_vitality_bar(info_struct->get_xp_yellow() + (int16)(player->GetXPVitality() *10));
		}
	}
}

void PlayerInfo::CalculateTSXPPercentages(){
	int32 ts_xp_needed = info_struct->get_ts_xp_needed();
	if(ts_xp_needed > 0){
		float percentage = ((double)info_struct->get_ts_xp() / ts_xp_needed) * 1000;
		info_struct->set_tradeskill_exp_yellow((int16)percentage);
		info_struct->set_tradeskill_exp_blue((int16)((percentage - info_struct->get_tradeskill_exp_yellow()) * 1000));
		/*info_struct->xp_blue_vitality_bar = 0;
		info_struct->xp_yellow_vitality_bar = 0;
		if(player->GetXPVitality() > 0){
			float vitality_total = player->GetXPVitality()*10 + percentage;
			vitality_total -= ((int)(percentage/100)*100);
			if(vitality_total < 100){ //10%
				info_struct->xp_blue_vitality_bar = info_struct->xp_blue + (int16)(player->GetXPVitality() *10);
			}
			else
				info_struct->xp_yellow_vitality_bar = info_struct->xp_yellow + (int16)(player->GetXPVitality() *10);
		}*/
	}
}

void PlayerInfo::SetHouseZone(int32 id){
	house_zone_id = id;
}

void PlayerInfo::SetBindZone(int32 id){
	bind_zone_id = id;
}

void PlayerInfo::SetBindX(float x){
	bind_x = x;
}

void PlayerInfo::SetBindY(float y){
	bind_y = y;
}

void PlayerInfo::SetBindZ(float z){
	bind_z = z;
}

void PlayerInfo::SetBindHeading(float heading){
	bind_heading = heading;
}

int32 PlayerInfo::GetHouseZoneID(){
	return house_zone_id;
}

int32 PlayerInfo::GetBindZoneID(){
	return bind_zone_id;
}

float PlayerInfo::GetBindZoneX(){
	return bind_x;
}

float PlayerInfo::GetBindZoneY(){
	return bind_y;
}

float PlayerInfo::GetBindZoneZ(){
	return bind_z;
}

float PlayerInfo::GetBindZoneHeading(){
	return bind_heading;
}

PacketStruct* PlayerInfo::serialize2(int16 version){
	player->CalculateBonuses();
	PacketStruct* packet = configReader.getStruct("WS_CharacterSheet", version);
	if(packet){
		//TODO: 2021 FIX THIS CASTING
		char deity[32];
		strncpy(deity, info_struct->get_deity().c_str(), 32);
		packet->setDataByName("deity", deity);
		
		char name[40];
		strncpy(name, info_struct->get_name().c_str(), 40);
		packet->setDataByName("character_name", name);
		packet->setDataByName("race", info_struct->get_race());
		packet->setDataByName("gender", info_struct->get_gender());
		packet->setDataByName("class1", info_struct->get_class1());
		packet->setDataByName("class2", info_struct->get_class2());
		packet->setDataByName("class3", info_struct->get_class3());
		packet->setDataByName("tradeskill_class1", info_struct->get_tradeskill_class1());
		packet->setDataByName("tradeskill_class2", info_struct->get_tradeskill_class2());
		packet->setDataByName("tradeskill_class3", info_struct->get_tradeskill_class3());
		packet->setDataByName("level", info_struct->get_level());
		packet->setDataByName("effective_level", info_struct->get_effective_level() != 0 ? info_struct->get_effective_level() : info_struct->get_level());
		packet->setDataByName("tradeskill_level", info_struct->get_tradeskill_level());
		packet->setDataByName("account_age_base", info_struct->get_account_age_base());

//		for(int8 i=0;i<19;i++)
//		{
//			packet->setDataByName("account_age_bonus", info_struct->get_account_age_bonus(i));
//		}

		//
		packet->setDataByName("current_hp", player->GetHP());
		packet->setDataByName("max_hp",player-> GetTotalHP());
		packet->setDataByName("base_hp", player->GetTotalHPBase());
		float bonus_health = floor( (float)(info_struct->get_sta() * player->CalculateBonusMod()));
		packet->setDataByName("bonus_health", bonus_health);
		packet->setDataByName("stat_bonus_health", player->CalculateBonusMod());
		packet->setDataByName("current_power", player->GetPower());
		packet->setDataByName("max_power", player->GetTotalPower());
		packet->setDataByName("base_power", player->GetTotalPowerBase());
		packet->setDataByName("bonus_power", floor( (float)(player->GetPrimaryStat() * player->CalculateBonusMod())));
		packet->setDataByName("stat_bonus_power", player->CalculateBonusMod());
		packet->setDataByName("conc_used", info_struct->get_cur_concentration());
		packet->setDataByName("conc_max", info_struct->get_max_concentration());
		packet->setDataByName("attack", info_struct->get_cur_attack());
		packet->setDataByName("attack_base", info_struct->get_attack_base());
		packet->setDataByName("absorb", info_struct->get_absorb());
		packet->setDataByName("mitigation_skill1", info_struct->get_mitigation_skill1());
		packet->setDataByName("mitigation_skill2", info_struct->get_mitigation_skill2());
		packet->setDataByName("mitigation_skill3", info_struct->get_mitigation_skill3());
		CalculateXPPercentages();
		packet->setDataByName("exp_yellow", info_struct->get_xp_yellow());
		packet->setDataByName("exp_blue", info_struct->get_xp_blue());
		packet->setDataByName("tradeskill_exp_yellow", info_struct->get_tradeskill_exp_yellow());
		packet->setDataByName("tradeskill_exp_blue", info_struct->get_tradeskill_exp_blue());
		packet->setDataByName("flags", info_struct->get_flags());
		packet->setDataByName("flags2", info_struct->get_flags2());

		packet->setDataByName("avoidance_pct", (int16)info_struct->get_avoidance_display()*10.0f);//avoidance_pct 192 = 19.2% // confirmed DoV
		packet->setDataByName("avoidance_base", (int16)info_struct->get_avoidance_base()*10.0f); // confirmed DoV
		packet->setDataByName("avoidance", info_struct->get_cur_avoidance());
		packet->setDataByName("base_avoidance_pct", info_struct->get_base_avoidance_pct());// confirmed DoV
		float parry_pct = info_struct->get_parry(); // client works off of int16, but we use floats to track the actual x/100%
		packet->setDataByName("parry",(int16)(parry_pct*10.0f));// confirmed DoV

		float block_pct = info_struct->get_block()*10.0f;
		
		packet->setDataByName("block", (int16)block_pct);// confirmed DoV
		packet->setDataByName("uncontested_block", info_struct->get_uncontested_block());// confirmed DoV

		packet->setDataByName("str", info_struct->get_str());
		packet->setDataByName("sta", info_struct->get_sta());
		packet->setDataByName("agi", info_struct->get_agi());
		packet->setDataByName("wis", info_struct->get_wis());
		packet->setDataByName("int", info_struct->get_intel());
		packet->setDataByName("str_base", info_struct->get_str_base());
		packet->setDataByName("sta_base", info_struct->get_sta_base());
		packet->setDataByName("agi_base", info_struct->get_agi_base());
		packet->setDataByName("wis_base", info_struct->get_wis_base());
		packet->setDataByName("int_base", info_struct->get_intel_base());
		packet->setDataByName("mitigation_cur", info_struct->get_cur_mitigation());
		packet->setDataByName("mitigation_max", info_struct->get_max_mitigation());
		packet->setDataByName("mitigation_base", info_struct->get_mitigation_base());
		packet->setDataByName("heat", info_struct->get_heat());
		packet->setDataByName("cold", info_struct->get_cold());
		packet->setDataByName("magic", info_struct->get_magic());
		packet->setDataByName("mental", info_struct->get_mental());
		packet->setDataByName("divine", info_struct->get_divine());
		packet->setDataByName("disease", info_struct->get_disease());
		packet->setDataByName("poison", info_struct->get_poison());
		packet->setDataByName("heat_base", info_struct->get_heat_base());
		packet->setDataByName("cold_base", info_struct->get_cold_base());
		packet->setDataByName("magic_base", info_struct->get_magic_base());
		packet->setDataByName("mental_base", info_struct->get_mental_base());
		packet->setDataByName("divine_base", info_struct->get_divine_base());
		packet->setDataByName("disease_base", info_struct->get_disease_base());
		packet->setDataByName("poison_base", info_struct->get_poison_base());
		packet->setDataByName("mitigation_cur2", info_struct->get_cur_mitigation());
		packet->setDataByName("mitigation_max2", info_struct->get_max_mitigation());
		packet->setDataByName("mitigation_base2", info_struct->get_mitigation_base());
		packet->setDataByName("coins_copper", info_struct->get_coin_copper());
		packet->setDataByName("coins_silver", info_struct->get_coin_silver());
		packet->setDataByName("coins_gold", info_struct->get_coin_gold());
		packet->setDataByName("coins_plat", info_struct->get_coin_plat());
		packet->setDataByName("weight", info_struct->get_weight());
		packet->setDataByName("max_weight", info_struct->get_max_weight());
		char pet_name[32];
		strncpy(pet_name, info_struct->get_pet_name().c_str(), 32);
		packet->setDataByName("pet_name", pet_name);
		packet->setDataByName("status_points", info_struct->get_status_points());
		if(bind_zone_id > 0){
			string bind_name = database.GetZoneName(bind_zone_id);
			if (bind_name.length() > 0)
				packet->setDataByName("bind_zone", bind_name.c_str());
		}
		else
			packet->setDataByName("bind_zone", "None");
		if(house_zone_id > 0){
			string house_name = database.GetZoneName(house_zone_id);
			if (house_name.length() > 0)
				packet->setDataByName("house_zone", house_name.c_str());
		}
		else
			packet->setDataByName("house_zone", "None");
		//packet->setDataByName("account_age_base", 14);
		packet->setDataByName("hp_regen", info_struct->get_hp_regen());
		packet->setDataByName("power_regen", info_struct->get_power_regen());
		/*packet->setDataByName("unknown11", -1, 0);
		packet->setDataByName("unknown11", -1, 1);
		packet->setDataByName("unknown13", 201, 0);
		packet->setDataByName("unknown13", 201, 1);
		packet->setDataByName("unknown13", 234, 2);
		packet->setDataByName("unknown13", 201, 3);
		packet->setDataByName("unknown13", 214, 4);
		packet->setDataByName("unknown13", 234, 5);
		packet->setDataByName("unknown13", 234, 6);

		packet->setDataByName("unknown14", 78);
		*/
		packet->setDataByName("adventure_exp_vitality", (int16)(player->GetXPVitality() *10));
		//packet->setDataByName("unknown15b", 9911);
		packet->setDataByName("unknown15a", 78);
		packet->setDataByName("xp_yellow_vitality_bar", info_struct->get_xp_yellow_vitality_bar());
		packet->setDataByName("xp_blue_vitality_bar", info_struct->get_xp_blue_vitality_bar());
		packet->setDataByName("tradeskill_exp_vitality", 100);
		packet->setDataByName("unknown15c", 200);

		//packet->setDataByName("unknown15", 100, 10);
		packet->setDataByName("unknown18", 16880, 1);
		/*packet->setDataByName("unknown19", 1);
		packet->setDataByName("unknown19", 3, 1);
		packet->setDataByName("unknown19", 1074301064, 2);
		packet->setDataByName("unknown19", 1, 3);
		packet->setDataByName("unknown19", 3, 4);
		packet->setDataByName("unknown19", 1074301064, 5);
		packet->setDataByName("unknown19", 6, 6);
		packet->setDataByName("unknown19", 14, 7);
		packet->setDataByName("unknown19", 1083179008, 8);*/
		player->SetGroupInformation(packet);
		packet->setDataByName("unknown20", 1, 107);
		packet->setDataByName("unknown20", 1, 108);
		packet->setDataByName("unknown20", 1, 109);
		packet->setDataByName("unknown20", 1, 110);
		packet->setDataByName("unknown20", 1, 111);
		//packet->setDataByName("unknown20b", 255);
		//packet->setDataByName("unknown20b", 255, 1);
		//packet->setDataByName("unknown20b", 255, 2);
		packet->setDataByName("unknown11", 123);
		packet->setDataByName("unknown11", 234, 1);
		
		//packet->setDataByName("in_combat", 32768);	
		//make name flash red
		/*packet->setDataByName("unknown20", 8);
		packet->setDataByName("unknown20", 38, 70);
		packet->setDataByName("unknown20", 17, 77);
		packet->setDataByName("unknown20", 1, 112); //melee stats and such
		packet->setDataByName("unknown20", 1, 113);
		packet->setDataByName("unknown20", 1, 114);
		packet->setDataByName("unknown20", 1, 115);

		packet->setDataByName("unknown20", 4294967295, 309);
		packet->setDataByName("unknown22", 2, 4);
		packet->setDataByName("unknown23", 2, 29);
		*/
	//packet->setDataByName("unknown20b", 1, i); // pet bar in here
	//	for(int i=0;i<19;i++)
	//		packet->setDataByName("unknown7", 257, i);
		//packet->setDataByName("unknown21", info_struct->rain, 2);
		packet->setDataByName("rain", info_struct->get_rain());
		packet->setDataByName("rain2", info_struct->get_wind()); //-102.24);
		/*packet->setDataByName("unknown22", 3, 4);
		packet->setDataByName("unknown23", 3, 161);
		packet->setDataByName("unknown20", 103);
		packet->setDataByName("unknown20", 1280, 70);
		packet->setDataByName("unknown20", 9, 71);
		packet->setDataByName("unknown20", 5, 72);
		packet->setDataByName("unknown20", 4294967271, 73);
		packet->setDataByName("unknown20", 5, 75);
		packet->setDataByName("unknown20", 1051, 77);
		packet->setDataByName("unknown20", 3, 78);
		packet->setDataByName("unknown20", 6, 104);
		packet->setDataByName("unknown20", 1, 105);
		packet->setDataByName("unknown20", 20, 106);
		packet->setDataByName("unknown20", 3, 107);
		packet->setDataByName("unknown20", 1, 108);
		packet->setDataByName("unknown20", 1, 109);
		packet->setDataByName("unknown20", 4278190080, 494);
		packet->setDataByName("unknown20b", 255);
		packet->setDataByName("unknown20b", 255, 1);
		packet->setDataByName("unknown20b", 255, 2);
		packet->setDataByName("unknown20", 50, 75);
		*/
		//packet->setDataByName("rain2", -102.24);
		for(int i=0;i<45;i++){
			if(i < 30){
				packet->setSubstructDataByName("maintained_effects", "name", info_struct->maintained_effects[i].name, i, 0);
				packet->setSubstructDataByName("maintained_effects", "target", info_struct->maintained_effects[i].target, i, 0);
				packet->setSubstructDataByName("maintained_effects", "spell_id", info_struct->maintained_effects[i].spell_id, i, 0);
				packet->setSubstructDataByName("maintained_effects", "slot_pos", info_struct->maintained_effects[i].slot_pos, i, 0);
				packet->setSubstructDataByName("maintained_effects", "icon", info_struct->maintained_effects[i].icon, i, 0);
				packet->setSubstructDataByName("maintained_effects", "icon_type", info_struct->maintained_effects[i].icon_backdrop, i, 0);
				packet->setSubstructDataByName("maintained_effects", "conc_used", info_struct->maintained_effects[i].conc_used, i, 0);
				packet->setSubstructDataByName("maintained_effects", "unknown3", 1, i, 0);
				packet->setSubstructDataByName("maintained_effects", "total_time", info_struct->maintained_effects[i].total_time, i, 0);
				packet->setSubstructDataByName("maintained_effects", "expire_timestamp", info_struct->maintained_effects[i].expire_timestamp, i, 0);
			}
			else if(version < 942)//version 942 added 15 additional spell effect slots
				break;
			packet->setSubstructDataByName("spell_effects", "spell_id", info_struct->spell_effects[i].spell_id, i, 0);
			if(info_struct->spell_effects[i].spell_id > 0 && info_struct->spell_effects[i].spell_id < 0xFFFFFFFF)
				packet->setSubstructDataByName("spell_effects", "unknown2", 514, i, 0);
			packet->setSubstructDataByName("spell_effects", "total_time", info_struct->spell_effects[i].total_time, i, 0);
			packet->setSubstructDataByName("spell_effects", "expire_timestamp", info_struct->spell_effects[i].expire_timestamp, i, 0);
			packet->setSubstructDataByName("spell_effects", "icon", info_struct->spell_effects[i].icon, i, 0);
			packet->setSubstructDataByName("spell_effects", "icon_type", info_struct->spell_effects[i].icon_backdrop, i, 0);
		}
		return packet;	
	}
	return 0;
}

EQ2Packet* PlayerInfo::serialize3(PacketStruct* packet, int16 version){
	if(packet){
		string* data = packet->serializeString();
		int32 size = data->length();
		//DumpPacket((uchar*)data->c_str(), size);
		uchar* tmp = new uchar[size];
		if(!changes){
			orig_packet = new uchar[size];
			changes = new uchar[size];
			memcpy(orig_packet, (uchar*)data->c_str(), size);
			size = Pack(tmp, (uchar*)data->c_str(), size, size, version);
		}
		else{
			memcpy(changes, (uchar*)data->c_str(), size);
			Encode(changes, orig_packet, size);
			size = Pack(tmp, changes, size, size, version);
			//cout << "INFO HERE:\n";
			//DumpPacket(tmp, size);
		}
		EQ2Packet* ret_packet = new EQ2Packet(OP_UpdateCharacterSheetMsg, tmp, size+4);
		safe_delete_array(tmp);
		safe_delete(packet);
		return ret_packet;
	}
	return 0;
}

void PlayerInfo::SetAccountAge(int16 age){
	info_struct->set_account_age_base(age);
}

EQ2Packet* PlayerInfo::serialize(int16 version, int16 modifyPos, int32 modifyValue) {
	player->CalculateBonuses();
/*	info_struct->heat = 15;
	info_struct->heat_base = 13;
	info_struct->divine = 14;
	info_struct->divine_base = 11;
	info_struct->cur_attack = 5;
	info_struct->attack_base = 5;
	info_struct->coin_copper = 1;
	info_struct->coin_silver = 2;
	info_struct->coin_gold = 3;
	info_struct->coin_plat = 4;*/

	int8 blah1 = 90;
	int8 blah2 = 120;
	/*for (int i = 0; i < 12; i++) {
		info_struct->maintained_effects[i].icon = 8+i;
		info_struct->maintained_effects[i].icon_backdrop = 315+i;
		strcpy(info_struct->maintained_effects[i].name, "Testing Spell");
		info_struct->maintained_effects[i].spell_id = 3000+i;
		info_struct->maintained_effects[i].slot_pos = i;
		info_struct->maintained_effects[i].expire_timestamp = Timer::GetCurrentTime2() + 72000;
		if(i<2)
			info_struct->maintained_effects[i].conc_used = 1;
		info_struct->maintained_effects[i].total_time = 60+i;
	}*/
	PacketStruct* packet = configReader.getStruct("WS_CharacterSheet", version);
	/*for (int i = 0; i < 1; i++) {
		info_struct->spell_effects[i].icon = 303;
		info_struct->spell_effects[i].icon_backdrop = 317;
		info_struct->spell_effects[i].spell_id = 8308;
		info_struct->spell_effects[i].expire_timestamp = Timer::GetCurrentTime2() + 72000;
		if (i < 5)
			packet->setSubstructDataByName("spell_effects", "cancellable", 1, i);
	}*/
	//0-69, locked screen movement
	//30-69 normal movement
	//10-30 normal movement

	//for (int i = 5; i < 10; i++)
		//packet->setDataByName("unknown19", 1+i, i);

	//Sleep(5000);

	if (packet) {
		char name[40];
		strncpy(name,info_struct->get_name().c_str(),40);
		packet->setDataByName("character_name", name);
		//	packet->setDataByName("unknown_1_1_MJ", 99);//unknown_1_1_MJ
		packet->setDataByName("race", info_struct->get_race());
		packet->setDataByName("gender", info_struct->get_gender());
		packet->setDataByName("exiled", 0);  // need exiled data
		packet->setDataByName("class1", info_struct->get_class1());
		packet->setDataByName("class2", info_struct->get_class2());
		packet->setDataByName("class3", info_struct->get_class3());
		packet->setDataByName("tradeskill_class1", info_struct->get_tradeskill_class1());
		packet->setDataByName("tradeskill_class2", info_struct->get_tradeskill_class2());
		packet->setDataByName("tradeskill_class3", info_struct->get_tradeskill_class3());
		packet->setDataByName("level", info_struct->get_level());
		packet->setDataByName("effective_level", info_struct->get_effective_level() != 0 ? info_struct->get_effective_level() : info_struct->get_level());
		packet->setDataByName("tradeskill_level", info_struct->get_tradeskill_level());
		//		packet->setDataByName("unknown_1_2_MJ", 98);  //unknown_1_2_MJ
		packet->setDataByName("account_age_base", info_struct->get_account_age_base());
		//TODO: 2021 FIX THIS CASTING
		for (int8 i = 0; i < 19; i++)
			packet->setDataByName("account_age_bonus", 0);
		//TODO: 2021 FIX THIS CASTING
		char deity[32];
		strncpy(deity, info_struct->get_deity().c_str(), 32);
		packet->setDataByName("deity", deity);
		
		packet->setDataByName("last_name", player->GetLastName());
		//	packet->setDataByName("unknown_1_3_MJ", 97);//unknown_1_3_MJ
		packet->setDataByName("current_hp", player->GetHP());
		packet->setDataByName("max_hp", player->GetTotalHP());
		packet->setDataByName("base_hp", player->GetTotalHPBase());

		packet->setDataByName("current_power", player->GetPower());
		packet->setDataByName("max_power", player->GetTotalPower());
		packet->setDataByName("base_power", player->GetTotalPowerBase());
		packet->setDataByName("conc_used", info_struct->get_cur_concentration());
		packet->setDataByName("conc_max", info_struct->get_max_concentration());
		packet->setDataByName("hp_regen", player->GetInfoStruct()->get_hp_regen());
		packet->setDataByName("power_regen", player->GetInfoStruct()->get_power_regen());

		//	packet->setDataByName("unknown_1_4a_MJ", 96); //-1// was unknown11
		//	packet->setDataByName("unknown_1_4b_MJ", 96); //-1
		packet->setDataByName("stat_bonus_health", player->CalculateBonusMod());//bonus health and bonus power getting same value?
		packet->setDataByName("stat_bonus_power", player->CalculateBonusMod());//bonus health and bonus power getting same value?
		float bonus_health = floor((float)(info_struct->get_sta() * player->CalculateBonusMod()));
		packet->setDataByName("bonus_health", bonus_health);
		packet->setDataByName("bonus_power", floor((float)(player->GetPrimaryStat() * player->CalculateBonusMod())));
		packet->setDataByName("stat_bonus_damage", 95); //stat_bonus_damage
		packet->setDataByName("mitigation_cur", info_struct->get_cur_mitigation());// confirmed DoV
		packet->setDataByName("mitigation_base", info_struct->get_mitigation_base());// confirmed DoV
		packet->setDataByName("mitigation_pct_pve", 392); // % calculation Mitigation % vs PvE 392 = 39.2%// confirmed DoV
		packet->setDataByName("mitigation_pct_pvp", 559); // % calculation Mitigation % vs PvP 559 = 55.9%// confirmed DoV
		packet->setDataByName("toughness", 0);//toughness// confirmed DoV
		packet->setDataByName("toughness_resist_dmg_pvp", 0);//toughness_resist_dmg_pvp 73 = 7300% // confirmed DoV 
		packet->setDataByName("avoidance_pct", (int16)info_struct->get_avoidance_display()*10.0f);//avoidance_pct 192 = 19.2% // confirmed DoV
		packet->setDataByName("avoidance_base", (int16)info_struct->get_avoidance_base()*10.0f); // confirmed DoV
		packet->setDataByName("avoidance", info_struct->get_cur_avoidance());
		//		packet->setDataByName("unknown_1096_1_MJ", 90);//unknown_1096_1_MJ
		packet->setDataByName("base_avoidance_pct", info_struct->get_base_avoidance_pct());// confirmed DoV
		//		packet->setDataByName("unknown_1096_2_MJ", 89);//unknown_1096_2_MJ
		float parry_pct = info_struct->get_parry(); // client works off of int16, but we use floats to track the actual x/100%
		packet->setDataByName("parry",(int16)(parry_pct*10.0f));// confirmed DoV
		//		packet->setDataByName("unknown_1096_3_MJ", 88);//unknown_1096_3_MJ

		float block_pct = info_struct->get_block()*10.0f;
		
		packet->setDataByName("block", (int16)block_pct);// confirmed DoV
		//		packet->setDataByName("unknown_1096_4_MJ", 87);//unknown_1096_4_MJ
		packet->setDataByName("uncontested_block", info_struct->get_uncontested_block());// confirmed DoV
		//		packet->setDataByName("unknown_1096_5_MJ", 86);//unknown_1096_5_MJ
		packet->setDataByName("str", info_struct->get_str());// confirmed DoV
		packet->setDataByName("sta", info_struct->get_sta());// confirmed DoV
		packet->setDataByName("agi", info_struct->get_agi());// confirmed DoV
		packet->setDataByName("wis", info_struct->get_wis());// confirmed DoV
		packet->setDataByName("int", info_struct->get_intel());// confirmed DoV
		packet->setDataByName("str_base", info_struct->get_str_base());  // confirmed DoV
		packet->setDataByName("sta_base", info_struct->get_sta_base());// confirmed DoV
		packet->setDataByName("agi_base", info_struct->get_agi_base());// confirmed DoV
		packet->setDataByName("wis_base", info_struct->get_wis_base());// confirmed DoV
		packet->setDataByName("int_base", info_struct->get_intel_base());// confirmed DoV
		//		packet->setDataByName("unknown_1096_6_MJ", 86);//unknown_1096_6_MJ
		if (version <= 996) {
			packet->setDataByName("heat", info_struct->get_heat());
			packet->setDataByName("cold", info_struct->get_cold());
			packet->setDataByName("magic", info_struct->get_magic());
			packet->setDataByName("mental", info_struct->get_mental());
			packet->setDataByName("divine", info_struct->get_divine());
			packet->setDataByName("disease", info_struct->get_disease());
			packet->setDataByName("poison", info_struct->get_poison());
			packet->setDataByName("heat_base", info_struct->get_heat_base());
			packet->setDataByName("cold_base", info_struct->get_cold_base());
			packet->setDataByName("magic_base", info_struct->get_magic_base());
			packet->setDataByName("mental_base", info_struct->get_mental_base());
			packet->setDataByName("divine_base", info_struct->get_divine_base());
			packet->setDataByName("disease_base", info_struct->get_disease_base());
			packet->setDataByName("poison_base", info_struct->get_poison_base());
		}
		else {
			packet->setDataByName("elemental", info_struct->get_heat());// confirmed DoV
			packet->setDataByName("noxious", info_struct->get_poison());// confirmed DoV
			packet->setDataByName("arcane", info_struct->get_magic());// confirmed DoV
			//		packet->setDataByName("unknown_1096_7_MJ", 85);//unknown_1096_7_MJ
			packet->setDataByName("elemental_base", info_struct->get_elemental_base());// confirmed DoV
			packet->setDataByName("noxious_base", info_struct->get_noxious_base());// confirmed DoV
			packet->setDataByName("arcane_base", info_struct->get_arcane_base());// confirmed DoV
		}
		//	packet->setDataByName("unknown_1096_8_MJ", 205);//unknown_1096_8_MJ
		packet->setDataByName("elemental_absorb_pve", 0); //210 = 21.0% confirmed DoV
		packet->setDataByName("noxious_absorb_pve", 0);//210 = 21.0% confirmed DoV
		packet->setDataByName("arcane_absorb_pve", 0);//210 = 21.0% confirmed DoV
		//		packet->setDataByName("unknown_1096_9_MJ", 240);//unknown_1096_9_MJ
		packet->setDataByName("elemental_absorb_pvp", 0);//210 = 21.0% confirmed DoV
		packet->setDataByName("noxious_absorb_pvp", 0);//210 = 21.0% confirmed DoV
		packet->setDataByName("arcane_absorb_pvp", 0);//210 = 21.0% confirmed DoV
			//	packet->setDataByName("unknown_1096_10_MJ", 280);//unknown_1096_10_MJ
		packet->setDataByName("elemental_dmg_reduction", 0);// confirmed DoV
		packet->setDataByName("noxious_dmg_reduction", 0);// confirmed DoV
		packet->setDataByName("arcane_dmg_reduction", 0);// confirmed DoV
		//		packet->setDataByName("unknown_1096_11_MJ", 320);//unknown_1096_11_MJ
		packet->setDataByName("elemental_dmg_reduction_pct", 0);//210 = 21.0% confirmed DoV
		packet->setDataByName("noxious_dmg_reduction_pct", 0);//210 = 21.0% confirmed DoV
		packet->setDataByName("arcane_dmg_reduction_pct", 0);//210 = 21.0% confirmed DoV
		CalculateXPPercentages();
		packet->setDataByName("current_adv_xp", info_struct->get_xp()); // confirmed DoV
		packet->setDataByName("needed_adv_xp", info_struct->get_xp_needed());// confirmed DoV

		if(version >= 60114)
		{
			// AoM ends up the debt_adv_xp field is the percentage of xp to the next level needed to advance out of debt (WHYY CANT THIS JUST BE A PERCENTAGE LIKE DOV!)
			float currentPctOfLevel = (float)info_struct->get_xp() / (float)info_struct->get_xp_needed();
			float neededPctAdvanceOutOfDebt = currentPctOfLevel + (info_struct->get_xp_debt() / 100.0f);
			packet->setDataByName("debt_adv_xp", neededPctAdvanceOutOfDebt);
		}
		else
		{
			packet->setDataByName("exp_debt", (int16)(info_struct->get_xp_debt()/10.0f));//95= 9500% //confirmed DoV
		}
		
		packet->setDataByName("current_trade_xp", info_struct->get_ts_xp());// confirmed DoV
		packet->setDataByName("needed_trade_xp", info_struct->get_ts_xp_needed());// confirmed DoV

		packet->setDataByName("debt_trade_xp", 0);//95= 9500% //confirmed DoV
		packet->setDataByName("server_bonus", 0);//confirmed DoV
		packet->setDataByName("adventure_vet_bonus", 145);//confirmed DoV
		packet->setDataByName("tradeskill_vet_bonus", 123);//confirmed DoV
		packet->setDataByName("recruit_friend", 110);// 110 = 11000% //confirmed DoV
		packet->setDataByName("recruit_friend_bonus", 0);//confirmed DoV

		packet->setDataByName("adventure_vitality", (int16)(player->GetXPVitality() * 10)); // a %%
		packet->setDataByName("adventure_vitality_yellow_arrow", info_struct->get_xp_yellow_vitality_bar()); //change info_struct to match struct
		packet->setDataByName("adventure_vitality_blue_arrow", info_struct->get_xp_blue_vitality_bar());  //change info_struct to match struct

		packet->setDataByName("tradeskill_vitality", 300); //300 = 30%

		packet->setDataByName("tradeskill_vitality_purple_arrow", 0);// dov confirmed
		packet->setDataByName("tradeskill_vitality_blue_arrow", 0);// dov confirmed
		packet->setDataByName("mentor_bonus", 50);//mentor_bonus //this converts wrong says mentor bonus enabled but earning 0

		packet->setDataByName("assigned_aa", player->GetAssignedAA());
		packet->setDataByName("max_aa", rule_manager.GetGlobalRule(R_Player, MaxAA)->GetInt16());
		packet->setDataByName("unassigned_aa", player->GetUnassignedAA()); // dov confirmed
		packet->setDataByName("aa_green_bar", 0);// dov confirmed
		packet->setDataByName("adv_xp_to_aa_xp_slider", 0);  // aa slider max // dov confirmed
		packet->setDataByName("adv_xp_to_aa_xp_max", 100);  // aa slider position // dov confirmed
		packet->setDataByName("aa_blue_bar", 0);// dov confirmed
		packet->setDataByName("bonus_achievement_xp", 0); // dov confirmed
		//		packet->setDataByName("unknown_1096_12_MJ", 90);
		packet->setDataByName("items_found", 62);// dov confirmed
		packet->setDataByName("named_npcs_killed", 192);// dov confirmed
		packet->setDataByName("quests_completed", 670);// dov confirmed
		packet->setDataByName("exploration_events", 435);// dov confirmed
		packet->setDataByName("completed_collections", 144);// dov confirmed
		packet->setDataByName("unknown_1096_13_MJ", 80);//unknown_1096_13_MJ
		packet->setDataByName("unknown_1096_14_MJ", 50);//unknown_1096_14_MJ
		packet->setDataByName("coins_copper", info_struct->get_coin_copper());// dov confirmed
		packet->setDataByName("coins_silver", info_struct->get_coin_silver());// dov confirmed
		packet->setDataByName("coins_gold", info_struct->get_coin_gold());// dov confirmed
		packet->setDataByName("coins_plat", info_struct->get_coin_plat());// dov confirmed
		//packet->setDataByName("unknown_1096_15_MJ", 50);//unknown_1096_15_MJ
		//////Spell Effects go here, but are below
		//////Dettrimental effects go here, but are below
		packet->setDataByName("trauma_count", 45);// added with spells leave here for testing//dov confirmed
		packet->setDataByName("arcane_count", 255);// added with spells leave here for testing//dov confirmed
		packet->setDataByName("noxious_count", 47);// added with spells leave here for testing//dov confirmed
		packet->setDataByName("elemental_count", 255);// added with spells leave here for testing//dov confirmed
		packet->setDataByName("curse_count", 49);// added with spells leave here for testing//dov confirmed
	//	packet->setDataByName("unknown_1096_17_MJ", 30);//unknown_1096_17_MJ
		//////Maintained effects go here, but are below
		packet->setDataByName("breath", 30);
		//packet->setDataByName("unknown_1096_18_MJ", 1000);//16880
		packet->setDataByName("melee_pri_dmg_min", player->GetPrimaryWeaponMinDamage());// dov confirmed
		packet->setDataByName("melee_pri_dmg_max", player->GetPrimaryWeaponMaxDamage());// dov confirmed
		packet->setDataByName("melee_sec_dmg_min", player->GetSecondaryWeaponMinDamage());// dov confirmed
		packet->setDataByName("melee_sec_dmg_max", player->GetSecondaryWeaponMaxDamage());// dov confirmed // this is off when using 2 handed weapon
		packet->setDataByName("ranged_dmg_min", player->GetRangedWeaponMinDamage());// dov confirmed
		packet->setDataByName("ranged_dmg_max", player->GetRangedWeaponMaxDamage());// dov confirmed
		if (info_struct->get_attackspeed() > 0) {
			packet->setDataByName("melee_pri_delay", (((float)player->GetPrimaryWeaponDelay() * 1.33) / player->CalculateAttackSpeedMod()) * .001);// dov confirmed
			packet->setDataByName("melee_sec_delay", (((float)player->GetSecondaryWeaponDelay() * 1.33) / player->CalculateAttackSpeedMod()) * .001);// dov confirmed
			packet->setDataByName("ranged_delay", (((float)player->GetRangeWeaponDelay() * 1.33) / player->CalculateAttackSpeedMod()) * .001);// dov confirmed
		}
		else {
			packet->setDataByName("melee_pri_delay", (float)player->GetPrimaryWeaponDelay() * .001);// dov confirmed
			packet->setDataByName("melee_sec_delay", (float)player->GetSecondaryWeaponDelay() * .001);// dov confirmed
			packet->setDataByName("ranged_delay", (float)player->GetRangeWeaponDelay() * .001);// dov confirmed
		}
		//packet->setDataByName("unknown_1096_18_MJ", 99);//unknown_1096_19a_MJ
		//packet->setDataByName("unknown_1096_18_MJ", 98);//unknown_1096_19b_MJ
		//packet->setDataByName("unknown_1096_18_MJ", 97);//unknown_1096_19c_MJ
		//packet->setDataByName("unknown_1096_18_MJ", 96);//unknown_1096_19d_MJ
		packet->setDataByName("ability_mod_pve", info_struct->get_ability_modifier());// dov confirmed
		packet->setDataByName("base_melee_crit", 85);//85 = 8500% dov confirmed
		packet->setDataByName("base_spell_crit", 84);// dov confirmed
		packet->setDataByName("base_taunt_crit", 83);// dov confirmed
		packet->setDataByName("base_heal_crit", 82);// dov confirmed
		packet->setDataByName("flags", info_struct->get_flags());
		packet->setDataByName("flags2", info_struct->get_flags2());
		if (version == 546) {
			if (player->get_character_flag(CF_ANONYMOUS))
				packet->setDataByName("flags_anonymous", 1);
			if (player->get_character_flag(CF_ROLEPLAYING))
				packet->setDataByName("flags_roleplaying", 1);
			if (player->get_character_flag(CF_AFK))
				packet->setDataByName("flags_afk", 1);
			if (player->get_character_flag(CF_LFG))
				packet->setDataByName("flags_lfg", 1);
			if (player->get_character_flag(CF_LFW))
				packet->setDataByName("flags_lfw", 1);
			if (!player->get_character_flag(CF_HIDE_HOOD) && !player->get_character_flag(CF_HIDE_HELM))
				packet->setDataByName("flags_show_hood", 1);
			if (player->get_character_flag(CF_SHOW_ILLUSION))
				packet->setDataByName("flags_show_illusion_form", 1);
			if (player->get_character_flag(CF_ALLOW_DUEL_INVITES))
				packet->setDataByName("flags_show_duel_invites", 1);
			if (player->get_character_flag(CF_ALLOW_TRADE_INVITES))
				packet->setDataByName("flags_show_trade_invites", 1);
			if (player->get_character_flag(CF_ALLOW_GROUP_INVITES))
				packet->setDataByName("flags_show_group_invites", 1);
			if (player->get_character_flag(CF_ALLOW_RAID_INVITES))
				packet->setDataByName("flags_show_raid_invites", 1);
			if (player->get_character_flag(CF_ALLOW_GUILD_INVITES))
				packet->setDataByName("flags_show_guild_invites", 1);
		}
		//unknown_1096_20_MJ
		//unknown_1096_21_MJ
		//unknown_1096_22_MJ
		//unknown_1096_23_MJ
		packet->setDataByName("haste", info_struct->get_haste());// dov confirmed
		//unknown_1096_24_MJ
		//unknown_1096_25_MJ
		//unknown_1096_26_MJ
		packet->setDataByName("drunk", info_struct->get_drunk());// dov confirmed
		//unknown_1096_27_MJ
		packet->setDataByName("hate_mod", info_struct->get_hate_mod());// dov confirmed
		packet->setDataByName("adventure_effects_bonus", 55);// NEED an adventure_effects_bonus// dov confirmed
		packet->setDataByName("tradeskill_effects_bonus", 56);// NEED an tradeskill_effects_bonus// dov confirmed
		//unknown_1096_28_MJ
		packet->setDataByName("dps", info_struct->get_dps());// dov confirmed
		//unknown_1096_29_MJ
		packet->setDataByName("melee_ae", info_struct->get_melee_ae());// dov confirmed
		packet->setDataByName("multi_attack", info_struct->get_multi_attack());// dov confirmed
		packet->setDataByName("spell_multi_attack", info_struct->get_spell_multi_attack());// dov confirmed
		//unknown_1096_30_MJ
		packet->setDataByName("block_chance", info_struct->get_block_chance());// dov confirmed
		//unknown_1096_31_MJ
		packet->setDataByName("crit_chance", info_struct->get_crit_chance());// dov confirmed
		//unknown_1096_32_MJ
		packet->setDataByName("crit_bonus", info_struct->get_crit_bonus());// dov confirmed
		((Entity*)player)->MStats.lock();
		packet->setDataByName("potency", player->stats[ITEM_STAT_POTENCY]);//info_struct->get_potency);// dov confirmed
		((Entity*)player)->MStats.unlock();
		//unknown_1096_33_MJ
		packet->setDataByName("reuse_speed", info_struct->get_reuse_speed());// dov confirmed
		packet->setDataByName("recovery_speed", info_struct->get_recovery_speed());// dov confirmed
		packet->setDataByName("casting_speed", info_struct->get_casting_speed());// dov confirmed
		packet->setDataByName("spell_reuse_speed", info_struct->get_spell_reuse_speed());// dov confirmed
		//unknown_1096_34_MJ
		packet->setDataByName("strikethrough", info_struct->get_strikethrough());//dov confirmed
		//unknown_1096_35_MJ
		packet->setDataByName("accuracy", info_struct->get_accuracy());//dov confirmed
		//unknown_1096_36_MJ
		packet->setDataByName("critical_mit", info_struct->get_critical_mitigation());//dov /confirmed
		//unknown_1096_37_MJ
		//toughness_resist_crit_pvp
		//unknown_1096_38_MJ
		((Entity*)player)->MStats.lock();
		packet->setDataByName("durability_mod", player->stats[ITEM_STAT_DURABILITY_MOD]);// dov confirmed
		packet->setDataByName("durability_add", player->stats[ITEM_STAT_DURABILITY_ADD]);// dov confirmed
		packet->setDataByName("progress_mod", player->stats[ITEM_STAT_PROGRESS_MOD]);// dov confirmed
		packet->setDataByName("progress_add", player->stats[ITEM_STAT_PROGRESS_ADD]);// dov confirmed
		packet->setDataByName("success_mod", player->stats[ITEM_STAT_SUCCESS_MOD]);// dov confirmed
		packet->setDataByName("crit_success_mod", player->stats[ITEM_STAT_CRIT_SUCCESS_MOD]);// dov confirmed
		((Entity*)player)->MStats.unlock();

		//unknown_1096_39_MJ
		/////GRoup Members
		//unknown_1096_40_MJ
		//unknown_1096_41_MJ
		if (version <= 283 && info_struct->get_pet_id() == 0xFFFFFFFF)
			packet->setDataByName("pet_id", 0);
		else {
			packet->setDataByName("pet_id", info_struct->get_pet_id());
			char pet_name[32];
			strncpy(pet_name, info_struct->get_pet_name().c_str(), 32);
			packet->setDataByName("pet_name", pet_name);
		}
		//unknown_1096_42_MJ
		packet->setDataByName("pet_health_pct", info_struct->get_pet_health_pct());
		packet->setDataByName("pet_power_pct", info_struct->get_pet_power_pct());
		//unknown_1096_43_MJ
		packet->setDataByName("pet_movement", info_struct->get_pet_movement());
		packet->setDataByName("pet_behavior", info_struct->get_pet_behavior());
		packet->setDataByName("rain", info_struct->get_rain());
		packet->setDataByName("rain2", info_struct->get_wind()); //-102.24);
		packet->setDataByName("status_points", info_struct->get_status_points());
		packet->setDataByName("guild_status", 888888);
		//unknown_1096_44_MJ
		if (house_zone_id > 0){
			string house_name = database.GetZoneName(house_zone_id);
			if(house_name.length() > 0)
				packet->setDataByName("house_zone", house_name.c_str());
		}
		else
			packet->setDataByName("house_zone", "abcdefghijklmnopqrst");
		//unknown_1096_45_MJ		
		if (bind_zone_id > 0){
			string bind_name = database.GetZoneName(bind_zone_id);
			if(bind_name.length() > 0)
				packet->setDataByName("bind_zone", bind_name.c_str());
		}
		else
			packet->setDataByName("bind_zone", "abcdefghijklmnopqrst");
		//










		((Entity*)player)->MStats.lock();
		packet->setDataByName("rare_harvest_chance", player->stats[ITEM_STAT_RARE_HARVEST_CHANCE]);
		packet->setDataByName("max_crafting", player->stats[ITEM_STAT_MAX_CRAFTING]);
		packet->setDataByName("component_refund", player->stats[ITEM_STAT_COMPONENT_REFUND]);
		packet->setDataByName("ex_durability_mod", player->stats[ITEM_STAT_EX_DURABILITY_MOD]);
		packet->setDataByName("ex_durability_add", player->stats[ITEM_STAT_EX_DURABILITY_ADD]);
		packet->setDataByName("ex_crit_success_mod", player->stats[ITEM_STAT_EX_CRIT_SUCCESS_MOD]);
		packet->setDataByName("ex_crit_failure_mod", player->stats[ITEM_STAT_EX_CRIT_FAILURE_MOD]);
		packet->setDataByName("ex_progress_mod", player->stats[ITEM_STAT_EX_PROGRESS_MOD]);
		packet->setDataByName("ex_progress_add", player->stats[ITEM_STAT_EX_PROGRESS_ADD]);
		packet->setDataByName("ex_success_mod", player->stats[ITEM_STAT_EX_SUCCESS_MOD]);
		((Entity*)player)->MStats.unlock();

		packet->setDataByName("flurry", info_struct->get_flurry());
		packet->setDataByName("unknown153", 153);
		packet->setDataByName("bountiful_harvest", 0); // need bountiful harvest

		packet->setDataByName("unknown156", 156);
		packet->setDataByName("unknown157", 157);

		packet->setDataByName("unknown159", 159);
		packet->setDataByName("unknown160", 160);


		packet->setDataByName("unknown163", 163);


		packet->setDataByName("unknown168", 168);
		packet->setDataByName("decrease_falling_dmg", 169);


		info_struct->set_max_weight(200);
		//packet->setDataByName("auto_attack", 1);
		//492
		if (version <= 546) {
			packet->setDataByName("exp_yellow", info_struct->get_xp_yellow() / 10);
			packet->setDataByName("exp_blue", info_struct->get_xp_blue()/10);
		}
		else {
			packet->setDataByName("exp_yellow", info_struct->get_xp_yellow());
			packet->setDataByName("exp_blue", info_struct->get_xp_blue());
		}
		
		if (version <= 546) {
			packet->setDataByName("tradeskill_exp_yellow", info_struct->get_tradeskill_exp_yellow() / 10);
			packet->setDataByName("tradeskill_exp_blue", info_struct->get_tradeskill_exp_blue() / 10);
		}
		else {
			packet->setDataByName("tradeskill_exp_yellow", info_struct->get_tradeskill_exp_yellow());
			packet->setDataByName("tradeskill_exp_blue", info_struct->get_tradeskill_exp_blue());
		}		

		packet->setDataByName("attack", info_struct->get_cur_attack());
		packet->setDataByName("attack_base", info_struct->get_attack_base());
		packet->setDataByName("absorb", info_struct->get_absorb());
		packet->setDataByName("mitigation_skill1", info_struct->get_mitigation_skill1());
		packet->setDataByName("mitigation_skill2", info_struct->get_mitigation_skill2());
		packet->setDataByName("mitigation_skill3", info_struct->get_mitigation_skill3());

		packet->setDataByName("mitigation_max", info_struct->get_max_mitigation());

		packet->setDataByName("savagery", 250);
		packet->setDataByName("max_savagery", 500);
		packet->setDataByName("savagery_level", 1);
		packet->setDataByName("max_savagery_level", 5);
		packet->setDataByName("dissonance", 5000);
		packet->setDataByName("max_dissonance", 10000);

		packet->setDataByName("mitigation_cur2", info_struct->get_cur_mitigation());
		packet->setDataByName("mitigation_max2", info_struct->get_max_mitigation());
		packet->setDataByName("mitigation_base2", info_struct->get_mitigation_base());

		packet->setDataByName("weight", info_struct->get_weight());
		packet->setDataByName("max_weight", info_struct->get_max_weight());
		packet->setDataByName("unknownint32a", 777777);
		packet->setDataByName("unknownint32b", 666666);
		packet->setDataByName("mitigation2_cur", 2367);
		packet->setDataByName("uncontested_riposte", info_struct->get_uncontested_riposte());
		packet->setDataByName("uncontested_dodge", info_struct->get_uncontested_dodge());
		packet->setDataByName("uncontested_parry", info_struct->get_uncontested_parry()); //????
		packet->setDataByName("uncontested_riposte_pve", 0); //????
		packet->setDataByName("uncontested_parry_pve", 0); //????
		packet->setDataByName("total_prestige_points", player->GetPrestigeAA());
		packet->setDataByName("unassigned_prestige_points", player->GetUnassignedPretigeAA());
		packet->setDataByName("total_tradeskill_points", player->GetTradeskillAA());
		packet->setDataByName("unassigned_tradeskill_points", player->GetUnassignedTradeskillAA());
		packet->setDataByName("total_tradeskill_prestige_points", player->GetTradeskillPrestigeAA());
		packet->setDataByName("unassigned_tradeskill_prestige_points", player->GetUnassignedTradeskillPrestigeAA());
		/*packet->setDataByName("unknown13", 201, 0);
		packet->setDataByName("unknown13", 201, 1);
		packet->setDataByName("unknown13", 234, 2);
		packet->setDataByName("unknown13", 201, 3);
		packet->setDataByName("unknown13", 214, 4);
		packet->setDataByName("unknown13", 234, 5);
		packet->setDataByName("unknown13", 234, 6);

		packet->setDataByName("unknown14", 78);
		*/

		//packet->setDataByName("unknown23", 1, 146);

		//packet->setDataByName("unknown24", 0xFF, 42);
		//packet->setDataByName("unknown24", 0xFF, 46);

		// unknown14c = percent aa exp to next level
		packet->setDataByName("unknown14d", 100, 0);
		packet->setDataByName("unknown20", 1084227584, 72);
		//packet->setDataByName("unknown16", 0xFFFFFFFF, 4);


		//packet->setDataByName("unknown15b", 9911);

		packet->setDataByName("unknown15c", 200);

		//packet->setDataByName("unknown15", 100, 10);

		/*packet->setDataByName("unknown19", 1);
		packet->setDataByName("unknown19", 3, 1);
		packet->setDataByName("unknown19", 1074301064, 2);
		packet->setDataByName("unknown19", 1, 3);
		packet->setDataByName("unknown19", 3, 4);
		packet->setDataByName("unknown19", 1074301064, 5);
		packet->setDataByName("unknown19", 6, 6);
		packet->setDataByName("unknown19", 14, 7);
		packet->setDataByName("unknown19", 1083179008, 8);*/
		player->SetGroupInformation(packet);
		//packet->setDataByName("unknown20", 1, 107);
		//packet->setDataByName("unknown20", 1, 108);
		//packet->setDataByName("unknown20", 1, 109);
		//packet->setDataByName("unknown20", 1, 110);
		//packet->setDataByName("unknown20", 1, 111);
		//packet->setDataByName("unknown20b", 255);
		//packet->setDataByName("unknown20b", 255, 1);
		//packet->setDataByName("unknown20b", 255, 2);
		//packet->setDataByName("in_combat", 32768);	
		//make name flash red
		/*packet->setDataByName("unknown20", 8);
		packet->setDataByName("unknown20", 38, 70);
		packet->setDataByName("unknown20", 17, 77);
		packet->setDataByName("unknown20", 1, 112); //melee stats and such
		packet->setDataByName("unknown20", 1, 113);
		packet->setDataByName("unknown20", 1, 114);
		packet->setDataByName("unknown20", 1, 115);

		packet->setDataByName("unknown20", 4294967295, 309);
		packet->setDataByName("unknown22", 2, 4);
		packet->setDataByName("unknown23", 2, 29);
		*/
		//packet->setDataByName("unknown20b", 1, i); // pet bar in here
		//	for(int i=0;i<19;i++)
		//		packet->setDataByName("unknown7", 257, i);
			//packet->setDataByName("unknown21", info_struct->rain, 2);

			/*packet->setDataByName("unknown22", 3, 4);
			packet->setDataByName("unknown23", 3, 161);
			packet->setDataByName("unknown20", 103);
			packet->setDataByName("unknown20", 1280, 70);
			packet->setDataByName("unknown20", 9, 71);
			packet->setDataByName("unknown20", 5, 72);
			packet->setDataByName("unknown20", 4294967271, 73);
			packet->setDataByName("unknown20", 5, 75);
			packet->setDataByName("unknown20", 1051, 77);
			packet->setDataByName("unknown20", 3, 78);
			packet->setDataByName("unknown20", 6, 104);
			packet->setDataByName("unknown20", 1, 105);
			packet->setDataByName("unknown20", 20, 106);
			packet->setDataByName("unknown20", 3, 107);
			packet->setDataByName("unknown20", 1, 108);
			packet->setDataByName("unknown20", 1, 109);
			packet->setDataByName("unknown20", 4278190080, 494);
			packet->setDataByName("unknown20b", 255);
			packet->setDataByName("unknown20b", 255, 1);
			packet->setDataByName("unknown20b", 255, 2);
			packet->setDataByName("unknown20", 50, 75);
			*/








			/*packet->setDataByName("unknown199a", 843);// 25);
			//packet->setDataByName("unknown199b", 844);// 30);
			//packet->setDataByName("unknown199c", 845);// 45);
			//packet->setDataByName("unknown199d", 846);// 55);


			packet->setDataByName("unknown37", 537);
			packet->setDataByName("unknown38", 538);
			packet->setDataByName("unknown39", 539);
			packet->setDataByName("unknown40", 540);
			packet->setDataByName("unknown41", 541);
			packet->setDataByName("unknown42", 542);
			packet->setDataByName("unknown43", 543);
			packet->setDataByName("unknown44", 544);

			packet->setDataByName("ability_mod_pvp", 542);
			packet->setDataByName("unknown43", 543);
			packet->setDataByName("unknown44", 544);


			packet->setDataByName("unknown45", 645);
			packet->setDataByName("unknown46", 646);
			packet->setDataByName("unknown47", 647);
			packet->setDataByName("unknown48", 648);
			packet->setDataByName("unknown49", 649);
			packet->setDataByName("unknown50", 650);
			packet->setDataByName("unknown51", 651);
			packet->setDataByName("unknown52", 652);
			packet->setDataByName("unknown53", 653);
			packet->setDataByName("unknown54", 654);
			packet->setDataByName("unknown55", 655);
			packet->setDataByName("unknown56", 656);
			packet->setDataByName("unknown57", 657);
			packet->setDataByName("unknown58", 658);
			packet->setDataByName("unknown59", 659);
			packet->setDataByName("unknown60", 660);

			*/



		packet->setDataByName("in_combat_movement_speed", 125);

		packet->setDataByName("increase_max_power", 127);
		packet->setDataByName("increase_max_power2", 128);
		//129 does not exist
	/*	packet->setDataByName("unknown130", 130);
		packet->setDataByName("unknown132", 132);
		packet->setDataByName("unknown133", 133);


		packet->setDataByName("unknown137", 137);
		packet->setDataByName("unknown138", 138);
		packet->setDataByName("unknown139", 139);


		packet->setDataByName("unknown141", 141);
		packet->setDataByName("unknown142", 142);




		packet->setDataByName("unknown144", 144);

		packet->setDataByName("unknown147", 147);
		packet->setDataByName("unknown148", 148);

		packet->setDataByName("unknown170", 170);
		packet->setDataByName("unknown171", 171);
		packet->setDataByName("unknown172", 172);
		packet->setDataByName("unknown173", 173);
		packet->setDataByName("unknown174", 174);
		packet->setDataByName("unknown175", 175);
		packet->setDataByName("unknown176", 176);
		packet->setDataByName("unknown177", 177);
		packet->setDataByName("loot_coin", 178);
		packet->setDataByName("mitigation_increase", 179);
		packet->setDataByName("unknown180", 180);

		packet->setDataByName("unknown182", 182);

		packet->setDataByName("unknown184", 184);
		packet->setDataByName("unknown185", 185);
		packet->setDataByName("unknown186", 186);
		packet->setDataByName("unknown187", 187);
		packet->setDataByName("unknown188", 188);
		packet->setDataByName("unknown189", 189);
		packet->setDataByName("unknown190", 190);
		packet->setDataByName("unknown191", 191);
		packet->setDataByName("unknown192", 192);
		packet->setDataByName("unknown193", 193);
		packet->setDataByName("unknown194", 194);
		packet->setDataByName("unknown195", 195);
		packet->setDataByName("unknown196", 196);
		packet->setDataByName("unknown197", 197);
		packet->setDataByName("unknown198", 198);
		packet->setDataByName("unknown199", 199);
		packet->setDataByName("unknown200", 200);
		packet->setDataByName("unknown201", 201);
		packet->setDataByName("unknown202", 202);
		packet->setDataByName("unknown203", 203);
		packet->setDataByName("unknown204", 204);
		packet->setDataByName("unknown205", 205);
		packet->setDataByName("unknown206", 206);
		packet->setDataByName("unknown207", 207);
		packet->setDataByName("unknown208", 208);
		packet->setDataByName("unknown209", 209);
		packet->setDataByName("unknown210", 210);
		packet->setDataByName("unknown211", 211);
		packet->setDataByName("unknown212", 212);
		packet->setDataByName("unknown213", 213);
		packet->setDataByName("unknown214", 214);
		packet->setDataByName("unknown215", 215);
		packet->setDataByName("unknown216", 216);
		packet->setDataByName("unknown217", 217);
		packet->setDataByName("unknown218", 218);
		packet->setDataByName("unknown219", 219);
		packet->setDataByName("unknown220", 220);
		packet->setDataByName("unknown221", 221);
		packet->setDataByName("unknown222", 222);
		packet->setDataByName("unknown223", 223);
		packet->setDataByName("unknown224", 224);
		packet->setDataByName("unknown225", 225);
		packet->setDataByName("unknown226", 226);
		packet->setDataByName("unknown227", 227);
		packet->setDataByName("unknown228", 228);
		packet->setDataByName("unknown229", 229);
		packet->setDataByName("unknown230", 230);
		packet->setDataByName("unknown231", 231);
		packet->setDataByName("unknown232", 232);
		packet->setDataByName("unknown233", 233);
		packet->setDataByName("unknown234", 234);
		packet->setDataByName("unknown235", 235);
		packet->setDataByName("unknown236", 236);
		packet->setDataByName("unknown237", 237);
		packet->setDataByName("unknown238", 238);
		packet->setDataByName("unknown239", 239);
		packet->setDataByName("unknown240", 240);

		// Tradeskill stats
		packet->setDataByName("unknown383", 383);
		packet->setDataByName("unknown384", 384);
		packet->setDataByName("unknown385", 385);
		packet->setDataByName("unknown386", 386);
		packet->setDataByName("unknown387", 387);
		packet->setDataByName("unknown388", 388);
		packet->setDataByName("unknown389", 389);
		packet->setDataByName("unknown390", 390);
		packet->setDataByName("unknown391", 391);
		packet->setDataByName("unknown392", 392);
		packet->setDataByName("unknown393", 393);
		packet->setDataByName("unknown394", 394);
		packet->setDataByName("unknown395", 395);
		packet->setDataByName("unknown396", 396);
		packet->setDataByName("unknown397", 397);
		packet->setDataByName("unknown398", 398);


		*/



		packet->setDataByName("vision", info_struct->get_vision());
		packet->setDataByName("breathe_underwater", info_struct->get_breathe_underwater());





		int32 expireTimestamp = 0;
		Spawn* maintained_target = 0;
		player->GetSpellEffectMutex()->readlock(__FUNCTION__, __LINE__);
		player->GetMaintainedMutex()->readlock(__FUNCTION__, __LINE__);
		for (int i = 0; i < 45; i++) {
			if (i < 30) {
				maintained_target = player->GetZone()->GetSpawnByID(info_struct->maintained_effects[i].target);
				packet->setSubstructDataByName("maintained_effects", "name", info_struct->maintained_effects[i].name, i, 0);
				if (maintained_target)
					packet->setSubstructDataByName("maintained_effects", "target", player->GetIDWithPlayerSpawn(maintained_target), i, 0);
				packet->setSubstructDataByName("maintained_effects", "target_type", info_struct->maintained_effects[i].target_type, i, 0);
				packet->setSubstructDataByName("maintained_effects", "spell_id", info_struct->maintained_effects[i].spell_id, i, 0);
				packet->setSubstructDataByName("maintained_effects", "slot_pos", info_struct->maintained_effects[i].slot_pos, i, 0);
				packet->setSubstructDataByName("maintained_effects", "icon", info_struct->maintained_effects[i].icon, i, 0);
				packet->setSubstructDataByName("maintained_effects", "icon_type", info_struct->maintained_effects[i].icon_backdrop, i, 0);
				packet->setSubstructDataByName("maintained_effects", "conc_used", info_struct->maintained_effects[i].conc_used, i, 0);
				packet->setSubstructDataByName("maintained_effects", "unknown3", 1, i, 0);
				packet->setSubstructDataByName("maintained_effects", "total_time", info_struct->maintained_effects[i].total_time, i, 0);
				expireTimestamp = info_struct->maintained_effects[i].expire_timestamp;
				if (expireTimestamp == 0xFFFFFFFF)
					expireTimestamp = 0;
				packet->setSubstructDataByName("maintained_effects", "expire_timestamp", expireTimestamp, i, 0);
			}
			else if (version < 942)//version 942 added 15 additional spell effect slots
				break;
			packet->setSubstructDataByName("spell_effects", "spell_id", info_struct->spell_effects[i].spell_id, i, 0);
			/*if(info_struct->spell_effects[i].spell_id > 0 && info_struct->spell_effects[i].spell_id < 0xFFFFFFFF)
				packet->setSubstructDataByName("spell_effects", "unknown2", 514, i, 0);*/
			packet->setSubstructDataByName("spell_effects", "total_time", info_struct->spell_effects[i].total_time, i, 0);
			expireTimestamp = info_struct->spell_effects[i].expire_timestamp;
			if (expireTimestamp == 0xFFFFFFFF)
				expireTimestamp = 0;
			packet->setSubstructDataByName("spell_effects", "expire_timestamp", expireTimestamp, i, 0);
			packet->setSubstructDataByName("spell_effects", "icon", info_struct->spell_effects[i].icon, i, 0);
			packet->setSubstructDataByName("spell_effects", "icon_type", info_struct->spell_effects[i].icon_backdrop, i, 0);
			if(info_struct->spell_effects[i].spell && info_struct->spell_effects[i].spell->spell && info_struct->spell_effects[i].spell->spell->GetSpellData()->friendly_spell == 1)
				packet->setSubstructDataByName("spell_effects", "cancellable", 1, i); 
		}
		player->GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
		player->GetSpellEffectMutex()->releasereadlock(__FUNCTION__, __LINE__);

		int8 det_count = 0;
		//Send detriment counts as 255 if all dets of that type are incurable
		det_count = player->GetTraumaCount();
		if (det_count > 0) {
			if (!player->HasCurableDetrimentType(DET_TYPE_TRAUMA))
				det_count = 255;
		}
		packet->setDataByName("trauma_count", det_count);

		det_count = player->GetArcaneCount();
		if (det_count > 0) {
			if (!player->HasCurableDetrimentType(DET_TYPE_ARCANE))
				det_count = 255;
		}
		packet->setDataByName("arcane_count", det_count);

		det_count = player->GetNoxiousCount();
		if (det_count > 0) {
			if (!player->HasCurableDetrimentType(DET_TYPE_NOXIOUS))
				det_count = 255;
		}
		packet->setDataByName("noxious_count", det_count);

		det_count = player->GetElementalCount();
		if (det_count > 0) {
			if (!player->HasCurableDetrimentType(DET_TYPE_ELEMENTAL))
				det_count = 255;
		}
		packet->setDataByName("elemental_count", det_count);

		det_count = player->GetCurseCount();
		if (det_count > 0) {
			if (!player->HasCurableDetrimentType(DET_TYPE_CURSE))
				det_count = 255;
		}
		packet->setDataByName("curse_count", det_count);

		player->GetDetrimentMutex()->readlock(__FUNCTION__, __LINE__);
		vector<DetrimentalEffects>* det_list = player->GetDetrimentalSpellEffects();
		DetrimentalEffects det;
		int32 i = 0;
		for (i = 0; i < det_list->size(); i++) {
			det = det_list->at(i);
			packet->setSubstructDataByName("detrimental_spell_effects", "spell_id", det.spell_id, i);
			packet->setSubstructDataByName("detrimental_spell_effects", "total_time", det.total_time, i);
			packet->setSubstructDataByName("detrimental_spell_effects", "icon", det.icon, i);
			packet->setSubstructDataByName("detrimental_spell_effects", "icon_type", det.icon_backdrop, i);
			expireTimestamp = det.expire_timestamp;
			if (expireTimestamp == 0xFFFFFFFF)
				expireTimestamp = 0;
			packet->setSubstructDataByName("detrimental_spell_effects", "expire_timestamp", expireTimestamp, i);
			packet->setSubstructDataByName("detrimental_spell_effects", "unknown2", 2, i);
			if (i == 30) {
				if (version < 942)
					break;
			}
			else if (i == 45)
				break;
		}
		if (version < 942) {
			while (i < 30) {
				packet->setSubstructDataByName("detrimental_spell_effects", "spell_id", 0xFFFFFFFF, i);
				i++;
			}
		}
		else {
			while (i < 45) {
				packet->setSubstructDataByName("detrimental_spell_effects", "spell_id", 0xFFFFFFFF, i);
				i++;
			}
		}
		player->GetDetrimentMutex()->releasereadlock(__FUNCTION__, __LINE__);

		// disabling as not in use right now
		//packet->setDataByName("spirit_rank", 2);
		//packet->setDataByName("spirit", 1);
		//packet->setDataByName("spirit_progress", .67);

		packet->setDataByName("combat_exp_enabled", 1);
		/*for (int i = 0; i < 12; i++) {
			packet->setSubstructDataByName("spell_effects", "spell_id", i + 1, i);
			if (i % 2 == 0)
				packet->setSubstructDataByName("spell_effects", "cancellable", 1, i);
		}*/
		int testa = 0x41;
		int testb = 0x41;
		//160-330
		//0-250 (160-250) //top down view
		//250-290 nothing
		//290-330 //blocked view
		//310-330 nothing
		//1168: 00 00 00 00 00 00 00 00 - 00 00 00 00 00 41 41 41  | .............AAA
		//1184: 42 41 43 41 44 41 45 00 - 00 00 00 00 00 00 00 00 | BACADAE......... //blocked view
		//1184: 00 41 41 41 42 41 43 00 - 00 00 00 00 00 00 00 00 | .AAABAC......... //blocked view
		//1184: 00 41 41 41 41 00 00 00 - 00 00 00 00 00 00 00 00 | .AAAA........... //blocked view
		//1184: 00 41 41 00 00 00 00 00 - 00 00 00 00 00 00 00 00 | .AA............. //blocked view
		//1184: 00 41 00 00 00 00 00 00 - 00 00 00 00 00 00 00 00 | .AA............. //blocked view
		//1184: 41 00 00 00 00 00 00 00 - 00 00 00 00 00 00 00 00 | .AA............. //blocked view 293
		//1168: 00 00 00 00 00 00 00 00 - 00 00 00 00 00 00 00 41 | ...............A //blocked view 292
		//packet->setDataByName("screen_blur", 0); //1168: 00 00 00 00 00 00 00 00 - 00 00 00 00 00 00 41 00 //blurred view
		//packet->setDataByName("unknown18", testa, 295);
		//packet->setDataByName("unknown18", testa, 296);
		//packet->setDataByName("unknown18", testa, 297);
		//300 pet junk
		//492
	/*for (int i = 300; i < 360; i++) {
		packet->setDataByName("unknown19", testa, i);
		testa++;
		//packet->setDataByName("unknown19", 0xc3, i+1);
	}*/
	/*packet->setDataByName("pet_id", 5);
	packet->setDataByName("pet_name", "Blah");
	packet->setDataByName("pet_hp", .9);
	packet->setDataByName("pet_power", .8);*/
	/*packet->setDataByName("test7", 0x3f);
	packet->setDataByName("test8", 0xc3);
	packet->setDataByName("unknown17", 12);
	packet->setDataByName("unknown17", 12, 1);
	packet->setDataByName("unknown17", 12, 2);
	packet->setDataByName("unknown17", 12, 3);*/
		string* data = packet->serializeString();
		int32 size = data->length();
		/*uchar blah[] = { 0x31,0x02,0x00,0x00,0xff,0x4f,0x77,0x6b,0x65,0x65,0x63,0x65,0x87,0x61
	,0x67,0x68,0x1b,0x83,0x04,0x01,0x13,0x95,0x02,0x02,0x01,0x88,0x01,0x91,0x30,0x30
	,0xa2,0x01,0x30,0x84,0x30,0x8a,0x38,0x38,0xf0,0x17,0x01,0x17,0x9f,0x01,0x17,0x01
	,0x17,0x01,0x0a,0xd5,0x10,0x14,0x18,0x14,0xaa,0x14,0x10,0x14,0x95,0x18,0x14,0x14
	,0x09,0xd1,0x08,0x08,0x06,0x82,0x06,0x1a,0xd1,0x28,0x28,0x1e,0x8a,0x1e,0x01,0x1f
	,0x81,0x13,0x09,0x91,0x01,0x50,0x15,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff
	,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f
	,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff
	,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff
	,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f
	,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff
	,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff
	,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f
	,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff
	,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff
	,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x07,0x8f
	,0xff,0xff,0xff,0xff,0x07,0x8f,0xff,0xff,0xff,0xff,0x47,0x8f,0xff,0xff,0xff,0xff
	,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff
	,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f
	,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff
	,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86
	,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff
	,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff
	,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48
	,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff
	,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff
	,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff
	,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f
	,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff
	,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86
	,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff
	,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff
	,0xff,0xff,0xff,0x86,0xff,0xff,0x48,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x48
	,0x8f,0xff,0xff,0xff,0xff,0x86,0xff,0xff,0x0a,0x83,0xf0,0x41,0x7f,0x7f,0x7f,0x7f
	,0x3a,0xff,0xff,0xff,0xff,0xff,0x4e,0x6f,0x20,0x87,0x50,0x65,0x74,0x2d,0x9f,0x3f
	,0xc3,0x94,0xcb,0xc2,0x08,0x81,0x02 };*/
	//size = sizeof(blah);
	//packet->PrintPacket();
		uchar* tmp = new uchar[size];
		bool reverse = version > 283;
		if (!changes) {
			orig_packet = new uchar[size];
			changes = new uchar[size];
			memcpy(orig_packet, (uchar*)data->c_str(), size);

			//DumpPacket(orig_packet, size);
			size = Pack(tmp, orig_packet, size, size, version, reverse);
		}
		else {
			memcpy(changes, (uchar*)data->c_str(), size);
			if (modifyPos > 0) {
				uchar* ptr2 = (uchar*)changes;
				ptr2 += modifyPos - 1;
				if (modifyValue > 0xFFFF) {
					memcpy(ptr2, (uchar*)&modifyValue, 4);
				}
				else if (modifyValue > 0xFF) {
					memcpy(ptr2, (uchar*)&modifyValue, 2);
				}
				else
					memcpy(ptr2, (uchar*)&modifyValue, 1);
			}
			/*if (player->GetTempVariable("offset").length() > 0){
				changes[atoul(player->GetTempVariable("offset").c_str())] = 0xF4;
				changes[atoul(player->GetTempVariable("offset").c_str()) + 1] = 0x01;
			}*/
			Encode(changes, orig_packet, size);
			if (modifyPos > 0) {
				uchar* ptr2 = (uchar*)orig_packet;
				if (modifyPos > 64)
					ptr2 += modifyPos - 64;
				int16 tmpsize = modifyPos + 128;
				if (tmpsize > size)
					tmpsize = size;
				DumpPacket(ptr2, tmpsize - modifyPos);
			}
			size = Pack(tmp, changes, size, size, version, reverse);
			//DumpPacket(tmp, size);
		}

		if (version >= 546)
		{
			PacketStruct* control_packet = configReader.getStruct("WS_SetControlGhost", version);
			if (control_packet) {
				control_packet->setDataByName("spawn_id", 0xFFFFFFFF);
				control_packet->setDataByName("speed", player->GetSpeed());
				control_packet->setDataByName("air_speed", player->GetAirSpeed());
				control_packet->setDataByName("size", 0.51);
				Client* client = player->GetZone()->GetClientBySpawn(player);
				if (client)
					client->QueuePacket(control_packet->serialize());
				safe_delete(control_packet);
			}
		}

		EQ2Packet* ret_packet = new EQ2Packet(OP_UpdateCharacterSheetMsg, tmp, size);
		safe_delete(packet);
		safe_delete_array(tmp);
		return ret_packet;
	}
	return 0;
}

EQ2Packet* PlayerInfo::serializePet(int16 version) {
	PacketStruct* packet = configReader.getStruct("WS_CharacterPet", version);
	if(packet) {
		Spawn* pet = 0;
		pet = player->GetPet();
		if (!pet)
			pet = player->GetCharmedPet();

		if (pet) {
			packet->setDataByName("current_hp", pet->GetHP());
			packet->setDataByName("max_hp", pet->GetTotalHP());
			packet->setDataByName("base_hp", pet->GetTotalHPBase());

			packet->setDataByName("current_power", pet->GetPower());
			packet->setDataByName("max_power", pet->GetTotalPower());
			packet->setDataByName("base_power", pet->GetTotalPowerBase());

			packet->setDataByName("spawn_id", info_struct->get_pet_id());
			packet->setDataByName("spawn_id2", info_struct->get_pet_id());
			char pet_name[32];
			strncpy(pet_name, info_struct->get_pet_name().c_str(), 32);
			packet->setDataByName("name", pet_name);
			packet->setDataByName("no_pet", pet_name);

			if (version >= 57000) {
				packet->setDataByName("current_power3", pet->GetPower());
				packet->setDataByName("max_power3", pet->GetTotalPower());
				packet->setDataByName("health_pct_tooltip", (double)info_struct->get_pet_health_pct());
				packet->setDataByName("health_pct_bar", (double)info_struct->get_pet_health_pct());
			}
			else {
				packet->setDataByName("health_pct_tooltip", info_struct->get_pet_health_pct());
				packet->setDataByName("health_pct_bar", info_struct->get_pet_health_pct());
			}
			packet->setDataByName("power_pct_tooltip", info_struct->get_pet_power_pct());
			packet->setDataByName("power_pct_bar", info_struct->get_pet_power_pct());
			packet->setDataByName("unknown5", 255); // Hate % maybe
			packet->setDataByName("movement", info_struct->get_pet_movement());
			packet->setDataByName("behavior", info_struct->get_pet_behavior());
		}
		else {
			packet->setDataByName("current_hp", 0);
			packet->setDataByName("max_hp", 0);
			packet->setDataByName("base_hp", 0);
			packet->setDataByName("current_power", 0);
			packet->setDataByName("max_power", 0);
			packet->setDataByName("base_power", 0);

			packet->setDataByName("spawn_id", 0);
			packet->setDataByName("spawn_id2", 0xFFFFFFFF);
			packet->setDataByName("name", "");
			packet->setDataByName("no_pet", "No Pet");
			packet->setDataByName("health_pct_tooltip", 0);
			packet->setDataByName("health_pct_bar", 0);
			packet->setDataByName("power_pct_tooltip", 0);
			packet->setDataByName("power_pct_bar", 0);
			packet->setDataByName("unknown5", 0);
			packet->setDataByName("movement", 0);
			packet->setDataByName("behavior", 0);
		}


		string* data = packet->serializeString();
		int32 size = data->length();
		uchar* tmp = new uchar[size];
		// if this is the first time sending this packet create the buffers
		if(!pet_changes){
			pet_orig_packet = new uchar[size];
			pet_changes = new uchar[size];
			// copy the packet into the pet_orig_packet so we can xor against it in the future
			memcpy(pet_orig_packet, (uchar*)data->c_str(), size);
			// pack the packet, result ends up in tmp
			size = Pack(tmp, (uchar*)data->c_str(), size, size, version);
		}
		else{
			// copy the packet into pet_changes
			memcpy(pet_changes, (uchar*)data->c_str(), size);
			// XOR's the packet to the original, stores the new packet in the orig packet (will xor against that for the next update)
			// puts the xor packet into pet_changes.
			Encode(pet_changes, pet_orig_packet, size);
			// Pack the pet_changes packet, will put the packed size at the start, result ends up in tmp
			size = Pack(tmp, pet_changes, size, size, version);
		}

		// Create the packet that we will send
		EQ2Packet* ret_packet = new EQ2Packet(OP_CharacterPet, tmp, size+4);
		// Clean up
		safe_delete_array(tmp);
		safe_delete(packet);
		// Return the packet that will be sent to the client
		return ret_packet;
	}
	return 0;
}

bool Player::DamageEquippedItems(int8 amount, Client* client) {
	bool ret = false;
	int8 item_type;
	Item* item = 0;
	for(int8 i=0;i<NUM_SLOTS;i++){
		item = equipment_list.items[i];
		if(item) {
			item_type = item->generic_info.item_type;
			if (item->details.item_id > 0 && item_type != ITEM_TYPE_FOOD && item_type != ITEM_TYPE_BAUBLE && item_type != ITEM_TYPE_THROWN && 
			!item->CheckFlag2(INDESTRUCTABLE)){
				ret = true;
				if((item->generic_info.condition - amount) > 0)
					item->generic_info.condition -= amount;
				else
					item->generic_info.condition = 0;
				item->save_needed = true;
				if (client)
					client->QueuePacket(item->serialize(client->GetVersion(), false, this));
			}
		}
	}
	return ret;
}

int8 Player::ConvertSlotToClient(int8 slot, int16 version) {
	if (version <= 283) {
		if (slot == EQ2_FOOD_SLOT)
			slot = EQ2_ORIG_FOOD_SLOT;
		else if (slot == EQ2_DRINK_SLOT)
			slot = EQ2_ORIG_DRINK_SLOT;
		else if (slot > EQ2_EARS_SLOT_1 && slot <= EQ2_WAIST_SLOT)
			slot -= 1;
	}
	else if (version <= 546) {
		if (slot == EQ2_FOOD_SLOT)
			slot = EQ2_DOF_FOOD_SLOT;
		else if (slot == EQ2_DRINK_SLOT)
			slot = EQ2_DOF_DRINK_SLOT;
		else if (slot > EQ2_EARS_SLOT_1 && slot <= EQ2_WAIST_SLOT)
			slot -= 1;
	}
	return slot;
}

int8 Player::ConvertSlotFromClient(int8 slot, int16 version) {
	if (version <= 283) {
		if (slot == EQ2_ORIG_FOOD_SLOT)
			slot = EQ2_FOOD_SLOT;
		else if (slot == EQ2_ORIG_DRINK_SLOT)
			slot = EQ2_DRINK_SLOT;
		else if (slot > EQ2_EARS_SLOT_1 && slot <= EQ2_WAIST_SLOT)
			slot += 1;
	}
	else if (version <= 546) {
		if (slot == EQ2_DOF_FOOD_SLOT)
			slot = EQ2_FOOD_SLOT;
		else if (slot == EQ2_DOF_DRINK_SLOT)
			slot = EQ2_DRINK_SLOT;
		else if (slot > EQ2_EARS_SLOT_1 && slot <= EQ2_WAIST_SLOT)
			slot += 1;
	}
	return slot;
}

vector<EQ2Packet*>	Player::UnequipItem(int16 index, sint32 bag_id, int8 slot, int16 version, int8 appearance_type) {
	vector<EQ2Packet*>	packets;
	EquipmentItemList* equipList = &equipment_list;
	
	if(appearance_type)
		equipList = &appearance_equipment_list;
		
	Item* item = equipList->items[index];
	if (item && bag_id == -999) {
		int8 old_slot = item->details.slot_id;
		if (item_list.AssignItemToFreeSlot(item)) {
			if(appearance_type)
				database.DeleteItem(GetCharacterID(), item, "APPEARANCE");
			else
				database.DeleteItem(GetCharacterID(), item, "EQUIPPED");

			if (item->GetItemScript() && lua_interface)
				lua_interface->RunItemScript(item->GetItemScript(), "unequipped", item, this);
			const char* zone_script = world.GetZoneScript(GetZone()->GetZoneID());
			if (zone_script && lua_interface)
				lua_interface->RunZoneScript(zone_script, "item_unequipped", GetZone(), this, item->details.item_id, item->name.c_str(), 0, item->details.unique_id);
			item->save_needed = true;
			EQ2Packet* outapp = item_list.serialize(this, version);
			if (outapp) {
				packets.push_back(outapp);
				packets.push_back(item->serialize(version, false));
				EQ2Packet* bag_packet = SendBagUpdate(item->details.inv_slot_id, version);
				if (bag_packet)
					packets.push_back(bag_packet);
			}
			equipList->RemoveItem(index);
			SetEquippedItemAppearances();
			packets.push_back(equipList->serialize(version, this));
			SetCharSheetChanged(true);
			SetEquipment(0, old_slot);
		}
		else {
			PacketStruct* packet = configReader.getStruct("WS_DisplayText", version);
			if (packet) {
				packet->setDataByName("color", CHANNEL_COLOR_YELLOW);
				packet->setMediumStringByName("text", "Unable to unequip item: no free inventory locations.");
				packet->setDataByName("unknown02", 0x00ff);
				packets.push_back(packet->serialize());
				safe_delete(packet);
			}
		}
	}
	else if (item) {
		Item* to_item = 0;
		if(appearance_type && slot == 255)
		{
			sint16 tmpSlot = 0;
			item_list.GetFirstFreeSlot(&bag_id, &tmpSlot);
			if(tmpSlot >= 0 && tmpSlot < 255)
				slot = tmpSlot;
			else
				bag_id = 0;
		}

		if (item_list.items.count(bag_id) > 0 && item_list.items[bag_id][BASE_EQUIPMENT].count(slot) > 0)
			to_item = item_list.items[bag_id][BASE_EQUIPMENT][slot];
		if (to_item && equipList->CanItemBeEquippedInSlot(to_item, ConvertSlotFromClient(item->details.slot_id, version))) {
			equipList->RemoveItem(index);
			if(item->details.appearance_type)
				database.DeleteItem(GetCharacterID(), item, "APPEARANCE");
			else
				database.DeleteItem(GetCharacterID(), item, "EQUIPPED");
			
			database.DeleteItem(GetCharacterID(), to_item, "NOT-EQUIPPED");

			if (item->GetItemScript() && lua_interface)
				lua_interface->RunItemScript(item->GetItemScript(), "unequipped", item, this);

			if (to_item->GetItemScript() && lua_interface)
				lua_interface->RunItemScript(item->GetItemScript(), "equipped", to_item, this);

			item_list.RemoveItem(to_item);
			equipList->SetItem(item->details.slot_id, to_item);
			to_item->save_needed = true;
			packets.push_back(to_item->serialize(version, false));
			SetEquipment(to_item);
			item->details.inv_slot_id = bag_id;
			item->details.slot_id = slot;
			item->details.appearance_type = 0;
			item_list.AddItem(item);
			item->save_needed = true;
			SetEquippedItemAppearances();
			packets.push_back(item->serialize(version, false));
			packets.push_back(equipList->serialize(version, this));
			packets.push_back(item_list.serialize(this, version));
		}
		else if (to_item && to_item->IsBag() && to_item->details.num_slots > 0) {
			bool free_slot = false;
			for (int8 i = 0; i < to_item->details.num_slots; i++) {
				if (item_list.items[to_item->details.bag_id][appearance_type].count(i) == 0) {
					SetEquipment(0, item->details.slot_id);

					if(item->details.appearance_type)
						database.DeleteItem(GetCharacterID(), item, "APPEARANCE");
					else
						database.DeleteItem(GetCharacterID(), item, "EQUIPPED");

					if (item->GetItemScript() && lua_interface)
						lua_interface->RunItemScript(item->GetItemScript(), "unequipped", item, this);

					equipList->RemoveItem(index);
					item->details.inv_slot_id = to_item->details.bag_id;
					item->details.slot_id = i;
					item->details.appearance_type = to_item->details.appearance_type;
					item_list.AddItem(item);
					item->save_needed = true;
					SetEquippedItemAppearances();
					packets.push_back(equipList->serialize(version, this));
					packets.push_back(item->serialize(version, false));
					packets.push_back(to_item->serialize(version, false, this));
					packets.push_back(item_list.serialize(this, version));
					free_slot = true;
					break;
				}
			}
			if (!free_slot) {
				PacketStruct* packet = configReader.getStruct("WS_DisplayText", version);
				if (packet) {
					packet->setDataByName("color", CHANNEL_COLOR_YELLOW);
					packet->setMediumStringByName("text", "Unable to unequip item: no free space in the bag.");
					packet->setDataByName("unknown02", 0x00ff);
					packets.push_back(packet->serialize());
					safe_delete(packet);
				}
			}
		}
		else if (to_item) {
			PacketStruct* packet = configReader.getStruct("WS_DisplayText", version);
			if (packet) {
				packet->setDataByName("color", CHANNEL_COLOR_YELLOW);
				packet->setMediumStringByName("text", "Unable to swap items: that item cannot be equipped there.");
				packet->setDataByName("unknown02", 0x00ff);
				packets.push_back(packet->serialize());
				safe_delete(packet);
			}
		}
		else {
			if ((bag_id == 0 && slot < NUM_INV_SLOTS) || (bag_id == -3 && slot < NUM_BANK_SLOTS) || (bag_id == -4 && slot < NUM_SHARED_BANK_SLOTS)) {
				if (bag_id == -4 && item->CheckFlag(NO_TRADE)) {
					PacketStruct* packet = configReader.getStruct("WS_DisplayText", version);
					if (packet) {
						packet->setDataByName("color", CHANNEL_COLOR_YELLOW);
						packet->setMediumStringByName("text", "Unable to unequip item: that item cannot be traded.");
						packet->setDataByName("unknown02", 0x00ff);
						packets.push_back(packet->serialize());
						safe_delete(packet);
					}
				}
				else {
					// need to check if appearance slot vs equipped
					SetEquipment(0, item->details.slot_id);
					if(item->details.appearance_type)
						database.DeleteItem(GetCharacterID(), item, "APPEARANCE");
					else
						database.DeleteItem(GetCharacterID(), item, "EQUIPPED");

					if (item->GetItemScript() && lua_interface)
						lua_interface->RunItemScript(item->GetItemScript(), "unequipped", item, this);

					equipList->RemoveItem(index);
					item->details.inv_slot_id = bag_id;
					item->details.slot_id = slot;
					item->details.appearance_type = 0;
					item_list.AddItem(item);
					item->save_needed = true;
					SetEquippedItemAppearances();
					packets.push_back(equipList->serialize(version, this));
					packets.push_back(item->serialize(version, false));
					packets.push_back(item_list.serialize(this, version));
				}
			}
			else {
				Item* bag = item_list.GetItemFromUniqueID(bag_id, true);
				if (bag && bag->IsBag() && slot < bag->details.num_slots) {
					SetEquipment(0, item->details.slot_id);
					if(item->details.appearance_type)
						database.DeleteItem(GetCharacterID(), item, "APPEARANCE");
					else
						database.DeleteItem(GetCharacterID(), item, "EQUIPPED");

					if (item->GetItemScript() && lua_interface)
						lua_interface->RunItemScript(item->GetItemScript(), "unequipped", item, this);

					equipList->RemoveItem(index);
					item->details.inv_slot_id = bag_id;
					item->details.slot_id = slot;
					item->details.appearance_type = 0;
					item_list.AddItem(item);
					item->save_needed = true;
					SetEquippedItemAppearances();
					packets.push_back(equipList->serialize(version, this));
					packets.push_back(item->serialize(version, false));
					packets.push_back(item_list.serialize(this, version));
				}
			}
		}
		Item* bag = item_list.GetItemFromUniqueID(bag_id, true);
		if (bag && bag->IsBag())
			packets.push_back(bag->serialize(version, false, this));
	}
	return packets;
}

map<int32, Item*>* Player::GetItemList(){
	return item_list.GetAllItems();
}

vector<Item*>* Player::GetEquippedItemList(){
	return equipment_list.GetAllEquippedItems();
}

vector<Item*>* Player::GetAppearanceEquippedItemList(){
	return appearance_equipment_list.GetAllEquippedItems();
}

EQ2Packet*	Player::SendBagUpdate(int32 bag_unique_id, int16 version){
	Item* bag = 0;
	if(bag_unique_id > 0)
		bag = item_list.GetItemFromUniqueID(bag_unique_id, true);

	if(bag && bag->IsBag())
		return bag->serialize(version, false, this);
	return 0;
}

void Player::SetEquippedItemAppearances(){
	vector<Item*>* items = GetEquipmentList()->GetAllEquippedItems();
	vector<Item*>* appearance_items = GetAppearanceEquipmentList()->GetAllEquippedItems();
	if(items){
		for(int32 i=0;i<items->size();i++)
			SetEquipment(items->at(i));
		
		// just have appearance items brute force replace the slots after the fact
		for(int32 i=0;i<appearance_items->size();i++)
			SetEquipment(appearance_items->at(i));
	}
	safe_delete(items);
	safe_delete(appearance_items);
	info_changed = true;
	GetZone()->SendSpawnChanges(this);
}

EQ2Packet* Player::SwapEquippedItems(int8 slot1, int8 slot2, int16 version, int16 equip_type){
	EquipmentItemList* equipList = &equipment_list;
	
	// right now client seems to pass 3 for this? Not sure why when other fields has appearance equipment as type 1
	if(equip_type == 3)
		equipList = &appearance_equipment_list;
	
	Item* item_from = equipList->items[slot1];
	Item* item_to = equipList->items[slot2];
	if(item_from && equipList->CanItemBeEquippedInSlot(item_from, slot2)){
		if(item_to){
			if(!equipList->CanItemBeEquippedInSlot(item_to, slot1))
				return 0;
		}
		equipList->items[slot1] = nullptr;
		equipList->SetItem(slot2, item_from);
		if(item_to)
		{
			equipList->SetItem(slot1, item_to);
			item_to->save_needed = true;
		}
		item_from->save_needed = true;
		
		if (GetClient())
		{
			//EquipmentItemList* equipList = &equipment_list;
			
			//if(appearance_type)
			//	equipList = &appearance_equipment_list;
			
			if(item_to)
				GetClient()->QueuePacket(item_to->serialize(version, false, this));
			GetClient()->QueuePacket(item_from->serialize(version, false, this));
			GetClient()->QueuePacket(item_list.serialize(this, version));
		}
		return equipList->serialize(version, this);
	}
	return 0;
}
bool Player::CanEquipItem(Item* item) {
	if (item) {
		Client* client = GetZone()->GetClientBySpawn(this);
		if (client) {
			if (item->IsArmor() || item->IsWeapon() || item->IsFood() || item->IsRanged() || item->IsShield() || item->IsBauble() || item->IsAmmo() || item->IsThrown()) {
				if ((item->generic_info.skill_req1 == 0 || item->generic_info.skill_req1 == 0xFFFFFFFF || skill_list.HasSkill(item->generic_info.skill_req1)) && (item->generic_info.skill_req2 == 0 || item->generic_info.skill_req2 == 0xFFFFFFFF || skill_list.HasSkill(item->generic_info.skill_req2))) {
					int16 override_level = item->GetOverrideLevel(GetAdventureClass(), GetTradeskillClass());
					if (override_level > 0 && override_level <= GetLevel())
						return true;
					if (item->CheckClass(GetAdventureClass(), GetTradeskillClass()))
						if (item->CheckLevel(GetAdventureClass(), GetTradeskillClass(), GetLevel()))
							return true;
						else
							client->Message(CHANNEL_COLOR_RED, "You must be at least level %u to equip %s.", item->generic_info.adventure_default_level, item->CreateItemLink(client->GetVersion()).c_str());
					else
						client->Message(CHANNEL_COLOR_RED, "Your class may not equip %s.", item->CreateItemLink(client->GetVersion()).c_str());
				}
				else
					client->SimpleMessage(0, "You lack the skill required to equip this item.");
			}
			else
				client->Message(0, "Item %s isn't equipable.", item->name.c_str());
		}
	}
	return false;
}

vector<EQ2Packet*> Player::EquipItem(int16 index, int16 version, int8 appearance_type, int8 slot_id) {

	EquipmentItemList* equipList = &equipment_list;
	if(appearance_type)
		equipList = &appearance_equipment_list;

	vector<EQ2Packet*>	packets;
	if (item_list.indexed_items.count(index) == 0)
		return packets;
	Item* item = item_list.indexed_items[index];
	slot_id = ConvertSlotFromClient(slot_id, version);
	if (item) {
		if (slot_id != 255 && !item->HasSlot(slot_id))
			return packets;
		int8 slot = equipList->GetFreeSlot(item, slot_id);
		bool canEquip = CanEquipItem(item);
		if(canEquip && !appearance_type && item->CheckFlag2(APPEARANCE_ONLY))
		{
			GetClient()->SimpleMessage(CHANNEL_COLOR_RED, "This item is for appearance slots only.");
			return packets;
		}
		else if (canEquip && item->CheckFlag(ATTUNEABLE)) {
			PacketStruct* packet = configReader.getStruct("WS_ChoiceWindow", version);
			char text[255];
			sprintf(text, "%s must be attuned before it can be equipped. Would you like to attune it now?", item->name.c_str());
			char accept_command[25];
			sprintf(accept_command, "attune_inv %i 1 0 -1", index);
			packet->setDataByName("text", text);
			packet->setDataByName("accept_text", "Attune");
			packet->setDataByName("accept_command", accept_command);
			packet->setDataByName("cancel_text", "Cancel");
			// No clue if we even need the following 2 unknowns, just added them so the packet matches what live sends
			packet->setDataByName("max_length", 50);
			packet->setDataByName("unknown4", 1);
			packets.push_back(packet->serialize());
			safe_delete(packet);
			return packets;
		}
		if (canEquip && slot == 255)
		{
			if (slot_id == 255)
				slot = item->slot_data.at(0);
			else
				slot = slot_id;
			packets = UnequipItem(slot, item->details.inv_slot_id, item->details.slot_id, version, appearance_type);
			// If item is a 2handed weapon and something is in the secondary, unequip the secondary
			if (item->IsWeapon() && item->weapon_info->wield_type == ITEM_WIELD_TYPE_TWO_HAND && equipList->GetItem(EQ2_SECONDARY_SLOT) != 0) {
				vector<EQ2Packet*> tmp_packets = UnequipItem(EQ2_SECONDARY_SLOT, -999, 0, version, appearance_type);
				//packets.reserve(packets.size() + tmp_packets.size());
				packets.insert(packets.end(), tmp_packets.begin(), tmp_packets.end());
			}
		}
		else if (canEquip && slot < 255) {
			// If item is a 2handed weapon and something is in the secondary, unequip the secondary
			if (item->IsWeapon() && item->weapon_info->wield_type == ITEM_WIELD_TYPE_TWO_HAND && equipList->GetItem(EQ2_SECONDARY_SLOT) != 0) {
				vector<EQ2Packet*> tmp_packets = UnequipItem(EQ2_SECONDARY_SLOT, -999, 0, version, appearance_type);
				//packets.reserve(packets.size() + tmp_packets.size());
				packets.insert(packets.end(), tmp_packets.begin(), tmp_packets.end());
			}

			database.DeleteItem(GetCharacterID(), item, "NOT-EQUIPPED");

			if (item->GetItemScript() && lua_interface)
				lua_interface->RunItemScript(item->GetItemScript(), "equipped", item, this);

			item_list.RemoveItem(item);
			equipList->SetItem(ConvertSlotToClient(slot, version), item);
			item->save_needed = true;
			packets.push_back(item->serialize(version, false));
			SetEquipment(item);
			const char* zone_script = world.GetZoneScript(GetZone()->GetZoneID());
			if (zone_script && lua_interface)
				lua_interface->RunZoneScript(zone_script, "item_equipped", GetZone(), this, item->details.item_id, item->name.c_str(), 0, item->details.unique_id);
			int32 bag_id = item->details.inv_slot_id;
			if (item->generic_info.condition == 0) {
				Client* client = GetZone()->GetClientBySpawn(this);
				if (client) {

					LogWrite(MISC__TODO, 1, "TODO", "Send popup text in red 'Some of your equipment is broken!'\n\t(%s, function: %s, line #: %i)", __FILE__, __FUNCTION__, __LINE__);

					client->Message(CHANNEL_COLOR_RED, "Your %s is worn out and will not be effective until repaired.", item->CreateItemLink(client->GetVersion(), true).c_str());
				}
			}
			SetEquippedItemAppearances();
			packets.push_back(equipList->serialize(version, this));
			EQ2Packet* outapp = item_list.serialize(this, version);
			if (outapp) {
				packets.push_back(outapp);
				EQ2Packet* bag_packet = SendBagUpdate(bag_id, version);
				if (bag_packet)
					packets.push_back(bag_packet);
			}
			SetCharSheetChanged(true);
		}
	}
	return packets;
}
bool Player::AddItem(Item* item) {
	if (item && item->details.item_id > 0) {
		if (item_list.AssignItemToFreeSlot(item)) {
			item->save_needed = true;
			return true;
		}
		else if (item_list.AddOverflowItem(item))
			return true;
	}
	return false;
}
bool Player::AddItemToBank(Item* item) {

	if (item && item->details.item_id > 0) {

		sint32 bag = -3;
		sint16 slot = -1;
		if (item_list.GetFirstFreeBankSlot(&bag, &slot)) {
			item->details.inv_slot_id = bag;
			item->details.slot_id = slot;
			item->save_needed = true;
			item_list.AddItem(item);

			return true;
		}
		else if (item_list.AddOverflowItem(item))
			return true;
	}
	return false;
}
EQ2Packet* Player::SendInventoryUpdate(int16 version) {
	return item_list.serialize(this, version);
}
EQ2Packet* Player::MoveInventoryItem(sint32 to_bag_id, int16 from_index, int8 new_slot, int8 charges, int8 appearance_type, int16 version) {
	Item* item = item_list.GetItemFromIndex(from_index);
	int8 result = item_list.MoveItem(to_bag_id, from_index, new_slot, appearance_type, charges);
	if (result == 1) {
		if (item) {
			if (!item->needs_deletion)
				item->save_needed = true;
			else if (item->needs_deletion) {
				database.DeleteItem(GetCharacterID(), item, 0);
				safe_delete(item);
			}
		}
		return item_list.serialize(this, version);
	}
	else {
		PacketStruct* packet = configReader.getStruct("WS_DisplayText", version);
		if (packet) {
			packet->setDataByName("color", CHANNEL_COLOR_YELLOW);
			packet->setMediumStringByName("text", "Could not move item to that location.");
			packet->setDataByName("unknown02", 0x00ff);
			EQ2Packet* outapp = packet->serialize();
			safe_delete(packet);
			return outapp;
		}
	}
	return 0;
}

int32 Player::GetCoinsCopper(){
	return GetInfoStruct()->get_coin_copper();
}

int32 Player::GetCoinsSilver(){
	return GetInfoStruct()->get_coin_silver();
}

int32 Player::GetCoinsGold(){
	return GetInfoStruct()->get_coin_gold();
}

int32 Player::GetCoinsPlat(){
	return GetInfoStruct()->get_coin_plat();
}

int32 Player::GetBankCoinsCopper(){
	return GetInfoStruct()->get_bank_coin_copper();
}

int32 Player::GetBankCoinsSilver(){
	return GetInfoStruct()->get_bank_coin_silver();
}

int32 Player::GetBankCoinsGold(){
	return GetInfoStruct()->get_bank_coin_gold();
}

int32 Player::GetBankCoinsPlat(){
	return GetInfoStruct()->get_bank_coin_plat();
}

int32 Player::GetStatusPoints(){
	return GetInfoStruct()->get_status_points();
}

vector<QuickBarItem*>* Player::GetQuickbar(){
	return &quickbar_items;
}

bool Player::UpdateQuickbarNeeded(){
	return quickbar_updated;
}

void Player::ResetQuickbarNeeded(){
	quickbar_updated = false;
}

void Player::AddQuickbarItem(int32 bar, int32 slot, int32 type, int16 icon, int16 icon_type, int32 id, int8 tier, int32 unique_id, const char* text, bool update){
	RemoveQuickbarItem(bar, slot, false);
	QuickBarItem* ability = new QuickBarItem;
	ability->deleted = false;
	ability->hotbar = bar;
	ability->slot = slot;
	ability->type = type;
	ability->icon = icon;
	ability->tier = tier;
	ability->icon_type = icon_type;
	ability->id = id;
	if(unique_id == 0)
		unique_id = database.NextUniqueHotbarID();
	ability->unique_id = unique_id;
	if(type == QUICKBAR_TEXT_CMD && text){
		ability->text.data = string(text);
		ability->text.size = ability->text.data.length();
	}
	else
		ability->text.size = 0;
	quickbar_items.push_back(ability);
	if(update)
		quickbar_updated = true;
}

void Player::RemoveQuickbarItem(int32 bar, int32 slot, bool update){
	vector<QuickBarItem*>::iterator itr;
	QuickBarItem* qbi = 0;
	for(itr=quickbar_items.begin();itr!=quickbar_items.end();itr++){
		qbi = *itr;
		if(qbi && qbi->deleted == false && qbi->hotbar == bar && qbi->slot == slot){
			qbi->deleted = true;
			break;
		}
	}
	if(update)
		quickbar_updated = true;
}

void Player::ClearQuickbarItems(){
	quickbar_items.clear();
}

EQ2Packet* Player::GetQuickbarPacket(int16 version){
	PacketStruct* packet = configReader.getStruct("WS_QuickBarInit", version);
	if(packet){
		vector<QuickBarItem*>::iterator itr;
		packet->setArrayLengthByName("num_abilities", quickbar_items.size());
		int16 i=0;
		for(itr=quickbar_items.begin();itr != quickbar_items.end(); itr++){
			QuickBarItem* ability = *itr;
			if(!ability || ability->deleted)
				continue;
			packet->setArrayDataByName("hotbar", ability->hotbar, i);
			packet->setArrayDataByName("slot", ability->slot, i);
			packet->setArrayDataByName("type", ability->type, i);
			packet->setArrayDataByName("icon", ability->icon, i);
			packet->setArrayDataByName("icon_type", ability->icon_type, i);
			packet->setArrayDataByName("id", ability->id, i);
			packet->setArrayDataByName("unique_id", ability->tier, i);
			packet->setArrayDataByName("text", &ability->text, i);
			i++;
		}
		EQ2Packet* app = packet->serialize();
		safe_delete(packet);
		return app;
	}
	return 0;
}

void Player::AddSpellBookEntry(int32 spell_id, int8 tier, sint32 slot, int32 type, int32 timer, bool save_needed){
	SpellBookEntry* spell = new SpellBookEntry;
	spell->status = 169;
	spell->slot = slot;
	spell->spell_id = spell_id;
	spell->type = type;
	spell->tier = tier;
	spell->timer = timer;
	spell->save_needed = save_needed;
	spell->recast = 0;
	spell->recast_available = 0;
	spell->player = this;
	spell->visible = true;
	spell->in_use = false;
	spell->in_remiss = false;
	MSpellsBook.lock();
	spells.push_back(spell);
	MSpellsBook.unlock();
	
	if (type == SPELL_BOOK_TYPE_NOT_SHOWN)
		AddPassiveSpell(spell_id, tier);
}

void Player::RemoveSpellBookEntry(int32 spell_id, bool remove_passives_from_list){
	MSpellsBook.lock();
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = *itr;
		if(spell->spell_id == spell_id){
			if (spell->type == SPELL_BOOK_TYPE_NOT_SHOWN)
				RemovePassive(spell->spell_id, spell->tier, remove_passives_from_list);
			spells.erase(itr);
			break;
		}
	}
	MSpellsBook.unlock();
}

void Player::ResortSpellBook(int32 sort_by, int32 order, int32 pattern, int32 maxlvl_only, int32 book_type)
{
	//sort_by : 0 - alpha, 1 - level, 2 - category
	//order : 0 - ascending, 1 - descending
	//pattern : 0 - zigzag, 1 - down, 2 - across
	MSpellsBook.lock();

	if (!maxlvl_only)
	{
		switch (sort_by)
		{
		case 0:
			if (!order)
				stable_sort(spells.begin(), spells.end(), SortSpellEntryByName);
			else
				stable_sort(spells.begin(), spells.end(), SortSpellEntryByNameReverse);
			break;
		case 1:
			if (!order)
				stable_sort(spells.begin(), spells.end(), SortSpellEntryByLevel);
			else
				stable_sort(spells.begin(), spells.end(), SortSpellEntryByLevelReverse);
			break;
		case 2:
			if (!order)
				stable_sort(spells.begin(), spells.end(), SortSpellEntryByCategory);
			else
				stable_sort(spells.begin(), spells.end(), SortSpellEntryByCategoryReverse);
			break;
		}
	}

	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell = 0;
	int i = 0;
	map<string, SpellBookEntry*> tmpSpells;
	vector<SpellBookEntry*> resultSpells;
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		spell = *itr;

		if (spell->type != book_type || spell->slot == -1)
			continue;

		if (maxlvl_only)
		{
			Spell* actual_spell = 0;
			actual_spell = master_spell_list.GetSpell(spell->spell_id, spell->tier);

			std::regex re("^(.*?)(\\s(I{1,}[VX]{0,}|V{1,}[IVX]{0,})|X{1,}[IVX]{0,})$");
			std::string output = std::regex_replace(string(actual_spell->GetName()), re, "$1", std::regex_constants::format_no_copy);

			if ( output.size() < 1 )
				output = string(actual_spell->GetName());

			map<string, SpellBookEntry*>::iterator tmpItr = tmpSpells.find(output);
			if (tmpItr != tmpSpells.end())
			{
				Spell* tmpSpell = master_spell_list.GetSpell(tmpItr->second->spell_id, tmpItr->second->tier);
				if (actual_spell->GetLevelRequired(this) > tmpSpell->GetLevelRequired(this))
				{
					tmpItr->second->visible = false;
					tmpItr->second->slot = 0xFFFF;

					std::vector<SpellBookEntry*>::iterator it;
					it = find(resultSpells.begin(), resultSpells.end(), (SpellBookEntry*)tmpItr->second);
					if (it != resultSpells.end())
						resultSpells.erase(it);

					tmpSpells.erase(tmpItr);
				}
				else
					continue; // leave as-is we have the newer spell
			}
			
			spell->visible = true;
			tmpSpells.insert(make_pair(output, spell));
			resultSpells.push_back(spell);
		}
		spell->slot = i;
		i++;
	} // end for loop for setting slots

	if (maxlvl_only)
	{
		switch (sort_by)
		{
		case 0:
			if (!order)
				stable_sort(resultSpells.begin(), resultSpells.end(), SortSpellEntryByName);
			else
				stable_sort(resultSpells.begin(), resultSpells.end(), SortSpellEntryByNameReverse);
			break;
		case 1:
			if (!order)
				stable_sort(resultSpells.begin(), resultSpells.end(), SortSpellEntryByLevel);
			else
				stable_sort(resultSpells.begin(), resultSpells.end(), SortSpellEntryByLevelReverse);
			break;
		case 2:
			if (!order)
				stable_sort(resultSpells.begin(), resultSpells.end(), SortSpellEntryByCategory);
			else
				stable_sort(resultSpells.begin(), resultSpells.end(), SortSpellEntryByCategoryReverse);
			break;
		}

		i = 0;
		vector<SpellBookEntry*>::iterator tmpItr;
		for (tmpItr = resultSpells.begin(); tmpItr != resultSpells.end(); tmpItr++) {
			((SpellBookEntry*)*tmpItr)->slot = i;
			i++;
		}
	}

	MSpellsBook.unlock();
}

bool Player::SortSpellEntryByName(SpellBookEntry* s1, SpellBookEntry* s2)
{
	Spell* spell1 = master_spell_list.GetSpell(s1->spell_id, s1->tier);
	Spell* spell2 = master_spell_list.GetSpell(s2->spell_id, s2->tier);

	if (!spell1 || !spell2)
		return false;

	return (string(spell1->GetName()) < string(spell2->GetName()));
}

bool Player::SortSpellEntryByCategory(SpellBookEntry* s1, SpellBookEntry* s2)
{
	Spell* spell1 = master_spell_list.GetSpell(s1->spell_id, s1->tier);
	Spell* spell2 = master_spell_list.GetSpell(s2->spell_id, s2->tier);

	if (!spell1 || !spell2)
		return false;

	return (spell1->GetSpellIconBackdrop() < spell2->GetSpellIconBackdrop());
}

bool Player::SortSpellEntryByLevel(SpellBookEntry* s1, SpellBookEntry* s2)
{
	Spell* spell1 = master_spell_list.GetSpell(s1->spell_id, s1->tier);
	Spell* spell2 = master_spell_list.GetSpell(s2->spell_id, s2->tier);

	if (!spell1 || !spell2)
		return false;

	int16 lvl1 = spell1->GetLevelRequired(s1->player);
	int16 lvl2 = spell2->GetLevelRequired(s2->player);
	if (lvl1 == 0xFFFF)
		lvl1 = 0;
	if (lvl2 == 0xFFFF)
		lvl2 = 0;

	return (lvl1 < lvl2);
}

bool Player::SortSpellEntryByNameReverse(SpellBookEntry* s1, SpellBookEntry* s2)
{
	Spell* spell1 = master_spell_list.GetSpell(s1->spell_id, s1->tier);
	Spell* spell2 = master_spell_list.GetSpell(s2->spell_id, s2->tier);

	if (!spell1 || !spell2)
		return false;

	return (string(spell2->GetName()) < string(spell1->GetName()));
}

bool Player::SortSpellEntryByCategoryReverse(SpellBookEntry* s1, SpellBookEntry* s2)
{
	Spell* spell1 = master_spell_list.GetSpell(s1->spell_id, s1->tier);
	Spell* spell2 = master_spell_list.GetSpell(s2->spell_id, s2->tier);
	if (!spell1 || !spell2)
		return false;
	return (spell2->GetSpellIconBackdrop() < spell1->GetSpellIconBackdrop());
}

bool Player::SortSpellEntryByLevelReverse(SpellBookEntry* s1, SpellBookEntry* s2)
{
	Spell* spell1 = master_spell_list.GetSpell(s1->spell_id, s1->tier);
	Spell* spell2 = master_spell_list.GetSpell(s2->spell_id, s2->tier);

	if (!spell1 || !spell2)
		return false;

	int16 lvl1 = spell1->GetLevelRequired(s1->player);
	int16 lvl2 = spell2->GetLevelRequired(s2->player);
	if (lvl1 == 0xFFFF)
		lvl1 = 0;
	if (lvl2 == 0xFFFF)
		lvl2 = 0;

	return (lvl2 < lvl1);
}

int8 Player::GetSpellSlot(int32 spell_id){
	MSpellsBook.lock();
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = *itr;
		if(spell->spell_id == spell_id)
		{
			int8 slot = spell->slot;
			MSpellsBook.unlock();
			return slot;
		}
	}
	MSpellsBook.unlock();
	return 0;
}

void Player::AddSkill(int32 skill_id, int16 current_val, int16 max_val, bool save_needed){
	Skill* master_skill = master_skill_list.GetSkill(skill_id);
	if (master_skill) {
		Skill* skill = new Skill(master_skill);
		skill->current_val = current_val;
		skill->previous_val = current_val;
		skill->max_val = max_val;
		if (save_needed)
			skill->save_needed = true;
		skill_list.AddSkill(skill);
	}
}

void Player::RemovePlayerSkill(int32 skill_id, bool save) {
	Skill* skill = skill_list.GetSkill(skill_id);
	if (skill)
		RemoveSkillFromDB(skill, save);
}

void Player::RemoveSkillFromDB(Skill* skill, bool save) {
	skill_list.RemoveSkill(skill);
	if (save)
		database.DeleteCharacterSkill(GetCharacterID(), skill);
}

int16 Player::GetSpellSlotMappingCount(){
	int16 ret = 0;
	MSpellsBook.lock();
	for(int32 i=0;i<spells.size();i++){
		SpellBookEntry* spell = (SpellBookEntry*)spells[i];
		if(spell->slot >= 0 && spell->spell_id > 0)
			ret++;
	}
	MSpellsBook.unlock();
	return ret;
}

int8 Player::GetSpellTier(int32 id){
	int8 ret = 0;
	MSpellsBook.lock();
	for(int32 i=0;i<spells.size();i++){
		SpellBookEntry* spell = (SpellBookEntry*)spells[i];
		if(spell->spell_id == id){
			ret = spell->tier;
			break;
		}
	}
	MSpellsBook.unlock();
	return ret;
}

int16 Player::GetSpellPacketCount(){
	int16 ret = 0;
	MSpellsBook.lock();
	for(int32 i=0;i<spells.size();i++){
		SpellBookEntry* spell = (SpellBookEntry*)spells[i];
		if(spell->spell_id > 0)
			ret++;
	}
	MSpellsBook.unlock();
	return ret;
}

void Player::LockAllSpells() {
	vector<SpellBookEntry*>::iterator itr;

	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		if ((*itr)->type != SPELL_BOOK_TYPE_TRADESKILL)
			RemoveSpellStatus((*itr), SPELL_STATUS_LOCK, false);
	}

	all_spells_locked = true;

	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
}

void Player::UnlockAllSpells(bool modify_recast, Spell* exception) {
	vector<SpellBookEntry*>::iterator itr;
	int32 exception_spell_id = 0;
	if (exception)
		exception_spell_id = exception->GetSpellID();
	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		MaintainedEffects* effect = 0;
		if((effect = GetMaintainedSpell((*itr)->spell_id)) && effect->spell->spell->GetSpellData()->duration_until_cancel)
			continue;

		if ((*itr)->in_use == false && 
			 (((*itr)->spell_id != exception_spell_id || 
			 (*itr)->timer > 0 && (*itr)->timer != exception->GetSpellData()->linked_timer)
		&& (*itr)->type != SPELL_BOOK_TYPE_TRADESKILL))
			AddSpellStatus((*itr), SPELL_STATUS_LOCK, modify_recast);
		else if((*itr)->in_remiss)
		{
			AddSpellStatus((*itr), SPELL_STATUS_LOCK);
			(*itr)->in_remiss = false;
		}
	}

	all_spells_locked = false;

	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
}

void Player::LockSpell(Spell* spell, int16 recast) {
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell2;
	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		spell2 = *itr;
		if (spell2->spell_id == spell->GetSpellID() || (spell->GetSpellData()->linked_timer > 0 && spell->GetSpellData()->linked_timer == spell2->timer))
		{
			spell2->in_use = true;
			RemoveSpellStatus(spell2, SPELL_STATUS_LOCK, true, recast);
		}
		else if(spell2->in_use)
			RemoveSpellStatus(spell2, SPELL_STATUS_LOCK, false, 0);
	}
	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
}

void Player::UnlockSpell(Spell* spell) {
	if (spell->GetStayLocked())
		return;
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell2;	
	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		spell2 = *itr;
		if (spell2->spell_id == spell->GetSpellID() || (spell->GetSpellData()->linked_timer > 0 && spell->GetSpellData()->linked_timer == spell2->timer))
		{
			spell2->in_use = false;
			if(all_spells_locked)
				spell2->in_remiss = true;
			else
				AddSpellStatus(spell2, SPELL_STATUS_LOCK);
		}
	}
	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
}

void Player::LockTSSpells() {
	vector<SpellBookEntry*>::iterator itr;

	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		if ((*itr)->type == SPELL_BOOK_TYPE_TRADESKILL)
			RemoveSpellStatus(*itr, SPELL_STATUS_LOCK);
	}

	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
	// Unlock all other types
	UnlockAllSpells();
}

void Player::UnlockTSSpells() {
	vector<SpellBookEntry*>::iterator itr;

	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		if ((*itr)->type == SPELL_BOOK_TYPE_TRADESKILL)
			AddSpellStatus(*itr, SPELL_STATUS_LOCK);
	}

	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
	// Lock all other types
	LockAllSpells();
}

void Player::QueueSpell(Spell* spell) {
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell2;
	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		spell2 = *itr;
		if (spell2->spell_id == spell->GetSpellID())
			AddSpellStatus(spell2, SPELL_STATUS_QUEUE, false);
	}
	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
}

void Player::UnQueueSpell(Spell* spell) {
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell2;
	MSpellsBook.writelock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		spell2 = *itr;
		if (spell2->spell_id == spell->GetSpellID())
			RemoveSpellStatus(spell2, SPELL_STATUS_QUEUE, false);
	}
	MSpellsBook.releasewritelock(__FUNCTION__, __LINE__);
}

vector<Spell*> Player::GetSpellBookSpellsByTimer(int32 timerID) {
	vector<Spell*> ret;
	vector<SpellBookEntry*>::iterator itr;
	MSpellsBook.readlock(__FUNCTION__, __LINE__);
	for (itr = spells.begin(); itr != spells.end(); itr++) {
		if ((*itr)->timer == timerID)
			ret.push_back(master_spell_list.GetSpell((*itr)->spell_id, (*itr)->tier));
	}
	MSpellsBook.releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

void Player::ModifySpellStatus(SpellBookEntry* spell, sint16 value, bool modify_recast, int16 recast) {
	if (modify_recast) {
		spell->recast = recast;
		spell->recast_available = Timer::GetCurrentTime2()	+ (recast * 100);
	}
	if (modify_recast || spell->recast_available <= Timer::GetCurrentTime2() || value == 4) {
		spell->status += value; // use set/remove spell status now
	}
}
void Player::AddSpellStatus(SpellBookEntry* spell, sint16 value, bool modify_recast, int16 recast) {
	if (modify_recast) {
		spell->recast = recast;
		spell->recast_available = Timer::GetCurrentTime2() + (recast * 100);
	}
	if (modify_recast || spell->recast_available <= Timer::GetCurrentTime2() || value == 4) {
		spell->status = spell->status | value;
	}
}
void Player::RemoveSpellStatus(SpellBookEntry* spell, sint16 value, bool modify_recast, int16 recast) {
	if (modify_recast) {
		spell->recast = recast;
		spell->recast_available = Timer::GetCurrentTime2() + (recast * 100);
	}
	if (modify_recast || spell->recast_available <= Timer::GetCurrentTime2() || value == 4) {
		spell->status = spell->status & ~value;
	}

}
void Player::SetSpellStatus(Spell* spell, int8 status){
	MSpellsBook.lock();
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell2 = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell2 = *itr;
		if(spell2->spell_id == spell->GetSpellData()->id){
			spell2->status = spell2->status | status;
			break;
		}
	}
	MSpellsBook.unlock();
}

vector<SpellBookEntry*>* Player::GetSpellsSaveNeeded(){
	vector<SpellBookEntry*>* ret = 0;
	vector<SpellBookEntry*>::iterator itr;
	MSpellsBook.lock();
	SpellBookEntry* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = *itr;
		if(spell->save_needed){
			if(!ret)
				ret = new vector<SpellBookEntry*>;
			ret->push_back(spell);
		}
	}
	MSpellsBook.unlock();
	return ret;
}

int16 Player::GetTierUp(int16 tier)
{
	switch(tier)
	{
		case 0:
			break;
		case 7:
		case 9:
			tier -= 2;
			break;
		default:
			tier -= 1;
		break;
	}

	return tier;
}
bool Player::HasSpell(int32 spell_id, int8 tier, bool include_higher_tiers, bool include_possible_scribe){
	bool ret = false;
	vector<SpellBookEntry*>::iterator itr;
	MSpellsBook.lock();
	SpellBookEntry* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = *itr;
		if(spell->spell_id == spell_id && (tier == 255 || spell->tier == tier || (include_higher_tiers && spell->tier > tier) || (include_possible_scribe && tier <= spell->tier))){
			ret = true;
			break;
		}
	}
	MSpellsBook.unlock();
	return ret;
}

sint32 Player::GetFreeSpellBookSlot(int32 type){
	sint32 ret = 0;
	MSpellsBook.lock();
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = *itr;
		if(spell->type == type && spell->slot > ret) //get last slot (add 1 to it on return)
			ret = spell->slot;
	}
	MSpellsBook.unlock();
	return ret+1;
}

SpellBookEntry* Player::GetSpellBookSpell(int32 spell_id){
	MSpellsBook.lock();
	vector<SpellBookEntry*>::iterator itr;
	SpellBookEntry* ret = 0;
	SpellBookEntry* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = *itr;
		if(spell->spell_id == spell_id){
			ret = spell;
			break;
		}
	}
	MSpellsBook.unlock();
	return ret;
}

vector<int32> Player::GetSpellBookSpellIDBySkill(int32 skill_id) {
	vector<int32> ret;

	MSpellsBook.readlock(__FUNCTION__, __LINE__);
	vector<SpellBookEntry*>::iterator itr;
	Spell* spell = 0;
	for(itr = spells.begin(); itr != spells.end(); itr++){
		spell = master_spell_list.GetSpell((*itr)->spell_id, (*itr)->tier);
		if(spell && spell->GetSpellData()->mastery_skill == skill_id)
			ret.push_back(spell->GetSpellData()->id);
	}	
	MSpellsBook.releasereadlock(__FUNCTION__, __LINE__);

	return ret;
}


EQ2Packet* Player::GetSpellSlotMappingPacket(int16 version){
	PacketStruct* packet = configReader.getStruct("WS_SpellSlotMapping", version);
	if(packet){
		int16 count = GetSpellSlotMappingCount();
		int16 ptr = 0;
		if(count > 0){
			packet->setArrayLengthByName("spell_count", count);
			MSpellsBook.lock();
			for(int32 i=0;i<spells.size();i++){
				SpellBookEntry* spell = (SpellBookEntry*)spells[i];
				if(spell->slot < 0 || spell->spell_id == 0)
					continue;
				packet->setArrayDataByName("spell_id", spell->spell_id, ptr);
				packet->setArrayDataByName("slot_id", (int16)spell->slot, ptr);
				ptr++;
			}
			MSpellsBook.unlock();
			EQ2Packet* ret = packet->serialize();
			safe_delete(packet);
			return ret;
		}
		safe_delete(packet);
	}
	return 0;
}

EQ2Packet* Player::GetSpellBookUpdatePacket(int16 version) {
	PacketStruct* packet = configReader.getStruct("WS_UpdateSpellBook", version);
	EQ2Packet* ret = 0;
	if (packet) {
		Spell* spell = 0;
		SpellBookEntry* spell_entry = 0;
		int16 count = GetSpellPacketCount();
		int16 ptr = 0;
		// Get the packet size
		PacketStruct* packet2 = configReader.getStruct("SubStruct_UpdateSpellBook", version);
		int32 total_bytes = packet2->GetTotalPacketSize();
		safe_delete(packet2);
		packet->setArrayLengthByName("spell_count", count);
		if (count > 0) {
			if (count > spell_count) {
				uchar* tmp = 0;
				if (spell_orig_packet) {
					tmp = new uchar[count * total_bytes];
					memset(tmp, 0, total_bytes * count);
					memcpy(tmp, spell_orig_packet, spell_count * total_bytes);
					safe_delete_array(spell_orig_packet);
					safe_delete_array(spell_xor_packet);
					spell_orig_packet = tmp;
				}
				else {
					spell_orig_packet = new uchar[count * total_bytes];
					memset(spell_orig_packet, 0, total_bytes * count);
				}
				spell_xor_packet = new uchar[count * total_bytes];
				memset(spell_xor_packet, 0, count * total_bytes);
				spell_count = count;
			}
			MSpellsBook.lock();
			for (int32 i = 0; i < spells.size(); i++) {
				spell_entry = (SpellBookEntry*)spells[i];
				if (spell_entry->spell_id == 0)
					continue;
				spell = master_spell_list.GetSpell(spell_entry->spell_id, spell_entry->tier);
				if (spell) {			
					if (spell_entry->recast_available == 0 || Timer::GetCurrentTime2() > spell_entry->recast_available) {
						packet->setSubstructArrayDataByName("spells", "available", 1, 0, ptr);
					}
										
					packet->setSubstructArrayDataByName("spells", "spell_id", spell_entry->spell_id, 0, ptr);
					packet->setSubstructArrayDataByName("spells", "type", spell_entry->type, 0, ptr);
					packet->setSubstructArrayDataByName("spells", "recast_available", spell_entry->recast_available, 0, ptr);
					packet->setSubstructArrayDataByName("spells", "recast_time", spell_entry->recast, 0, ptr);
					packet->setSubstructArrayDataByName("spells", "status", spell_entry->status, 0, ptr);
					packet->setSubstructArrayDataByName("spells", "icon", (spell->GetSpellIcon() * -1) - 1, 0, ptr);
					packet->setSubstructArrayDataByName("spells", "icon_type", spell->GetSpellIconBackdrop(), 0, ptr);
					packet->setSubstructArrayDataByName("spells", "icon2", spell->GetSpellIconHeroicOp(), 0, ptr);
					packet->setSubstructArrayDataByName("spells", "unique_id", (spell_entry->tier + 1) * -1, 0, ptr); //this is actually GetSpellNameCrc(spell->GetName()), but hijacking it for spell tier
					packet->setSubstructArrayDataByName("spells", "charges", 255, 0, ptr);
					// Beastlord and Channeler spell support
					if (spell->GetSpellData()->savage_bar == 1)
						packet->setSubstructArrayDataByName("spells", "unknown6", 32, 0, ptr); // advantages
					else if (spell->GetSpellData()->savage_bar == 2)
						packet->setSubstructArrayDataByName("spells", "unknown6", 64, 0, ptr); // primal
					else if (spell->GetSpellData()->savage_bar == 3) {
						packet->setSubstructArrayDataByName("spells", "unknown6", 6, 1, ptr); // 6 = channeler
						// Slot req for channelers
						// bitmask for slots 1 = slot 1, 2 = slot 2, 4 = slot 3, 8 = slot 4, 16 = slot 5, 32 = slot 6, 64 = slot 7, 128 = slot 8
						packet->setSubstructArrayDataByName("spells", "savage_bar_slot", spell->GetSpellData()->savage_bar_slot, 0, ptr);
					}

					ptr++;
				}
			}
			MSpellsBook.unlock();
		}
		ret = packet->serializeCountPacket(version, 0, spell_orig_packet, spell_xor_packet);
		//packet->PrintPacket();
		//DumpPacket(ret);
		safe_delete(packet);
	}
	return ret;
}

PlayerInfo::~PlayerInfo(){
	RemoveOldPackets();
}

PlayerInfo::PlayerInfo(Player* in_player){
	orig_packet = 0;
	changes = 0;
	pet_orig_packet = 0;
	pet_changes = 0;
	player = in_player;
	info_struct = player->GetInfoStruct();
	info_struct->set_name(std::string(player->GetName()));
	info_struct->set_deity(std::string("None"));

	info_struct->set_class1(classes.GetBaseClass(player->GetAdventureClass()));
	info_struct->set_class2(classes.GetSecondaryBaseClass(player->GetAdventureClass()));
	info_struct->set_class3(player->GetAdventureClass());

	info_struct->set_race(player->GetRace());
	info_struct->set_gender(player->GetGender());
	info_struct->set_level(player->GetLevel());
	info_struct->set_tradeskill_level(player->GetTSLevel()); // JA: added 2011.07.22 to address TODO below
	info_struct->set_tradeskill_class1(classes.GetTSBaseClass(player->GetTradeskillClass()));
	info_struct->set_tradeskill_class2(classes.GetSecondaryTSBaseClass(player->GetTradeskillClass()));
	info_struct->set_tradeskill_class3(player->GetTradeskillClass());

	LogWrite(MISC__TODO, 1, "TODO", "Fix info_struct.tradeskill_level = player->GetArtLevel();\n\t(%s, function: %s, line #: %i)", __FILE__, __FUNCTION__, __LINE__);

	for(int i=0;i<45;i++){
		if(i<30){
			info_struct->maintained_effects[i].spell_id = 0xFFFFFFFF;
			info_struct->maintained_effects[i].icon = 0xFFFF;
			info_struct->maintained_effects[i].spell = nullptr;
		}
		info_struct->spell_effects[i].spell_id = 0xFFFFFFFF;	
		info_struct->spell_effects[i].spell = nullptr;	
	}
	
	house_zone_id = 0;
	bind_zone_id = 0;
	bind_x = 0;
	bind_y = 0;
	bind_z = 0;
	bind_heading = 0;
	boat_x_offset = 0;
	boat_y_offset = 0;
	boat_z_offset = 0;
	boat_spawn = 0;
}

MaintainedEffects* Player::GetFreeMaintainedSpellSlot(){
	MaintainedEffects* ret = 0;
	InfoStruct* info = GetInfoStruct();
	GetMaintainedMutex()->readlock(__FUNCTION__, __LINE__);
	for(int i=0;i<NUM_MAINTAINED_EFFECTS;i++){
		if(info->maintained_effects[i].spell_id == 0xFFFFFFFF){
			ret = &info->maintained_effects[i];
			ret->spell_id = 0;
			ret->slot_pos = i;
			break;
		}
	}
	GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

MaintainedEffects* Player::GetMaintainedSpell(int32 id){
	MaintainedEffects* ret = 0;
	InfoStruct* info = GetInfoStruct();
	GetMaintainedMutex()->readlock(__FUNCTION__, __LINE__);
	for(int i=0;i<NUM_MAINTAINED_EFFECTS;i++){
		if(info->maintained_effects[i].spell_id == id){
			ret = &info->maintained_effects[i];
			break;
		}
	}
	GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

MaintainedEffects* Player::GetMaintainedSpellBySlot(int8 slot){
	MaintainedEffects* ret = 0;
	InfoStruct* info = GetInfoStruct();
	GetMaintainedMutex()->readlock(__FUNCTION__, __LINE__);
	for(int i=0;i<NUM_MAINTAINED_EFFECTS;i++){
		if(info->maintained_effects[i].slot_pos == slot){
			ret = &info->maintained_effects[i];
			break;
		}
	}
	GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

MaintainedEffects* Player::GetMaintainedSpells() {
	return GetInfoStruct()->maintained_effects;
}

SpellEffects* Player::GetFreeSpellEffectSlot(){
	SpellEffects* ret = 0;
	InfoStruct* info = GetInfoStruct();
	GetSpellEffectMutex()->readlock(__FUNCTION__, __LINE__);
	for(int i=0;i<45;i++){
		if(info->spell_effects[i].spell_id == 0xFFFFFFFF){
			ret = &info->spell_effects[i];
			ret->spell_id = 0;
			break;
		}
	}
	GetSpellEffectMutex()->releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

SpellEffects* Player::GetSpellEffects() {
	return GetInfoStruct()->spell_effects;
}

void Player::ClearEverything(){
	index_mutex.writelock(__FUNCTION__, __LINE__);
	player_removed_spawns.clear();
	player_spawn_id_map.clear();
	player_spawn_reverse_id_map.clear();
	index_mutex.releasewritelock(__FUNCTION__, __LINE__);
	map<int32, vector<int32>*>::iterator itr;
	m_playerSpawnQuestsRequired.writelock(__FUNCTION__, __LINE__);
	for (itr = player_spawn_quests_required.begin(); itr != player_spawn_quests_required.end(); itr++){
		safe_delete(itr->second);
	}
	player_spawn_quests_required.clear();
	m_playerSpawnQuestsRequired.releasewritelock(__FUNCTION__, __LINE__);

	m_playerSpawnHistoryRequired.writelock(__FUNCTION__, __LINE__);
	for (itr = player_spawn_history_required.begin(); itr != player_spawn_history_required.end(); itr++){
		safe_delete(itr->second);
	}
	player_spawn_history_required.clear();
	m_playerSpawnHistoryRequired.releasewritelock(__FUNCTION__, __LINE__);

	info_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_info_packet_list.clear();
	info_mutex.releasewritelock(__FUNCTION__, __LINE__);

	vis_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_vis_packet_list.clear();
	vis_mutex.releasewritelock(__FUNCTION__, __LINE__);

	pos_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_pos_packet_list.clear();
	pos_mutex.releasewritelock(__FUNCTION__, __LINE__);
}

bool Player::IsFullyLoggedIn() {
	return fully_logged_in;
}
void Player::SetFullyLoggedIn(bool val) {
	fully_logged_in = val;
}
bool Player::IsResurrecting(){
	return resurrecting;
}
void Player::SetResurrecting(bool val){
	resurrecting = val;
}
void Player::AddMaintainedSpell(LuaSpell* luaspell){
	if(!luaspell)
		return;

	Spell* spell = luaspell->spell;
	MaintainedEffects* effect = GetFreeMaintainedSpellSlot();
	int32 target_type = 0;
	Spawn* spawn = 0;

	if(effect){
		GetMaintainedMutex()->writelock(__FUNCTION__, __LINE__);
		strcpy(effect->name, spell->GetSpellData()->name.data.c_str());
		effect->target = luaspell->initial_target;

		spawn = luaspell->caster->GetZone()->GetSpawnByID(luaspell->initial_target);
		if (spawn){
			if (spawn == this)
				target_type = 0;
			else if (GetPet() == spawn || GetCharmedPet() == spawn)
				target_type = 1;
			else
				target_type = 2;
		}
		effect->target_type = target_type;

		effect->spell = luaspell;
		if(!luaspell->slot_pos)
			luaspell->slot_pos = effect->slot_pos;
		effect->spell_id = spell->GetSpellData()->id;
		LogWrite(PLAYER__DEBUG, 5, "Player", "AddMaintainedSpell Spell ID: %u, req concentration: %u", spell->GetSpellData()->id, spell->GetSpellData()->req_concentration);
		effect->icon = spell->GetSpellData()->icon;
		effect->icon_backdrop = spell->GetSpellData()->icon_backdrop;
		effect->conc_used = spell->GetSpellData()->req_concentration;
		effect->total_time = spell->GetSpellDuration()/10;
		effect->tier = spell->GetSpellData()->tier;
		if (spell->GetSpellData()->duration_until_cancel)
			effect->expire_timestamp = 0xFFFFFFFF;
		else
			effect->expire_timestamp = Timer::GetCurrentTime2() + (spell->GetSpellDuration()*100);
		GetMaintainedMutex()->releasewritelock(__FUNCTION__, __LINE__);
		charsheet_changed = true;
	}
}
void Player::AddSpellEffect(LuaSpell* luaspell, int32 override_expire_time){
	if(!luaspell || !luaspell->caster)
		return;

	Spell* spell = luaspell->spell;
	SpellEffects* old_effect = GetSpellEffect(spell->GetSpellID(), luaspell->caster);
	SpellEffects* effect = 0;
	if (old_effect){
		GetZone()->RemoveTargetFromSpell(old_effect->spell, this);
		RemoveSpellEffect(old_effect->spell);
	}
	effect = GetFreeSpellEffectSlot();

	if(effect){
		GetSpellEffectMutex()->writelock(__FUNCTION__, __LINE__);
		effect->spell = luaspell;
		effect->spell_id = spell->GetSpellData()->id;
		effect->caster = luaspell->caster;
		effect->total_time = spell->GetSpellDuration()/10;
		if (spell->GetSpellData()->duration_until_cancel)
			effect->expire_timestamp = 0xFFFFFFFF;
		else if(override_expire_time)
			effect->expire_timestamp = Timer::GetCurrentTime2() + override_expire_time;
		else
			effect->expire_timestamp = Timer::GetCurrentTime2() + (spell->GetSpellDuration()*100);
		effect->icon = spell->GetSpellData()->icon;
		effect->icon_backdrop = spell->GetSpellData()->icon_backdrop;
		effect->tier = spell->GetSpellTier();
		GetSpellEffectMutex()->releasewritelock(__FUNCTION__, __LINE__);
		charsheet_changed = true;

		if(luaspell->caster && luaspell->caster->IsPlayer() && luaspell->caster != this)
		{
			GetClient()->TriggerSpellSave();
			((Player*)luaspell->caster)->GetClient()->TriggerSpellSave();
		}
	}	
}

void Player::RemoveMaintainedSpell(LuaSpell* luaspell){
	if(!luaspell)
		return;

	bool found = false;
	Client* client = GetZone()->GetClientBySpawn(this);
	LuaSpell* old_spell = 0;
	LuaSpell* current_spell = 0;
	GetMaintainedMutex()->writelock(__FUNCTION__, __LINE__);
	for(int i=0;i<30;i++){
		// If we already found the spell then we are bumping all other up one so there are no gaps in the ui
		// This check needs to be first so found can never be true on the first iteration (i = 0)
		if (found) {
			old_spell = GetInfoStruct()->maintained_effects[i - 1].spell;
			current_spell = GetInfoStruct()->maintained_effects[i].spell;

		    //Update the maintained window uses_remaining and damage_remaining values
			if (current_spell && current_spell->num_triggers > 0)
				ClientPacketFunctions::SendMaintainedExamineUpdate(client, i - 1, current_spell->num_triggers, 0);
			else if (current_spell && current_spell->damage_remaining > 0)
				ClientPacketFunctions::SendMaintainedExamineUpdate(client, i - 1, current_spell->damage_remaining, 1);
			else if (old_spell && old_spell->had_triggers)
				ClientPacketFunctions::SendMaintainedExamineUpdate(client, i - 1, 0, 0);
			else if (old_spell && old_spell->had_dmg_remaining)
				ClientPacketFunctions::SendMaintainedExamineUpdate(client, i - 1, 0, 1);


			GetInfoStruct()->maintained_effects[i].slot_pos = i - 1;
			GetInfoStruct()->maintained_effects[i - 1] = GetInfoStruct()->maintained_effects[i];
			if (current_spell)
				current_spell->slot_pos = i - 1;
		}
		// Compare spells, if we found a match set the found flag
		if(GetInfoStruct()->maintained_effects[i].spell == luaspell)
			found = true;
	}
	// if we found the spell in the array then we need to flag the char sheet as changed and set the last element to empty
	if (found) {
		memset(&GetInfoStruct()->maintained_effects[29], 0, sizeof(MaintainedEffects));
		GetInfoStruct()->maintained_effects[29].spell_id = 0xFFFFFFFF;
		GetInfoStruct()->maintained_effects[29].icon = 0xFFFF;
		GetInfoStruct()->maintained_effects[29].spell = nullptr;
		charsheet_changed = true;
	}
	GetMaintainedMutex()->releasewritelock(__FUNCTION__, __LINE__);
}

void Player::RemoveSpellEffect(LuaSpell* spell){
	bool found = false;
	GetSpellEffectMutex()->writelock(__FUNCTION__, __LINE__);
	for(int i=0;i<45;i++){
		if (found) {
			GetInfoStruct()->spell_effects[i-1] = GetInfoStruct()->spell_effects[i];
		}
		if(GetInfoStruct()->spell_effects[i].spell == spell)
			found = true;
	}
	if (found) {
		memset(&GetInfoStruct()->spell_effects[44], 0, sizeof(SpellEffects));
		GetInfoStruct()->spell_effects[44].spell_id = 0xFFFFFFFF;
		changed = true;
		info_changed = true;
		AddChangedZoneSpawn();
		charsheet_changed = true;
	}
	GetSpellEffectMutex()->releasewritelock(__FUNCTION__, __LINE__);
}

bool Player::HasActiveMaintainedSpell(Spell* spell, Spawn* target){
	GetMaintainedMutex()->readlock(__FUNCTION__, __LINE__);
	for(int i=0;i<30;i++){
		if (GetInfoStruct()->maintained_effects[i].spell_id == spell->GetSpellData()->id){
			GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
			return true;
		}
	}
	GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
	return false;
}

bool Player::HasActiveSpellEffect(Spell* spell, Spawn* target){
	return false;
}

void Player::PrepareIncomingMovementPacket(int32 len, uchar* data, int16 version)
{
	LogWrite(PLAYER__DEBUG, 7, "Player", "Enter: %s", __FUNCTION__); // trace

	// XML structs may be to slow to use in this portion of the code as a single
	// client sends a LOT of these packets when they are moving.  I have commented
	// out all the code for xml structs, to switch to it just uncomment
	// the code and comment the 2 if/else if/else blocks, both have a comment
	// above them to let you know wich ones they are.

	//PacketStruct* update = configReader.getStruct("WS_PlayerPosUpdate", version);
	int16 total_bytes;		// = update->GetTotalPacketSize();

	// Comment out this if/else if/else block if you switch to xml structs
	if (version >= 1144)
		total_bytes = sizeof(Player_Update1144);
	else if (version >= 1096)
		total_bytes = sizeof(Player_Update1096);
	else if (version <= 283)
		total_bytes = sizeof(Player_Update283);
	else
		total_bytes = sizeof(Player_Update);

	if (!movement_packet)
		movement_packet = new uchar[total_bytes];
	else if (!old_movement_packet)
		old_movement_packet = new uchar[total_bytes];
	if (movement_packet && old_movement_packet)
		memcpy(old_movement_packet, movement_packet, total_bytes);
	bool reverse = version > 283;
	Unpack(len, data, movement_packet, total_bytes, 0, reverse);
	if (!movement_packet || !old_movement_packet)
		return;
	Decode(movement_packet, old_movement_packet, total_bytes);

	//update->LoadPacketData(movement_packet, total_bytes);

	int32 activity;		// = update->getType_int32_ByName("activity");
	int32 grid_id;		// = update->getType_int32_ByName("grid_location");
	float direction1;	// = update->getType_float_ByName("direction1");
	float direction2;	// = update->getType_float_ByName("direction2");;
	float speed;		// = update->getType_float_ByName("speed");;
	float side_speed;
	float x;			// = update->getType_float_ByName("x");;
	float y;			// = update->getType_float_ByName("y");;
	float z;			// = update->getType_float_ByName("z");;
	float x_speed;
	float y_speed;
	float z_speed;

	// comment out this if/else if/else block if you use xml structs
	if (version >= 1144) {
		Player_Update1144* update = (Player_Update1144*)movement_packet;
		activity = update->activity;
		grid_id = update->grid_location;
		direction1 = update->direction1;
		direction2 = update->direction2;
		speed = update->speed;
		side_speed = update->side_speed;
		x = update->x;
		y = update->y;
		z = update->z;
		x_speed = update->speed_x;
		y_speed = update->speed_y;
		z_speed = update->speed_z;

		SetPitch(180 + update->pitch);
	}
	else if (version >= 1096) {
		Player_Update1096* update = (Player_Update1096*)movement_packet;
		activity = update->activity;
		grid_id = update->grid_location;
		direction1 = update->direction1;
		direction2 = update->direction2;
		speed = update->speed;
		side_speed = update->side_speed;
		x = update->x;
		y = update->y;
		z = update->z;
		x_speed = update->speed_x;
		y_speed = update->speed_y;
		z_speed = update->speed_z;

		SetPitch(180 + update->pitch);
	}
	else if (version <= 283) {
		Player_Update283* update = (Player_Update283*)movement_packet;
		activity = update->activity;
		grid_id = update->grid_location;
		direction1 = update->direction1;
		direction2 = update->direction2;
		speed = update->speed;
		side_speed = update->side_speed;
		x = update->x;
		y = update->y;
		z = update->z;
		x_speed = update->speed_x;
		y_speed = update->speed_y;
		z_speed = update->speed_z;
		if (update->pitch != 0)
			SetPitch(180 + update->pitch);
	}
	else {
		Player_Update* update = (Player_Update*)movement_packet;
		activity = update->activity;
		grid_id = update->grid_location;
		direction1 = update->direction1;
		direction2 = update->direction2;
		speed = update->speed;
		side_speed = update->side_speed;
		x = update->x;
		y = update->y;
		z = update->z;
		x_speed = update->speed_x;
		y_speed = update->speed_y;
		z_speed = update->speed_z;
		appearance.pos.X2 = update->orig_x;
		appearance.pos.Y2 = update->orig_y;
		appearance.pos.Z2 = update->orig_z;
		appearance.pos.X3 = update->orig_x2;
		appearance.pos.Y3 = update->orig_y2;
		appearance.pos.Z3 = update->orig_z2;
		SetPitch(180 + update->pitch);
	}

	SetHeading((sint16)(direction1 * 64), (sint16)(direction2 * 64));
	if (activity != last_movement_activity) {
		if (GetZone() && GetZone()->GetDrowningVictim(this) && (activity == UPDATE_ACTIVITY_RUNNING || activity == UPDATE_ACTIVITY_IN_WATER_ABOVE)) // not drowning anymore
			GetZone()->RemoveDrowningVictim(this);

		if ((activity == UPDATE_ACTIVITY_DROWNING || activity == UPDATE_ACTIVITY_DROWNING2) && GetZone() && !GetInvulnerable()) //drowning
			GetZone()->AddDrowningVictim(this);

		if (activity == UPDATE_ACTIVITY_JUMPING || activity == UPDATE_ACTIVITY_FALLING)
			SetInitialState(1024);
		else if (GetInitialState() == 1024)
			SetInitialState(16512);

		last_movement_activity = activity;
	}

	//Player is riding a lift, update lift XYZ offsets and the lift's spawn pointer
	if (activity & UPDATE_ACTIVITY_RIDING_BOAT) {
		Spawn* boat = 0;

		float boat_x = x;
		float boat_y = y;
		float boat_z = z;

		if (GetBoatSpawn() == 0 && GetZone()) {
			boat = GetZone()->GetClosestTransportSpawn(GetX(), GetY(), GetZ());
			SetBoatSpawn(boat);
			printf("Set boat: %s\n", boat ? boat->GetName() : "notset");
			if(boat)
			{
				boat->AddRailPassenger(GetCharacterID());
				GetZone()->CallSpawnScript(boat, SPAWN_SCRIPT_BOARD, this);
			}
		}

		if (boat || (GetBoatSpawn() && GetZone())) {
			if (!boat)
				boat = GetZone()->GetSpawnByID(GetBoatSpawn());

			if (boat && boat->IsWidget() && ((Widget*)boat)->GetMultiFloorLift()) {
				boat_x -= boat->GetX();
				boat_y -= boat->GetY();
				boat_z -= boat->GetZ();

				//appearance.pos.grid_id = grid_id;
			}
		}

		SetBoatX(boat_x);
		SetBoatY(boat_y);
		SetBoatZ(boat_z);
		pos_packet_speed = speed;
		grid_id = appearance.pos.grid_id;
	}
	else if (GetBoatSpawn() > 0 && !lift_cooldown.Enabled())
	{
		lift_cooldown.Start(100, true);
	}
	else if(lift_cooldown.Check())
	{
		printf("Disable boat\n");
		if(GetBoatSpawn())
		{
			Spawn* boat = GetZone()->GetSpawnByID(GetBoatSpawn());
			if(boat)
			{
				boat->RemoveRailPassenger(GetCharacterID());
				GetZone()->CallSpawnScript(boat, SPAWN_SCRIPT_EMBARK, this);
			}
		}
		SetBoatSpawn(0);
	}

	if (!IsResurrecting() && !GetBoatSpawn())
	{
		if (!IsRooted() && !IsMezzedOrStunned()) {
			SetX(x);
			SetY(y);
			SetZ(z);
			SetSpeedX(x_speed);
			SetSpeedY(y_speed);
			SetSpeedZ(z_speed);
			SetSideSpeed(side_speed);
			pos_packet_speed = speed;
		}
		else {
			SetSpeedX(0);
			SetSpeedY(0);
			SetSpeedZ(0);
			SetSideSpeed(0);
			pos_packet_speed = 0;
		}
	}

	if (appearance.pos.grid_id != grid_id)
	{
		LogWrite(PLAYER__DEBUG, 0, "Player", "%s left grid %u and entered grid %u", appearance.name, appearance.pos.grid_id, grid_id);
		const char* zone_script = world.GetZoneScript(GetZone()->GetZoneID());

		if (zone_script && lua_interface)
		{
			lua_interface->RunZoneScript(zone_script, "enter_location", GetZone(), this, grid_id);
			lua_interface->RunZoneScript(zone_script, "leave_location", GetZone(), this, appearance.pos.grid_id);
		}

		appearance.pos.grid_id = grid_id;
	}
	if (activity == UPDATE_ACTIVITY_IN_WATER_ABOVE || activity == UPDATE_ACTIVITY_IN_WATER_BELOW) {
		if (MakeRandomFloat(0, 100) < 25)
			GetSkillByName("Swimming", true);
	}
	// don't have to uncomment the print packet but you MUST uncomment the safe_delete() for xml structs
	//update->PrintPacket();
	//safe_delete(update);

	LogWrite(PLAYER__DEBUG, 7, "Player", "Exit: %s", __FUNCTION__); // trace
}

int16 Player::GetLastMovementActivity(){
	return last_movement_activity;
}

void Player::AddSpawnInfoPacketForXOR(int32 spawn_id, uchar* packet, int16 packet_size){
	spawn_info_packet_list[spawn_id] = string((char*)packet, packet_size);
}

void Player::AddSpawnPosPacketForXOR(int32 spawn_id, uchar* packet, int16 packet_size){
	spawn_pos_packet_list[spawn_id] = string((char*)packet, packet_size);
}

uchar* Player::GetSpawnPosPacketForXOR(int32 spawn_id){
	uchar* ret = 0;
	if(spawn_pos_packet_list.count(spawn_id) == 1)
		ret = (uchar*)spawn_pos_packet_list[spawn_id].c_str();
	return ret;
}
uchar* Player::GetSpawnInfoPacketForXOR(int32 spawn_id){
	uchar* ret = 0;
	if(spawn_info_packet_list.count(spawn_id) == 1)
		ret = (uchar*)spawn_info_packet_list[spawn_id].c_str();
	return ret;
}
void Player::AddSpawnVisPacketForXOR(int32 spawn_id, uchar* packet, int16 packet_size){
	spawn_vis_packet_list[spawn_id] = string((char*)packet, packet_size);
}

uchar* Player::GetSpawnVisPacketForXOR(int32 spawn_id){
	uchar* ret = 0;
	if(spawn_vis_packet_list.count(spawn_id) == 1)
		ret = (uchar*)spawn_vis_packet_list[spawn_id].c_str();
	return ret;
}

uchar* Player::GetTempInfoPacketForXOR(){
	return spawn_tmp_info_xor_packet;
}

uchar* Player::GetTempVisPacketForXOR(){
	return spawn_tmp_vis_xor_packet;
}

uchar* Player::GetTempPosPacketForXOR(){
	return spawn_tmp_pos_xor_packet;
}

uchar* Player::SetTempInfoPacketForXOR(int16 size){
	spawn_tmp_info_xor_packet = new uchar[size];
	info_xor_size = size;
	return spawn_tmp_info_xor_packet;
}

uchar* Player::SetTempVisPacketForXOR(int16 size){
	spawn_tmp_vis_xor_packet = new uchar[size];
	vis_xor_size = size;
	return spawn_tmp_vis_xor_packet;
}

uchar* Player::SetTempPosPacketForXOR(int16 size){
	spawn_tmp_pos_xor_packet = new uchar[size];
	pos_xor_size = size;
	return spawn_tmp_pos_xor_packet;
}

bool Player::CheckPlayerInfo(){
	return info != 0;
}

bool Player::NeedsSpawnResent(Spawn* spawn){
	return WasSentSpawn(spawn->GetID()) && WasSpawnRemoved(spawn);
}

bool Player::WasSentSpawn(int32 spawn_id){
	bool ret;
	info_mutex.readlock(__FUNCTION__, __LINE__);
	ret = spawn_info_packet_list.count(spawn_id) == 1;
	info_mutex.releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

PlayerSkillList* Player::GetSkills(){
	return &skill_list;
}

void Player::InCombat(bool val, bool range) {
	if (val)
		GetInfoStruct()->set_flags(GetInfoStruct()->get_flags() | (1 << (range?CF_RANGED_AUTO_ATTACK:CF_AUTO_ATTACK)));
	else
		GetInfoStruct()->set_flags(GetInfoStruct()->get_flags() & ~(1 << (range?CF_RANGED_AUTO_ATTACK:CF_AUTO_ATTACK)));

	bool changeCombatState = false;
	
	if((in_combat && !val) || (!in_combat && val))
		changeCombatState = true;

	in_combat = val;
	if(in_combat)
		AddIconValue(64);
	else
		RemoveIconValue(64);

	if(changeCombatState)
		SetRegenValues(GetInfoStruct()->get_effective_level());

	charsheet_changed = true;
	info_changed = true;
}

void Player::SetCharSheetChanged(bool val){
	charsheet_changed = val;
}

bool Player::GetCharSheetChanged(){
	return charsheet_changed;
}

bool Player::AdventureXPEnabled(){
	return (GetInfoStruct()->get_flags() & (1 << CF_COMBAT_EXPERIENCE_ENABLED));
}

bool Player::TradeskillXPEnabled() {
	// TODO: need to identify the flag to togle tradeskill xp
	return true;
}

void Player::set_character_flag(int flag){
	LogWrite(PLAYER__DEBUG, 0, "Player", "Flag: %u", flag);
	LogWrite(PLAYER__DEBUG, 0, "Player", "Flags before: %u, Flags2: %u", GetInfoStruct()->get_flags(), GetInfoStruct()->get_flags2());

	if (flag > CF_MAXIMUM_FLAG) return;
	if (flag < 32) GetInfoStruct()->set_flags(GetInfoStruct()->get_flags() | (1 << flag));
	else GetInfoStruct()->set_flags2(GetInfoStruct()->get_flags2() | (1 << (flag - 32)));
	charsheet_changed = true;
	info_changed = true;

	LogWrite(PLAYER__DEBUG, 0, "Player", "Flags after: %u, Flags2: %u", GetInfoStruct()->get_flags(), GetInfoStruct()->get_flags2());
}

void Player::reset_character_flag(int flag){
	LogWrite(PLAYER__DEBUG, 0, "Player", "Flag: %u", flag);
	LogWrite(PLAYER__DEBUG, 0, "Player", "Flags before: %u, Flags2: %u", GetInfoStruct()->get_flags(), GetInfoStruct()->get_flags2());

	if (flag > CF_MAXIMUM_FLAG) return;
	if (flag < 32)
	{
		int8 origflag = GetInfoStruct()->get_flags();
		GetInfoStruct()->set_flags(origflag &= ~(1 << flag));
	}
	else
	{
		int8 flag2 = GetInfoStruct()->get_flags2();
		GetInfoStruct()->set_flags2(flag2  &= ~(1 << (flag - 32)));
	}
	charsheet_changed = true;
	info_changed = true;

	LogWrite(PLAYER__DEBUG, 0, "Player", "Flags after: %u, Flags2: %u", GetInfoStruct()->get_flags(), GetInfoStruct()->get_flags2());
}

void Player::toggle_character_flag(int flag){
	LogWrite(PLAYER__DEBUG, 0, "Player", "Flag: %u", flag);
	LogWrite(PLAYER__DEBUG, 0, "Player", "Flags before: %u, Flags2: %u", GetInfoStruct()->get_flags(), GetInfoStruct()->get_flags2());

	if (flag > CF_MAXIMUM_FLAG) return;
	if (flag < 32)
	{
		int32 origflag = GetInfoStruct()->get_flags();
		GetInfoStruct()->set_flags(origflag ^= (1 << flag));
	}
	else
	{
		int32 flag2 = GetInfoStruct()->get_flags2();
		GetInfoStruct()->set_flags2(flag2  ^= (1 << (flag - 32)));
	}
	charsheet_changed = true;
	info_changed = true;

	LogWrite(PLAYER__DEBUG, 0, "Player", "Flags after: %u, Flags2: %u", GetInfoStruct()->get_flags(), GetInfoStruct()->get_flags2());
}

bool Player::get_character_flag(int flag){
	bool ret = false;

	if (flag > CF_MAXIMUM_FLAG){
		LogWrite(PLAYER__DEBUG, 0, "Player", "Player::get_character_flag error: attempted to check flag %i", flag);
		return ret;
	}
	if (flag < 32) ret = ((GetInfoStruct()->get_flags()) >> flag & 1);
	else ret = ((GetInfoStruct()->get_flags2()) >> (flag - 32) & 1);

	return ret;
}

float Player::GetXPVitality(){
	return GetInfoStruct()->get_xp_vitality();
}

float Player::GetTSXPVitality() {
	return GetInfoStruct()->get_tradeskill_xp_vitality();
}

bool Player::DoubleXPEnabled(){
	return GetInfoStruct()->get_xp_vitality() > 0;
}

void Player::SetCharacterID(int32 new_id){
	char_id = new_id;
}

int32 Player::GetCharacterID(){
	return char_id;
}

float Player::CalculateXP(Spawn* victim){
	if(AdventureXPEnabled() == false || !victim)
		return 0;
	float multiplier = 0;

	float zone_xp_modifier = 1;				// let's be safe!!
	if( GetZone()->GetXPModifier() != 0 ) {
		zone_xp_modifier = GetZone()->GetXPModifier();
		LogWrite(PLAYER__DEBUG, 5, "XP", "Zone XP Modifier = %.2f", zone_xp_modifier);
	}

	switch(GetArrowColor(victim->GetLevel())){
		case ARROW_COLOR_GREEN:
			multiplier = 3.25;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Green Arrow Multiplier = %.2f", multiplier);
			break;
		case ARROW_COLOR_BLUE:
			multiplier = 3.5;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Blue Arrow Multiplier = %.2f", multiplier);
			break;
		case ARROW_COLOR_WHITE:
			multiplier = 4;
			LogWrite(PLAYER__DEBUG, 5, "XP", "White Arrow Multiplier = %.2f", multiplier);
			break;
		case ARROW_COLOR_YELLOW:
			multiplier = 4.25;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Yellow Arrow Multiplier = %.2f", multiplier);
			break;
		case ARROW_COLOR_ORANGE:
			multiplier = 4.5;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Orange Arrow Multiplier = %.2f", multiplier);
			break;
		case ARROW_COLOR_RED:
			multiplier = 6;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Red Arrow Multiplier = %.2f", multiplier);
			break;
	}
	float total = multiplier * 8;	
	LogWrite(PLAYER__DEBUG, 5, "XP", "Multiplier * 8 = %.2f", total);

	if(victim->GetEncounterLevel() > 6) { // no need to multiply by 1 if this is a normal mob
		total *= (victim->GetEncounterLevel() - 5);
		LogWrite(PLAYER__DEBUG, 5, "XP", "Encounter > 6, total = %.2f", total);
	}
	else if(victim->GetEncounterLevel() <= 5) {
		total /= (7 - victim->GetEncounterLevel()); //1 down mobs are worth half credit, 2 down worth .25, etc
		LogWrite(PLAYER__DEBUG, 5, "XP", "Encounter <= 5, total = %.2f", total);
	}

	if(victim->GetHeroic() > 1) {
		total *= victim->GetHeroic();
		LogWrite(PLAYER__DEBUG, 5, "XP", "Heroic, total = %.2f", total);
	}
	if(DoubleXPEnabled()) {
		LogWrite(PLAYER__DEBUG, 5, "XP", "Calculating Double XP!");

		float percent = (((float)(total))/GetNeededXP()) *100;
		LogWrite(PLAYER__DEBUG, 5, "XP", "Percent of total / XP Needed * 100, percent = %.2f", percent);
		float xp_vitality = GetXPVitality();
		if(xp_vitality >= percent) {
			GetInfoStruct()->set_xp_vitality(xp_vitality - percent);
			total *= 2;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Vitality >= Percent, total = %.2f", total);
		}
		else {
			total += ((GetXPVitality() / percent) *2)*total;
			GetInfoStruct()->set_xp_vitality(0);
			LogWrite(PLAYER__DEBUG, 5, "XP", "Vitality < Percent, total = %.2f", total);
		}
	}
	LogWrite(PLAYER__DEBUG, 5, "XP", "Final total = %.2f", (total * world.GetXPRate() * zone_xp_modifier));
	return total * world.GetXPRate() * zone_xp_modifier;
}

float Player::CalculateTSXP(int8 level){
	if(TradeskillXPEnabled() == false)
		return 0;
	float multiplier = 0;

	float zone_xp_modifier = 1;				// let's be safe!!
	if( GetZone()->GetXPModifier() != 0 ) {
		zone_xp_modifier = GetZone()->GetXPModifier();
		LogWrite(PLAYER__DEBUG, 5, "XP", "Zone XP Modifier = %.2f", zone_xp_modifier);
	}

	sint16 diff = level - GetTSLevel();
	if(GetTSLevel() < 10)
		diff *= 3;
	else if(GetTSLevel() <= 20)
		diff *= 2;
	if(diff >= 9)
		multiplier = 6;
	else if(diff >= 5)
		multiplier = 4.5;
	else if(diff >= 1)
		multiplier = 4.25;
	else if(diff == 0)
		multiplier = 4;
	else if(diff <= -11)
		multiplier = 0;
	else if(diff <= -6)
		multiplier = 3.25;
	else //if(diff < 0)
		multiplier = 3.5;


	float total = multiplier * 8;	
	LogWrite(PLAYER__DEBUG, 5, "XP", "Multiplier * 8 = %.2f", total);

	if(DoubleXPEnabled()) {
		LogWrite(PLAYER__DEBUG, 5, "XP", "Calculating Double XP!");

		float percent = (((float)(total))/GetNeededTSXP()) *100;
		LogWrite(PLAYER__DEBUG, 5, "XP", "Percent of total / XP Needed * 100, percent = %.2f", percent);

		float ts_xp_vitality = GetTSXPVitality();
		if(ts_xp_vitality >= percent) {
			GetInfoStruct()->set_tradeskill_xp_vitality(ts_xp_vitality - percent);
			total *= 2;
			LogWrite(PLAYER__DEBUG, 5, "XP", "Vitality >= Percent, total = %.2f", total);
		}
		else {
			total += ((GetTSXPVitality() / percent) *2)*total;
			GetInfoStruct()->set_tradeskill_xp_vitality(0);
			LogWrite(PLAYER__DEBUG, 5, "XP", "Vitality < Percent, total = %.2f", total);
		}
	}
	LogWrite(PLAYER__DEBUG, 5, "XP", "Final total = %.2f", (total * world.GetXPRate() * zone_xp_modifier));
	return total * world.GetXPRate() * zone_xp_modifier;
}

void Player::CalculateOfflineDebtRecovery(int32 unix_timestamp)
{
	float xpDebt = GetXPDebt();
	// not a real timestamp to work with
	if(unix_timestamp < 1 || xpDebt == 0.0f)
		return;

	uint32 diff = (Timer::GetCurrentTime2() - unix_timestamp)/1000;
	
	float recoveryDebtPercentage = rule_manager.GetGlobalRule(R_Combat, ExperienceDebtRecoveryPercent)->GetFloat()/100.0f;
	int32 recoveryPeriodSeconds = rule_manager.GetGlobalRule(R_Combat, ExperienceDebtRecoveryPeriod)->GetInt32();
	if(recoveryDebtPercentage == 0.0f || recoveryPeriodSeconds < 1)
		return;


	float periodsPassed = (float)diff/(float)recoveryPeriodSeconds;

	// not enough time passed to calculate debt xp recovered
	if(periodsPassed < 1.0f)
		return;

	float debtToSubtract = xpDebt * ((recoveryDebtPercentage*periodsPassed)/100.0f);

	if(debtToSubtract >= xpDebt)
		GetInfoStruct()->set_xp_debt(0.0f);
	else
		GetInfoStruct()->set_xp_debt(xpDebt - debtToSubtract);
}

void Player::SetNeededXP(int32 val){
	GetInfoStruct()->set_xp_needed(val);
}

void Player::SetNeededXP(){
	//GetInfoStruct()->xp_needed = GetLevel() * 100;
	// Get xp needed to get to the next level
	int16 level = GetLevel() + 1;
	// If next level is beyond what we have in the map multiply the last value we have by how many levels we are over plus one
	if (level > 95)
		SetNeededXP(m_levelXPReq[95] * ((level - 95) + 1));
	else
		SetNeededXP(m_levelXPReq[level]);
}

void Player::SetXP(int32 val){
	GetInfoStruct()->set_xp(val);
}

void Player::SetNeededTSXP(int32 val) {
	GetInfoStruct()->set_ts_xp_needed(val);
}

void Player::SetNeededTSXP() {
	GetInfoStruct()->set_ts_xp_needed(GetTSLevel() * 100);
}

void Player::SetTSXP(int32 val) {
	GetInfoStruct()->set_ts_xp(val);
}

float Player::GetXPDebt(){
	return GetInfoStruct()->get_xp_debt();
}

int32 Player::GetNeededXP(){
	return GetInfoStruct()->get_xp_needed();
}

int32 Player::GetXP(){
	return GetInfoStruct()->get_xp();
}

int32 Player::GetNeededTSXP() {
	return GetInfoStruct()->get_ts_xp_needed();
}

int32 Player::GetTSXP() {
	return GetInfoStruct()->get_ts_xp();
}

bool Player::AddXP(int32 xp_amount){
	MStats.lock();
	xp_amount += (int32)(((float)xp_amount) * stats[ITEM_STAT_COMBATEXPMOD]) / 100;
	MStats.unlock();

	if(GetInfoStruct()->get_xp_debt())
	{
		float expRatioToDebt = rule_manager.GetGlobalRule(R_Combat, ExperienceToDebt)->GetFloat()/100.0f;
		int32 amountToTakeFromDebt = (int32)((float)expRatioToDebt * (float)xp_amount);
		int32 amountRequiredClearDebt = (GetInfoStruct()->get_xp_debt()/100.0f) * xp_amount;

		if(amountToTakeFromDebt > amountRequiredClearDebt)
		{
			GetInfoStruct()->set_xp_debt(0.0f);
			if(amountRequiredClearDebt > xp_amount)
				xp_amount = 0;
			else
				xp_amount -= amountRequiredClearDebt;
		}
		else
		{
			float amountRemovedPct = ((float)amountToTakeFromDebt/(float)amountRequiredClearDebt);
			GetInfoStruct()->set_xp_debt(GetInfoStruct()->get_xp_debt()-amountRemovedPct);
			if(amountToTakeFromDebt > xp_amount)
				xp_amount = 0;
			else
				xp_amount -= amountToTakeFromDebt;
		}
	}
	
	// used up in xp debt
	if(!xp_amount)
		return true;

	float current_xp_percent = ((float)GetXP()/(float)GetNeededXP())*100;
	float miniding_min_percent = ((int)(current_xp_percent/10)+1)*10;
	while((xp_amount + GetXP()) >= GetNeededXP()){
		if (!CheckLevelStatus(GetLevel() + 1)) {
			GetZone()->GetClientBySpawn(this)->SimpleMessage(CHANNEL_COLOR_RED, "You do not have the required status to level up anymore!");
			return false;
		}
		xp_amount -= GetNeededXP() - GetXP();
		SetLevel(GetLevel() + 1);		
	}
	SetXP(GetXP() + xp_amount);
	GetPlayerInfo()->CalculateXPPercentages();
	current_xp_percent = ((float)GetXP()/(float)GetNeededXP())*100;
	if(current_xp_percent >= miniding_min_percent){
		SetHP(GetTotalHP());
		SetPower(GetTotalPower());
		GetZone()->SendCastSpellPacket(332, this, this); //send mini level up spell effect
	}
	return true;
}

bool Player::AddTSXP(int32 xp_amount){
	MStats.lock();
	xp_amount += ((xp_amount)*stats[ITEM_STAT_TRADESKILLEXPMOD]) / 100;
	MStats.unlock();

	float current_xp_percent = ((float)GetTSXP()/(float)GetNeededTSXP())*100;
	float miniding_min_percent = ((int)(current_xp_percent/10)+1)*10;
	while((xp_amount + GetTSXP()) >= GetNeededTSXP()){
		if (!CheckLevelStatus(GetTSLevel() + 1)) {
			GetZone()->GetClientBySpawn(this)->SimpleMessage(CHANNEL_COLOR_RED, "You do not have the required status to level up anymore!");
			return false;
		}
		xp_amount -= GetNeededTSXP() - GetTSXP();
		SetTSLevel(GetTSLevel() + 1);
		SetTSXP(0);
		SetNeededTSXP();
	}
	SetTSXP(GetTSXP() + xp_amount);
	GetPlayerInfo()->CalculateXPPercentages();
	current_xp_percent = ((float)GetTSXP()/(float)GetNeededTSXP())*100;
	if(current_xp_percent >= miniding_min_percent){
		SetHP(GetTotalHP());
		SetPower(GetTotalPower());
	}

	if (GetTradeskillClass() == 0){
		SetTradeskillClass(1);
		GetInfoStruct()->set_tradeskill_class1(1);
		GetInfoStruct()->set_tradeskill_class2(1);
		GetInfoStruct()->set_tradeskill_class3(1);
	}
	return true;
}

void Player::CalculateLocation(){
	if(GetSpeed() > 0 ){
		if(GetHeading() >= 270 && GetHeading() <= 360){
			SetX(GetX() + (GetSpeed()*.5)*((360-GetHeading())/90));
			SetZ(GetZ() - (GetSpeed()*.5)*((GetHeading()-270)/90));
		}
		else if(GetHeading() >= 180 && GetHeading() < 270){
			SetX(GetX() + (GetSpeed()*.5)*((GetHeading()-180)/90));
			SetZ(GetZ() + (GetSpeed()*.5)*((270-GetHeading())/90));
		}
		else if(GetHeading() >= 90 && GetHeading() < 180){
			SetX(GetX() - (GetSpeed()*.5)*((180-GetHeading())/90));
			SetZ(GetZ() + (GetSpeed()*.5)*((GetHeading()-90)/90));
		}
		else if(GetHeading() >= 0 && GetHeading() < 90){
			SetX(GetX() - (GetSpeed()*.5)*(GetHeading()/90));
			SetZ(GetZ() - (GetSpeed()*.5)*((90-GetHeading())/90));
		}
	}
}

Spawn* Player::GetSpawnByIndex(int16 index){
	Spawn* spawn = 0;

	index_mutex.readlock(__FUNCTION__, __LINE__);
	if(player_spawn_id_map.count(index) > 0)
		spawn = player_spawn_id_map[index];
	index_mutex.releasereadlock(__FUNCTION__, __LINE__);

	return spawn;
}

int16 Player::GetIndexForSpawn(Spawn* spawn) {
	int16 val = 0;

	index_mutex.readlock(__FUNCTION__, __LINE__);
	if(player_spawn_reverse_id_map.count(spawn) > 0)
		val = player_spawn_reverse_id_map[spawn];
	index_mutex.releasereadlock(__FUNCTION__, __LINE__);

	return val;
}

bool Player::WasSpawnRemoved(Spawn* spawn){
	bool wasRemoved = false;

	index_mutex.readlock(__FUNCTION__, __LINE__);
	if(player_removed_spawns.count(spawn) > 0)
		wasRemoved = true;
	index_mutex.releasereadlock(__FUNCTION__, __LINE__);

	return wasRemoved;
}

void Player::RemoveSpawn(Spawn* spawn)
{
	LogWrite(PLAYER__DEBUG, 3, "Player", "Remove Spawn '%s' (%u)", spawn->GetName(), spawn->GetID());

	info_mutex.writelock(__FUNCTION__, __LINE__);
	vis_mutex.writelock(__FUNCTION__, __LINE__);
	pos_mutex.writelock(__FUNCTION__, __LINE__);

	index_mutex.writelock(__FUNCTION__, __LINE__);

	player_removed_spawns[spawn] = 1;

	if (player_spawn_reverse_id_map[spawn] && player_spawn_id_map.count(player_spawn_reverse_id_map[spawn]) > 0)
		player_spawn_id_map.erase(player_spawn_reverse_id_map[spawn]);

	if (player_spawn_reverse_id_map.count(spawn) > 0)
		player_spawn_reverse_id_map.erase(spawn);

	if (player_spawn_id_map.count(spawn->GetID()) && player_spawn_id_map[spawn->GetID()] == spawn)
		player_spawn_id_map.erase(spawn->GetID());

	if (player_spawn_reverse_id_map.count(spawn))
		player_spawn_reverse_id_map.erase(spawn);

	int32 id = spawn->GetID();
	if (spawn_info_packet_list.count(id))
		spawn_info_packet_list.erase(id);

	if (spawn_pos_packet_list.count(id))
		spawn_pos_packet_list.erase(id);

	if (spawn_vis_packet_list.count(id))
		spawn_vis_packet_list.erase(id);

	index_mutex.releasewritelock(__FUNCTION__, __LINE__);

	info_mutex.releasewritelock(__FUNCTION__, __LINE__);
	pos_mutex.releasewritelock(__FUNCTION__, __LINE__);
	vis_mutex.releasewritelock(__FUNCTION__, __LINE__);
}

vector<int32> Player::GetQuestIDs(){
	vector<int32> ret;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second)
			ret.push_back(itr->second->GetQuestID());
	}
	MPlayerQuests.unlock();
	return ret;
}

vector<Quest*>* Player::CheckQuestsItemUpdate(Item* item){
	vector<Quest*>* quest_updates = 0;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second && itr->second->CheckQuestItemUpdate(item->details.item_id, item->details.count)){
			if(!quest_updates)
				quest_updates = new vector<Quest*>();
			quest_updates->push_back(itr->second);
		}
	}
	MPlayerQuests.unlock();
	return quest_updates;
}

void Player::CheckQuestsCraftUpdate(Item* item, int32 qty){
	map<int32, Quest*>::iterator itr;
	vector<Quest*>* update_list = new vector<Quest*>;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second){
			if(item && qty > 0){
				if(itr->second->CheckQuestCraftUpdate(item->details.item_id, qty)){
					update_list->push_back(itr->second);
				}
			}
		}
	}
	MPlayerQuests.unlock();
	if(update_list && update_list->size() > 0){
		Client* client = GetZone()->GetClientBySpawn(this);
		if(client){
			for(int8 i=0;i<update_list->size(); i++){
				client->SendQuestUpdate(update_list->at(i));
				client->SendQuestFailure(update_list->at(i));
			}
		}
	}
	update_list->clear();
	safe_delete(update_list);
}

void Player::CheckQuestsHarvestUpdate(Item* item, int32 qty){
	map<int32, Quest*>::iterator itr;
	vector<Quest*>* update_list = new vector<Quest*>;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second){
			if(item && qty > 0){
				if(itr->second->CheckQuestHarvestUpdate(item->details.item_id, qty)){
					update_list->push_back(itr->second);
				}
			}
		}
	}
	MPlayerQuests.unlock();
	if(update_list && update_list->size() > 0){
		Client* client = GetZone()->GetClientBySpawn(this);
		if(client){
			for(int8 i=0;i<update_list->size(); i++){
				client->SendQuestUpdate(update_list->at(i));
				client->SendQuestFailure(update_list->at(i));
			}
		}
	}
	update_list->clear();
	safe_delete(update_list);
}

vector<Quest*>* Player::CheckQuestsSpellUpdate(Spell* spell) {
	vector<Quest*>* quest_updates = 0;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for (itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if (itr->second && itr->second->CheckQuestSpellUpdate(spell)) {
			if (!quest_updates)
				quest_updates = new vector<Quest*>();
			quest_updates->push_back(itr->second);
		}
	}
	MPlayerQuests.unlock();
	return quest_updates;
}

PacketStruct* Player::GetQuestJournalPacket(bool all_quests, int16 version, int32 crc, int32 current_quest_id, bool updated){
	PacketStruct* packet = configReader.getStruct("WS_QuestJournalUpdate", version);
	Quest* quest = 0;
	if(packet){
		int16 total_quests_num = 0;
		int16 total_completed_quests = 0;
		map<int32, Quest*> total_quests = player_quests;
		if(all_quests && completed_quests.size() > 0)
			total_quests.insert(completed_quests.begin(), completed_quests.end());
		MPlayerQuests.lock();
		if(total_quests.size() > 0){
			map<string, int16> quest_types;
			map<int32, Quest*>::iterator itr;
			int16 zone_id = 0;
			for(itr = total_quests.begin(); itr != total_quests.end(); itr++){
				if(itr->first && itr->second){
					if(current_quest_id == 0 && itr->second->GetTurnedIn() == false)
						current_quest_id = itr->first;
					if(itr->second->GetTurnedIn())
						total_completed_quests++;
					if(itr->second->GetType()){
						if(quest_types.count(itr->second->GetType()) == 0){
							quest_types[itr->second->GetType()] = zone_id;
							zone_id++;
						}
					}
					if(itr->second->GetZone()){
						if(quest_types.count(itr->second->GetType()) == 0){
							quest_types[itr->second->GetType()] = zone_id;
							zone_id++;
						}
					}
					total_quests_num++;
				}
				else
					continue;
			}
			packet->setArrayLengthByName("num_quests", total_quests_num);
			int16 i = 0;
			for(itr = total_quests.begin(); itr != total_quests.end(); itr++){
				if(i == 0 && quest_types.size() > 0){
					packet->setArrayLengthByName("num_quest_zones", quest_types.size());
					map<string, int16>::iterator type_itr;
					int16 x = 0;
					for(type_itr = quest_types.begin(); type_itr != quest_types.end(); type_itr++){
						packet->setArrayDataByName("quest_zones_zone", type_itr->first.c_str(), x);
						packet->setArrayDataByName("quest_zones_zone_id", type_itr->second, x);
						x++;
					}
				}
				if(itr->first == 0 || !itr->second)
					continue;
				if(!all_quests && !itr->second->GetUpdateRequired())
					continue;
				quest = itr->second;
				if(!quest->GetDeleted())
					packet->setArrayDataByName("active", 1, i);
				packet->setArrayDataByName("name", quest->GetName(), i);
				packet->setArrayDataByName("quest_type", quest->GetType(), i);
				packet->setArrayDataByName("quest_zone", quest->GetZone(), i);
				int8 display_status = QUEST_DISPLAY_STATUS_NORMAL;
				if(itr->second->GetCompleted())
					packet->setArrayDataByName("completed", 1, i);
				if(itr->second->GetTurnedIn()){
					packet->setArrayDataByName("turned_in", 1, i);
					packet->setArrayDataByName("completed", 1, i);
					packet->setArrayDataByName("visible", 1, i);
					packet->setArrayDataByName("unknown3", 1, i);
					display_status += QUEST_DISPLAY_STATUS_COMPLETED;					
				}
				if (updated) {
					packet->setArrayDataByName("quest_updated", 1, i);
					packet->setArrayDataByName("journal_updated", 1, i);
				}
				packet->setArrayDataByName("quest_id", quest->GetQuestID(), i);
				packet->setArrayDataByName("day", quest->GetDay(), i);
				packet->setArrayDataByName("month", quest->GetMonth(), i);
				packet->setArrayDataByName("year", quest->GetYear(), i);
				packet->setArrayDataByName("level", quest->GetQuestLevel(), i);
				int8 difficulty = 0;
				string category = quest->GetType();
				if(category == "Tradeskill")
					difficulty = GetTSArrowColor(quest->GetQuestLevel());
				else
					difficulty = GetArrowColor(quest->GetQuestLevel());
				packet->setArrayDataByName("difficulty", difficulty, i);
				if (itr->second->GetEncounterLevel() > 4)
					packet->setArrayDataByName("encounter_level", quest->GetEncounterLevel(), i);
				else
					packet->setArrayDataByName("encounter_level", 4, i);
				if(version >= 931 && quest_types.count(quest->GetType()) > 0)
					packet->setArrayDataByName("zonetype_id", quest_types[quest->GetType()], i);
				if(version >= 931 && quest_types.count(quest->GetZone()) > 0)
					packet->setArrayDataByName("zone_id", quest_types[quest->GetZone()], i);
				if(version >= 931 && quest->GetVisible()){
					if (quest->GetCompletedFlag())
						display_status += QUEST_DISPLAY_STATUS_COMPLETE_FLAG;
					else if (quest->IsRepeatable())
						display_status += QUEST_DISPLAY_STATUS_REPEATABLE;
					if (quest->GetYellowName() || quest->CheckCategoryYellow())
						display_status += QUEST_DISPLAY_STATUS_YELLOW;
					
					if (quest->IsTracked())
						display_status += QUEST_DISPLAY_STATUS_CHECK;
					else
						display_status += QUEST_DISPLAY_STATUS_NO_CHECK;

					if (quest->IsHidden() && !quest->GetTurnedIn())
						display_status = QUEST_DISPLAY_STATUS_HIDDEN;
				}
				else
					packet->setArrayDataByName("visible", quest->GetVisible(), i);
				if (itr->second->IsRepeatable())
					packet->setArrayDataByName("repeatable", 1, i);
				
				packet->setArrayDataByName("display_status", display_status, i);
				i++;
			}
			//packet->setDataByName("unknown4", 0);
			packet->setDataByName("visible_quest_id", current_quest_id);
		}
		MPlayerQuests.unlock();		
		packet->setDataByName("player_crc", crc);
		packet->setDataByName("player_name", GetName());
		packet->setDataByName("used_quests", total_quests_num - total_completed_quests);
		packet->setDataByName("max_quests", 75);

		LogWrite(PLAYER__PACKET, 0, "Player", "Dump/Print Packet in func: %s, line: %i", __FUNCTION__, __LINE__);
#if EQDEBUG >= 9
		packet->PrintPacket();
#endif

	}
	return packet;
}

PacketStruct* Player::GetQuestJournalPacket(Quest* quest, int16 version, int32 crc, bool updated) {
	if (!quest)
		return 0;

	PacketStruct* packet = configReader.getStruct("WS_QuestJournalUpdate", version);
	if (packet) {

		packet->setArrayLengthByName("num_quests", 1);
		packet->setArrayLengthByName("num_quest_zones", 1);
		packet->setArrayDataByName("quest_zones_zone", quest->GetType());
		packet->setArrayDataByName("quest_zones_zone_id", 0);
		
		if(!quest->GetDeleted() && !quest->GetCompleted())
			packet->setArrayDataByName("active", 1);

		packet->setArrayDataByName("name", quest->GetName());
		// don't see these two in the struct
		packet->setArrayDataByName("quest_type", quest->GetType());
		packet->setArrayDataByName("quest_zone", quest->GetZone());

		int8 display_status = QUEST_DISPLAY_STATUS_NORMAL;
		if(quest->GetCompleted())
			packet->setArrayDataByName("completed", 1);
		if(quest->GetTurnedIn()) {
			packet->setArrayDataByName("turned_in", 1);
			packet->setArrayDataByName("completed", 1);
			packet->setArrayDataByName("visible", 1);	
			display_status += QUEST_DISPLAY_STATUS_COMPLETED;
		}		
		packet->setArrayDataByName("quest_id", quest->GetQuestID());
		packet->setArrayDataByName("day", quest->GetDay());
		packet->setArrayDataByName("month", quest->GetMonth());
		packet->setArrayDataByName("year", quest->GetYear());
		packet->setArrayDataByName("level", quest->GetQuestLevel());
		int8 difficulty = 0;
		string category = quest->GetType();
		if(category == "Tradeskill")
			difficulty = GetTSArrowColor(quest->GetQuestLevel());
		else
			difficulty = GetArrowColor(quest->GetQuestLevel());

		packet->setArrayDataByName("difficulty", difficulty);
		if (quest->GetEncounterLevel() > 4)
			packet->setArrayDataByName("encounter_level", quest->GetEncounterLevel());
		else
			packet->setArrayDataByName("encounter_level", 4);

		if (version >= 931) {
			packet->setArrayDataByName("zonetype_id", 0);
			packet->setArrayDataByName("zone_id", 0);
		}
		if(version >= 931 && quest->GetVisible()){
			if (quest->GetCompletedFlag())
				display_status += QUEST_DISPLAY_STATUS_COMPLETE_FLAG;
			else if (quest->IsRepeatable())
				display_status += QUEST_DISPLAY_STATUS_REPEATABLE;
			if (quest->GetYellowName() || quest->CheckCategoryYellow())
				display_status += QUEST_DISPLAY_STATUS_YELLOW;

			if (quest->IsTracked())
				display_status += QUEST_DISPLAY_STATUS_CHECK;
			else
				display_status += QUEST_DISPLAY_STATUS_NO_CHECK;

			if (quest->IsHidden() && !quest->GetTurnedIn())
				display_status = QUEST_DISPLAY_STATUS_HIDDEN;
		}
		else
			packet->setArrayDataByName("visible", quest->GetVisible());
		if (quest->IsRepeatable())
			packet->setArrayDataByName("repeatable", 1);

		packet->setArrayDataByName("display_status", display_status);
		if (updated) {
			packet->setArrayDataByName("quest_updated", 1);
			packet->setArrayDataByName("journal_updated", 1);
		}		
		if(version >= 546)
			packet->setDataByName("unknown3", 1);
		packet->setDataByName("visible_quest_id", quest->GetQuestID());
		packet->setDataByName("player_crc", crc);
		packet->setDataByName("player_name", GetName());
		packet->setDataByName("used_quests", player_quests.size());
		packet->setDataByName("unknown4a", 1);
		packet->setDataByName("max_quests", 75);
	}

	return packet;
}

Quest* Player::SetStepComplete(int32 id, int32 step){
	Quest* ret = 0;
	MPlayerQuests.lock();
	if(player_quests.count(id) > 0){
		if(player_quests[id]->SetStepComplete(step))
			ret = player_quests[id];
	}
	MPlayerQuests.unlock();
	return ret;
}

Quest* Player::AddStepProgress(int32 quest_id, int32 step, int32 progress) {
	Quest* ret = 0;
	MPlayerQuests.lock();
	if (player_quests.count(quest_id) > 0) {
		if (player_quests[quest_id]->AddStepProgress(step, progress))
			ret = player_quests[quest_id];
	}
	MPlayerQuests.unlock();
	return ret;
}

int32 Player::GetStepProgress(int32 quest_id, int32 step_id) {
	int32 ret = 0;

	MPlayerQuests.lock();
	if (player_quests.count(quest_id) > 0)
		ret = player_quests[quest_id]->GetStepProgress(step_id);
	MPlayerQuests.unlock();

	return ret;
}

void Player::RemoveQuest(int32 id, bool delete_quest){
	MPlayerQuests.lock();
	if(delete_quest){
		safe_delete(player_quests[id]);
	}
	player_quests.erase(id);
	MPlayerQuests.unlock();
	SendQuestRequiredSpawns(id);
}

vector<Quest*>* Player::CheckQuestsLocationUpdate(){
	vector<Quest*>* quest_updates = 0;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second && itr->second->CheckQuestLocationUpdate(GetX(), GetY(), GetZ())){
			if(!quest_updates)
				quest_updates = new vector<Quest*>();
			quest_updates->push_back(itr->second);
		}
	}
	MPlayerQuests.unlock();
	return quest_updates;
}

vector<Quest*>* Player::CheckQuestsFailures(){
	vector<Quest*>* quest_failures = 0;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second && itr->second->GetQuestFailures()->size() > 0){
			if(!quest_failures)
				quest_failures = new vector<Quest*>();
			quest_failures->push_back(itr->second);
		}
	}
	MPlayerQuests.unlock();
	return quest_failures;
}

vector<Quest*>* Player::CheckQuestsKillUpdate(Spawn* spawn, bool update){
	vector<Quest*>* quest_updates = 0;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second && itr->second->CheckQuestKillUpdate(spawn, update)){
			if(!quest_updates)
				quest_updates = new vector<Quest*>();
			quest_updates->push_back(itr->second);
		}
	}
	MPlayerQuests.unlock();
	return quest_updates;
}

vector<Quest*>* Player::CheckQuestsChatUpdate(Spawn* spawn){
	vector<Quest*>* quest_updates = 0;
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second && itr->second->CheckQuestChatUpdate(spawn->GetDatabaseID())){
			if(!quest_updates)
				quest_updates = new vector<Quest*>();
			quest_updates->push_back(itr->second);
		}
	}
	MPlayerQuests.unlock();
	return quest_updates;
}

int16 Player::GetTaskGroupStep(int32 quest_id){
	Quest* quest = 0;
	int16 step = 0;
	MPlayerQuests.lock();
	if(player_quests.count(quest_id) > 0){
		quest = player_quests[quest_id];
		step = quest->GetTaskGroupStep();
	}
	MPlayerQuests.unlock();
	return step;
}

bool Player::GetQuestStepComplete(int32 quest_id, int32 step_id){
	bool ret = false;
	MPlayerQuests.lock();
	if(player_quests.count(quest_id) > 0){
		Quest* quest = player_quests[quest_id];
		if ( quest != NULL )
			ret = quest->GetQuestStepCompleted(step_id);
	}
	MPlayerQuests.unlock();
	return ret;
}

int16 Player::GetQuestStep(int32 quest_id){
	Quest* quest = 0;
	int16 step = 0;
	MPlayerQuests.lock();
	if(player_quests.count(quest_id) > 0){
		quest = player_quests[quest_id];
		step = quest->GetQuestStep();
	}
	MPlayerQuests.unlock();
	return step;
}

void Player::LockQuests(){
	MPlayerQuests.lock();
}

void Player::UnlockQuests(){
	MPlayerQuests.unlock();
}

map<int32, Quest*>*	Player::GetPlayerQuests(){
	return &player_quests;
}

map<int32, Quest*>*	Player::GetCompletedPlayerQuests(){
	return &completed_quests;
}

Quest* Player::GetCompletedQuest(int32 quest_id){
	if(completed_quests.count(quest_id) > 0)
		return completed_quests[quest_id];
	return 0;
}

Quest* Player::GetQuest(int32 quest_id){
	if(player_quests.count(quest_id) > 0)
		return player_quests[quest_id];
	return 0;
}

void Player::AddCompletedQuest(Quest* quest){
	completed_quests[quest->GetQuestID()] = quest;
	quest->SetSaveNeeded(true);
	quest->SetTurnedIn(true);
	if(quest->GetCompletedDescription())
		quest->SetDescription(string(quest->GetCompletedDescription()));
	quest->SetUpdateRequired(true);
}

bool Player::CheckQuestRemoveFlag(Spawn* spawn){
	if(current_quest_flagged.count(spawn) > 0){
		current_quest_flagged.erase(spawn);
		return true;
	}
	return false;
}

bool Player::CheckQuestRequired(Spawn* spawn){
	if(spawn)
		return spawn->MeetsSpawnAccessRequirements(this);
	return false;
}

int8 Player::CheckQuestFlag(Spawn* spawn){
	int8 ret = 0;

	if (!spawn) {
		LogWrite(PLAYER__ERROR, 0, "Player", "CheckQuestFlag() called with an invalid spawn");
		return ret;
	}

	if(spawn->HasProvidedQuests()){
		vector<int32>* quests = spawn->GetProvidedQuests();
		Quest* quest = 0;
		for(int32 i=0;i<quests->size();i++){
			MPlayerQuests.lock();
			if(player_quests.count(quests->at(i)) > 0){
				if(player_quests[quests->at(i)]->GetCompleted() && player_quests[quests->at(i)]->GetQuestReturnNPC() == spawn->GetDatabaseID()){
					ret = 2;
					MPlayerQuests.unlock();
					break;
				}
			}
			MPlayerQuests.unlock();
			if (CanReceiveQuest(quests->at(i))){
				MPlayerQuests.lock();
				quest = master_quest_list.GetQuest(quests->at(i), false);
				MPlayerQuests.unlock();
				if(quest){
					int8 color = quest->GetFeatherColor();
					// purple
					if (color == 1)
						ret = 16;
					// green
					else if (color == 2)
						ret = 32;
					// blue
					else if (color == 3)
						ret = 64;
					// normal
					else
						ret = 1;
					break;
				}
			}
		}
	}
	map<int32, Quest*>::iterator itr;
	MPlayerQuests.lock();
	for(itr = player_quests.begin(); itr != player_quests.end(); itr++){
		if(itr->second->CheckQuestChatUpdate(spawn->GetDatabaseID(), false))
			ret = 2;
	}
	MPlayerQuests.unlock();
	if(ret > 0)
		current_quest_flagged[spawn] = true;
	return ret;
}

bool Player::CanReceiveQuest(int32 quest_id){
	bool passed = true;
	int32 x;
	MPlayerQuests.lock();
	Quest* quest = master_quest_list.GetQuest(quest_id, false);
	MPlayerQuests.unlock();
	if (!quest)
		passed = false;
	//check if quest is already completed, and not repeatable
	else if (GetCompletedQuest(quest_id) && !quest->IsRepeatable())
		passed = false;
	//check if the player already has this quest
	else if (player_quests.count(quest_id) > 0)
		passed = false;
	//Check Prereq Adv Levels
	else if (quest->GetPrereqLevel() > GetLevel())
		passed = false;
	else if (quest->GetPrereqMaxLevel() > 0){
		if (GetLevel() > quest->GetPrereqMaxLevel())
			passed = false;
	}
	//Check Prereq TS Levels
	else if (quest->GetPrereqTSLevel() > GetTSLevel())
		passed = false;
	else if (quest->GetPrereqMaxTSLevel() > 0){
		if (GetTSLevel() > quest->GetPrereqMaxLevel())
			passed = false;
	}


	// Check quest pre req
	vector<int32>* prereq_quests = quest->GetPrereqQuests();
	if(passed && prereq_quests && prereq_quests->size() > 0){
		for(int32 x=0;x<prereq_quests->size();x++){
			if(completed_quests.count(prereq_quests->at(x)) == 0){
				passed = false;
				break;
			}
		}
	}

	//Check Prereq Classes
	vector<int8>* prereq_classes = quest->GetPrereqClasses();
	if(passed && prereq_classes && prereq_classes->size() > 0){
		for(int32 x=0;x<prereq_classes->size();x++){
			if(prereq_classes->at(x) == GetAdventureClass()){
				passed = true;
				break;
			}
			else
				passed = false;
		}
	}

	//Check Prereq TS Classes
	vector<int8>* prereq_tsclasses = quest->GetPrereqTradeskillClasses();
	if(passed && prereq_tsclasses && prereq_tsclasses->size() > 0){
		for( x=0;x<prereq_tsclasses->size();x++){
			if(prereq_tsclasses->at(x) == GetTradeskillClass()){
				passed = true;
				break;
			}
			else
				passed = false;
		}
	}


	// Check model prereq
	vector<int16>* prereq_model_types = quest->GetPrereqModelTypes();
	if(passed && prereq_model_types && prereq_model_types->size() > 0){
		for(x=0;x<prereq_model_types->size();x++){
			if(prereq_model_types->at(x) == GetModelType()){
				passed = true;
				break;
			}
			else
				passed = false;
		}
	}


	// Check faction pre req
	vector<QuestFactionPrereq>* prereq_factions = quest->GetPrereqFactions();
	if(passed && prereq_factions && prereq_factions->size() > 0){
		sint32 val = 0;
		for(x=0;x<prereq_factions->size();x++){
			val = GetFactions()->GetFactionValue(prereq_factions->at(x).faction_id);
			if(val >= prereq_factions->at(x).min && (prereq_factions->at(x).max == 0 || val <= prereq_factions->at(x).max)){
				passed = true;
				break;
			}
			else
				passed = false;
		}
	}

	LogWrite(MISC__TODO, 1, "TODO", "Check prereq items\n\t(%s, function: %s, line #: %i)", __FILE__, __FUNCTION__, __LINE__);

	// Check race pre req
	vector<int8>* prereq_races = quest->GetPrereqRaces();
	if(passed && prereq_races && prereq_races->size() > 0){
		for(x=0;x<prereq_races->size();x++){
			if(prereq_races->at(x) == GetRace()){
				passed = true;
				break;
			}
			else
				passed = false;
		}
	}

	return passed;
}

void Player::ClearRemovedSpawn(Spawn* spawn){
	index_mutex.writelock(__FUNCTION__, __LINE__);
	if(player_removed_spawns.count(spawn) > 0)
		player_removed_spawns.erase(spawn);
	index_mutex.releasewritelock(__FUNCTION__, __LINE__);
}

bool Player::ShouldSendSpawn(Spawn* spawn){
	// Added a try catch to attempt to prevent a zone crash when an invalid spawn is passed to this function.
	// Think invalid spawns are coming from the mutex list, if spawn is invalid return false.
	try
	{
		if((WasSentSpawn(spawn->GetID()) == false || NeedsSpawnResent(spawn)) && (!spawn->IsPrivateSpawn() || spawn->AllowedAccess(this)))
			return true;
	}
	catch (...)
	{
		LogWrite(SPAWN__ERROR, 0, "Spawn", "Invalid spawn passes to player->ShouldSendSpawn()");
	}
	return false;
}

int8 Player::GetArrowColor(int8 spawn_level){
	int8 color = 0;
	sint16 diff = spawn_level - GetLevel();
	if(GetLevel() < 10)
		diff *= 3;
	else if(GetLevel() <= 20)
		diff *= 2;
	if(diff >= 9)
		color = ARROW_COLOR_RED;
	else if(diff >= 5)
		color = ARROW_COLOR_ORANGE;
	else if(diff >= 1)
		color = ARROW_COLOR_YELLOW;
	else if(diff == 0)
		color = ARROW_COLOR_WHITE;	
	else if(diff <= -11)
		color = ARROW_COLOR_GRAY;
	else if(diff <= -6)
		color = ARROW_COLOR_GREEN;
	else //if(diff < 0)
		color = ARROW_COLOR_BLUE;
	return color;
}

int8 Player::GetTSArrowColor(int8 level){
	int8 color = 0;
	sint16 diff = level - GetTSLevel();
	if(GetLevel() < 10)
		diff *= 3;
	else if(GetLevel() <= 20)
		diff *= 2;
	if(diff >= 9)
		color = ARROW_COLOR_RED;
	else if(diff >= 5)
		color = ARROW_COLOR_ORANGE;
	else if(diff >= 1)
		color = ARROW_COLOR_YELLOW;
	else if(diff == 0)
		color = ARROW_COLOR_WHITE;	
	else if(diff <= -11)
		color = ARROW_COLOR_GRAY;
	else if(diff <= -6)
		color = ARROW_COLOR_GREEN;
	else //if(diff < 0)
		color = ARROW_COLOR_BLUE;
	return color;
}

void Player::AddCoins(int64 val){
	int32 tmp = 0;
	UpdatePlayerStatistic(STAT_PLAYER_TOTAL_WEALTH, (GetCoinsCopper() + (GetCoinsSilver() * 100) + (GetCoinsGold() * 10000) + (GetCoinsPlat() * 1000000)) + val, true);
	if(val >= 1000000){
		tmp = val / 1000000;
		val -= tmp*1000000;
		GetInfoStruct()->add_coin_plat(tmp);
	}
	if(val >= 10000){
		tmp = val / 10000;
		val -= tmp*10000;
		GetInfoStruct()->add_coin_gold(tmp);
	}
	if(val >= 100){
		tmp = val / 100;
		val -= tmp*100;
		GetInfoStruct()->add_coin_silver(tmp);
	}
	GetInfoStruct()->add_coin_copper(val);
	int32 new_copper_value = GetInfoStruct()->get_coin_copper();
	if(new_copper_value >= 100){
		tmp = new_copper_value/100;
		GetInfoStruct()->set_coin_copper(new_copper_value - (100 * tmp));
		GetInfoStruct()->add_coin_silver(tmp);
	}
	int32 new_silver_value = GetInfoStruct()->get_coin_silver();
	if(new_silver_value >= 100){
		tmp = new_silver_value/100;
		GetInfoStruct()->set_coin_silver(new_silver_value - (100 * tmp));
		GetInfoStruct()->add_coin_gold(tmp);
	}
	int32 new_gold_value = GetInfoStruct()->get_coin_gold();
	if(new_gold_value >= 100){
		tmp = new_gold_value/100;
		GetInfoStruct()->set_coin_gold(new_gold_value - (100 * tmp));
		GetInfoStruct()->add_coin_plat(tmp);
	}
	charsheet_changed = true;
}

bool Player::RemoveCoins(int64 val){
	int64 total_coins = GetInfoStruct()->get_coin_plat()*1000000;
	total_coins += GetInfoStruct()->get_coin_gold()*10000;
	total_coins += GetInfoStruct()->get_coin_silver()*100;
	total_coins += GetInfoStruct()->get_coin_copper();
	if(total_coins >= val){
		total_coins -= val;
		GetInfoStruct()->set_coin_plat(0);
		GetInfoStruct()->set_coin_gold(0);
		GetInfoStruct()->set_coin_silver(0);
		GetInfoStruct()->set_coin_copper(0);
		AddCoins(total_coins);
		return true;
	}
	return false;
}

bool Player::HasCoins(int64 val) {
	int64 total_coins = GetInfoStruct()->get_coin_plat()*1000000;
	total_coins += GetInfoStruct()->get_coin_gold()*10000;
	total_coins += GetInfoStruct()->get_coin_silver()*100;
	total_coins += GetInfoStruct()->get_coin_copper();
	if(total_coins >= val)
		return true;

	return false;
}

bool Player::HasPendingLootItems(int32 id){
	return (pending_loot_items.count(id) > 0 && pending_loot_items[id].size() > 0);
}

bool Player::HasPendingLootItem(int32 id, int32 item_id){
	return (pending_loot_items.count(id) > 0 && pending_loot_items[id].count(item_id) > 0);
}
vector<Item*>* Player::GetPendingLootItems(int32 id){
	vector<Item*>* ret = 0;
	if(pending_loot_items.count(id) > 0){
		ret = new vector<Item*>();
		map<int32, bool>::iterator itr;
		for(itr = pending_loot_items[id].begin(); itr != pending_loot_items[id].end(); itr++){
			if(master_item_list.GetItem(itr->first))
				ret->push_back(master_item_list.GetItem(itr->first));
		}
	}
	return ret;
}

void Player::RemovePendingLootItem(int32 id, int32 item_id){
	if(pending_loot_items.count(id) > 0){
		pending_loot_items[id].erase(item_id);
		if(pending_loot_items[id].size() == 0)
			pending_loot_items.erase(id);
	}
}

void Player::RemovePendingLootItems(int32 id){
	if(pending_loot_items.count(id) > 0)
		pending_loot_items.erase(id);
}

void Player::AddPendingLootItems(int32 id, vector<Item*>* items){
	if(items){
		Item* item = 0;
		for(int32 i=0;i<items->size();i++){
			item = items->at(i);
			if(item)
				pending_loot_items[id][item->details.item_id] = true;
		}
	}
}

void Player::AddPlayerStatistic(int32 stat_id, sint32 stat_value, int32 stat_date) {
	if (statistics.count(stat_id) == 0) {
		Statistic* stat = new Statistic;
		stat->stat_id = stat_id;
		stat->stat_value = stat_value;
		stat->stat_date = stat_date;
		stat->save_needed = false;
		statistics[stat_id] = stat;
	}
}

void Player::UpdatePlayerStatistic(int32 stat_id, sint32 stat_value, bool overwrite) {
	if (statistics.count(stat_id) == 0)
		AddPlayerStatistic(stat_id, 0, 0);
	Statistic* stat = statistics[stat_id];
	overwrite == true ? stat->stat_value = stat_value : stat->stat_value += stat_value;
	stat->stat_date = Timer::GetUnixTimeStamp();
	stat->save_needed = true;
}

void Player::WritePlayerStatistics() {
	map<int32, Statistic*>::iterator stat_itr;
	for (stat_itr = statistics.begin(); stat_itr != statistics.end(); stat_itr++) {
		Statistic* stat = stat_itr->second;
		if (stat->save_needed) {
			stat->save_needed = false;
			database.WritePlayerStatistic(this, stat);
		}
	}
}

sint64 Player::GetPlayerStatisticValue(int32 stat_id) {
	if (stat_id >= 0 && statistics.count(stat_id) > 0)
		return statistics[stat_id]->stat_value;
	return 0;
}

void Player::RemovePlayerStatistics() {
	map<int32, Statistic*>::iterator stat_itr;
	for (stat_itr = statistics.begin(); stat_itr != statistics.end(); stat_itr++)
		safe_delete(stat_itr->second);
	statistics.clear();
}

void Player::SetGroup(PlayerGroup* new_group){
	group = new_group;
}

/*PlayerGroup* Player::GetGroup(){
	return group;
}*/

bool Player::IsGroupMember(Entity* player) {
	bool ret = false;
	if (GetGroupMemberInfo() && player) {
		//world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);
		ret = world.GetGroupManager()->IsInGroup(GetGroupMemberInfo()->group_id, player);

		/*deque<GroupMemberInfo*>::iterator itr;
		deque<GroupMemberInfo*>* members = world.GetGroupManager()->GetGroupMembers(GetGroupMemberInfo()->group_id);
		for (itr = members->begin(); itr != members->end(); itr++) {
			GroupMemberInfo* gmi = *itr;
			if (gmi->client && gmi->client->GetPlayer() == player) {
				ret = true;
				break;
			}
		}

		world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);*/
	}
	return ret;
}





void Player::SetGroupInformation(PacketStruct* packet){
	int8 det_count = 0;
	Entity* member = 0;

	world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);
	if (GetGroupMemberInfo()) {
		PlayerGroup* group = world.GetGroupManager()->GetGroup(GetGroupMemberInfo()->group_id);
		if (group)
		{
			group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
			deque<GroupMemberInfo*>* members = group->GetMembers();
			deque<GroupMemberInfo*>::iterator itr;
			GroupMemberInfo* info = 0;
			int x = 0;

			for (itr = members->begin(); itr != members->end(); itr++) {
				info = *itr;

				if (info == GetGroupMemberInfo()) {
					if (info->leader)
						packet->setDataByName("group_leader_id", 0xFFFFFFFF);	// If this player is the group leader then fill this element with FF FF FF FF

					continue;
				}
				else {
					if (info->leader)
						packet->setDataByName("group_leader_id", x);			// If leader is some one else then fill with the slot number they are in
				}

				member = info->member;

				if (member && member->GetZone() == GetZone()) {
					packet->setSubstructDataByName("group_members", "unknown3", 1, x);
					packet->setSubstructDataByName("group_members", "spawn_id", GetIDWithPlayerSpawn(member), x);

					if (member->HasPet()) {
						if (member->GetPet())
							packet->setSubstructDataByName("group_members", "pet_id", GetIDWithPlayerSpawn(member->GetPet()), x);
						else
							packet->setSubstructDataByName("group_members", "pet_id", GetIDWithPlayerSpawn(member->GetCharmedPet()), x);
					}
					else
						packet->setSubstructDataByName("group_members", "pet_id", 0xFFFFFFFF, x);

					//Send detriment counts as 255 if all dets of that type are incurable
					det_count = member->GetTraumaCount();
					if (det_count > 0) {
						if (!member->HasCurableDetrimentType(DET_TYPE_TRAUMA))
							det_count = 255;
					}
					packet->setSubstructDataByName("group_members", "trauma_count", det_count, x);

					det_count = member->GetArcaneCount();
					if (det_count > 0) {
						if (!member->HasCurableDetrimentType(DET_TYPE_ARCANE))
							det_count = 255;
					}
					packet->setSubstructDataByName("group_members", "arcane_count", det_count, x);

					det_count = member->GetNoxiousCount();
					if (det_count > 0) {
						if (!member->HasCurableDetrimentType(DET_TYPE_NOXIOUS))
							det_count = 255;
					}
					packet->setSubstructDataByName("group_members", "noxious_count", det_count, x);

					det_count = member->GetElementalCount();
					if (det_count > 0) {
						if (!member->HasCurableDetrimentType(DET_TYPE_ELEMENTAL))
							det_count = 255;
					}
					packet->setSubstructDataByName("group_members", "elemental_count", det_count, x);

					det_count = member->GetCurseCount();
					if (det_count > 0) {
						if (!member->HasCurableDetrimentType(DET_TYPE_CURSE))
							det_count = 255;
					}
					packet->setSubstructDataByName("group_members", "curse_count", det_count, x);
				}
				else {
					packet->setSubstructDataByName("group_members", "unknown3", 2, x);
					packet->setSubstructDataByName("group_members", "pet_id", 0xFFFFFFFF, x);
					//packet->setSubstructDataByName("group_members", "unknown5", 1, x, 1); // unknown5 > 1 = name is blue
				}

				packet->setSubstructDataByName("group_members", "name", info->name.c_str(), x);
				packet->setSubstructDataByName("group_members", "hp_current", info->hp_current, x);
				packet->setSubstructDataByName("group_members", "hp_max", info->hp_max, x);
				packet->setSubstructDataByName("group_members", "power_current", info->power_current, x);
				packet->setSubstructDataByName("group_members", "power_max", info->power_max, x);
				packet->setSubstructDataByName("group_members", "level_current", info->level_current, x);
				packet->setSubstructDataByName("group_members", "level_max", info->level_max, x);
				packet->setSubstructDataByName("group_members", "zone", info->zone.c_str(), x);
				packet->setSubstructDataByName("group_members", "race_id", info->race_id, x);
				packet->setSubstructDataByName("group_members", "class_id", info->class_id, x);

				x++;
			}
		}
		group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
	}
	//packet->PrintPacket();
	world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);
}

PlayerItemList*	Player::GetPlayerItemList(){
	return &item_list;
}

void Player::ResetRemovedSpawns(){
	player_removed_spawns.clear();
}
void Player::ResetSavedSpawns(){
	ResetRemovedSpawns();

	info_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_info_packet_list.clear();
	info_mutex.releasewritelock(__FUNCTION__, __LINE__);

	vis_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_vis_packet_list.clear();
	vis_mutex.releasewritelock(__FUNCTION__, __LINE__);

	pos_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_pos_packet_list.clear();
	pos_mutex.releasewritelock(__FUNCTION__, __LINE__);

	index_mutex.writelock(__FUNCTION__, __LINE__);
	player_spawn_reverse_id_map.clear();
	player_spawn_id_map.clear();
	index_mutex.releasewritelock(__FUNCTION__, __LINE__);

	m_playerSpawnQuestsRequired.writelock(__FUNCTION__, __LINE__);
	player_spawn_quests_required.clear();
	m_playerSpawnQuestsRequired.releasewritelock(__FUNCTION__, __LINE__);
	info->RemoveOldPackets();
	safe_delete_array(movement_packet);
	safe_delete_array(old_movement_packet);
}

void Player::SetReturningFromLD(bool val){
	returning_from_ld = val;
}

bool Player::IsReturningFromLD(){
	return returning_from_ld;
}

void Player::AddFriend(const char* name, bool save){
	if(name){
		if(save)
			friend_list[name] = 1;
		else
			friend_list[name] = 0;
	}
}

bool Player::IsFriend(const char* name){
	if(name && friend_list.count(name) > 0 && friend_list[name] < 2)
		return true;
	return false;
}

void Player::RemoveFriend(const char* name){
	if(friend_list.count(name) > 0)
		friend_list[name] = 2;
}

map<string, int8>* Player::GetFriends(){
	return &friend_list;
}

void Player::AddIgnore(const char* name, bool save){
	if(name){
		if(save)
			ignore_list[name] = 1;
		else
			ignore_list[name] = 0;
	}
}

bool Player::IsIgnored(const char* name){
	if(name && ignore_list.count(name) > 0 && ignore_list[name] < 2)
		return true;
	return false;
}

void Player::RemoveIgnore(const char* name){
	if(name && ignore_list.count(name) > 0)
		ignore_list[name] = 2;
}

map<string, int8>* Player::GetIgnoredPlayers(){
	return &ignore_list;
}

bool Player::CheckLevelStatus(int16 new_level) {
	int16 LevelCap					= rule_manager.GetGlobalRule(R_Player, MaxLevel)->GetInt16();
	int16 LevelCapOverrideStatus	= rule_manager.GetGlobalRule(R_Player, MaxLevelOverrideStatus)->GetInt16();
	if ( (LevelCap < new_level) && (LevelCapOverrideStatus > GetZone()->GetClientBySpawn(this)->GetAdminStatus()) )
			return false;
	return true;
}

Skill* Player::GetSkillByName(const char* name, bool check_update){
	Skill* ret = skill_list.GetSkillByName(name);
	if(check_update)
		{
			if(skill_list.CheckSkillIncrease(ret))
				CalculateBonuses();
		}
	return ret;
}

Skill* Player::GetSkillByID(int32 id, bool check_update){
	Skill* ret = skill_list.GetSkill(id);
	if(check_update)
		{
			if(skill_list.CheckSkillIncrease(ret))
				CalculateBonuses();
		}
	return ret;
}

void Player::SetRangeAttack(bool val){
	range_attack = val;
}

bool Player::GetRangeAttack(){
	return range_attack;
}

bool Player::AddMail(Mail* mail) {
	bool ret = false;
	if (mail) {
		mail_list.Put(mail->mail_id, mail);
		ret = true;
	}
	return ret;
}

MutexMap<int32, Mail*>* Player::GetMail() {
	return &mail_list;
}

Mail* Player::GetMail(int32 mail_id) {
	Mail* mail = 0;
	if (mail_list.count(mail_id) > 0)
		mail = mail_list.Get(mail_id);
	return mail;
}

void Player::DeleteMail(bool from_database) {
	MutexMap<int32, Mail*>::iterator itr = mail_list.begin();
	while (itr.Next())
		DeleteMail(itr->first, from_database);
	mail_list.clear();
}

void Player::DeleteMail(int32 mail_id, bool from_database) {
	if (mail_list.count(mail_id) > 0) {
		if (from_database)
			database.DeletePlayerMail(mail_list.Get(mail_id));
		mail_list.erase(mail_id);
	}
}

ZoneServer* Player::GetGroupMemberInZone(int32 zone_id) {
	//if ( GetGroup() == NULL )
		return NULL;

	/*GroupMemberInfo* info = 0;
	for(int32 i=0;i<GetGroup()->members.size(); i++){
		info = GetGroup()->members[i];
		if(info == group_member_info)
			continue;

		// if the client exists, they are attached to a player,
		// the player is currently in an instance, which has the same zone id (for that instance type)
		if ( info->client != NULL && info->client->GetPlayer() != NULL && 
			info->client->GetPlayer()->GetZone()->GetInstanceID() > 0 && 
			info->client->GetPlayer()->GetZone()->GetZoneID() == zone_id )
		{
			return info->client->GetPlayer()->GetZone();
		}
	}

	// no member is in an instance with this zone id
	return NULL;*/
}


/*			CharacterInstances			*/

CharacterInstances::CharacterInstances() {
	m_instanceList.SetName("Mutex::m_instanceList");
}

CharacterInstances::~CharacterInstances() {
	RemoveInstances();
}

void CharacterInstances::AddInstance(int32 db_id, int32 instance_id, int32 last_success_timestamp, int32 last_failure_timestamp, int32 success_lockout_time, int32 failure_lockout_time, int32 zone_id, int8 zone_instancetype, string zone_name) {
	InstanceData data;
	data.db_id = db_id;
	data.instance_id = instance_id;
	data.zone_id = zone_id;
	data.zone_instance_type = zone_instancetype;
	data.zone_name = zone_name;
	data.last_success_timestamp = last_success_timestamp;
	data.last_failure_timestamp = last_failure_timestamp;
	data.success_lockout_time = success_lockout_time;
	data.failure_lockout_time = failure_lockout_time;
	instanceList.push_back(data);
}

void CharacterInstances::RemoveInstances() {
	instanceList.clear();
}

bool CharacterInstances::RemoveInstanceByZoneID(int32 zone_id) {
	vector<InstanceData>::iterator itr;
	m_instanceList.writelock(__FUNCTION__, __LINE__);
	for(itr = instanceList.begin(); itr != instanceList.end(); itr++) {
		InstanceData* data = &(*itr);
		if (data->zone_id == zone_id) {
			instanceList.erase(itr);
			m_instanceList.releasewritelock(__FUNCTION__, __LINE__);
			return true;
		}
	}
	m_instanceList.releasewritelock(__FUNCTION__, __LINE__);
	return false;
}

bool CharacterInstances::RemoveInstanceByInstanceID(int32 instance_id) {
	vector<InstanceData>::iterator itr;
	m_instanceList.writelock(__FUNCTION__, __LINE__);
	for(itr = instanceList.begin(); itr != instanceList.end(); itr++) {
		InstanceData* data = &(*itr);
		if (data->instance_id == instance_id) {
			instanceList.erase(itr);
			m_instanceList.releasewritelock(__FUNCTION__, __LINE__);
			return true;
		}
	}
	m_instanceList.releasewritelock(__FUNCTION__, __LINE__);
	return false;
}

InstanceData* CharacterInstances::FindInstanceByZoneID(int32 zone_id) {
	m_instanceList.readlock(__FUNCTION__, __LINE__);
	for(int32 i = 0; i < instanceList.size(); i++) {
		InstanceData* data = &instanceList.at(i);
		if (data->zone_id == zone_id) {
			m_instanceList.releasereadlock(__FUNCTION__, __LINE__);
			return data;
		}
	}
	m_instanceList.releasereadlock(__FUNCTION__, __LINE__);

	return 0;
}

InstanceData* CharacterInstances::FindInstanceByDBID(int32 db_id) {
	m_instanceList.readlock(__FUNCTION__, __LINE__);
	for(int32 i = 0; i < instanceList.size(); i++) {
		InstanceData* data = &instanceList.at(i);
		if (data->db_id == db_id) {
			m_instanceList.releasereadlock(__FUNCTION__, __LINE__);
			return data;
		}
	}
	m_instanceList.releasereadlock(__FUNCTION__, __LINE__);

	return 0;
}

InstanceData* CharacterInstances::FindInstanceByInstanceID(int32 instance_id) {
	m_instanceList.readlock(__FUNCTION__, __LINE__);
	for(int32 i = 0; i < instanceList.size(); i++) {
		InstanceData* data = &instanceList.at(i);
		if (data->instance_id == instance_id) {
			m_instanceList.releasereadlock(__FUNCTION__, __LINE__);
			return data;
		}
	}
	m_instanceList.releasereadlock(__FUNCTION__, __LINE__);

	return 0;
}
vector<InstanceData> CharacterInstances::GetLockoutInstances() {
	vector<InstanceData> ret;
	m_instanceList.readlock(__FUNCTION__, __LINE__);
	for (int32 i = 0; i < instanceList.size(); i++) {
		InstanceData* data = &instanceList.at(i);
		if (data->zone_instance_type == SOLO_LOCKOUT_INSTANCE || data->zone_instance_type == GROUP_LOCKOUT_INSTANCE || data->zone_instance_type == RAID_LOCKOUT_INSTANCE)
			ret.push_back(*data);
	}
	m_instanceList.releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

vector<InstanceData> CharacterInstances::GetPersistentInstances() {
	vector<InstanceData> ret;
	m_instanceList.readlock(__FUNCTION__, __LINE__);
	for (int32 i = 0; i < instanceList.size(); i++) {
		InstanceData* data = &instanceList.at(i);
		if (data->zone_instance_type == SOLO_PERSIST_INSTANCE || data->zone_instance_type == GROUP_PERSIST_INSTANCE || data->zone_instance_type == RAID_PERSIST_INSTANCE)
			ret.push_back(*data);
	}
	m_instanceList.releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

void CharacterInstances::ProcessInstanceTimers(Player* player) {

	// Only need to check persistent instances here, lockout should be handled by zone shutting down

	// Check instance id, if > 0 check timers, if timers expired  set instance id to 0 and update the db `character_instance` to instance id 0,
	// delete instance from `instances` if no more characters assigned to it
	
	m_instanceList.readlock(__FUNCTION__, __LINE__);
	for (int32 i = 0; i < instanceList.size(); i++) {
		InstanceData* data = &instanceList.at(i);

		// Check to see if we have a valid instance and if it is persistant
		if (data->instance_id > 0) {
			
			if (data->zone_instance_type == SOLO_PERSIST_INSTANCE || data->zone_instance_type == GROUP_PERSIST_INSTANCE || data->zone_instance_type == RAID_PERSIST_INSTANCE) {
				// Check max duration (last success + success time)
				if (Timer::GetUnixTimeStamp() >= (data->last_success_timestamp + data->success_lockout_time)) {
					// Max duration has passed, instance has expired lets remove the player from it,
					// this will also delete the instace if all players have been removed from it
					database.DeleteCharacterFromInstance(player->GetCharacterID(), data->instance_id);
					data->instance_id = 0;
				}
			}

			if (data->zone_instance_type == SOLO_LOCKOUT_INSTANCE || data->zone_instance_type == GROUP_LOCKOUT_INSTANCE || data->zone_instance_type == RAID_LOCKOUT_INSTANCE) {
				// Need to check lockout instance ids to ensure they are still valid.
				if (!database.VerifyInstanceID(player->GetCharacterID(), data->instance_id))
					data->instance_id = 0;
			}
		}
	}
	m_instanceList.releasereadlock(__FUNCTION__, __LINE__);

	/*for(int32 i=0;i<instanceList->size();i++)
	{
		bool valuesUpdated = false;
		InstanceData data = instanceList->at(i);
		if ( data.grant_reenter_time_left > 0 )
		{
			if ( ( data.grant_reenter_time_left - msDiff ) < 1 )
				data.grant_reenter_time_left = 0;
			else
				data.grant_reenter_time_left -= msDiff;

			valuesUpdated = true;
		}
		if ( data.grant_reset_time_left > 0 )
		{
			if ( ( data.grant_reset_time_left - msDiff ) < 1 )
				data.grant_reset_time_left = 0;
			else
				data.grant_reset_time_left -= msDiff;

			valuesUpdated = true;
		}
		if ( data.lockout_time > 0 )
		{
			if ( ( data.lockout_time - msDiff ) < 1 )
			{
				data.lockout_time = 0;
				// this means that their timer ran out and we need to clear it from db and player
				RemoveInstanceByInstanceID(data.instance_id);
				database.DeleteCharacterFromInstance(player->GetCharacterID(),data.instance_id);
			}
			else
				data.lockout_time -= msDiff;

			valuesUpdated = true;
		}

		if ( valuesUpdated )
			database.UpdateCharacterInstanceTimers(player->GetCharacterID(),data.instance_id,data.lockout_time,data.grant_reset_time_left,data.grant_reenter_time_left);
	}*/
}

int32 CharacterInstances::GetInstanceCount() {
	return instanceList.size();
}

void Player::SetPlayerAdventureClass(int8 new_class){
	SetAdventureClass(new_class);
	GetInfoStruct()->set_class1(classes.GetBaseClass(new_class));
	GetInfoStruct()->set_class2(classes.GetSecondaryBaseClass(new_class));
	GetInfoStruct()->set_class3(new_class);
	charsheet_changed = true;
	if(GetZone())
		GetZone()->TriggerCharSheetTimer();
}

void Player::AddSkillBonus(int32 spell_id, int32 skill_id, float value) {
	GetSkills()->AddSkillBonus(spell_id, skill_id, value);
}

SkillBonus* Player::GetSkillBonus(int32 spell_id) {
	return GetSkills()->GetSkillBonus(spell_id);
}

void Player::RemoveSkillBonus(int32 spell_id) {
	GetSkills()->RemoveSkillBonus(spell_id);
}

bool Player::HasFreeBankSlot() {
	return item_list.HasFreeBankSlot();
}

int8 Player::FindFreeBankSlot() {
	return item_list.FindFreeBankSlot();
}

void Player::AddTitle(sint32 title_id, const char *name, int8 prefix, bool save_needed){
	Title* new_title = new Title;
	new_title->SetID(title_id);
	new_title->SetName(name);
	new_title->SetPrefix(prefix);
	new_title->SetSaveNeeded(save_needed);
	player_titles_list.Add(new_title);
}

void Player::AddAAEntry(int16 template_id, int8 tab_id, int32 aa_id, int16 order,int8 treeid) {
	
	
	
}
void Player::AddLanguage(int32 id, const char *name, bool save_needed){
	// Check to see if the player already has the language
	if (HasLanguage(id))
		return;

	// Doesn't already have the language so add it
	Language* new_language = new Language;
	new_language->SetID(id);
	new_language->SetName(name);
	player_languages_list.Add(new_language);

	if (save_needed)
		database.SaveCharacterLang(GetCharacterID(), id);
}

bool Player::HasLanguage(int32 id){
	list<Language*>* languages = player_languages_list.GetAllLanguages();
	list<Language*>::iterator itr;
	Language* language = 0;
	bool ret = false;
	for(itr = languages->begin(); itr != languages->end(); itr++){
		language = *itr;
		if(language->GetID() == id){
			ret = true;
			break;
		}
	}
	return ret;
}

bool Player::HasLanguage(const char* name){
	list<Language*>* languages = player_languages_list.GetAllLanguages();
	list<Language*>::iterator itr;
	Language* language = 0;
	bool ret = false;
	for(itr = languages->begin(); itr != languages->end(); itr++){
		language = *itr;
		if(!strncmp(language->GetName(), name, strlen(name))){
			ret = true;
			break;
		}
	}
	return ret;
}

void Player::AddPassiveSpell(int32 id, int8 tier)
{
	// Add the spell to the list of passives this player currently has
	// list is used for quickly going over only the passive spells the
	// player has instead of going through all their spells.
	passive_spells.push_back(id);

	Client* client = GetZone()->GetClientBySpawn(this);

	// Don not apply passives if the client is null, zoning, or reviving
	if (client == NULL || client->IsZoning() || IsResurrecting())
		return;

	Spell* spell = 0;
	spell = master_spell_list.GetSpell(id, tier);
	if (spell) {
		SpellProcess* spellProcess = 0;
		// Get the current zones spell process
		spellProcess = GetZone()->GetSpellProcess();
		// Cast the spell, CastPassives() bypasses the spell queue
		spellProcess->CastPassives(spell, this);
	}
}

void Player::ApplyPassiveSpells()
{
	Spell* spell = 0;
	SpellBookEntry* spell2 = 0;
	vector<int32>::iterator itr;
	SpellProcess* spellProcess = 0;
	spellProcess = GetZone()->GetSpellProcess();

	for (itr = passive_spells.begin(); itr != passive_spells.end(); itr++)
	{
		spell2 = GetSpellBookSpell((*itr));
		spell = master_spell_list.GetSpell(spell2->spell_id, spell2->tier);
		if (spell) {
			spellProcess->CastPassives(spell, this);
		}
	}
}

void Player::RemovePassive(int32 id, int8 tier, bool remove_from_list)
{
	Spell* spell = 0;
	spell = master_spell_list.GetSpell(id, tier);
	if (spell) {
		SpellProcess* spellProcess = 0;
		spellProcess = GetZone()->GetSpellProcess();
		spellProcess->CastPassives(spell, this, true);

		if (remove_from_list) {
			vector<int32>::iterator remove;
			remove = find(passive_spells.begin(), passive_spells.end(), id);
			if (remove != passive_spells.end())
				passive_spells.erase(remove);
		}

		database.DeleteCharacterSpell(GetCharacterID(), spell->GetSpellID());
	}
}

void Player::RemoveAllPassives()
{
	vector<int32>::iterator itr;
	for (itr = passive_spells.begin(); itr != passive_spells.end(); itr++)
		RemoveSpellBookEntry((*itr), false);

	passive_spells.clear();
}

void Player::ResetPetInfo() {
	GetInfoStruct()->set_pet_id(0xFFFFFFFF);
	GetInfoStruct()->set_pet_name(std::string("No Pet"));
	GetInfoStruct()->set_pet_movement(0);
	GetInfoStruct()->set_pet_behavior(0);
	GetInfoStruct()->set_pet_health_pct(0.0f);
	GetInfoStruct()->set_pet_power_pct(0.0f);
	// Make sure the values get sent to the client
	SetCharSheetChanged(true);
}

bool Player::HasRecipeBook(int32 recipe_id){
	return recipebook_list.HasRecipeBook(recipe_id);
}

bool Player::DiscoveredLocation(int32 locationID) {
	bool ret = false;

	// No discovery type entry then return false
	if (m_characterHistory.count(HISTORY_TYPE_DISCOVERY) == 0)
		return false;

	// Is a discovery type entry but not a location subtype return false
	if (m_characterHistory[HISTORY_TYPE_DISCOVERY].count(HISTORY_SUBTYPE_LOCATION) == 0)
		return false;

	vector<HistoryData*>::iterator itr;

	for (itr = m_characterHistory[HISTORY_TYPE_DISCOVERY][HISTORY_SUBTYPE_LOCATION].begin(); itr != m_characterHistory[HISTORY_TYPE_DISCOVERY][HISTORY_SUBTYPE_LOCATION].end(); itr++) {
		if ((*itr)->Value == locationID) {
			ret = true;
			break;
		}
	}

	return ret;
}

void Player::UpdatePlayerHistory(int8 type, int8 subtype, int32 value, int32 value2) {
	switch (type) {
	case HISTORY_TYPE_NONE:
		HandleHistoryNone(subtype, value, value2);
		break;
	case HISTORY_TYPE_DEATH:
		HandleHistoryDeath(subtype, value, value2);
		break;
	case HISTORY_TYPE_DISCOVERY:
		HandleHistoryDiscovery(subtype, value, value2);
		break;
	case HISTORY_TYPE_XP:
		HandleHistoryXP(subtype, value, value2);
		break;
	default:
		// Not a valid history event so return out before trying to save into the db
		return;
	}
}

void Player::HandleHistoryNone(int8 subtype, int32 value, int32 value2) {
}

void Player::HandleHistoryDeath(int8 subtype, int32 value, int32 value2) {
}

void Player::HandleHistoryDiscovery(int8 subtype, int32 value, int32 value2) {
	switch (subtype) {
	case HISTORY_SUBTYPE_NONE:
		break;
	case HISTORY_SUBTYPE_ADVENTURE:
		break;
	case HISTORY_SUBTYPE_TRADESKILL:
		break;
	case HISTORY_SUBTYPE_QUEST:
		break;
	case HISTORY_SUBTYPE_AA:
		break;
	case HISTORY_SUBTYPE_ITEM:
		break;
	case HISTORY_SUBTYPE_LOCATION: {
		HistoryData* hd = new HistoryData;
		hd->Value = value;
		hd->Value2 = value2;
		hd->EventDate = Timer::GetUnixTimeStamp();
		strcpy(hd->Location, GetZone()->GetZoneName());

		m_characterHistory[HISTORY_TYPE_DISCOVERY][HISTORY_SUBTYPE_LOCATION].push_back(hd);
		break;
	}
	default:
		// Invalid subtype, default to NONE
		break;
	}
}

void Player::HandleHistoryXP(int8 subtype, int32 value, int32 value2) {
	switch (subtype) {
	case HISTORY_SUBTYPE_NONE:
		break;
	case HISTORY_SUBTYPE_ADVENTURE: {
		HistoryData* hd = new HistoryData;
		hd->Value = value;
		hd->Value2 = value2;
		hd->EventDate = Timer::GetUnixTimeStamp();
		strcpy(hd->Location, GetZone()->GetZoneName());

		m_characterHistory[HISTORY_TYPE_XP][HISTORY_SUBTYPE_ADVENTURE].push_back(hd);
	}
		break;
	case HISTORY_SUBTYPE_TRADESKILL:
		break;
	case HISTORY_SUBTYPE_QUEST:
		break;
	case HISTORY_SUBTYPE_AA:
		break;
	case HISTORY_SUBTYPE_ITEM:
		break;
	case HISTORY_SUBTYPE_LOCATION:
		break;
	default:
		// Invalid subtype, default to NONE
		break;
	}
}

void Player::LoadPlayerHistory(int8 type, int8 subtype, HistoryData* hd) {
	m_characterHistory[type][subtype].push_back(hd);
}

void Player::SaveHistory() {
	LogWrite(PLAYER__DEBUG, 0, "Player", "Saving History for Player: '%s'", GetName());

	map<int8, map<int8, vector<HistoryData*> > >::iterator itr;
	map<int8, vector<HistoryData*> >::iterator itr2;
	vector<HistoryData*>::iterator itr3;
	for (itr = m_characterHistory.begin(); itr != m_characterHistory.end(); itr++) {
		for (itr2 = itr->second.begin(); itr2 != itr->second.end(); itr2++) {
			for (itr3 = itr2->second.begin(); itr3 != itr2->second.end(); itr3++) {
				database.SaveCharacterHistory(this, itr->first, itr2->first, (*itr3)->Value, (*itr3)->Value2, (*itr3)->Location, (*itr3)->EventDate);
			}
		}
	}
}

void Player::InitXPTable() {
	m_levelXPReq[2] = 600;
	m_levelXPReq[3] = 800;
	m_levelXPReq[4] = 1000;
	m_levelXPReq[5] = 1400;
	m_levelXPReq[6] = 1800;
	m_levelXPReq[7] = 2200;
	m_levelXPReq[8] = 2600;
	m_levelXPReq[9] = 3000;
	m_levelXPReq[10] = 3400;
	m_levelXPReq[11] = 3800;
	m_levelXPReq[12] = 4200;
	m_levelXPReq[13] = 4600;
	m_levelXPReq[14] = 5000;
	m_levelXPReq[15] = 5500;
	m_levelXPReq[16] = 6000;
	m_levelXPReq[17] = 6500;
	m_levelXPReq[18] = 7000;
	m_levelXPReq[19] = 7500;
	m_levelXPReq[20] = 8000;
	m_levelXPReq[21] = 8500;
	m_levelXPReq[22] = 9000;
	m_levelXPReq[23] = 9500;
	m_levelXPReq[24] = 10000;
	m_levelXPReq[25] = 10500;
	m_levelXPReq[26] = 11000;
	m_levelXPReq[27] = 11750;
	m_levelXPReq[28] = 12500;
	m_levelXPReq[29] = 13250;
	m_levelXPReq[30] = 14000;
	m_levelXPReq[31] = 14750;
	m_levelXPReq[32] = 15500;
	m_levelXPReq[33] = 16250;
	m_levelXPReq[34] = 17000;
	m_levelXPReq[35] = 17750;
	m_levelXPReq[36] = 18500;
	m_levelXPReq[37] = 19250;
	m_levelXPReq[38] = 20000;
	m_levelXPReq[39] = 20750;
	m_levelXPReq[40] = 21500;
	m_levelXPReq[41] = 22250;
	m_levelXPReq[42] = 23000;
	m_levelXPReq[43] = 24000;
	m_levelXPReq[44] = 25000;
	m_levelXPReq[45] = 26000;
	m_levelXPReq[46] = 27000;
	m_levelXPReq[47] = 28000;
	m_levelXPReq[48] = 29250;
	m_levelXPReq[49] = 30500;
	m_levelXPReq[50] = 32000;
	m_levelXPReq[51] = 33750;
	m_levelXPReq[52] = 35750;
	m_levelXPReq[53] = 38000;
	m_levelXPReq[54] = 40500;
	m_levelXPReq[55] = 42500;
	m_levelXPReq[56] = 45500;
	m_levelXPReq[57] = 48500;
	m_levelXPReq[58] = 51500;
	m_levelXPReq[59] = 54500;
	m_levelXPReq[60] = 57500;
	m_levelXPReq[61] = 60500;
	m_levelXPReq[62] = 63500;
	m_levelXPReq[63] = 66500;
	m_levelXPReq[64] = 70000;
	m_levelXPReq[65] = 73500;
	m_levelXPReq[66] = 77000;
	m_levelXPReq[67] = 80500;
	m_levelXPReq[68] = 84000;
	m_levelXPReq[69] = 87500;
	m_levelXPReq[70] = 91000;
	m_levelXPReq[71] = 94500;
	m_levelXPReq[72] = 98000;
	m_levelXPReq[73] = 101500;
	m_levelXPReq[74] = 105000;
	m_levelXPReq[75] = 108500;
	m_levelXPReq[76] = 116500;
	m_levelXPReq[77] = 132500;
	m_levelXPReq[78] = 152500;
	m_levelXPReq[79] = 172500;
	m_levelXPReq[80] = 192500;
	m_levelXPReq[81] = 212500;
	m_levelXPReq[82] = 232500;
	m_levelXPReq[83] = 252500;
	m_levelXPReq[84] = 272500;
	m_levelXPReq[85] = 292500;
	m_levelXPReq[86] = 312500;
	m_levelXPReq[87] = 332500;
	m_levelXPReq[88] = 352500;
	m_levelXPReq[89] = 372500;
	m_levelXPReq[90] = 392500;
	m_levelXPReq[91] = 863550;
	m_levelXPReq[92] = 949905;
	m_levelXPReq[93] = 1044895;
	m_levelXPReq[94] = 1149385;
	m_levelXPReq[95] = 1264323;
}

void Player::SendQuestRequiredSpawns(int32 quest_id){
	bool locked = true;
	m_playerSpawnQuestsRequired.readlock(__FUNCTION__, __LINE__);
	if (player_spawn_quests_required.size() > 0 ) {
		ZoneServer* zone = GetZone();
		Client* client = zone->GetClientBySpawn(this);
		if (!client){
			m_playerSpawnQuestsRequired.releasereadlock(__FUNCTION__, __LINE__);
			return;
		}
		int xxx = player_spawn_quests_required.count(quest_id);
		if (player_spawn_quests_required.count(quest_id) > 0){
			vector<int32> spawns = *player_spawn_quests_required[quest_id];
			m_playerSpawnQuestsRequired.releasereadlock(__FUNCTION__, __LINE__);
			Spawn* spawn = 0;
			vector<int32>::iterator itr;
			for (itr = spawns.begin(); itr != spawns.end();){
				spawn = zone->GetSpawnByID(*itr);
				if (spawn)
					zone->SendSpawnChanges(spawn, client, false, true);
				else {
					itr = spawns.erase(itr);
					continue;
				}
				itr++;
			}
			locked = false;
		}
	}
	if (locked)
		m_playerSpawnQuestsRequired.releasereadlock(__FUNCTION__, __LINE__);
}

void Player::SendHistoryRequiredSpawns(int32 event_id){
	bool locked = true;
	m_playerSpawnHistoryRequired.readlock(__FUNCTION__, __LINE__);
	if (player_spawn_history_required.size() > 0) {
		ZoneServer* zone = GetZone();
		Client* client = zone->GetClientBySpawn(this);
		if (!client){
			m_playerSpawnHistoryRequired.releasereadlock(__FUNCTION__, __LINE__);
			return;
		}
		if (player_spawn_history_required.count(event_id) > 0){
			vector<int32> spawns = *player_spawn_history_required[event_id];
			m_playerSpawnHistoryRequired.releasereadlock(__FUNCTION__, __LINE__);
			Spawn* spawn = 0;
			vector<int32>::iterator itr;
			for (itr = spawns.begin(); itr != spawns.end();){
				spawn = zone->GetSpawnByID(*itr);
				if (spawn)
					zone->SendSpawnChanges(spawn, client, false, true);
				else {
					itr = spawns.erase(itr);
					continue;
				}
				itr++;
			}
			locked = false;
		}
	}
	if (locked)
		m_playerSpawnHistoryRequired.releasereadlock(__FUNCTION__, __LINE__);
}

void Player::AddQuestRequiredSpawn(Spawn* spawn, int32 quest_id){
	if(!spawn || !quest_id)
		return;
	m_playerSpawnQuestsRequired.writelock(__FUNCTION__, __LINE__);
	if(player_spawn_quests_required.count(quest_id) == 0)
		player_spawn_quests_required[quest_id] = new vector<int32>;
	vector<int32>* quest_spawns = player_spawn_quests_required[quest_id];
	int32 current_spawn = 0;
	for(int32 i=0;i<quest_spawns->size();i++){
		current_spawn = quest_spawns->at(i);
		if (current_spawn == spawn->GetID()){
			m_playerSpawnQuestsRequired.releasewritelock(__FUNCTION__, __LINE__);
			return;
		}
	}
	player_spawn_quests_required[quest_id]->push_back(spawn->GetID());
	m_playerSpawnQuestsRequired.releasewritelock(__FUNCTION__, __LINE__);
}

void Player::AddHistoryRequiredSpawn(Spawn* spawn, int32 event_id){
	if (!spawn || !event_id)
		return;
	m_playerSpawnHistoryRequired.writelock(__FUNCTION__, __LINE__);
	if (player_spawn_history_required.count(event_id) == 0)
		player_spawn_history_required[event_id] = new vector<int32>;
	vector<int32>* history_spawns = player_spawn_history_required[event_id];
	vector<int32>::iterator itr = find(history_spawns->begin(), history_spawns->end(), spawn->GetID());
	if (itr == history_spawns->end())
		history_spawns->push_back(spawn->GetID());
	m_playerSpawnHistoryRequired.releasewritelock(__FUNCTION__, __LINE__);
}

int32 PlayerInfo::GetBoatSpawn(){
	return boat_spawn;
}

void PlayerInfo::SetBoatSpawn(Spawn* spawn){
	if(spawn)
		boat_spawn = spawn->GetID();
	else
		boat_spawn = 0;
}

void PlayerInfo::RemoveOldPackets(){
	safe_delete_array(changes);
	safe_delete_array(orig_packet);
	safe_delete_array(pet_changes);
	safe_delete_array(pet_orig_packet);
}

PlayerControlFlags::PlayerControlFlags(){
	MControlFlags.SetName("PlayerControlFlags::MControlFlags");
	MFlagChanges.SetName("PlayerControlFlags::MFlagChanges");
	flags_changed = false;
	flag_changes.clear();
	current_flags.clear();
}

PlayerControlFlags::~PlayerControlFlags(){
	flag_changes.clear();
	current_flags.clear();
}

bool PlayerControlFlags::ControlFlagsChanged(){
	bool ret;
	MFlagChanges.writelock(__FUNCTION__, __LINE__);
	ret = flags_changed;
	MFlagChanges.releasewritelock(__FUNCTION__, __LINE__);
	return ret;
}

void PlayerControlFlags::SetPlayerControlFlag(int8 param, int8 param_value, bool is_active){
	if (!param || !param_value)
		return;

	bool active_changed = false;
	MControlFlags.writelock(__FUNCTION__, __LINE__);
	active_changed = (current_flags[param][param_value] != is_active);
	if (active_changed){
		current_flags[param][param_value] = is_active;
		MFlagChanges.writelock(__FUNCTION__, __LINE__);
		flag_changes[param][param_value] = is_active ? 1 : 0;
		flags_changed = true;
		MFlagChanges.releasewritelock(__FUNCTION__, __LINE__);
	}
	MControlFlags.releasewritelock(__FUNCTION__, __LINE__);
}

void PlayerControlFlags::SendControlFlagUpdates(Client* client){
	if (!client)
		return;

	map<int8, int8>* ptr = 0;
	map<int8, map<int8, int8> >::iterator itr;
	map<int8, int8>::iterator itr2;

	MFlagChanges.writelock(__FUNCTION__, __LINE__);
	for (itr = flag_changes.begin(); itr != flag_changes.end(); itr++){
		ptr = &itr->second;
		for (itr2 = ptr->begin(); itr2 != ptr->end(); itr2++){
			ClientPacketFunctions::SendServerControlFlags(client, itr->first, itr2->first, itr2->second);
		}
	}
	flag_changes.clear();
	flags_changed = false;
	MFlagChanges.releasewritelock(__FUNCTION__, __LINE__);
}

bool Player::ControlFlagsChanged(){
	return control_flags.ControlFlagsChanged();
}

void Player::SetPlayerControlFlag(int8 param, int8 param_value, bool is_active){
	control_flags.SetPlayerControlFlag(param, param_value, is_active);
}

void Player::SendControlFlagUpdates(Client* client){
	control_flags.SendControlFlagUpdates(client);
}

void Player::LoadLUAHistory(int32 event_id, LUAHistory* history) {
	mLUAHistory.writelock();
	if (m_charLuaHistory.count(event_id) > 0) {
		LogWrite(PLAYER__ERROR, 0, "Player", "Attempted to added a dupicate event (%u) to character LUA history", event_id);
		safe_delete(history);
		mLUAHistory.releasewritelock();
		return;
	}

	m_charLuaHistory.insert(make_pair(event_id,history));
	mLUAHistory.releasewritelock();
}

void Player::SaveLUAHistory() {
	mLUAHistory.readlock();
	LogWrite(PLAYER__DEBUG, 0, "Player", "Saving LUA History for Player: '%s'", GetName());

	map<int32, LUAHistory*>::iterator itr;
	for (itr = m_charLuaHistory.begin(); itr != m_charLuaHistory.end(); itr++) {
		if (itr->second->SaveNeeded) {
			database.SaveCharacterLUAHistory(this, itr->first, itr->second->Value, itr->second->Value2);
			itr->second->SaveNeeded = false;
		}
	}
	mLUAHistory.releasereadlock();
}

void Player::UpdateLUAHistory(int32 event_id, int32 value, int32 value2) {
	mLUAHistory.writelock();
	LUAHistory* hd = 0;

	if (m_charLuaHistory.count(event_id) > 0)
		hd = m_charLuaHistory[event_id];
	else {
		hd = new LUAHistory;
		m_charLuaHistory.insert(make_pair(event_id,hd));
	}

	hd->Value = value;
	hd->Value2 = value2;
	hd->SaveNeeded = true;
	mLUAHistory.releasewritelock();
	// release the mLUAHistory lock, we will maintain a readlock to avoid any further writes until we complete SendHistoryRequiredSpawns
	// through Spawn::SendSpawnChanges -> Spawn::InitializeVisPacketData -> Spawn::MeetsSpawnAccessRequirements-> Player::GetLUAHistory (this was causing a deadlock)
	mLUAHistory.readlock();
	SendHistoryRequiredSpawns(event_id);
	mLUAHistory.releasereadlock();
}

LUAHistory* Player::GetLUAHistory(int32 event_id) {
	LUAHistory* ret = 0;

	mLUAHistory.readlock();

	if (m_charLuaHistory.count(event_id) > 0)
		ret = m_charLuaHistory[event_id];

	mLUAHistory.releasereadlock();

	return ret;
}

bool Player::CanSeeInvis(Entity* target)
{
	if (!target->IsStealthed() && !target->IsInvis())
		return true;
	if (target->IsStealthed() && HasSeeHideSpell())
		return true;
	else if (target->IsInvis() && HasSeeInvisSpell())
		return true;

	sint32 radius = rule_manager.GetGlobalRule(R_PVP, InvisPlayerDiscoveryRange)->GetSInt32();

	if (radius == 0) // radius of 0 is always seen
		return true;
	// radius of -1 is never seen except through items/spells, radius > -1 means we will show the player if they get into the inner radius
	else if (radius > -1 && this->GetDistance((Spawn*)target) < (float)radius)
		return true;

	// TODO: Implement See Invis Spells! http://cutpon.com:3000/devn00b/EQ2EMu/issues/43

	Item* item = 0;
	vector<Item*>* equipped_list = GetEquippedItemList();
	bool seeInvis = false;
	bool seeStealth = false;
	for (int32 i = 0; i < equipped_list->size(); i++)
	{
		item = equipped_list->at(i);
		seeInvis = item->HasStat(ITEM_STAT_SEEINVIS);
		seeStealth = item->HasStat(ITEM_STAT_SEESTEALTH);
		if (target->IsStealthed() && seeStealth)
			return true;
		else if (target->IsInvis() && seeInvis)
			return true;
	}

	return false;
}

// returns true if we need to update target info due to see invis status change
bool Player::CheckChangeInvisHistory(Entity* target)
{
	std::map<int32, bool>::iterator it;

	it = target_invis_history.find(target->GetID());
	if (it != target_invis_history.end())
	{
		//canSeeStatus
		if (it->second)
		{
			if (!this->CanSeeInvis(target))
			{
				UpdateTargetInvisHistory(target->GetID(), false);
				return true;
			}
			else
				return false;
		}
		else
		{
			if (this->CanSeeInvis(target))
			{
				UpdateTargetInvisHistory(target->GetID(), true);
				return true;
			}
			else
				return false;
		}
	}

	if (!this->CanSeeInvis(target))
		UpdateTargetInvisHistory(target->GetID(), false);
	else
		UpdateTargetInvisHistory(target->GetID(), true);

	return true;
}

void Player::UpdateTargetInvisHistory(int32 targetID, bool canSeeStatus)
{
	target_invis_history[targetID] = canSeeStatus;
}

void Player::RemoveTargetInvisHistory(int32 targetID)
{
	target_invis_history.erase(targetID);
}

void Player::SetSpawnMap(Spawn* spawn)
{
	index_mutex.writelock(__FUNCTION__, __LINE__);
	spawn_id += 1;
	if (spawn_index == 255)
		spawn_index += 1; //just so we dont have to worry about overloading
	
	int32 tmp_id = spawn_id;

	player_spawn_id_map[tmp_id] = spawn;

	if(player_spawn_reverse_id_map.count(spawn))
		player_spawn_reverse_id_map.erase(spawn);

	player_spawn_reverse_id_map.insert(make_pair(spawn,tmp_id));
	index_mutex.releasewritelock(__FUNCTION__, __LINE__);
}

NPC* Player::InstantiateSpiritShard(float origX, float origY, float origZ, float origHeading, int32 origGridID, ZoneServer* origZone)
{
		NPC* npc = new NPC();
		string newName(GetName());
		newName.append("'s spirit shard");

		strcpy(npc->appearance.name, newName.c_str());
		/*vector<EntityCommand*>* primary_command_list = zone->GetEntityCommandList(result.GetInt32(9));
		vector<EntityCommand*>* secondary_command_list = zone->GetEntityCommandList(result.GetInt32(10));
		if(primary_command_list){
			npc->SetPrimaryCommands(primary_command_list);
			npc->primary_command_list_id = result.GetInt32(9);
		}
		if(secondary_command_list){
			npc->SetSecondaryCommands(secondary_command_list);
			npc->secondary_command_list_id = result.GetInt32(10);
		}*/
		npc->appearance.level =	GetLevel();
		npc->appearance.race = GetRace();
		npc->appearance.gender = GetGender();
		npc->appearance.adventure_class = GetAdventureClass();
		 
		//npc->appearance.lua_race_id = result.GetInt16(74);
		npc->appearance.model_type = GetModelType();
		npc->appearance.soga_model_type = GetSogaModelType();
		npc->appearance.display_name = 1;
		npc->features.hair_type = GetHairType();
		npc->features.hair_face_type = GetFacialHairType();
		npc->features.wing_type = GetWingType();
		npc->features.chest_type = GetChestType();
		npc->features.legs_type = GetLegsType();
		npc->features.soga_hair_type = GetSogaHairType();
		npc->features.soga_hair_face_type = GetSogaFacialHairType();
		npc->appearance.attackable = 0;
		npc->appearance.show_level = 1;
		npc->appearance.targetable = 1;
		npc->appearance.show_command_icon = 1;
		npc->appearance.display_hand_icon = 0;
		npc->appearance.hide_hood = GetHideHood();
		npc->size = GetSize();
		npc->appearance.pos.collision_radius = appearance.pos.collision_radius;
		npc->appearance.action_state = appearance.action_state;
		npc->appearance.visual_state = 6193; // ghostly look
		npc->appearance.mood_state = appearance.mood_state;
		npc->appearance.emote_state = appearance.emote_state;
		npc->appearance.pos.state = appearance.pos.state;
		npc->appearance.activity_status = appearance.activity_status;
		strncpy(npc->appearance.sub_title, appearance.sub_title, sizeof(npc->appearance.sub_title));
		npc->SetPrefixTitle(GetPrefixTitle());
		npc->SetSuffixTitle(GetSuffixTitle());
		npc->SetLastName(GetLastName());
		npc->SetX(origX);
		npc->SetY(origY);
		npc->SetZ(origZ);
		npc->SetHeading(origHeading);
		npc->SetSpawnOrigX(origX);
		npc->SetSpawnOrigY(origY);
		npc->SetSpawnOrigZ(origZ);
		npc->SetSpawnOrigHeading(origHeading);
		npc->appearance.pos.grid_id = origGridID;
		const char* script = rule_manager.GetGlobalRule(R_Combat, SpiritShardSpawnScript)->GetString();

		int32 dbid = database.CreateSpiritShard(newName.c_str(), GetLevel(), GetRace(), GetGender(), GetAdventureClass(), GetModelType(), GetSogaModelType(), 
		GetHairType(), GetFacialHairType(), GetWingType(), GetChestType(), GetLegsType(), GetSogaHairType(), GetSogaFacialHairType(), GetHideHood(),
		GetSize(), npc->appearance.pos.collision_radius, npc->appearance.action_state, npc->appearance.visual_state, npc->appearance.mood_state, 
		npc->appearance.emote_state, npc->appearance.pos.state, npc->appearance.activity_status, npc->appearance.sub_title, GetPrefixTitle(), GetSuffixTitle(),
		GetLastName(), origX, origY, origZ, origHeading, origGridID, GetCharacterID(), origZone->GetZoneID(), origZone->GetInstanceID());

		npc->SetShardID(dbid);
		npc->SetShardCharID(GetCharacterID());
		npc->SetShardCreatedTimestamp(Timer::GetCurrentTime2());

		if(script)
			npc->SetSpawnScript(script);
		
		return npc;
}

void Player::SaveSpellEffects()
{
	if(stop_save_spell_effects)
	{
		LogWrite(PLAYER__WARNING, 0, "Player", "SaveSpellEffects called while player constructing / deconstructing!");
		return;
	}

	SpellProcess* spellProcess = 0;
	// Get the current zones spell process
	spellProcess = GetZone()->GetSpellProcess();

	Query savedEffects;
	savedEffects.AddQueryAsync(GetCharacterID(), &database, Q_DELETE, "delete from character_spell_effects where charid=%u", GetCharacterID());
	savedEffects.AddQueryAsync(GetCharacterID(), &database, Q_DELETE, "delete from character_spell_effect_targets where caster_char_id=%u", GetCharacterID());
	InfoStruct* info = GetInfoStruct();
	MSpellEffects.readlock(__FUNCTION__, __LINE__);
	MMaintainedSpells.readlock(__FUNCTION__, __LINE__);
	for(int i = 0; i < 45; i++) {
		if(info->spell_effects[i].spell_id != 0xFFFFFFFF)
		{
			Spawn* spawn = nullptr;
			int32 target_char_id = 0;
			if(info->spell_effects[i].spell->initial_target_char_id != 0)
				target_char_id = info->spell_effects[i].spell->initial_target_char_id;
			else if((spawn = GetZone()->GetSpawnByID(info->spell_effects[i].spell->initial_target)) != nullptr && spawn->IsPlayer())
				target_char_id = ((Player*)spawn)->GetCharacterID();

			int32 timestamp = 0xFFFFFFFF;
			if(!info->spell_effects[i].spell->spell->GetSpellData()->duration_until_cancel)
				timestamp = info->spell_effects[i].expire_timestamp - Timer::GetCurrentTime2();
			
			int32 caster_char_id = info->spell_effects[i].spell->initial_caster_char_id;

			if(caster_char_id == 0)
				continue;
			
			Query effectSave;
			effectSave.AddQueryAsync(GetCharacterID(), &database, Q_INSERT, 
			"insert into character_spell_effects (name, caster_char_id, target_char_id, target_type, db_effect_type, spell_id, effect_slot, slot_pos, icon, icon_backdrop, conc_used, tier, total_time, expire_timestamp, lua_file, custom_spell, charid, damage_remaining, effect_bitmask, num_triggers, had_triggers, cancel_after_triggers, crit, last_spellattack_hit, interrupted, resisted, custom_function) values ('%s', %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %f, %u, '%s', %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, '%s')", 
			database.getSafeEscapeString(info->spell_effects[i].spell->spell->GetName()).c_str(), caster_char_id,
			target_char_id,  0 /*no target_type for spell_effects*/, DB_TYPE_SPELLEFFECTS /* db_effect_type for spell_effects */, info->spell_effects[i].spell_id, i, info->spell_effects[i].spell->slot_pos, 
			info->spell_effects[i].icon, info->spell_effects[i].icon_backdrop, 0 /* no conc_used for spell_effects */, info->spell_effects[i].tier, 
			info->spell_effects[i].total_time, timestamp, database.getSafeEscapeString(info->spell_effects[i].spell->file_name.c_str()).c_str(), info->spell_effects[i].spell->spell->IsCopiedSpell(), GetCharacterID(), 
			info->spell_effects[i].spell->damage_remaining, info->spell_effects[i].spell->effect_bitmask, info->spell_effects[i].spell->num_triggers, info->spell_effects[i].spell->had_triggers, info->spell_effects[i].spell->cancel_after_all_triggers,
			info->spell_effects[i].spell->crit, info->spell_effects[i].spell->last_spellattack_hit, info->spell_effects[i].spell->interrupted, info->spell_effects[i].spell->resisted, (info->maintained_effects[i].expire_timestamp) == 0xFFFFFFFF ? "" : database.getSafeEscapeString(spellProcess->SpellScriptTimerCustomFunction(info->spell_effects[i].spell).c_str()).c_str());
		}
		if (i < NUM_MAINTAINED_EFFECTS && info->maintained_effects[i].spell_id != 0xFFFFFFFF){
			Spawn* spawn = GetZone()->GetSpawnByID(info->maintained_effects[i].spell->initial_target);

			int32 target_char_id = 0;
		
			if(info->maintained_effects[i].spell->initial_target_char_id != 0)
				target_char_id = info->maintained_effects[i].spell->initial_target_char_id;
			else if(!info->maintained_effects[i].spell->initial_target)
				target_char_id = GetCharacterID();
			else if(spawn && spawn->IsPlayer())
				target_char_id = ((Player*)spawn)->GetCharacterID();
			else if (spawn && spawn->IsPet() && ((Entity*)spawn)->GetOwner() == (Entity*)this)
				target_char_id = 0xFFFFFFFF;

			int32 caster_char_id = (info->maintained_effects[i].spell->caster && info->maintained_effects[i].spell->caster->IsPlayer()) ? ((Player*)info->maintained_effects[i].spell->caster)->GetCharacterID() : 0;
			
			int32 timestamp = 0xFFFFFFFF;
			if(!info->maintained_effects[i].spell->spell->GetSpellData()->duration_until_cancel)
				timestamp = info->maintained_effects[i].expire_timestamp - Timer::GetCurrentTime2();
			Query effectSave;
			effectSave.AddQueryAsync(GetCharacterID(), &database, Q_INSERT, 
			"insert into character_spell_effects (name, caster_char_id, target_char_id, target_type, db_effect_type, spell_id, effect_slot, slot_pos, icon, icon_backdrop, conc_used, tier, total_time, expire_timestamp, lua_file, custom_spell, charid, damage_remaining, effect_bitmask, num_triggers, had_triggers, cancel_after_triggers, crit, last_spellattack_hit, interrupted, resisted, custom_function) values ('%s', %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %f, %u, '%s', %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, %u, '%s')", 
			database.getSafeEscapeString(info->maintained_effects[i].name).c_str(), caster_char_id, target_char_id,  info->maintained_effects[i].target_type, DB_TYPE_MAINTAINEDEFFECTS /* db_effect_type for maintained_effects */, info->maintained_effects[i].spell_id, i, info->maintained_effects[i].slot_pos, 
			info->maintained_effects[i].icon, info->maintained_effects[i].icon_backdrop, info->maintained_effects[i].conc_used, info->maintained_effects[i].tier, 
			info->maintained_effects[i].total_time, timestamp, database.getSafeEscapeString(info->maintained_effects[i].spell->file_name.c_str()).c_str(), info->maintained_effects[i].spell->spell->IsCopiedSpell(), GetCharacterID(), 
			info->maintained_effects[i].spell->damage_remaining, info->maintained_effects[i].spell->effect_bitmask, info->maintained_effects[i].spell->num_triggers, info->maintained_effects[i].spell->had_triggers, info->maintained_effects[i].spell->cancel_after_all_triggers,
			info->maintained_effects[i].spell->crit, info->maintained_effects[i].spell->last_spellattack_hit, info->maintained_effects[i].spell->interrupted, info->maintained_effects[i].spell->resisted, (info->maintained_effects[i].expire_timestamp) == 0xFFFFFFFF ? "" : database.getSafeEscapeString(spellProcess->SpellScriptTimerCustomFunction(info->maintained_effects[i].spell).c_str()).c_str());

			info->maintained_effects[i].spell->MSpellTargets.readlock(__FUNCTION__, __LINE__);
			std::string insertTargets = string("insert into character_spell_effect_targets (caster_char_id, target_char_id, target_type, db_effect_type, spell_id, effect_slot, slot_pos) values ");
			bool firstTarget = true;
			map<Spawn*, int8> targetsInserted;
			for (int8 t = 0; t < info->maintained_effects[i].spell->targets.size(); t++) {
				int32 spawn_id = info->maintained_effects[i].spell->targets.at(t);
					Spawn* spawn = GetZone()->GetSpawnByID(spawn_id);
					LogWrite(SPELL__DEBUG, 0, "Spell", "%s has target %u to identify for spell %s", GetName(), spawn_id, info->maintained_effects[i].spell->spell->GetName());
					if(spawn && (spawn->IsPlayer() || spawn->IsPet()))
					{
						int32 tmpCharID = 0;
						int8 type = 0;

						if(targetsInserted.find(spawn) != targetsInserted.end())
							continue;
						
						if(spawn->IsPlayer())
							tmpCharID = ((Player*)spawn)->GetCharacterID();
						else if (spawn->IsPet() && ((Entity*)spawn)->GetOwner() == (Entity*)this)
						{
							tmpCharID = 0xFFFFFFFF;
						}
						else if(spawn->IsPet() && ((Entity*)spawn)->GetOwner() && 
									((Entity*)spawn)->GetOwner()->IsPlayer())
						{
							type = ((Entity*)spawn)->GetPetType();
							Player* petOwner =  (Player*)((Entity*)spawn)->GetOwner();
							tmpCharID = petOwner->GetCharacterID();
						}

						if(!firstTarget)
							insertTargets.append(", ");
						
						targetsInserted.insert(make_pair(spawn, true));


						LogWrite(SPELL__DEBUG, 0, "Spell", "%s has target %s (%u) added to spell %s", GetName(), spawn ? spawn->GetName() : "NA", tmpCharID, info->maintained_effects[i].spell->spell->GetName());
						insertTargets.append("(" + std::to_string(caster_char_id) + ", " + std::to_string(tmpCharID) + ", " + std::to_string(type) + ", " + 
						std::to_string(DB_TYPE_MAINTAINEDEFFECTS) + ", " + std::to_string(info->maintained_effects[i].spell_id) + ", " + std::to_string(i) + 
						", " + std::to_string(info->maintained_effects[i].slot_pos) + ")");
						firstTarget = false;
					}
			}
			multimap<int32,int8>::iterator entries;
			for(entries = info->maintained_effects[i].spell->char_id_targets.begin(); entries != info->maintained_effects[i].spell->char_id_targets.end(); entries++)
			{
				if(!firstTarget)
					insertTargets.append(", ");

				LogWrite(SPELL__DEBUG, 0, "Spell", "%s has target %s (%u) added to spell %s", GetName(), spawn ? spawn->GetName() : "NA", entries->first, info->maintained_effects[i].spell->spell->GetName());
				insertTargets.append("(" + std::to_string(caster_char_id) + ", " + std::to_string(entries->first) + ", " + std::to_string(entries->second) + ", " + 
				std::to_string(DB_TYPE_MAINTAINEDEFFECTS) + ", " + std::to_string(info->maintained_effects[i].spell_id) + ", " + std::to_string(i) + 
				", " + std::to_string(info->maintained_effects[i].slot_pos) + ")");

				firstTarget = false;
			}
			info->maintained_effects[i].spell->MSpellTargets.releasereadlock(__FUNCTION__, __LINE__);
			if(!firstTarget)
			{
				Query targetSave;
				targetSave.AddQueryAsync(GetCharacterID(), &database, Q_INSERT, insertTargets.c_str());
			}
		}
	}
	MMaintainedSpells.releasereadlock(__FUNCTION__, __LINE__);
	MSpellEffects.releasereadlock(__FUNCTION__, __LINE__);
}

void Player::MentorTarget()
{
	if(client->GetPlayer()->GetGroupMemberInfo() && client->GetPlayer()->GetGroupMemberInfo()->mentor_target_char_id)
	{
		client->GetPlayer()->GetGroupMemberInfo()->mentor_target_char_id = 0;
		reset_mentorship = true;
		client->Message(CHANNEL_COMMAND_TEXT, "You stop mentoring, and return to level %u.", client->GetPlayer()->GetLevel());
	}
	else if(!reset_mentorship && client->GetPlayer()->GetTarget())
	{
		if(client->GetPlayer()->GetTarget()->IsPlayer())
		{
			Player* tmpPlayer = (Player*)client->GetPlayer()->GetTarget();
			if(tmpPlayer->GetGroupMemberInfo() && tmpPlayer->GetGroupMemberInfo()->mentor_target_char_id)
			{
				client->Message(CHANNEL_COMMAND_TEXT, "You cannot mentor %s at this time.",tmpPlayer->GetName());
				return;
			}
			if(client->GetPlayer()->group_id > 0 && client->GetPlayer()->GetTarget()->group_id == client->GetPlayer()->group_id)
			{
				if(client->GetPlayer()->GetGroupMemberInfo() && !client->GetPlayer()->GetGroupMemberInfo()->mentor_target_char_id && 
				client->GetPlayer()->GetZone() == client->GetPlayer()->GetTarget()->GetZone())
				{
					SetMentorStats(client->GetPlayer()->GetTarget()->GetLevel(), tmpPlayer->GetCharacterID());
					client->Message(CHANNEL_COMMAND_TEXT, "You are now mentoring %s, reducing your effective level to %u.",client->GetPlayer()->GetTarget()->GetName(), client->GetPlayer()->GetTarget()->GetLevel());
				}
			}
		}
	}
}

void Player::SetMentorStats(int32 effective_level, int32 target_char_id)
{
	if(client->GetPlayer()->GetGroupMemberInfo())
		client->GetPlayer()->GetGroupMemberInfo()->mentor_target_char_id = target_char_id;
	InfoStruct* info = GetInfoStruct();
	info->set_effective_level(effective_level);
	client->GetPlayer()->SetTotalHPBase(effective_level * effective_level * 2 + 40);
	client->GetPlayer()->SetTotalPowerBase((sint32)(effective_level * effective_level * 2.1 + 45));
	client->GetPlayer()->CalculateBonuses();
	client->GetPlayer()->SetHP(GetTotalHP());
	client->GetPlayer()->SetPower(GetTotalPower());
	info->set_agi_base(effective_level * 2 + 15);
	info->set_intel_base(effective_level * 2 + 15);
	info->set_wis_base(effective_level * 2 + 15);
	info->set_str_base(effective_level * 2 + 15);
	info->set_sta_base(effective_level * 2 + 15);
	info->set_cold_base((int16)(effective_level * 1.5 + 10));
	info->set_heat_base((int16)(effective_level * 1.5 + 10));
	info->set_disease_base((int16)(effective_level * 1.5 + 10));
	info->set_mental_base((int16)(effective_level * 1.5 + 10));
	info->set_magic_base((int16)(effective_level * 1.5 + 10));
	info->set_divine_base((int16)(effective_level * 1.5 + 10));
	info->set_poison_base((int16)(effective_level * 1.5 + 10));
	GetClient()->ClearSentItemDetails();
	if(GetClient())
	{
		EQ2Packet* app = GetEquipmentList()->serialize(GetClient()->GetVersion(), this);
		if (app) {
			GetClient()->QueuePacket(app);
		}
	}
	GetEquipmentList()->SendEquippedItems(this);
}