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
#include "Spawn.h"
#include <stdio.h>
#include "../common/timer.h"
#include <time.h>
#include <math.h>
#include "Entity.h"
#include "Widget.h"
#include "Sign.h"
#include "../common/MiscFunctions.h"
#include "../common/Log.h"
#include "Rules/Rules.h"
#include "World.h"
#include "LuaInterface.h"
#include "Zone/SPGrid.h"
#include "Bots/Bot.h"
#include "Zone/raycast_mesh.h"

extern ConfigReader configReader;
extern RuleManager rule_manager;
extern World world;

Spawn::Spawn(){ 
	loot_coins = 0;
	trap_triggered = false;
	group_id = 0;
	size_offset = 0;
	merchant_id = 0;
	merchant_type = 0;
	merchant_min_level = 0;
	merchant_max_level = 0;
	memset(&appearance, 0, sizeof(AppearanceData)); 
	memset(&basic_info, 0, sizeof(BasicInfoStruct));
	appearance.pos.state = 0x4080;
	appearance.encounter_level =6;
	size = 32;
	appearance.pos.collision_radius = 32;
	id = Spawn::NextID();
	oversized_packet = 0xFF;
	zone = 0;
	spawn_location_id = 0;
	spawn_entry_id = 0;
	spawn_location_spawns_id = 0;
	respawn = 0;
	expire_time = 0;
	expire_offset = 0;
	x_offset = 0;
	y_offset = 0;
	z_offset = 0;
	database_id = 0;
	packet_num = 1;
	changed = false;
	vis_changed = false;
	position_changed = false;
	send_spawn_changes = true;
	info_changed = false;
	appearance.pos.Speed1 = 0;
	last_attacker = 0;	
	faction_id = 0;
	running_to = 0;
	tmp_visual_state = -1;
	tmp_action_state = -1;
	transporter_id = 0;
	invulnerable = false;
	spawn_group_list = 0;
	MSpawnGroup = 0;
	movement_locations = 0;
	MMovementLocations = 0;
	target = 0;
	primary_command_list_id = 0;
	secondary_command_list_id = 0;
	is_pet = false;
	m_followTarget = 0;
	following = false;
	req_quests_continued_access = false;
	req_quests_override = 0;
	req_quests_private = false;
	m_illusionModel = 0;
	Cell_Info.CurrentCell = nullptr;
	Cell_Info.CellListIndex = -1;
	m_addedToWorldTimestamp = 0;
	m_spawnAnim = 0;
	m_spawnAnimLeeway = 0;
	m_Update.SetName("Spawn::m_Update");
	m_requiredHistory.SetName("Spawn::m_requiredHistory");
	m_requiredQuests.SetName("Spawn::m_requiredQuests");
	last_heading_angle = 0.0;
	last_grid_update = 0;
	last_location_update = 0.0;
	last_movement_update = Timer::GetCurrentTime2();
	forceMapCheck = false;
	m_followDistance = 0;
	MCommandMutex.SetName("Entity::MCommandMutex");
	has_spawn_proximities = false;
	pickup_item_id = 0;
	pickup_unique_item_id = 0;
	disable_sounds = false;
	has_quests_required = false;
	is_flying_creature = false;
	is_water_creature = false;
}

Spawn::~Spawn(){
	vector<Item*>::iterator itr;
	for (itr = loot_items.begin(); itr != loot_items.end(); itr++)
		safe_delete(*itr);
	loot_items.clear();

	RemovePrimaryCommands();

	for(int32 i=0;i<secondary_command_list.size();i++){
		safe_delete(secondary_command_list[i]);
	}
	secondary_command_list.clear();

	RemoveSpawnFromGroup();
	if (MMovementLocations)
		MMovementLocations->writelock(__FUNCTION__, __LINE__);
	if(movement_locations){
		while(movement_locations->size()){
			safe_delete(movement_locations->front());
			movement_locations->pop_front();
		}
		safe_delete(movement_locations);
	}
	if (MMovementLocations)
		MMovementLocations->releasewritelock(__FUNCTION__, __LINE__);
	safe_delete(MMovementLocations);

	MMovementLoop.lock();
	for (int32 i = 0; i < movement_loop.size(); i++)
		safe_delete(movement_loop.at(i));
	movement_loop.clear();
	MMovementLoop.unlock();

	m_requiredHistory.writelock(__FUNCTION__, __LINE__);
	map<int32, LUAHistory*>::iterator lua_itr;
	for (lua_itr = required_history.begin(); lua_itr != required_history.end(); lua_itr++) {
		safe_delete(lua_itr->second);
	}
	required_history.clear();
	m_requiredHistory.releasewritelock(__FUNCTION__, __LINE__);

	m_requiredQuests.writelock(__FUNCTION__, __LINE__);
	map<int32, vector<int16>* >::iterator rq_itr;
	for (rq_itr = required_quests.begin(); rq_itr != required_quests.end(); rq_itr++){
		safe_delete(rq_itr->second);
	}
	required_quests.clear();
	m_requiredQuests.releasewritelock(__FUNCTION__, __LINE__);

	// just in case to make sure data is destroyed
	RemoveSpawnProximities();
}

void Spawn::RemovePrimaryCommands()
{
	for (int32 i = 0; i < primary_command_list.size(); i++) {
		safe_delete(primary_command_list[i]);
	}
	primary_command_list.clear();
}

void Spawn::InitializeHeaderPacketData(Player* player, PacketStruct* header, int16 index) {
	header->setDataByName("index", index);

	if (GetSpawnAnim() > 0 && Timer::GetCurrentTime2() < (GetAddedToWorldTimestamp() + GetSpawnAnimLeeway())) {
		if (header->GetVersion() >= 57080)
			header->setDataByName("spawn_anim", GetSpawnAnim());
		else
			header->setDataByName("spawn_anim", (int16)GetSpawnAnim());
	}
	else {
		if (header->GetVersion() >= 57080)
			header->setDataByName("spawn_anim", 0xFFFFFFFF);
		else
			header->setDataByName("spawn_anim", 0xFFFF);
	}

	if (primary_command_list.size() > 0){
		if (primary_command_list.size() > 1) {
			header->setArrayLengthByName("command_list", primary_command_list.size());
			for (int32 i = 0; i < primary_command_list.size(); i++) {
				header->setArrayDataByName("command_list_name", primary_command_list[i]->name.c_str(), i);
				header->setArrayDataByName("command_list_max_distance", primary_command_list[i]->distance, i);
				header->setArrayDataByName("command_list_error", primary_command_list[i]->error_text.c_str(), i);
				header->setArrayDataByName("command_list_command", primary_command_list[i]->command.c_str(), i);
			}
		}
		if (header->GetVersion() <= 546) {
			header->setMediumStringByName("default_command", primary_command_list[0]->name.c_str());
		}
		else
			header->setMediumStringByName("default_command", primary_command_list[0]->command.c_str());
		header->setDataByName("max_distance", primary_command_list[0]->distance);
	}
	if (spawn_group_list && MSpawnGroup){
		MSpawnGroup->readlock(__FUNCTION__, __LINE__);
		header->setArrayLengthByName("group_size", spawn_group_list->size());
		vector<Spawn*>::iterator itr;
		int i = 0;
		for (itr = spawn_group_list->begin(); itr != spawn_group_list->end(); itr++, i++){
			int32 idx = 0;
			idx = player->GetIDWithPlayerSpawn((*itr));
			header->setArrayDataByName("group_spawn_id", idx, i);
		}
		MSpawnGroup->releasereadlock(__FUNCTION__, __LINE__);
	}

	header->setDataByName("spawn_id", player->GetIDWithPlayerSpawn(this));
	header->setDataByName("crc", 1);
	header->setDataByName("time_stamp", Timer::GetCurrentTime2());
}

void Spawn::InitializeVisPacketData(Player* player, PacketStruct* vis_packet) {
	int16 version = vis_packet->GetVersion();

	if (IsPlayer())
		appearance.pos.grid_id = 0xFFFFFFFF;

	if (IsPlayer())
		vis_packet->setDataByName("player", 1);
	if (version <= 546) {
		vis_packet->setDataByName("targetable", appearance.targetable);
		vis_packet->setDataByName("show_name", appearance.display_name);
		vis_packet->setDataByName("attackable", appearance.attackable);
		if(appearance.attackable == 1)
			vis_packet->setDataByName("attackable_icon", 1); 
		if (IsPlayer()) {
			if (((Player*)this)->IsGroupMember(player))
				vis_packet->setDataByName("group_member", 1);
		}

	}

	if (appearance.targetable == 1 || appearance.show_level == 1 || appearance.display_name == 1) {
		if (!IsGroundSpawn()) {
			int8 arrow_color = ARROW_COLOR_WHITE;
			sint8 npc_con = player->GetFactions()->GetCon(faction_id);

			if (IsPlayer() && !((Player*)this)->CanSeeInvis(player))
				npc_con = 0;
			else if (!IsPlayer() && IsEntity() && !((Entity*)this)->CanSeeInvis(player))
				npc_con = 0;

			if (appearance.attackable == 1)
				arrow_color = player->GetArrowColor(GetLevel());
			if (version <= 283) {
				if (GetMerchantID() > 0)
					arrow_color += 7;
				else {
					if (primary_command_list.size() > 0) {
						int16 len = strlen(primary_command_list[0]->command.c_str());
						if(len >= 4 && strncmp(primary_command_list[0]->command.c_str(), "bank", 4) == 0)
							arrow_color += 14;
						else if (len >= 4 && strncmp(primary_command_list[0]->command.c_str(), "hail", 4) == 0)
							arrow_color += 21;
						else if (len >= 6 && strncmp(primary_command_list[0]->command.c_str(), "attack", 6) == 0) {
							if (arrow_color > 5)
								arrow_color = 34;
							else
								arrow_color += 29;
						}
					}
				}
			}
			vis_packet->setDataByName("arrow_color", arrow_color);
			if (appearance.attackable == 0)
				vis_packet->setDataByName("locked_no_loot", 1);
			else
				vis_packet->setDataByName("locked_no_loot", appearance.locked_no_loot);
			if (player->GetArrowColor(GetLevel()) == ARROW_COLOR_GRAY)
				if (npc_con == -4)
					npc_con = -3;
			vis_packet->setDataByName("npc_con", npc_con);
			if (appearance.attackable == 1 && IsNPC() && (player->GetFactions()->GetCon(faction_id) <= -4 || ((NPC*)this)->Brain()->GetHate(player) > 1)) {
				vis_packet->setDataByName("npc_hate", ((NPC*)this)->Brain()->GetHatePercentage(player));
				vis_packet->setDataByName("show_difficulty_arrows", 1);
			}
			int8 quest_flag = player->CheckQuestFlag(this);
			if (version < 1188 && quest_flag >= 16)
				quest_flag = 1;
			vis_packet->setDataByName("quest_flag", quest_flag);
			if (player->CheckQuestsKillUpdate(this, false)) {
				vis_packet->setDataByName("name_quest_icon", 1);
			}
		}
	}

	int8 vis_flags = 0;
	if (MeetsSpawnAccessRequirements(player)) {
		if (appearance.attackable == 1)
			vis_flags += 64; //attackable icon
		if (appearance.show_level == 1)
			vis_flags += 32;
		if (appearance.display_name == 1)
			vis_flags += 16;
		if (IsPlayer() || appearance.targetable == 1)
			vis_flags += 4;
		if (appearance.show_command_icon == 1)
			vis_flags += 2;
		if (this == player) {
			//if (version <= 283) {
			//	vis_flags = 1;
			//}
			//else
			vis_flags += 1;
		}
	}
	else if (req_quests_override > 0)
	{
		//Check to see if there's an override value set
		vis_flags = req_quests_override & 0xFF;
	}

	if (player->HasGMVision())
	{
		if ((vis_flags & 16) == 0 && appearance.display_name == 0)
			vis_flags += 16;
		if ((vis_flags & 4) == 0)
			vis_flags += 4;
	}

	if (version <= 546 && vis_flags > 0)
		vis_flags = 1;
	
	vis_packet->setDataByName("vis_flags", vis_flags);


	if (MeetsSpawnAccessRequirements(player))
		vis_packet->setDataByName("hand_flag", appearance.display_hand_icon);
	else {
		if ((req_quests_override & 256) > 0)
			vis_packet->setDataByName("hand_flag", 1);
	}
	if (version == 546 && GetMerchantID() > 0) {
		vis_packet->setDataByName("guild", "<Merchant>");
	}
}

void Spawn::InitializeFooterPacketData(Player* player, PacketStruct* footer) {
	if (IsWidget()){
		Widget* widget = (Widget*)this;
		if (widget->GetMultiFloorLift()) {
			footer->setDataByName("widget_x", widget->GetX());
			footer->setDataByName("widget_y", widget->GetY());
			footer->setDataByName("widget_z", widget->GetZ());	
		}
		else {
			footer->setDataByName("widget_x", widget->GetWidgetX());
			footer->setDataByName("widget_y", widget->GetWidgetY());
			footer->setDataByName("widget_z", widget->GetWidgetZ());
		}
		footer->setDataByName("widget_id", widget->GetWidgetID());
		footer->setDataByName("unknown3c", 6);
	}
	else if (IsSign()){
		Sign* sign = (Sign*)this;
		footer->setDataByName("widget_id", sign->GetWidgetID());
		footer->setDataByName("widget_x", sign->GetWidgetX());
		footer->setDataByName("widget_y", sign->GetWidgetY());
		footer->setDataByName("widget_z", sign->GetWidgetZ());
		footer->setDataByName("unknown2b", 6);
		if (sign->GetSignTitle())
			footer->setMediumStringByName("title", sign->GetSignTitle());
		if (sign->GetSignDescription())
			footer->setMediumStringByName("description", sign->GetSignDescription());
		footer->setDataByName("sign_distance", sign->GetSignDistance());
		footer->setDataByName("show", 1);
	}

	if ( IsPlayer())
		footer->setDataByName("is_player", 1);


	if (strlen(appearance.name) < 1)
		strncpy(appearance.name,to_string(GetID()).c_str(),128);

	footer->setMediumStringByName("name", appearance.name);
	footer->setMediumStringByName("guild", appearance.sub_title);
	footer->setMediumStringByName("prefix", appearance.prefix_title);
	footer->setMediumStringByName("suffix", appearance.suffix_title);
	footer->setMediumStringByName("last_name", appearance.last_name);
	if (appearance.attackable == 0 && GetLevel() > 0)
		footer->setDataByName("spawn_type", 1);
	else if (appearance.attackable == 0)
		footer->setDataByName("spawn_type", 6);
	else
		footer->setDataByName("spawn_type", 3);
}

EQ2Packet* Spawn::spawn_serialize(Player* player, int16 version, int16 offset, int32 value, int16 offset2, int16 offset3, int16 offset4, int32 value2) {
	// If spawn is NPC AND is pet && owner is a player && owner is the player passed to this function && player's char sheet pet id is 0
	if (IsNPC() && ((NPC*)this)->IsPet() && ((NPC*)this)->GetOwner()->IsPlayer() && player == ((NPC*)this)->GetOwner() && player->GetInfoStruct()->pet_id == 0) {
		((Player*)((NPC*)this)->GetOwner())->GetInfoStruct()->pet_id = player->spawn_id;
		player->SetCharSheetChanged(true);
	}
	m_Update.writelock(__FUNCTION__, __LINE__);

	int16 index = 0;
	if ((index = player->GetIndexForSpawn(this)) > 0) {
		player->SetSpawnMapIndex(this, index);
	}
	else {
		index = player->SetSpawnMapAndIndex(this);
	}

	// Jabantiz - [Bug] Client Crash on Revive
	if (player->GetIDWithPlayerSpawn(this) == 0) {
		player->SetSpawnMap(this);
	}

	PacketStruct* header = player->GetSpawnHeaderStruct();
	header->ResetData();
	InitializeHeaderPacketData(player, header, index);

	PacketStruct* footer = 0;
	if (IsWidget())
		footer = player->GetWidgetFooterStruct();
	else if (IsSign())
		footer = player->GetSignFooterStruct();
	else if (version > 546)
		footer = player->GetSpawnFooterStruct();
	if (footer) {
		footer->ResetData();
		InitializeFooterPacketData(player, footer);
	}
	PacketStruct* vis_struct = player->GetSpawnVisStruct();
	PacketStruct* info_struct = player->GetSpawnInfoStruct();
	PacketStruct* pos_struct = player->GetSpawnPosStruct();

	player->vis_mutex.writelock(__FUNCTION__, __LINE__);
	vis_struct->ResetData();
	InitializeVisPacketData(player, vis_struct);

	player->info_mutex.writelock(__FUNCTION__, __LINE__);
	info_struct->ResetData();
	InitializeInfoPacketData(player, info_struct);

	player->pos_mutex.writelock(__FUNCTION__, __LINE__);
	pos_struct->ResetData();
	InitializePosPacketData(player, pos_struct);

	if (version <= 283) {
		if (offset == 777) {
			info_struct->setDataByName("name", "This is a really long name\n");
			info_struct->setDataByName("last_name", "This is a really long LAST name\n");
			info_struct->setDataByName("name_suffix", "This is a really long SUFFIX\n");
			info_struct->setDataByName("name_prefix", "This is a really long PREFIX\n");
			info_struct->setDataByName("unknown", "This is a really long UNKNOWN\n");
			info_struct->setDataByName("second_suffix", "This is a really long 2nd SUFFIX\n");
		}
		//info_struct->setDataByName("unknown2", 3, 0); // level
		//info_struct->setDataByName("unknown2", 1, 1); //unknown, two down arrows
		//info_struct->setDataByName("unknown2", 1, 2); //unknown
		//info_struct->setDataByName("unknown2", 1, 3); //unknown
		//info_struct->setDataByName("unknown2", 1, 4); //solo fight
		//info_struct->setDataByName("unknown2", 1, 5); //unknown
		//info_struct->setDataByName("unknown2", 1, 6);  //unknown
		//info_struct->setDataByName("unknown2", 1, 7); //merchant
		//info_struct->setDataByName("unknown2", 1, 8);  //unknown
		//info_struct->setDataByName("unknown2", 1, 9); //unknown
		//info_struct->setDataByName("unknown2", 1, 10);
		//112: 00 00 00 01 02 03 04 05 - 06 07 08 09 0A 00 00 00 | ................ merchant, x4
		//112: 00 00 00 01 02 03 04 05 - 00 00 00 00 00 00 00 00 | ................ x4, epic, indifferent
		//info_struct->setDataByName("body_size", 42); 
		//for(int i=0;i<8;i++)
		//	info_struct->setDataByName("persistent_spell_visuals", 329, i);
		//info_struct->setDataByName("persistent_spell_levels", 20);
	}

	string* vis_data = vis_struct->serializeString();
	string* pos_data = pos_struct->serializeString();
	string* info_data = info_struct->serializeString();

	int16 part2_size = pos_data->length() + vis_data->length() + info_data->length();
	uchar* part2 = new uchar[part2_size];

	player->AddSpawnPosPacketForXOR(id, (uchar*)pos_data->c_str(), pos_data->length());
	player->AddSpawnVisPacketForXOR(id, (uchar*)vis_data->c_str(), vis_data->length());
	player->AddSpawnInfoPacketForXOR(id, (uchar*)info_data->c_str(), info_data->length());

	uchar* ptr = part2;
	memcpy(ptr, pos_data->c_str(), pos_data->length());
	ptr += pos_data->length();
	memcpy(ptr, vis_data->c_str(), vis_data->length());
	ptr += vis_data->length();
	memcpy(ptr, info_data->c_str(), info_data->length());
	player->pos_mutex.releasewritelock(__FUNCTION__, __LINE__);
	player->info_mutex.releasewritelock(__FUNCTION__, __LINE__);
	player->vis_mutex.releasewritelock(__FUNCTION__, __LINE__);

	string* part1 = header->serializeString();
	string* part3 = 0;
	if (footer)
		part3 = footer->serializeString();

	//uchar blah7[] = {0x01,0x01,0x00,0x00,0x01,0x01,0x00,0x01,0x01,0x00 };
		//uchar blah7[] = { 0x03,0x01,0x00,0x01,0x01,0x01,0x00,0x01,0x01,0x00 }; base
		//uchar blah7[] = { 0x03,0x00,0x00,0x01,0x01,0x01,0x00,0x01,0x01,0x00 }; //no change
		//uchar blah7[] = { 0x03,0x00,0x00,0x00,0x01,0x01,0x00,0x01,0x01,0x00 }; //blue instead of green
		//uchar blah7[] = { 0x03,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x01,0x00 }; //no change
		//uchar blah7[] = { 0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x00 }; //not selectable
		//uchar blah7[] = { 0x03,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x01,0x00 }; //no change
		//uchar blah7[] = { 0x03,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00 }; //no longer have the two down arrows
		//uchar blah7[] = { 0x01,0x00,0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x00 }; //arrow color green instead of white/gray
		//memcpy(part2 + 77, blah7, sizeof(blah7));





		//DumpPacket(part2, 885);	
	if (offset > 0) {
		if (offset4 > 0 && offset4 >= offset3) {
			uchar* ptr2 = (uchar*)part2;
			ptr2 += offset3;
			while (offset4 >= offset3) {
				int8 jumpsize = 1;
				if (value2 > 0xFFFF) {
					memcpy(ptr2, (uchar*)&value2, 4);
					jumpsize = 4;
				}
				else if (value2 > 0xFF) {
					memcpy(ptr2, (uchar*)&value2, 2);
					jumpsize = 2;
				}
				else {
					memcpy(ptr2, (uchar*)&value2, 1);
					jumpsize = 1;
				}
				ptr2 += jumpsize;
				offset4 -= jumpsize;
			}
		}
		if (offset2 > 0 && offset2 >= offset) {
			uchar* ptr2 = (uchar*)part2;
			ptr2 += offset;
			while (offset2 >= offset) {
				int8 jumpsize = 1;
				if (value > 0xFFFF) {
					memcpy(ptr2, (uchar*)&value, 4);
					jumpsize = 4;
				}
				else if (value > 0xFF) {
					memcpy(ptr2, (uchar*)&value, 2);
					jumpsize = 2;
				}
				else
					memcpy(ptr2, (uchar*)&value, 1);
				ptr2 += jumpsize;
				offset2 -= jumpsize;
			}
		}
		else {
			uchar* ptr2 = (uchar*)part2;
			ptr2 += offset;
			if (value > 0xFFFF)
				memcpy(ptr2, (uchar*)&value, 4);
			else if (value > 0xFF)
				memcpy(ptr2, (uchar*)&value, 2);
			else
				memcpy(ptr2, (uchar*)&value, 1);
		}
		cout << "setting offset: " << offset << " to: " << value << endl;
	}
	if (offset > 0)
		DumpPacket(part2, part2_size);

	uchar tmp[1100];
	bool reverse = (version > 283);
	part2_size = Pack(tmp, part2, part2_size, 1100, version, reverse);
	int32 total_size = part1->length() + part2_size + 3;
	if (part3)
		total_size += part3->length();
	int32 final_packet_size = total_size + 1;

	if (version > 283)
		final_packet_size += 3;
	else {
		if (final_packet_size >= 255) {
			final_packet_size += 2;
		}
	}
	uchar* final_packet = new uchar[final_packet_size];
	ptr = final_packet;
	if (version <= 283) {
		if ((final_packet_size - total_size) > 1) {
			memcpy(ptr, &oversized_packet, sizeof(oversized_packet));
			ptr += sizeof(oversized_packet);
			memcpy(ptr, &total_size, 2);
			ptr += 2;
		}
		else {
			memcpy(ptr, &total_size, 1);
			ptr += 1;
		}
	}
	else {
		memcpy(ptr, &total_size, sizeof(total_size));
		ptr += sizeof(total_size);
	}

	memcpy(ptr, &oversized_packet, sizeof(oversized_packet));
	ptr += sizeof(oversized_packet);

	int16 opcode = 0;
	if(IsWidget())
		opcode = EQOpcodeManager[GetOpcodeVersion(version)]->EmuToEQ(OP_EqCreateWidgetCmd);
	else if(IsSign())
		opcode = EQOpcodeManager[GetOpcodeVersion(version)]->EmuToEQ(OP_EqCreateSignWidgetCmd);
	else
		opcode = EQOpcodeManager[GetOpcodeVersion(version)]->EmuToEQ(OP_EqCreateGhostCmd);
	memcpy(ptr, &opcode, sizeof(opcode));
	ptr += sizeof(opcode);

	memcpy(ptr, part1->c_str(), part1->length());
	ptr += part1->length();


	memcpy(ptr, tmp, part2_size);
	ptr += part2_size;

	if (part3)
		memcpy(ptr, part3->c_str(), part3->length());
	delete[] part2;

	//	printf("%s (%i): p1: %i, p2:% i (%i), p3:% i, ts: %i\n", GetName(), GetID(), part1->length(), part2_size, origPart2Size, part3->length(), total_size);

	EQ2Packet* ret = new EQ2Packet(OP_ClientCmdMsg, final_packet, final_packet_size);
	delete[] final_packet;

	m_Update.releasewritelock(__FUNCTION__, __LINE__);

	return ret;
}

uchar* Spawn::spawn_info_changes(Player* player, int16 version){
	int16 index = player->GetIndexForSpawn(this);

	PacketStruct* packet = player->GetSpawnInfoStruct();

	player->info_mutex.writelock(__FUNCTION__, __LINE__);
	packet->ResetData();
	InitializeInfoPacketData(player, packet);
	string* data = packet->serializeString();
	int32 size = data->length();
	uchar* xor_info_packet = player->GetTempInfoPacketForXOR();
	if (!xor_info_packet || size != player->GetTempInfoXorSize())
	{
		LogWrite(ZONE__DEBUG, 0, "Zone", "InstantiateInfoPacket: %i, %i", size, player->GetTempInfoXorSize());
		safe_delete(xor_info_packet);
		xor_info_packet = player->SetTempInfoPacketForXOR(size);
	}

	uchar* orig_packet = player->GetSpawnInfoPacketForXOR(id);
	if(orig_packet){
		memcpy(xor_info_packet, (uchar*)data->c_str(), size);
 		Encode(xor_info_packet, orig_packet, size);
	}


	bool changed = false;
	for (int i = 0; i < size; ++i) {
		if (xor_info_packet[i]) {
			changed = true;
			break;
		}
	}

	if (!changed) {
		player->info_mutex.releasewritelock(__FUNCTION__, __LINE__);
		return nullptr;
	}

	uchar* tmp = new uchar[size + 10];
	size = Pack(tmp, xor_info_packet, size, size, version);
	player->info_mutex.releasewritelock(__FUNCTION__, __LINE__);

	int32 orig_size = size;
	size-=sizeof(int32);
	size+=CheckOverLoadSize(index);
	info_packet_size = size + CheckOverLoadSize(size);

	uchar* tmp2 = new uchar[info_packet_size];
	uchar* ptr = tmp2;
	ptr += DoOverLoad(size, ptr);
	ptr += DoOverLoad(index, ptr);
	memcpy(ptr, tmp+sizeof(int32), orig_size - sizeof(int32));
	delete[] tmp;
	return tmp2;
}

uchar* Spawn::spawn_vis_changes(Player* player, int16 version){
	PacketStruct* vis_struct = player->GetSpawnVisStruct();
	int16 index = player->GetIndexForSpawn(this);

	player->vis_mutex.writelock(__FUNCTION__, __LINE__);
	uchar* orig_packet = player->GetSpawnVisPacketForXOR(id);
	vis_struct->ResetData();
	InitializeVisPacketData(player, vis_struct);
	string* data = vis_struct->serializeString();
	int32 size = data->length();
	uchar* xor_vis_packet = player->GetTempVisPacketForXOR();
	if (!xor_vis_packet || size != player->GetTempVisXorSize())
	{
		LogWrite(ZONE__DEBUG, 0, "Zone", "InstantiateVisPacket: %i, %i", size, player->GetTempVisXorSize());
		safe_delete(xor_vis_packet);
		xor_vis_packet = player->SetTempVisPacketForXOR(size);
	}
	if(orig_packet){		
		memcpy(xor_vis_packet, (uchar*)data->c_str(), size);
		Encode(xor_vis_packet, orig_packet, size);
	}

	bool changed = false;
	for (int i = 0; i < size; ++i) {
		if (xor_vis_packet[i]) {
			changed = true;
			break;
		}
	}

	if (!changed) {
		player->vis_mutex.releasewritelock(__FUNCTION__, __LINE__);
		return nullptr;
	}

	uchar* tmp = new uchar[size + 10];
	size = Pack(tmp, xor_vis_packet, size, size, version);
	player->vis_mutex.releasewritelock(__FUNCTION__, __LINE__);

	int32 orig_size = size;
	size-=sizeof(int32);
	size+=CheckOverLoadSize(index);
	vis_packet_size = size + CheckOverLoadSize(size);
	uchar* tmp2 = new uchar[vis_packet_size];
	uchar* ptr = tmp2;
	ptr += DoOverLoad(size, ptr);
	ptr += DoOverLoad(index, ptr);
	memcpy(ptr, tmp+sizeof(int32), orig_size - sizeof(int32));
	delete[] tmp;
	return tmp2;
}

uchar* Spawn::spawn_pos_changes(Player* player, int16 version) {
	int16 index = player->GetIndexForSpawn(this);

	PacketStruct* packet = player->GetSpawnPosStruct();

	player->pos_mutex.writelock(__FUNCTION__, __LINE__);
	uchar* orig_packet = player->GetSpawnPosPacketForXOR(id);
	packet->ResetData();
	InitializePosPacketData(player, packet, true);
	string* data = packet->serializeString();
	int32 size = data->length();
	uchar* xor_pos_packet = player->GetTempPosPacketForXOR();
	if (!xor_pos_packet || size != player->GetTempPosXorSize())
	{
		LogWrite(ZONE__DEBUG, 0, "Zone", "InstantiatePosPacket: %i, %i", size, player->GetTempPosXorSize());
		safe_delete(xor_pos_packet);
		xor_pos_packet = player->SetTempPosPacketForXOR(size);
	}
	if(orig_packet){
		memcpy(xor_pos_packet, (uchar*)data->c_str(), size);
		Encode(xor_pos_packet, orig_packet, size);
	}

	bool changed = false;
	for (int i = 0; i < size; ++i) {
		if (xor_pos_packet[i]) {
			changed = true;
			break;
		}
	}

	if (!changed) {
		player->pos_mutex.releasewritelock(__FUNCTION__, __LINE__);
		return nullptr;
	}


	uchar* tmp;
	if (IsPlayer() && version > 283)
		tmp = new uchar[size + 14];
	else
		tmp = new uchar[size + 10];
	size = Pack(tmp, xor_pos_packet, size, size, version);
	player->pos_mutex.releasewritelock(__FUNCTION__, __LINE__);


	int32 orig_size = size;
	// Needed for CoE+ clients
	if (version >= 1188)
		size += 1;

	if(IsPlayer() && version > 546)
		size += 4;
	size-=sizeof(int32);
	size+=CheckOverLoadSize(index);

	pos_packet_size = size + CheckOverLoadSize(size);
	uchar* tmp2 = new uchar[pos_packet_size];
	uchar* ptr = tmp2;
	ptr += DoOverLoad(size, ptr);
	ptr += DoOverLoad(index, ptr);

	// extra byte in coe+ clients, 0 for NPC's 1 for Players
	int8 x = 0;
	if (IsPlayer() && version > 546) {
		if (version >= 1188) {
			// set x to 1 and add it to the packet
			x = 1;
			memcpy(ptr, &x, sizeof(int8));
			ptr += sizeof(int8);
		}
		int32 now = Timer::GetCurrentTime2();
		memcpy(ptr, &now, sizeof(int32));
		ptr += sizeof(int32);
	}
	else if (version >= 1188) {
		// add x to packet
		memcpy(ptr, &x, sizeof(int8));
		ptr += sizeof(int8);
	}
	memcpy(ptr, tmp+sizeof(int32), orig_size - sizeof(int32));
	delete[] tmp;
	return tmp2;
}

EQ2Packet* Spawn::player_position_update_packet(Player* player, int16 version){
	if(!player || player->IsPlayer() == false){
		LogWrite(SPAWN__ERROR, 0, "Spawn", "Error: Called player_position_update_packet without player!");
		return 0;
	}
	else if(IsPlayer() == false){
		LogWrite(SPAWN__ERROR, 0, "Spawn", "Error: Called player_position_update_packet from spawn!");
		return 0;
	}

	static const int8 info_size = 1;
	static const int8 vis_size = 1;
	m_Update.writelock(__FUNCTION__, __LINE__);
	uchar* pos_changes = spawn_pos_changes(player, version);
	if (pos_changes == NULL )
	{
		m_Update.releasewritelock(__FUNCTION__, __LINE__);
		return NULL;
	}

	int32 tmp_pos_packet_size = pos_packet_size;
	m_Update.releasewritelock(__FUNCTION__, __LINE__);

	int32 size = info_size + tmp_pos_packet_size + vis_size + 8;
	if (version >= 284)
		size += 3;
	else if (version <= 283 && size >= 255) {//1 byte to 3 for overloaded val
		size += 2;
	}
	static const int8 oversized = 255;
	int16 opcode_val = EQOpcodeManager[GetOpcodeVersion(version)]->EmuToEQ(OP_EqUpdateGhostCmd);
	uchar* tmp = new uchar[size];
	memset(tmp, 0, size);
	uchar* ptr = tmp;
	if (version >= 284) {
		size -= 4;
		memcpy(ptr, &size, sizeof(int32));
		size += 4;
		ptr += sizeof(int32);
	}
	else {
		if (size >= 255) {
			memcpy(ptr, &oversized, sizeof(int8));
			ptr += sizeof(int8);
			size -= 3;
			memcpy(ptr, &size, sizeof(int16));
			size += 3;
			ptr += 3;
		}
		else {
			size -= 1;
			memcpy(ptr, &size, sizeof(int8));
			ptr += sizeof(int8);
			size += 1;
			ptr += 1;
		}
	}
	memcpy(ptr, &oversized, sizeof(int8));
	ptr += sizeof(int8);
	memcpy(ptr, &opcode_val, sizeof(int16));
	ptr += sizeof(int16);
	if (version <= 283) {
		int32 timestamp = Timer::GetCurrentTime2();
		memcpy(ptr, &timestamp, sizeof(int32));
	}
	ptr += sizeof(int32);
	ptr += info_size;
	memcpy(ptr, pos_changes, tmp_pos_packet_size);
	EQ2Packet* ret_packet = new EQ2Packet(OP_ClientCmdMsg, tmp, size);
	DumpPacket(ret_packet);
	delete[] tmp;
	delete[] pos_changes;
	return ret_packet;
}

EQ2Packet* Spawn::spawn_update_packet(Player* player, int16 version, bool override_changes, bool override_vis_changes){
	if(!player || player->IsPlayer() == false){
		LogWrite(SPAWN__ERROR, 0, "Spawn", "Error: Called spawn_update_packet without player!");
		return 0;
	}
	else if((IsPlayer() && info_changed == false && vis_changed == false) || (info_changed == false && vis_changed == false && position_changed == false)){
		if(!override_changes && !override_vis_changes)
			return 0;
	}

	static const uchar null_byte = 0;

	uchar* info_changes = 0;
	uchar* pos_changes = 0;
	uchar* vis_changes = 0;
	static const int8 oversized = 255;
	int16 opcode_val = EQOpcodeManager[GetOpcodeVersion(version)]->EmuToEQ(OP_EqUpdateGhostCmd);

	int16 tmp_info_packet_size;
	int16 tmp_vis_packet_size;
	int16 tmp_pos_packet_size;
	//We need to lock these variables up to make this thread safe
	m_Update.writelock(__FUNCTION__, __LINE__);
	//These variables are set in the spawn_info_changes, pos and vis changes functions
	info_packet_size = 1;
	pos_packet_size = 1;
	vis_packet_size = 1;

	if (info_changed || override_changes)
		info_changes = spawn_info_changes(player, version);
	if ((position_changed || override_changes) && IsPlayer() == false)
		pos_changes = spawn_pos_changes(player, version);
	if (vis_changed || override_changes || override_vis_changes)
		vis_changes = spawn_vis_changes(player, version);

	tmp_info_packet_size = info_packet_size;
	tmp_pos_packet_size = pos_packet_size;
	tmp_vis_packet_size = vis_packet_size;

	int32 size = info_packet_size + pos_packet_size + vis_packet_size + 8;
	if (version >= 284)
		size += 3;
	else if (version <= 283 && size >= 255) {//1 byte to 3 for overloaded val
		size += 2;
	}
	uchar* tmp = new uchar[size];
	memset(tmp, 0, size);
	uchar* ptr = tmp;
	if (version >= 284) {
		size -= 4;
		memcpy(ptr, &size, sizeof(int32));
		size += 4;
		ptr += sizeof(int32);
	}
	else {
		if (size >= 255) {
			memcpy(ptr, &oversized, sizeof(int8));
			ptr += sizeof(int8);
			size -= 3;
			memcpy(ptr, &size, sizeof(int16));
			size += 3;
			ptr += 3;
		}
		else {
			size -= 1;
			memcpy(ptr, &size, sizeof(int8));
			ptr += sizeof(int8);
			size += 1;
		}
	}
	memcpy(ptr, &oversized, sizeof(int8));
	ptr += sizeof(int8);
	memcpy(ptr, &opcode_val, sizeof(int16));
	ptr += sizeof(int16);
	if (IsPlayer() == false || version <= 546) { //this isnt sent for player updates, it is sent on position update
		//int32 time = Timer::GetCurrentTime2();
		packet_num = Timer::GetCurrentTime2();
		memcpy(ptr, &packet_num, sizeof(int32));
	}
	ptr += sizeof(int32);

	memcpy(ptr, info_changes ? info_changes : &null_byte, tmp_info_packet_size);
	ptr += info_packet_size;
	memcpy(ptr, pos_changes ? pos_changes : &null_byte, tmp_pos_packet_size);
	ptr += pos_packet_size;
	memcpy(ptr, vis_changes ? vis_changes : &null_byte, tmp_vis_packet_size);

	EQ2Packet* ret_packet = new EQ2Packet(OP_ClientCmdMsg, tmp, size);
	delete[] tmp;
	safe_delete_array(info_changes);
	safe_delete_array(vis_changes);
	safe_delete_array(pos_changes);
	m_Update.releasewritelock(__FUNCTION__, __LINE__);
	return ret_packet;
}

uchar* Spawn::spawn_info_changes_ex(Player* player, int16 version) {
	int16 index = player->GetIndexForSpawn(this);

	PacketStruct* packet = player->GetSpawnInfoStruct();

	player->info_mutex.writelock(__FUNCTION__, __LINE__);

	packet->ResetData();
	InitializeInfoPacketData(player, packet);

	string* data = packet->serializeString();
	int32 size = data->length();
	uchar* xor_info_packet = player->GetTempInfoPacketForXOR();

	if (!xor_info_packet || size != player->GetTempInfoXorSize()) {
		LogWrite(ZONE__DEBUG, 0, "Zone", "InstantiateInfoExPacket: %i, %i", size, player->GetTempInfoXorSize());
		safe_delete(xor_info_packet);
		xor_info_packet = player->SetTempInfoPacketForXOR(size);
	}

	uchar* orig_packet = player->GetSpawnInfoPacketForXOR(id);

	if (orig_packet) {		
		//if (!IsPlayer() && this->EngagedInCombat())
			//packet->PrintPacket();
		memcpy(xor_info_packet, (uchar*)data->c_str(), size);
		Encode(xor_info_packet, orig_packet, size);
	}

	bool changed = false;
	for (int i = 0; i < size; ++i) {
		if (xor_info_packet[i]) {
			changed = true;
			break;
		}
	}

	if (!changed) {
		player->info_mutex.releasewritelock(__FUNCTION__, __LINE__);
		return nullptr;
	}

	uchar* tmp = new uchar[size + 10];
	size = Pack(tmp, xor_info_packet, size, size, version);

	player->info_mutex.releasewritelock(__FUNCTION__, __LINE__);

	int32 orig_size = size;

	size -= sizeof(int32);
	size += CheckOverLoadSize(index);
	info_packet_size = size;

	uchar* tmp2 = new uchar[size];
	uchar* ptr = tmp2;

	ptr += DoOverLoad(index, ptr);

	memcpy(ptr, tmp + sizeof(int32), orig_size - sizeof(int32));

	delete[] tmp;

	return move(tmp2);
}

uchar* Spawn::spawn_vis_changes_ex(Player* player, int16 version) {
	PacketStruct* vis_struct = player->GetSpawnVisStruct();
	int16 index = player->GetIndexForSpawn(this);

	player->vis_mutex.writelock(__FUNCTION__, __LINE__);

	uchar* orig_packet = player->GetSpawnVisPacketForXOR(id);

	vis_struct->ResetData();
	InitializeVisPacketData(player, vis_struct);

	string* data = vis_struct->serializeString();
	int32 size = data->length();
	uchar* xor_vis_packet = player->GetTempVisPacketForXOR();

	if (!xor_vis_packet || size != player->GetTempVisXorSize()) {
		LogWrite(ZONE__DEBUG, 0, "Zone", "InstantiateVisExPacket: %i, %i", size, player->GetTempVisXorSize());
		safe_delete(xor_vis_packet);
		xor_vis_packet = player->SetTempVisPacketForXOR(size);
	}

	if (orig_packet) {		
		//if (!IsPlayer() && this->EngagedInCombat())
		//	vis_struct->PrintPacket();
		memcpy(xor_vis_packet, (uchar*)data->c_str(), size);
		Encode(xor_vis_packet, orig_packet, size);
	}

	bool changed = false;
	for (int i = 0; i < size; ++i) {
		if (xor_vis_packet[i]) {
			changed = true;
			break;
		}
	}

	if (!changed) {
		player->vis_mutex.releasewritelock(__FUNCTION__, __LINE__);
		return nullptr;
	}

	uchar* tmp = new uchar[size + 10];
	size = Pack(tmp, xor_vis_packet, size, size, version);

	player->vis_mutex.releasewritelock(__FUNCTION__, __LINE__);

	int32 orig_size = size;

	size -= sizeof(int32);
	size += CheckOverLoadSize(index);
	vis_packet_size = size;

	uchar* tmp2 = new uchar[size];
	uchar* ptr = tmp2;

	ptr += DoOverLoad(index, ptr);

	memcpy(ptr, tmp + sizeof(int32), orig_size - sizeof(int32));

	delete[] tmp;

	return move(tmp2);
}

uchar* Spawn::spawn_pos_changes_ex(Player* player, int16 version) {
	int16 index = player->GetIndexForSpawn(this);

	PacketStruct* packet = player->GetSpawnPosStruct();

	player->pos_mutex.writelock(__FUNCTION__, __LINE__);

	uchar* orig_packet = player->GetSpawnPosPacketForXOR(id);

	packet->ResetData();
	InitializePosPacketData(player, packet);

	string* data = packet->serializeString();
	int32 size = data->length();
	uchar* xor_pos_packet = player->GetTempPosPacketForXOR();

	if (!xor_pos_packet || size != player->GetTempPosXorSize()) {
		LogWrite(ZONE__DEBUG, 0, "Zone", "InstantiatePosExPacket: %i, %i", size, player->GetTempPosXorSize());
		safe_delete(xor_pos_packet);
		xor_pos_packet = player->SetTempPosPacketForXOR(size);
	}

	if (orig_packet) {
		//if (!IsPlayer() && this->EngagedInCombat())
		//	packet->PrintPacket();
		memcpy(xor_pos_packet, (uchar*)data->c_str(), size);
		Encode(xor_pos_packet, orig_packet, size);
	}

	bool changed = false;
	for (int i = 0; i < size; ++i) {
		if (xor_pos_packet[i]) {
			changed = true;
			break;
		}
	}

	if (!changed) {
		player->pos_mutex.releasewritelock(__FUNCTION__, __LINE__);
		return nullptr;
	}

	uchar* tmp = new uchar[size + 10];

	size = Pack(tmp, xor_pos_packet, size, size, version);

	player->pos_mutex.releasewritelock(__FUNCTION__, __LINE__);

	int32 orig_size = size;

	if (version >= 1188) {
		size += 1;
	}

	if (IsPlayer() && version > 546) {
		size += 4;
	}

	size -= sizeof(int32);
	size += CheckOverLoadSize(index);
	pos_packet_size = size;

	uchar* tmp2 = new uchar[size];
	uchar* ptr = tmp2;

	ptr += DoOverLoad(index, ptr);

	// extra byte in coe+ clients, 0 for NPC's 1 for Players
	int8 x = 0;

	if (version > 546) {
		if (IsPlayer()) {
			if (version >= 1188) {
				x = 1;
				memcpy(ptr, &x, sizeof(int8));
				ptr += sizeof(int8);
			}
			int32 now = Timer::GetCurrentTime2();
			memcpy(ptr, &now, sizeof(int32));
			ptr += sizeof(int32);
		}
		else if (version >= 1188) {
			memcpy(ptr, &x, sizeof(int8));
			ptr += sizeof(int8);
		}
	}

	memcpy(ptr, tmp + sizeof(int32), orig_size - sizeof(int32));

	delete[] tmp;

	return move(tmp2);
}


EQ2Packet* Spawn::serialize(Player* player, int16 version){
	return 0;
}

Spawn* Spawn::GetTarget(){
	Spawn* ret = 0;
	
	// only attempt to get a spawn if we had a target stored
	if (target != 0)
	{
		ret = GetZone()->GetSpawnByID(target);
	
		if (!ret)
			target = 0;
	}

	return ret;
}

void Spawn::SetTarget(Spawn* spawn){
	SetInfo(&target, spawn ? spawn->GetID() : 0);
}

Spawn* Spawn::GetLastAttacker() {
	Spawn* ret = 0;
	ret = GetZone()->GetSpawnByID(last_attacker);
	if (!ret)
		last_attacker = 0;
	return ret;
}

void Spawn::SetLastAttacker(Spawn* spawn){
	last_attacker = spawn->GetID();
}

void Spawn::SetInvulnerable(bool val){
	invulnerable = val;
}

bool Spawn::GetInvulnerable(){
	return invulnerable;
}

bool Spawn::TakeDamage(int32 damage){
	if(invulnerable)
		return false;
	if (IsEntity()) {
		if (((Entity*)this)->IsMezzed())
			((Entity*)this)->RemoveAllMezSpells();

		if (damage == 0)
			return true;
	}

	int32 hp = GetHP();
	if(damage >= hp) {
		SetHP(0);
		if (IsPlayer()) {
			((Player*)this)->InCombat(false);
			((Player*)this)->SetRangeAttack(false);	
			GetZone()->TriggerCharSheetTimer(); // force char sheet updates now
		}
	}
	else {
		SetHP(hp - damage);
		// if player flag the char sheet as changed so the ui updates properly
		if (IsPlayer())
			((Player*)this)->SetCharSheetChanged(true);
	}
	return true;
}

void Spawn::TakeDamage(Spawn* attacker, int32 damage){
	if (TakeDamage(damage))
		GetZone()->CallSpawnScript(this, SPAWN_SCRIPT_HEALTHCHANGED, attacker);
	SetLastAttacker(attacker);
}

ZoneServer*	Spawn::GetZone(){
	return zone;
}

void Spawn::SetZone(ZoneServer* in_zone){
	zone = in_zone;
}


/*** HIT POINT ***/
void Spawn::SetHP(sint32 new_val, bool setUpdateFlags){
	if(new_val == 0){
		ClearRunningLocations();
		CalculateRunningLocation(true);
	}
	if(new_val > basic_info.max_hp)
		SetInfo(&basic_info.max_hp, new_val, setUpdateFlags);
	SetInfo(&basic_info.cur_hp, new_val, setUpdateFlags);
	if(/*IsPlayer() &&*/ GetZone() && basic_info.cur_hp > 0 && basic_info.cur_hp < basic_info.max_hp)
		GetZone()->AddDamagedSpawn(this);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}

	if (IsNPC() && ((NPC*)this)->IsPet() && ((NPC*)this)->GetOwner()->IsPlayer()) {
		Player* player = (Player*)((NPC*)this)->GetOwner();
		if (player->GetPet() && player->GetCharmedPet()) {
			if (this == player->GetPet()) {
				player->GetInfoStruct()->pet_health_pct = (float)basic_info.cur_hp / (float)basic_info.max_hp;
				player->SetCharSheetChanged(true);
			}
		}
		else {
			player->GetInfoStruct()->pet_health_pct = (float)basic_info.cur_hp / (float)basic_info.max_hp;
			player->SetCharSheetChanged(true);
		}
	}
}
void Spawn::SetTotalHP(sint32 new_val){
	if(basic_info.hp_base == 0)
		SetTotalHPBase(new_val);
	SetInfo(&basic_info.max_hp, new_val);

	if(GetZone() && basic_info.cur_hp > 0 && basic_info.cur_hp < basic_info.max_hp)
		GetZone()->AddDamagedSpawn(this);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}

	if (IsNPC() && ((NPC*)this)->IsPet() && ((NPC*)this)->GetOwner()->IsPlayer()) {
		Player* player = (Player*)((NPC*)this)->GetOwner();
		if (player->GetPet() && player->GetCharmedPet()) {
			if (this == player->GetPet()) {
				player->GetInfoStruct()->pet_health_pct = (float)basic_info.cur_hp / (float)basic_info.max_hp;
				player->SetCharSheetChanged(true);
			}
		}
		else {
			player->GetInfoStruct()->pet_health_pct = (float)basic_info.cur_hp / (float)basic_info.max_hp;
			player->SetCharSheetChanged(true);
		}
	}
}
void Spawn::SetTotalHPBase(sint32 new_val)
{
	SetInfo(&basic_info.hp_base, new_val);

	if(GetZone() && basic_info.cur_hp > 0 && basic_info.cur_hp < basic_info.max_hp)
		GetZone()->AddDamagedSpawn(this);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}
}
sint32 Spawn::GetHP()
{
	return basic_info.cur_hp;
}
sint32 Spawn::GetTotalHP()
{
	return basic_info.max_hp;
}
sint32 Spawn::GetTotalHPBase()
{
	return basic_info.hp_base;
}


/*** POWER ***/
void Spawn::SetPower(sint32 power, bool setUpdateFlags){
	if(power > basic_info.max_power)
		SetInfo(&basic_info.max_power, power, setUpdateFlags);
	SetInfo(&basic_info.cur_power, power, setUpdateFlags);
	if(/*IsPlayer() &&*/ GetZone() && basic_info.cur_power < basic_info.max_power)
		GetZone()->AddDamagedSpawn(this);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}

	if (IsNPC() && ((NPC*)this)->IsPet() && ((NPC*)this)->GetOwner()->IsPlayer()) {
		Player* player = (Player*)((NPC*)this)->GetOwner();
		if (player->GetPet() && player->GetCharmedPet()) {
			if (this == player->GetPet()) {
				player->GetInfoStruct()->pet_power_pct = (float)basic_info.cur_power / (float)basic_info.max_power;
				player->SetCharSheetChanged(true);
			}
		}
		else {
			player->GetInfoStruct()->pet_power_pct = (float)basic_info.cur_power / (float)basic_info.max_power;
			player->SetCharSheetChanged(true);
		}
	}
}
void Spawn::SetTotalPower(sint32 new_val)
{
	if(basic_info.power_base == 0)
		SetTotalPowerBase(new_val);
	SetInfo(&basic_info.max_power, new_val);

	if(GetZone() && basic_info.cur_power < basic_info.max_power)
		GetZone()->AddDamagedSpawn(this);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}

	if (IsNPC() && ((NPC*)this)->IsPet() && ((NPC*)this)->GetOwner()->IsPlayer()) {
		Player* player = (Player*)((NPC*)this)->GetOwner();
		if (player->GetPet() && player->GetCharmedPet()) {
			if (this == player->GetPet()) {
				player->GetInfoStruct()->pet_power_pct = (float)basic_info.cur_power / (float)basic_info.max_power;
				player->SetCharSheetChanged(true);
			}
		}
		else {
			player->GetInfoStruct()->pet_power_pct = (float)basic_info.cur_power / (float)basic_info.max_power;
			player->SetCharSheetChanged(true);
		}
	}
}
void Spawn::SetTotalPowerBase(sint32 new_val)
{
	SetInfo(&basic_info.power_base, new_val);

	if(GetZone() && basic_info.cur_power < basic_info.max_power)
		GetZone()->AddDamagedSpawn(this);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}
}
sint32 Spawn::GetPower()
{
	return basic_info.cur_power;
}
sint32 Spawn::GetTotalPower(){
	return basic_info.max_power;
}
sint32 Spawn::GetTotalPowerBase()
{
	return basic_info.power_base;
}


/*** SAVAGERY ***/
void Spawn::SetSavagery(sint32 savagery, bool setUpdateFlags)
{
	/* JA: extremely limited functionality until we better understand Savagery */
	if(savagery > basic_info.max_savagery)
		SetInfo(&basic_info.max_savagery, savagery, setUpdateFlags);

	SetInfo(&basic_info.cur_savagery, savagery, setUpdateFlags);
}
void Spawn::SetTotalSavagery(sint32 new_val)
{
	/* JA: extremely limited functionality until we better understand Savagery */
	if(basic_info.savagery_base == 0)
		SetTotalSavageryBase(new_val);

	SetInfo(&basic_info.max_savagery, new_val);
}
void Spawn::SetTotalSavageryBase(sint32 new_val){
	SetInfo(&basic_info.savagery_base, new_val);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}
}
sint32 Spawn::GetTotalSavagery()
{
	return basic_info.max_savagery;
}
sint32 Spawn::GetSavagery()
{
	return basic_info.cur_savagery;
}


/*** DISSONANCE ***/
void Spawn::SetDissonance(sint32 dissonance, bool setUpdateFlags)
{
	/* JA: extremely limited functionality until we better understand Dissonance */
	if(dissonance > basic_info.max_dissonance)
		SetInfo(&basic_info.max_dissonance, dissonance, setUpdateFlags);

	SetInfo(&basic_info.cur_dissonance, dissonance, setUpdateFlags);
}
void Spawn::SetTotalDissonance(sint32 new_val)
{
	/* JA: extremely limited functionality until we better understand Dissonance */
	if(basic_info.dissonance_base == 0)
		SetTotalDissonanceBase(new_val);

	SetInfo(&basic_info.max_dissonance, new_val);

}
void Spawn::SetTotalDissonanceBase(sint32 new_val)
{
	SetInfo(&basic_info.dissonance_base, new_val);

	if (IsEntity() && ((Entity*)this)->GetGroupMemberInfo()) {
		((Entity*)this)->UpdateGroupMemberInfo();
		if (IsPlayer())
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id, GetZone()->GetClientBySpawn(this));
		else
			world.GetGroupManager()->SendGroupUpdate(((Entity*)this)->GetGroupMemberInfo()->group_id);
	}
}
sint32 Spawn::GetTotalDissonance()
{
	return basic_info.max_dissonance;
}
sint32 Spawn::GetDissonance()
{
	return basic_info.cur_dissonance;
}

/* --< Alternate Advancement Points >-- */
void Spawn::SetAssignedAA(sint16 new_val)
{
	SetInfo(&basic_info.assigned_aa, new_val);
}

void Spawn::SetUnassignedAA(sint16 new_val)
{
	SetInfo(&basic_info.unassigned_aa, new_val);
}

void Spawn::SetTradeskillAA(sint16 new_val)
{
	SetInfo(&basic_info.tradeskill_aa, new_val);
}

void Spawn::SetUnassignedTradeskillAA(sint16 new_val)
{
	SetInfo(&basic_info.unassigned_tradeskill_aa, new_val);
}

void Spawn::SetPrestigeAA(sint16 new_val)
{
	SetInfo(&basic_info.prestige_aa, new_val);
}

void Spawn::SetUnassignedPrestigeAA(sint16 new_val)
{
	SetInfo(&basic_info.unassigned_prestige_aa, new_val);
}

void Spawn::SetTradeskillPrestigeAA(sint16 new_val)
{
	SetInfo(&basic_info.tradeskill_prestige_aa, new_val);
}

void Spawn::SetUnassignedTradeskillPrestigeAA(sint16 new_val)
{
	SetInfo(&basic_info.unassigned_tradeskill_prestige_aa, new_val);
}


sint16 Spawn::GetAssignedAA()
{
	return basic_info.assigned_aa;
}

sint16 Spawn::GetUnassignedAA()
{
	return basic_info.unassigned_aa;
}

sint16 Spawn::GetTradeskillAA()
{
	return basic_info.tradeskill_aa;
}

sint16 Spawn::GetUnassignedTradeskillAA()
{
	return basic_info.unassigned_tradeskill_aa;
}

sint16 Spawn::GetPrestigeAA()
{
	return basic_info.prestige_aa;
}

sint16 Spawn::GetUnassignedPretigeAA()
{
	return basic_info.unassigned_prestige_aa;
}

sint16 Spawn::GetTradeskillPrestigeAA()
{
	return basic_info.tradeskill_prestige_aa;
}

sint16 Spawn::GetUnassignedTradeskillPrestigeAA()
{
	return basic_info.unassigned_tradeskill_prestige_aa;
}

float Spawn::GetDistance(float x1, float y1, float z1, float x2, float y2, float z2){
	x1 = x1 - x2;
	y1 = y1 - y2;
	z1 = z1 - z2;
	return sqrt(x1*x1 + y1*y1 + z1*z1); 
}

float Spawn::GetDistance(float x, float y, float z, float radius, bool ignore_y) {
	if (ignore_y)
		return GetDistance(x, y, z, GetX(), y, GetZ()) - radius;
	else
		return GetDistance(x, y, z, GetX(), GetY(), GetZ()) - radius;
}

float Spawn::GetDistance(float x, float y, float z, bool ignore_y) {
	return GetDistance(x, y, z, 0.0f, ignore_y);
}
float Spawn::GetDistance(Spawn* spawn, bool ignore_y, bool includeRadius){
	float ret = 0;

	if (spawn)
	{
		float radius = 0.0f;
		if (includeRadius)
			radius = CalculateRadius(spawn);
		ret = GetDistance(spawn->GetX(), spawn->GetY(), spawn->GetZ(), radius, ignore_y);
	}

	// maybe distance against ourselves, in that case we want to nullify the radius check
	if (ret < 0)
		ret = 0.0f;

	return ret;
}

float Spawn::GetDistance(Spawn* spawn, float x1, float y1, float z1, bool includeRadius) {
	float ret = 0;

	if (spawn)
	{
		float radius = 0.0f;
		if (includeRadius)
			radius = CalculateRadius(spawn);
		ret = GetDistance(x1, y1, z1, spawn->GetX(), spawn->GetY(), spawn->GetZ()) - radius;
	}

	// maybe distance against ourselves, in that case we want to nullify the radius check
	if (ret < 0)
		ret = 0.0f;

	return ret;
}

float Spawn::CalculateRadius(Spawn* target)
{
	float srcRadius = short_to_float(appearance.pos.collision_radius);
	if (target)
	{
		float targRadius = short_to_float(target->appearance.pos.collision_radius);
		return (targRadius / 32.0f) + (srcRadius / 32.0f);
	}
	else
		return (srcRadius / 32.0f);
}

int32 Spawn::GetRespawnTime(){
	return respawn;
}

void Spawn::SetRespawnTime(int32 time){
	respawn = time;
}

int32 Spawn::GetExpireOffsetTime(){
	return expire_offset;
}

void Spawn::SetExpireOffsetTime(int32 time){
	expire_offset = time;
}

int32 Spawn::GetSpawnLocationID(){
	return spawn_location_id;
}

void Spawn::SetSpawnLocationID(int32 id){
	spawn_location_id = id;
}

int32 Spawn::GetSpawnEntryID(){
	return spawn_entry_id;
}

void Spawn::SetSpawnEntryID(int32 id){
	spawn_entry_id = id;
}

int32 Spawn::GetSpawnLocationPlacementID(){
	return spawn_location_spawns_id;
}

void Spawn::SetSpawnLocationPlacementID(int32 id){
	spawn_location_spawns_id = id;
}

const char* Spawn::GetSpawnScript(){
	if(spawn_script.length() > 0)
		return spawn_script.c_str();
	else
		return 0;
}

void Spawn::SetSpawnScript(string name){
	spawn_script = name;
}

void Spawn::SetPrimaryCommand(const char* name, const char* command, float distance){
	EntityCommand* entity_command = CreateEntityCommand(name, distance, command, "", 0, 0);
	if(primary_command_list.size() > 0 && primary_command_list[0]){
		safe_delete(primary_command_list[0]);
		primary_command_list[0] = entity_command;
	}
	else
		primary_command_list.push_back(entity_command);
}

void Spawn::SetSecondaryCommands(vector<EntityCommand*>* commands){
	if(commands && commands->size() > 0){
		vector<EntityCommand*>::iterator itr;
		if(secondary_command_list.size() > 0){
			for(itr = secondary_command_list.begin(); itr != secondary_command_list.end(); itr++){
				safe_delete(*itr);
			}
			secondary_command_list.clear();
		}
		EntityCommand* command = 0;
		for(itr = commands->begin(); itr != commands->end(); itr++){
			command = CreateEntityCommand(*itr);
			secondary_command_list.push_back(command);
		}
	}
}

void Spawn::SetPrimaryCommands(vector<EntityCommand*>* commands){
	if(commands && commands->size() > 0){
		vector<EntityCommand*>::iterator itr;
		if(primary_command_list.size() > 0){
			for(itr = primary_command_list.begin(); itr != primary_command_list.end(); itr++){
				safe_delete(*itr);
			}
			primary_command_list.clear();
		}
		EntityCommand* command = 0;
		for(itr = commands->begin(); itr != commands->end(); itr++){
			command = CreateEntityCommand(*itr);
			primary_command_list.push_back(command);
		}
	}
}

EntityCommand* Spawn::FindEntityCommand(string command, bool primaryOnly) {
	EntityCommand* entity_command = 0;
	if (primary_command_list.size() > 0) {
		vector<EntityCommand*>::iterator itr;
		for (itr = primary_command_list.begin(); itr != primary_command_list.end(); itr++) {
			if ((*itr)->command.compare(command) == 0) {
				entity_command = *itr;
				break;
			}
		}
	}

	if (primaryOnly)
		return entity_command;

	if (!entity_command && secondary_command_list.size() > 0) {
		vector<EntityCommand*>::iterator itr;
		for (itr = secondary_command_list.begin(); itr != secondary_command_list.end(); itr++) {
			if ((*itr)->command == command) {
				entity_command = *itr;
				break;
			}
		}
	}
	return entity_command;
}

void Spawn::SetSizeOffset(int8 offset){
	size_offset = offset;
}

int8 Spawn::GetSizeOffset(){
	return size_offset;
}

void Spawn::SetMerchantID(int32 val){
	merchant_id = val;
}

int32 Spawn::GetMerchantID(){
	return merchant_id;
}

void Spawn::SetMerchantType(int8 val) {
	merchant_type = val;
}

int8 Spawn::GetMerchantType() {
	return merchant_type;
}

void Spawn::SetMerchantLevelRange(int32 minLvl, int32 maxLvl) {
	merchant_min_level = minLvl;
	merchant_max_level = maxLvl;
}

int32 Spawn::GetMerchantMinLevel() {
	return merchant_min_level;
}

int32 Spawn::GetMerchantMaxLevel() {
	return merchant_max_level;
}

bool Spawn::IsClientInMerchantLevelRange(Client* client, bool sendMessageIfDenied)
{
	if (!client)
		return false;

	if (GetMerchantMinLevel() && client->GetPlayer()->GetLevel() < GetMerchantMinLevel())
	{
		client->Message(CHANNEL_COLOR_RED, "You are unable to interact with this merchant due to a minimum level %u allowed.", GetMerchantMinLevel());
		return false;
	}
	else if (GetMerchantMaxLevel() && client->GetPlayer()->GetLevel() > GetMerchantMaxLevel())
	{
		client->Message(CHANNEL_COLOR_RED, "You are unable to interact with this merchant due to a maximum level %u allowed.", GetMerchantMaxLevel());
		return false;
	}
	
	return true;
}

void Spawn::SetQuestsRequired(Spawn* new_spawn){
	m_requiredQuests.writelock(__FUNCTION__, __LINE__);
	if(required_quests.size() > 0){
		map<int32, vector<int16>* >::iterator itr;
		for(itr = required_quests.begin(); itr != required_quests.end(); itr++){
			vector<int16>* quest_steps = itr->second;
			for (int32 i = 0; i < quest_steps->size(); i++)
				new_spawn->SetQuestsRequired(itr->first, quest_steps->at(i));
		}
	}
	m_requiredQuests.releasewritelock(__FUNCTION__, __LINE__);
}

void Spawn::SetQuestsRequired(int32 quest_id, int16 quest_step){
	m_requiredQuests.writelock(__FUNCTION__, __LINE__);
	if (required_quests.count(quest_id) == 0)
		required_quests.insert(make_pair(quest_id, new vector<int16>));
	else{
		for (int32 i = 0; i < required_quests[quest_id]->size(); i++){
			if (required_quests[quest_id]->at(i) == quest_step){
				m_requiredQuests.releasewritelock(__FUNCTION__, __LINE__);
				return;
			}
		}
	}

	has_quests_required = true;
	required_quests[quest_id]->push_back(quest_step);
	m_requiredQuests.releasewritelock(__FUNCTION__, __LINE__);
}

bool Spawn::HasQuestsRequired()
{
	return has_quests_required;
}

void Spawn::SetRequiredHistory(int32 event_id, int32 value1, int32 value2){
	LUAHistory* set_value = new LUAHistory();
	set_value->Value = value1;
	set_value->Value2 = value2;
	set_value->SaveNeeded = false;
	m_requiredHistory.writelock(__FUNCTION__, __LINE__);
	if (required_history.count(event_id) == 0)
		required_history.insert(make_pair(event_id, set_value));
	else
	{
		LUAHistory* tmp_value = required_history[event_id];
		required_history[event_id] = set_value;
		safe_delete(tmp_value);
	}
	m_requiredHistory.releasewritelock(__FUNCTION__, __LINE__);
}

void Spawn::SetTransporterID(int32 id){
	transporter_id = id;
}

int32 Spawn::GetTransporterID(){
	return transporter_id;
}

void Spawn::InitializePosPacketData(Player* player, PacketStruct* packet, bool bSpawnUpdate) {
	int16 version = packet->GetVersion();
	packet->setDataByName("pos_grid_id", appearance.pos.grid_id);
	bool include_heading = true;
	if (IsWidget() && ((Widget*)this)->GetIncludeHeading() == false)
		include_heading = false;
	else if (IsSign() && ((Sign*)this)->GetIncludeHeading() == false)
		include_heading = false;
	else if (IsGroundSpawn())
		include_heading = false;

	if (include_heading){
		packet->setDataByName("pos_heading1", appearance.pos.Dir1);
		packet->setDataByName("pos_heading2", appearance.pos.Dir2);
	}

	if (version <= 910) {
		packet->setDataByName("pos_collision_radius", appearance.pos.collision_radius > 0 ? appearance.pos.collision_radius : 32);
		packet->setDataByName("pos_size", size > 0 ? size : 32);
		packet->setDataByName("pos_size_multiplier", 32); //32 is normal
	}
	else {
		if (size == 0)
			size = 32;

		packet->setDataByName("pos_collision_radius", appearance.pos.collision_radius > 0 ? appearance.pos.collision_radius : 32);

		packet->setDataByName("pos_size", 1.0f);

		if (!IsPlayer())
			packet->setDataByName("pos_size", size > 0 ? (((float)size) / 32.0f) : 1.0f); // float not an integer
		else
			packet->setDataByName("pos_size", 1.0f);

		// please do not remove!  This makes it so NPCs for example do not resize large/small when you are in combat with them!
		packet->setDataByName("pos_size_ratio", 1.0f);
	}
	packet->setDataByName("pos_state", appearance.pos.state);

	bool include_location = true;
	if (IsWidget() && ((Widget*)this)->GetIncludeLocation() == false)
		include_location = false;
	else if (IsSign() && ((Sign*)this)->GetIncludeLocation() == false)
		include_location = false;

	if (include_location){
		if (IsWidget() && ((Widget*)this)->GetMultiFloorLift()) {
			Widget* widget = (Widget*)this;
			float x = appearance.pos.X - widget->GetWidgetX();
			float y = appearance.pos.Y - widget->GetWidgetY();
			float z = appearance.pos.Z - widget->GetWidgetZ();

			packet->setDataByName("pos_x", x);
			packet->setDataByName("pos_y", y);
			packet->setDataByName("pos_z", z);
		}
		else {
			packet->setDataByName("pos_x", appearance.pos.X);
			packet->setDataByName("pos_y", appearance.pos.Y);
			packet->setDataByName("pos_z", appearance.pos.Z);
		}
		if (IsSign())
			packet->setDataByName("pos_unknown6", 3, 2);
	}

	if (IsPlayer()) {
		packet->setDataByName("pos_swim_speed_modifier", 20);
		packet->setDataByName("pos_x_velocity", TransformFromFloat(GetSpeedX(), 5));
		packet->setDataByName("pos_y_velocity", TransformFromFloat(GetSpeedY(), 5));
		packet->setDataByName("pos_z_velocity", TransformFromFloat(GetSpeedZ(), 5));
	}

	if (appearance.pos.X2 == 0 && appearance.pos.Y2 == 0 && appearance.pos.Z2 && (appearance.pos.X != 0 || appearance.pos.Y != 0 || appearance.pos.Z != 0)) {
		appearance.pos.X2 = appearance.pos.X;
		appearance.pos.Y2 = appearance.pos.Y;
		appearance.pos.Z2 = appearance.pos.Z;
	}
	if (appearance.pos.X3 == 0 && appearance.pos.Y3 == 0 && appearance.pos.Z3 && (appearance.pos.X != 0 || appearance.pos.Y != 0 || appearance.pos.Z != 0)) {
		appearance.pos.X3 = appearance.pos.X;
		appearance.pos.Y3 = appearance.pos.Y;
		appearance.pos.Z3 = appearance.pos.Z;
	}
	//Transform To/From Float bits (original client)
	//pos_loc_offset[3]: 5
	//pos_x_velocity: 5
	//pos_y_velocity: 5
	//pos_z_velocity: 5
	//pos_heading1: 6
	//pos_heading2: 6
	//pos_speed: 8
	//pos_dest_loc_offset[3]: 5
	//pos_dest_loc_offset2[3]: 5
	//pos_heading_speed: 5
	//pos_move_type: 5 (speed_modifier)
	//pos_swim_speed_modifier: 5
	//pos_side_speed: 8
	//pos_vert_speed: 8
	//pos_requested_pitch: 6
	//pos_requested_pitch_speed: 5
	//pos_pitch: 6
	//pos_collision_radius: 5
	//pos_size: 5
	//actor_stop_range: 5
	//this is for original box client, destinations used to be offsets
	if (appearance.pos.X2 != 0 || appearance.pos.Y2 != 0 || appearance.pos.Z2 != 0) {
		packet->setDataByName("pos_dest_loc_offset", TransformFromFloat(appearance.pos.X2 - appearance.pos.X, 5));
		packet->setDataByName("pos_dest_loc_offset", TransformFromFloat(appearance.pos.Y2 - appearance.pos.Y, 5), 1);
		packet->setDataByName("pos_dest_loc_offset", TransformFromFloat(appearance.pos.Z2 - appearance.pos.Z, 5), 2);
	}
	if (appearance.pos.X3 != 0 || appearance.pos.Y3 != 0 || appearance.pos.Z3 != 0) {
		packet->setDataByName("pos_dest_loc_offset2", TransformFromFloat(appearance.pos.X3 - appearance.pos.X, 5));
		packet->setDataByName("pos_dest_loc_offset2", TransformFromFloat(appearance.pos.Y3 - appearance.pos.Y, 5), 1);
		packet->setDataByName("pos_dest_loc_offset2", TransformFromFloat(appearance.pos.Z3 - appearance.pos.Z, 5), 2);
	}

	bool bSendSpeed = true;

	if (IsWidget() && ((Widget*)this)->GetMultiFloorLift()) {
		Widget* widget = (Widget*)this;

		float x;
		float y;
		float z;

		if (IsRunning()){
			x = appearance.pos.X2 - widget->GetWidgetX();
			y = appearance.pos.Y2 - widget->GetWidgetY();
			z = appearance.pos.Z2- widget->GetWidgetZ();
		}
		else {
			x = appearance.pos.X - widget->GetWidgetX();
			y = appearance.pos.Y - widget->GetWidgetY();
			z = appearance.pos.Z - widget->GetWidgetZ();
		}

		packet->setDataByName("pos_next_x", x);
		packet->setDataByName("pos_next_y", y);
		packet->setDataByName("pos_next_z", z);

		packet->setDataByName("pos_x3", x);
		packet->setDataByName("pos_y3", y);
		packet->setDataByName("pos_z3", z);
	}
	//If this is a spawn update or this spawn is currently moving we can send these values, otherwise set speed and next_xyz to 0
	//This fixes the bug where spawns with movement scripts face south when initially spawning if they are at their target location.
	else if (bSpawnUpdate || memcmp(&appearance.pos.X, &appearance.pos.X2, sizeof(float) * 3) != 0) {
		packet->setDataByName("pos_next_x", appearance.pos.X2);
		packet->setDataByName("pos_next_y", appearance.pos.Y2);
		packet->setDataByName("pos_next_z", appearance.pos.Z2);

		packet->setDataByName("pos_x3", appearance.pos.X3);
		packet->setDataByName("pos_y3", appearance.pos.Y3);
		packet->setDataByName("pos_z3", appearance.pos.Z3);
	}
	else
	{
		bSendSpeed = false;
	}
	//packet->setDataByName("pos_unknown2", 4, 2);

	int16 speed_multiplier = rule_manager.GetGlobalRule(R_Spawn, SpeedMultiplier)->GetInt16(); // was 1280, 600 and now 300... investigating why

	if (IsPlayer()) {
		Player* player = static_cast<Player*>(this);

		packet->setDataByName("pos_speed", player->GetPosPacketSpeed() * speed_multiplier);
		packet->setDataByName("pos_side_speed", player->GetSideSpeed() * speed_multiplier);
	}
	else if (bSendSpeed) {
		packet->setDataByName("pos_speed", GetSpeed() * speed_multiplier);
	}
	
	

	if (IsNPC() || IsPlayer()) {
		packet->setDataByName("pos_move_type", 25);
	}
	else if (IsWidget() || IsSign()) {
		packet->setDataByName("pos_move_type", 11);
	}
	else if(IsGroundSpawn()) {
		packet->setDataByName("pos_move_type", 16);
	}

	if (!IsPlayer())
		packet->setDataByName("pos_movement_mode", 2);
	
	if(version <= 910)
		packet->setDataByName("pos_unknown10", 0xFFFF, 1);
	else if (version >= 1119)
			packet->setDataByName("face_actor_id", 0xFFFFFFFF);
	else
		packet->setDataByName("pos_unknown10", 0xFFFF);

	if(version <= 910)
		packet->setDataByName("pos_unknown10", 0xFFFF, 2);
	else if (version >= 1119)
		packet->setDataByName("face_actor_id", 0xFFFFFFFF);
	else
		packet->setDataByName("pos_unknown10", 0XFFFF, 1);

	packet->setDataByName("pos_pitch1", appearance.pos.Pitch1);
	packet->setDataByName("pos_pitch2", appearance.pos.Pitch2);
	packet->setDataByName("pos_roll", appearance.pos.Roll);
}

void Spawn::InitializeInfoPacketData(Player* spawn, PacketStruct* packet) {
	int16 version = packet->GetVersion();

	bool spawnHiddenFromClient = false;

	// radius of 0 is always seen, -1 is never seen (unless items/spells override), larger than 0 is a defined radius to restrict visibility
	sint32 radius = rule_manager.GetGlobalRule(R_PVP, InvisPlayerDiscoveryRange)->GetSInt32();
	if (radius != 0 && (Spawn*)spawn != this && this->IsPlayer() && !spawn->CanSeeInvis((Entity*)this))
		spawnHiddenFromClient = true;

	if (!spawnHiddenFromClient && (appearance.targetable == 1 || appearance.show_level == 1 || appearance.display_name == 1)) {
		appearance.locked_no_loot = 1; //for now
		if (!IsObject() && !IsGroundSpawn() && !IsWidget() && !IsSign()) {
			int8 percent = 0;
			if (GetHP() > 0)
				percent = (int8)(((float)GetHP() / GetTotalHP()) * 100);
			if (version >= 284) {
				if (percent < 100) {
					packet->setDataByName("hp_remaining", 100 ^ percent);
				}
				else
					packet->setDataByName("hp_remaining", 0);
			}
			else {
				if (percent > 100)
					percent = 100;
				packet->setDataByName("hp_remaining", percent);
			}
			if (GetTotalPower() > 0) {
				percent = (int8)(((float)GetPower() / GetTotalPower()) * 100);
				if (percent > 0)
					packet->setDataByName("power_percent", percent);
				else
					packet->setDataByName("power_percent", 0);
			}
		}
	}

	if (version <= 546) {
		packet->setDataByName("name", appearance.name);
		for (int8 i = 0; i < 8; i++)
			packet->setDataByName("unknown1", 0xFF, i);
		if (appearance.show_level == 0)
			packet->setDataByName("hide_health", 1);
	}
	if (GetHP() <= 0 && IsEntity()) {
		packet->setDataByName("corpse", 1);
		packet->setDataByName("loot_icon", 1); 
	}
	if (!IsPlayer())
		packet->setDataByName("npc", 1);
	if (GetMerchantID() > 0)
		packet->setDataByName("merchant", 1);		
	packet->setDataByName("effective_level", (int8)GetLevel());
	packet->setDataByName("level", (int8)GetLevel());
	packet->setDataByName("unknown4", (int8)GetLevel());
	packet->setDataByName("difficulty", appearance.encounter_level); //6);
	packet->setDataByName("unknown6", 1);
	packet->setDataByName("heroic_flag", appearance.heroic_flag);
	if (!IsObject() && !IsGroundSpawn() && !IsWidget() && !IsSign())
		packet->setDataByName("interaction_flag", 12); //this makes NPCs head turn to look at you

	packet->setDataByName("class", appearance.adventure_class);

	int16 model_type = appearance.model_type;
	if (GetIllusionModel() != 0) {
		if (IsPlayer()) {
			if (((Player*)this)->get_character_flag(CF_SHOW_ILLUSION)) {
				model_type = GetIllusionModel();
			}
		}
		else
			model_type = GetIllusionModel();
	}

	int16 sogaModelType = appearance.soga_model_type;
	if (spawnHiddenFromClient)
	{
		model_type = 0;
		sogaModelType = 0;
	}

	packet->setDataByName("model_type", model_type);
	if (appearance.soga_model_type == 0)
		packet->setDataByName("soga_model_type", model_type);
	else
		packet->setDataByName("soga_model_type", sogaModelType);

	if (GetTempActionState() >= 0)
		packet->setDataByName("action_state", GetTempActionState());
	else
		packet->setDataByName("action_state", appearance.action_state);
	if (GetTempVisualState() >= 0)
		packet->setDataByName("visual_state", GetTempVisualState());
	else
		packet->setDataByName("visual_state", appearance.visual_state);
	packet->setDataByName("emote_state", appearance.emote_state);
	packet->setDataByName("mood_state", appearance.mood_state);
	packet->setDataByName("gender", appearance.gender);
	packet->setDataByName("race", appearance.race);
	packet->setDataByName("gender", appearance.gender);
	if (IsEntity()) {
		Entity* entity = ((Entity*)this);
		packet->setDataByName("combat_voice", entity->GetCombatVoice());
		packet->setDataByName("emote_voice", entity->GetEmoteVoice());
		for (int i = 0; i < 25; i++) {
			if (i == 2) { //don't send helm if hidden flag
				if (IsPlayer()) {
					if (((Player*)this)->get_character_flag(CF_HIDE_HELM)) {
						packet->setDataByName("equipment_types", 0, i);
						packet->setColorByName("equipment_colors", 0, i);
						packet->setColorByName("equipment_highlights", 0, i);
						continue;
					}
				}
				if (IsBot()) {
					if (!((Bot*)this)->ShowHelm) {
						packet->setDataByName("equipment_types", 0, i);
						packet->setColorByName("equipment_colors", 0, i);
						packet->setColorByName("equipment_highlights", 0, i);
						continue;
					}
				}
			}
			else if (i == 19) { //don't send cloak if hidden
				if (IsPlayer()) {
					if (!((Player*)this)->get_character_flag(CF_SHOW_CLOAK)) {
						packet->setDataByName("equipment_types", 0, i);
						packet->setColorByName("equipment_colors", 0, i);
						packet->setColorByName("equipment_highlights", 0, i);
						continue;
					}
				}
				if (IsBot()) {
					if (!((Bot*)this)->ShowCloak) {
						packet->setDataByName("equipment_types", 0, i);
						packet->setColorByName("equipment_colors", 0, i);
						packet->setColorByName("equipment_highlights", 0, i);
						continue;
					}
				}
			}
			packet->setDataByName("equipment_types", entity->equipment.equip_id[i], i);
			packet->setColorByName("equipment_colors", entity->equipment.color[i], i);
			packet->setColorByName("equipment_highlights", entity->equipment.highlight[i], i);
		}
		packet->setDataByName("mount_type", entity->GetMount());

		// find the visual flags
		int8 vis_flag = 0;
		//Invis + crouch flag check
		if (entity->IsStealthed())
			vis_flag += (INFO_VIS_FLAG_INVIS + INFO_VIS_FLAG_CROUCH);
		//Invis flag check
		else if (entity->IsInvis())
			vis_flag += INFO_VIS_FLAG_INVIS;
		//Mount flag check
		if (entity->GetMount() > 0)
			vis_flag += INFO_VIS_FLAG_MOUNTED;
		//Hide hood check
		if ((IsPlayer() && ((Player*)this)->get_character_flag(CF_HIDE_HOOD)) || appearance.hide_hood)
			vis_flag += INFO_VIS_FLAG_HIDE_HOOD;

		packet->setDataByName("visual_flag", vis_flag);
		packet->setColorByName("mount_saddle_color", entity->GetMountSaddleColor());
		packet->setColorByName("mount_color", entity->GetMountColor());
		packet->setDataByName("hair_type_id", entity->features.hair_type);
		packet->setDataByName("chest_type_id", entity->features.chest_type);
		packet->setDataByName("wing_type_id", entity->features.wing_type);
		packet->setDataByName("legs_type_id", entity->features.legs_type);
		packet->setDataByName("soga_hair_type_id", entity->features.soga_hair_type);
		packet->setDataByName("facial_hair_type_id", entity->features.hair_face_type);
		packet->setDataByName("soga_facial_hair_type_id", entity->features.soga_hair_face_type);
		for (int i = 0; i < 3; i++) {
			packet->setDataByName("eye_type", entity->features.eye_type[i], i);
			packet->setDataByName("ear_type", entity->features.ear_type[i], i);
			packet->setDataByName("eye_brow_type", entity->features.eye_brow_type[i], i);
			packet->setDataByName("cheek_type", entity->features.cheek_type[i], i);
			packet->setDataByName("lip_type", entity->features.lip_type[i], i);
			packet->setDataByName("chin_type", entity->features.chin_type[i], i);
			packet->setDataByName("nose_type", entity->features.nose_type[i], i);
			packet->setDataByName("soga_eye_type", entity->features.soga_eye_type[i], i);
			packet->setDataByName("soga_ear_type", entity->features.soga_ear_type[i], i);
			packet->setDataByName("soga_eye_brow_type", entity->features.soga_eye_brow_type[i], i);
			packet->setDataByName("soga_cheek_type", entity->features.soga_cheek_type[i], i);
			packet->setDataByName("soga_lip_type", entity->features.soga_lip_type[i], i);
			packet->setDataByName("soga_chin_type", entity->features.soga_chin_type[i], i);
			packet->setDataByName("soga_nose_type", entity->features.soga_nose_type[i], i);
		}
		packet->setColorByName("skin_color", entity->features.skin_color);
		packet->setColorByName("eye_color", entity->features.eye_color);
		packet->setColorByName("hair_type_color", entity->features.hair_type_color);
		packet->setColorByName("hair_type_highlight_color", entity->features.hair_type_highlight_color);
		packet->setColorByName("hair_face_color", entity->features.hair_face_color);
		packet->setColorByName("hair_face_highlight_color", entity->features.hair_face_highlight_color);
		packet->setColorByName("hair_highlight", entity->features.hair_highlight_color);
		packet->setColorByName("wing_color1", entity->features.wing_color1);
		packet->setColorByName("wing_color2", entity->features.wing_color2);
		packet->setColorByName("hair_color1", entity->features.hair_color1);
		packet->setColorByName("hair_color2", entity->features.hair_color2);
		packet->setColorByName("soga_skin_color", entity->features.soga_skin_color);
		packet->setColorByName("soga_eye_color", entity->features.soga_eye_color);
		packet->setColorByName("soga_hair_color1", entity->features.soga_hair_color1);
		packet->setColorByName("soga_hair_color2", entity->features.soga_hair_color2);
		packet->setColorByName("soga_hair_type_color", entity->features.soga_hair_type_color);
		packet->setColorByName("soga_hair_type_highlight_color", entity->features.soga_hair_type_highlight_color);
		packet->setColorByName("soga_hair_face_color", entity->features.soga_hair_face_color);
		packet->setColorByName("soga_hair_face_highlight_color", entity->features.soga_hair_face_highlight_color);
		packet->setColorByName("soga_hair_highlight", entity->features.soga_hair_highlight_color);

		packet->setDataByName("body_age", entity->features.body_age);
	}
	else {
		EQ2_Color empty;
		empty.red = 255;
		empty.blue = 255;
		empty.green = 255;
		packet->setColorByName("skin_color", empty);
		packet->setColorByName("eye_color", empty);
		packet->setColorByName("soga_skin_color", empty);
		packet->setColorByName("soga_eye_color", empty);
	}
	if (appearance.icon == 0) {
		if (appearance.attackable == 1)
			appearance.icon = 0;
		else if (appearance.encounter_level > 0)
			appearance.icon = 4;
		else
			appearance.icon = 6;
	}

	// If Coe+ clients modify the values before we send
	// if not then just send the value we have.
	int8 temp_icon = appearance.icon;

	//Check if we need to add the hand icon..
	if ((temp_icon & 6) != 6 && appearance.display_hand_icon) {
		temp_icon |= 6;
	}

	//Icon value 28 for boats, set this without modifying the value
	if (version >= 1188 && temp_icon != 28) {
		if ((temp_icon & 64) > 0) {
			temp_icon -= 64;   // remove the DoV value;
			temp_icon += 128; // add the CoE value
		}
		if ((temp_icon & 32) > 0) {
			temp_icon -= 32;   // remove the DoV value;
			temp_icon += 64; // add the CoE value
		}
		if ((temp_icon & 4) > 0) {
			temp_icon -= 4;   // remove DoV value
			temp_icon += 8;   // add the CoE icon
		}
		if ((temp_icon & 6) > 0) {
			temp_icon -= 10;   // remove DoV value
			temp_icon += 12;   // add the CoE icon
		}
	}
	packet->setDataByName("icon", temp_icon);//appearance.icon);

	int32 temp_activity_status = 0;

	if (!Alive() && GetTotalHP() > 0 && !IsObject() && !IsGroundSpawn())
		temp_activity_status = 1;

	temp_activity_status += (IsNPC() || IsObject() || IsGroundSpawn()) ? 1 << 1 : 0;
	if (version >= 1188) {
		if (IsGroundSpawn() || GetShowHandIcon())
			temp_activity_status += ACTIVITY_STATUS_INTERACTABLE_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_ROLEPLAYING) > 0)
			temp_activity_status += ACTIVITY_STATUS_ROLEPLAYING_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_ANONYMOUS) > 0)
			temp_activity_status += ACTIVITY_STATUS_ANONYMOUS_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_LINKDEAD) > 0)
			temp_activity_status += ACTIVITY_STATUS_LINKDEAD_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_CAMPING) > 0)
			temp_activity_status += ACTIVITY_STATUS_CAMPING_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_LFG) > 0)
			temp_activity_status += ACTIVITY_STATUS_LFG_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_LFW) > 0)
			temp_activity_status += ACTIVITY_STATUS_LFW_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_SOLID) > 0)
			temp_activity_status += ACTIVITY_STATUS_SOLID_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_IMMUNITY_GAINED) > 0)
			temp_activity_status += ACTIVITY_STATUS_IMMUNITY_GAINED_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_IMMUNITY_REMAINING) > 0)
			temp_activity_status += ACTIVITY_STATUS_IMMUNITY_REMAINING_1188;

		if ((appearance.activity_status & ACTIVITY_STATUS_AFK) > 0)
			temp_activity_status += ACTIVITY_STATUS_AFK_1188;

		if (EngagedInCombat())
			temp_activity_status += ACTIVITY_STATUS_INCOMBAT_1188;

		// if this is either a boat or lift let the client be manipulated by the object
		// doesn't work for DoF client version 546
		if (appearance.icon == 28 || appearance.icon == 12)
		{
			temp_activity_status += ACTIVITY_STATUS_ISTRANSPORT_1188;
		}
	}
	else
	{
		temp_activity_status = appearance.activity_status;
		if(IsNPC())
			temp_activity_status = 0xFF;

		// this only partially fixes lifts in classic 283 client if you move just as the lift starts to move
		if (appearance.icon == 28 || appearance.icon == 12)
			packet->setDataByName("is_transport", 1);

		if (MeetsSpawnAccessRequirements(spawn))
			packet->setDataByName("hand_icon", appearance.display_hand_icon);
		else {
			if ((req_quests_override & 256) > 0)
				packet->setDataByName("hand_icon", 1);
		}

		if (IsPlayer()) {
			if (((Player*)this)->get_character_flag(CF_AFK))
				packet->setDataByName("afk", 1);
			if ((appearance.activity_status & ACTIVITY_STATUS_ROLEPLAYING) > 0)
				packet->setDataByName("roleplaying", 1);
			if ((appearance.activity_status & ACTIVITY_STATUS_ANONYMOUS) > 0)
				packet->setDataByName("anonymous", 1);
			if ((appearance.activity_status & ACTIVITY_STATUS_LINKDEAD) > 0)
				packet->setDataByName("linkdead", 1);
			if ((appearance.activity_status & ACTIVITY_STATUS_CAMPING) > 0)
				packet->setDataByName("camping", 1);
			if ((appearance.activity_status & ACTIVITY_STATUS_LFG) > 0)
				packet->setDataByName("lfg", 1);
		}
		if ((appearance.activity_status & ACTIVITY_STATUS_SOLID) > 0)
			packet->setDataByName("solid_object", 1);
	}

	packet->setDataByName("activity_status", temp_activity_status); //appearance.activity_status);

	// If player and player has a follow target
	if (IsPlayer()) {
		if (((Player*)this)->GetFollowTarget())
			packet->setDataByName("follow_target", ((((Player*)this)->GetIDWithPlayerSpawn(((Player*)this)->GetFollowTarget()) * -1) - 1));
		else
			packet->setDataByName("follow_target", 0xFFFFFFFF);
	}
	else if (!IsPet()) {
		packet->setDataByName("follow_target", 0xFFFFFFFF);
	}
	if (GetTarget() && GetTarget()->GetTargetable())
		packet->setDataByName("target_id", ((spawn->GetIDWithPlayerSpawn(GetTarget()) * -1) - 1));
	else
		packet->setDataByName("target_id", 0xFFFFFFFF);

	//Send spell effects for target window
	if(IsEntity()){
		InfoStruct* info = ((Entity*)this)->GetInfoStruct();
		int8 i = 0;
		int16 backdrop = 0;
		int16 spell_icon = 0;
		int32 spell_id = 0;
		LuaSpell* spell = 0;
		((Entity*)this)->GetSpellEffectMutex()->readlock(__FUNCTION__, __LINE__);
		while(i < 30){
			//Change value of spell id for this packet if spell exists
			spell_id = info->spell_effects[i].spell_id;
			if(spell_id > 0)
				spell_id = 0xFFFFFFFF - spell_id;
			else
				spell_id = 0;
			packet->setSubstructDataByName("spell_effects", "spell_id", spell_id, i);

			//Change value of spell icon for this packet if spell exists
			spell_icon = info->spell_effects[i].icon;
			if(spell_icon > 0){
				if(!(spell_icon == 0xFFFF))
					spell_icon = 0xFFFF - spell_icon;
			}
			else
				spell_icon = 0;
			packet->setSubstructDataByName("spell_effects", "spell_icon", spell_icon, i);

			//Change backdrop values to match values in this packet
			backdrop = info->spell_effects[i].icon_backdrop;
			switch(backdrop){
				case 312:
					backdrop = 33080;
					break;
				case 313:
					backdrop = 33081;
					break;
				case 314:
					backdrop = 33082;
					break;
				case 315:
					backdrop = 33083;
					break;
				case 316:
					backdrop = 33084;
					break;
				case 317:
					backdrop = 33085;
					break;
				case (318 || 319):
					backdrop = 33086;
					break;
				default:
					break;
			}

			packet->setSubstructDataByName("spell_effects", "spell_icon_backdrop", backdrop, i);
			spell = info->spell_effects[i].spell;
			if (spell)
				packet->setSubstructDataByName("spell_effects", "spell_triggercount", spell->num_triggers, i);
			i++;
		}
		((Entity*)this)->GetSpellEffectMutex()->releasereadlock(__FUNCTION__, __LINE__);
	}
}

void Spawn::MoveToLocation(Spawn* spawn, float distance, bool immediate, bool mapped){
	if(!spawn)
		return;
	SetRunningTo(spawn);
	FaceTarget(spawn);

	if (!IsPlayer() && distance > 0.0f)
	{
		if ((IsFlyingCreature() || IsWaterCreature()) && CheckLoS(spawn))
		{
			if (immediate)
				ClearRunningLocations();

			AddRunningLocation(spawn->GetX(), spawn->GetY(), spawn->GetZ(), GetSpeed(), distance, true, true, "", true);
		}
		else if (/*!mapped && */GetZone())
		{
			GetZone()->movementMgr->NavigateTo((Entity*)this, spawn->GetX(), spawn->GetY(), spawn->GetZ());
			last_grid_update = Timer::GetCurrentTime2();
		}
		else
		{
			if (immediate)
				ClearRunningLocations();

			AddRunningLocation(spawn->GetX(), spawn->GetY(), spawn->GetZ(), GetSpeed(), distance, true, true, "", mapped);
		}
	}
}

void Spawn::ProcessMovement(bool isSpawnListLocked){
	CheckProximities();

	if(IsPlayer()){
		//Check if player is riding a boat, if so update pos (boat's current location + XYZ offsets)
		Player* player = ((Player*)this);
		int32 boat_id = player->GetBoatSpawn();
		Spawn* boat = 0;
		if(boat_id > 0)
			boat = GetZone()->GetSpawnByID(boat_id, isSpawnListLocked);

		//TODO: MAYBE do this for real boats, not lifts... GetWidgetTypeNameByTypeID
		/*if(boat){
			SetX(boat->GetX() + player->GetBoatX());
			SetY(boat->GetY() + player->GetBoatY());
			SetZ(boat->GetZ() + player->GetBoatZ());
		}*/
		return;
	}

	if (forceMapCheck && GetZone() != nullptr && zone->zonemap != nullptr && zone->zonemap->IsMapLoaded())
	{
		FixZ(true);

		int32 newGrid = GetZone()->Grid->GetGridID(this);
		if (!IsFlyingCreature() && newGrid != 0 && newGrid != appearance.pos.grid_id)
			SetPos(&(appearance.pos.grid_id), newGrid);

		forceMapCheck = false;
	}

	if (GetHP() <= 0 && !IsWidget())
		return;

	if (EngagedInCombat())
	{
		int locations = 0;
		if (movement_locations && MMovementLocations)
		{
			MMovementLocations->readlock(__FUNCTION__, __LINE__);
			locations = movement_locations->size();
			MMovementLocations->releasereadlock(__FUNCTION__, __LINE__);
		}
		if (locations < 1 && GetZone() && ((Entity*)this)->IsFeared())
		{
			CalculateNewFearpoint();
		}
	}

	MMovementLoop.lock();
	Spawn* followTarget = GetZone()->GetSpawnByID(m_followTarget, isSpawnListLocked);
	if (!followTarget && m_followTarget > 0)
		m_followTarget = 0;
	if (following && followTarget && !((Entity*)this)->IsFeared()) {

		// Need to clear m_followTarget before the zoneserver deletes it
		if (followTarget->GetHP() <= 0) {
			followTarget = 0;
			MMovementLoop.unlock();
			return;
		}

		if (!IsEntity() || (!((Entity*)this)->IsCasting() && !((Entity*)this)->IsMezzedOrStunned() && !((Entity*)this)->IsRooted())) {
			if (GetBaseSpeed() > 0) {
				CalculateRunningLocation();
			}
			else {
				float speed = 4.0f;
				if (IsEntity())
					speed = ((Entity*)this)->GetMaxSpeed();
				SetSpeed(speed);
			}
			MovementLocation* loc = GetCurrentRunningLocation();
			float dist = GetDistance(followTarget, true);
			if ((!EngagedInCombat() && m_followDistance > 0 && dist <= m_followDistance) || 
				(dist <= rule_manager.GetGlobalRule(R_Combat, MaxCombatRange)->GetFloat())) {
				ClearRunningLocations();
				CalculateRunningLocation(true);
			}
			else if (loc) {
				float distance = GetDistance(followTarget, loc->x, loc->y, loc->z);
				if ( (!EngagedInCombat() && m_followDistance > 0 && distance > m_followDistance) ||
					 ( EngagedInCombat() && distance > rule_manager.GetGlobalRule(R_Combat, MaxCombatRange)->GetFloat())) {
					MoveToLocation(followTarget, rule_manager.GetGlobalRule(R_Combat, MaxCombatRange)->GetFloat(), true, loc->mapped);
					CalculateRunningLocation();
				}
			}
			else {
				MoveToLocation(followTarget, rule_manager.GetGlobalRule(R_Combat, MaxCombatRange)->GetFloat());
				CalculateRunningLocation();
			}
		}
	}

	// Movement loop is only for scripted paths
	else if(!EngagedInCombat() && !NeedsToResumeMovement() && movement_loop.size() > 0 && movement_index < movement_loop.size() && (!IsNPC() || !((NPC*)this)->m_runningBack)){
		// Get the target location
		MovementData* data = movement_loop[movement_index];
		// need to resume our movement
		if(resume_movement){
			if (movement_locations){
				while (movement_locations->size()){
					safe_delete(movement_locations->front());
					movement_locations->pop_front();
				}
				movement_locations->clear();
			}

			data = movement_loop[movement_index];
			((Entity*)this)->SetSpeed(data->speed);
			SetSpeed(data->speed);
			if(!IsWidget())
				FaceTarget(data->x, data->z);
			// 0 delay at target location, need to set multiple locations
			if(data->delay == 0 && movement_loop.size() > 0) {
				int16 tmp_index = movement_index+1;
				MovementData* data2 = 0;
				if(tmp_index < movement_loop.size()) 
					data2 = movement_loop[tmp_index];
				else
					data2 = movement_loop[0];
				AddRunningLocation(data->x, data->y, data->z, data->speed, 0, true, false, "", true);				
				AddRunningLocation(data2->x, data2->y, data2->z, data2->speed, 0, true, true, "", true);
			}
			// delay at target location, only need to set 1 location
			else
				AddRunningLocation(data->x, data->y, data->z, data->speed);
			movement_start_time = 0;
			resume_movement = false;
		}
		// If we are not moving or we have arrived at our destination
		else if(!IsRunning() || (data && data->x == GetX() && data->y == GetY() && data->z == GetZ())){
			// If we were moving remove the last running location (the point we just arrived at)
			if(IsRunning())
				RemoveRunningLocation();

			// If this waypoint has a delay and we just arrived here (movement_start_time == 0)
			if(data->delay > 0 && movement_start_time == 0){
				// Set the current time
				movement_start_time = Timer::GetCurrentTime2();
				// If this waypoint had a lua function then call it
				if(data->lua_function.length() > 0)
					GetZone()->CallSpawnScript(this, SPAWN_SCRIPT_CUSTOM, 0, data->lua_function.c_str());

				int16 nextMove;
				if ((int16)(movement_index + 1) < movement_loop.size())
					nextMove = movement_index + 1;
				else
					nextMove = 0;
				// Get the next target location
				data = movement_loop[nextMove];
				
				//Go ahead and face the next location
				FaceTarget(data->x, data->z);
			}
			// If this waypoint has no delay or we have waited the required time (current time >= delay + movement_start_time)
			else if(data->delay == 0 || (data->delay > 0 && Timer::GetCurrentTime2() >= (data->delay+movement_start_time))) {
				// if no delay at this waypoint but a lua function for it then call the function
				if(data->delay == 0 && data->lua_function.length() > 0)
					GetZone()->CallSpawnScript(this, SPAWN_SCRIPT_CUSTOM, 0, data->lua_function.c_str());
				// Advance the current movement loop index
				if((int16)(movement_index+1) < movement_loop.size())
					movement_index++;
				else
					movement_index = 0;
				// Get the next target location
				data = movement_loop[movement_index];
				// set the speed for that location
				SetSpeed(data->speed);

				if(!IsWidget())
				// turn towards the location
					FaceTarget(data->x, data->z);
				// If 0 delay at location get and set data for the point after it
				if(data->delay == 0 && movement_loop.size() > 0){
					while (movement_locations->size()){
						safe_delete(movement_locations->front());
						movement_locations->pop_front();
					}
					// clear current target locations
					movement_locations->clear();
					// get the data for the location after out new location
					int16 tmp_index = movement_index+1;
					MovementData* data2 = 0;
					if(tmp_index < movement_loop.size()) 
						data2 = movement_loop[tmp_index];
					else
						data2 = movement_loop[0];
					// set the first location (adds it to movement_locations that we just cleared)
					AddRunningLocation(data->x, data->y, data->z, data->speed, 0, true, false, "", true);
					// set the location after that
					AddRunningLocation(data2->x, data2->y, data2->z, data2->speed, 0, true, true, "", true);
				}
				// there is a delay at the next location so we only need to set it
				else
					AddRunningLocation(data->x, data->y, data->z, data->speed);

				// reset this timer to 0 now that we are moving again
				movement_start_time = 0;
			}
		}
		// moving and not at target location yet
		else if(GetBaseSpeed() > 0)
			CalculateRunningLocation();
		// not moving, have a target location but not at it yet
		else if (data) {
			SetSpeed(data->speed);
			AddRunningLocation(data->x, data->y, data->z, data->speed);
		}
	}
	else if (IsRunning()) {
		CalculateRunningLocation();
	}
	/*else if (IsNPC() && !IsRunning() && !EngagedInCombat() && ((NPC*)this)->GetRunbackLocation()) {
		// Is an npc that is not moving and not engaged in combat but has a run back location set then clear the runback location
		LogWrite(NPC_AI__DEBUG, 7, "NPC_AI", "Clear runback location for %s", GetName());
		((NPC*)this)->ClearRunback();
		resume_movement = true;
		NeedsToResumeMovement(false);
	}*/
	MMovementLoop.unlock();
}

void Spawn::ResetMovement(){
	MMovementLoop.lock();
	vector<MovementData*>::iterator itr;
	for(itr = movement_loop.begin(); itr != movement_loop.end(); itr++){
		safe_delete(*itr);
	}
	movement_loop.clear();
	MMovementLoop.unlock();
	resume_movement = true;
	movement_index = 0;
}

void Spawn::AddMovementLocation(float x, float y, float z, float speed, int16 delay, const char* lua_function){

	LogWrite(LUA__DEBUG, 5, "LUA", "AddMovementLocation: x: %.2f, y: %.2f, z: %.2f, speed: %.2f, delay: %i, lua: %s",
		x, y, z, speed, delay, string(lua_function).c_str());

	MovementData* data = new MovementData;
	data->x = x;
	data->y = y;
	data->z = z;
	data->speed = speed;
	data->delay = delay*1000;
	if(lua_function)
		data->lua_function = string(lua_function);
	MMovementLoop.lock();
	movement_loop.push_back(data);
	MMovementLoop.unlock();
}

bool Spawn::IsRunning(){
	if(movement_locations && movement_locations->size() > 0)
		return true;
	else
		return false;
}

void Spawn::RunToLocation(float x, float y, float z, float following_x, float following_y, float following_z){
	if(!IsWidget())
		FaceTarget(x, z);
	SetPos(&appearance.pos.X2, x, false);
	SetPos(&appearance.pos.Z2, z, false);
	SetPos(&appearance.pos.Y2, y, false);
	if(following_x == 0 && following_y == 0 && following_z == 0){
		SetPos(&appearance.pos.X3, x, false);
		SetPos(&appearance.pos.Z3, z, false);
		SetPos(&appearance.pos.Y3, y, false);
	}
	else{
		SetPos(&appearance.pos.X3, following_x, false);
		SetPos(&appearance.pos.Y3, following_y, false);
		SetPos(&appearance.pos.Z3, following_z, false);
	}

	position_changed = true;
	changed = true;
	GetZone()->AddChangedSpawn(this);
}

MovementLocation* Spawn::GetCurrentRunningLocation(){
	MovementLocation* ret = 0;
	if(movement_locations && movement_locations->size() > 0){
		MMovementLocations->readlock(__FUNCTION__, __LINE__);
		ret = movement_locations->front();
		MMovementLocations->releasereadlock(__FUNCTION__, __LINE__);
	}
	return ret;
}

MovementLocation* Spawn::GetLastRunningLocation(){
	MovementLocation* ret = 0;
	if(movement_locations && movement_locations->size() > 0){
		MMovementLocations->readlock(__FUNCTION__, __LINE__);
		ret = movement_locations->back();
		MMovementLocations->releasereadlock(__FUNCTION__, __LINE__);
	}
	return ret;
}

void Spawn::AddRunningLocation(float x, float y, float z, float speed, float distance_away, bool attackable, bool finished_adding_locations, string lua_function, bool isMapped){
	if(speed == 0)
		return;

	if ( IsEntity() )
		((Entity*)this)->SetSpeed(speed);
	else
		this->SetSpeed(speed);

	MovementLocation* current_location = 0;

	float distance = GetDistance(x, y, z, distance_away != 0);
	if(distance_away != 0){
		distance -= distance_away;

		x = x - (GetX() - x)*distance_away/distance;
		z = z - (GetZ() - z)*distance_away/distance;
	}
	if(!movement_locations){
		movement_locations = new deque<MovementLocation*>();
		MMovementLocations = new Mutex();
	}
	MovementLocation* data = new MovementLocation;
	data->mapped = isMapped;
	data->x = x;
	data->y = y;
	data->z = z;
	data->speed = speed;
	data->attackable = attackable;
	data->lua_function = lua_function;
	data->gridid = 0; // used for runback defaults

	MMovementLocations->writelock(__FUNCTION__, __LINE__);
	if(movement_locations->size() > 0)
		current_location = movement_locations->back();
	if(!current_location){
		SetSpawnOrigX(GetX());
		SetSpawnOrigY(GetY());
		SetSpawnOrigZ(GetZ());
		SetSpawnOrigHeading(GetHeading());
	}
	movement_locations->push_back(data);	
	if(finished_adding_locations){
		current_location = movement_locations->front();
		SetSpeed(current_location->speed);
		if(movement_locations->size() > 1){		
			data = movement_locations->at(1);
			RunToLocation(current_location->x, current_location->y, current_location->z, data->x, data->y, data->z);
		}
		else
			RunToLocation(current_location->x, current_location->y, current_location->z, 0, 0, 0);
	}
	MMovementLocations->releasewritelock(__FUNCTION__, __LINE__);
}

bool Spawn::RemoveRunningLocation(){
	bool ret = false;
	if(movement_locations){
		MMovementLocations->writelock(__FUNCTION__, __LINE__);
		if(movement_locations->size() > 0){
			delete movement_locations->front();
			movement_locations->pop_front();
			ret = true;
		}
		MMovementLocations->releasewritelock(__FUNCTION__, __LINE__);
	}
	return ret;
}

void Spawn::ClearRunningLocations(){
	while(RemoveRunningLocation()){}
}

bool Spawn::CalculateChange(){
	bool remove_needed = false;
	if(movement_locations && MMovementLocations){		
		MovementLocation* data = 0;
		MMovementLocations->readlock(__FUNCTION__, __LINE__);
		if(movement_locations->size() > 0){
			// Target location
			data = movement_locations->front();
			// If no target or we are at the target location need to remove this point
			if(!data || (data->x == GetX() && data->y == GetY() && data->z == GetZ()))
				remove_needed = true;
			if(data){					
				if(NeedsToResumeMovement()){
					resume_movement = true;
					NeedsToResumeMovement(false);
				}
				if(!data->attackable)
					SetHeading(GetSpawnOrigHeading());
			}
		}
		MMovementLocations->releasereadlock(__FUNCTION__, __LINE__);
		if(remove_needed) {
			if (data && data->lua_function.length() > 0)
				GetZone()->CallSpawnScript(this, SPAWN_SCRIPT_CUSTOM, 0, data->lua_function.c_str());

			RemoveRunningLocation();
			//CalculateChange();
		}
		else if(data){
			// Speed is per second so we need a time_step (amount of time since the last update) to modify movement by
			float time_step = (Timer::GetCurrentTime2() - last_movement_update) * 0.001; // * 0.001 is the same as / 1000, float muliplications is suppose to be faster though

			// Get current location
			float nx = GetX();
			float ny = GetY();
			float nz = GetZ();
			
			// Get Forward vecotr
			float tar_vx = data->x - nx;
			float tar_vy = data->y - ny;
			float tar_vz = data->z - nz;

			// Multiply speed by the time_step to get how much should have changed over the last tick
			float speed = GetSpeed() * time_step;

			// Normalize the forward vector and multiply by speed, this gives us our change in coords, just need to add them to our current coords
			float len = sqrtf(tar_vx * tar_vx + tar_vy * tar_vy + tar_vz * tar_vz);
			tar_vx = (tar_vx / len) * speed;
			tar_vy = (tar_vy / len) * speed;
			tar_vz = (tar_vz / len) * speed;

			// Distance less then 0.5 just set the npc to the target location
			if (GetDistance(data->x, data->y, data->z, IsWidget() ? false : true) <= 0.5f) {
				SetX(data->x, false);
				SetZ(data->z, false);
				SetY(data->y, false, true);
			}
			else {
				SetX(nx + tar_vx, false);
				SetZ(nz + tar_vz, false);
				if ( IsWidget() )
					SetY(ny + tar_vy, false, true);
				else
					SetY(ny + tar_vy, false);
			}

			if (GetZone()->Grid != nullptr) {
				Cell* newCell = GetZone()->Grid->GetCell(GetX(), GetZ());
				if (newCell != Cell_Info.CurrentCell) {
					GetZone()->Grid->RemoveSpawnFromCell(this);
					GetZone()->Grid->AddSpawn(this, newCell);
				}

				int32 newGrid = GetZone()->Grid->GetGridID(this);
				if (!IsFlyingCreature() && newGrid != 0 && newGrid != appearance.pos.grid_id)
					SetPos(&(appearance.pos.grid_id), newGrid);
			}
		}
	}
	return remove_needed;
}

void Spawn::CalculateRunningLocation(bool stop){

	if (!stop && (last_location_update + 100) > Timer::GetCurrentTime2())
		return;
	else if (!stop)
	last_location_update = Timer::GetCurrentTime2();


	bool removed = CalculateChange();
	if (stop) {
		//following = false;
		SetPos(&appearance.pos.X2, GetX(), false);
		SetPos(&appearance.pos.Y2, GetY(), false);
		SetPos(&appearance.pos.Z2, GetZ(), false);
		SetPos(&appearance.pos.X3, GetX(), false);
		SetPos(&appearance.pos.Y3, GetY(), false);
		SetPos(&appearance.pos.Z3, GetZ(), false);
	}
	else if (removed && movement_locations && movement_locations->size() > 0) {
		MovementLocation* current_location = movement_locations->at(0);
		if (movement_locations->size() > 1) {
			MovementLocation* data = movement_locations->at(1);
			RunToLocation(current_location->x, current_location->y, current_location->z, data->x, data->y, data->z);
		}
		else
			RunToLocation(current_location->x, current_location->y, current_location->z, 0, 0, 0);
	}
	else if (GetZone() && GetTarget() != NULL && EngagedInCombat())
	{
		if (GetDistance(GetTarget()) > rule_manager.GetGlobalRule(R_Combat, MaxCombatRange)->GetFloat())
		{
			if ((IsFlyingCreature() || IsWaterCreature()) && CheckLoS(GetTarget()))
				AddRunningLocation(GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ(), GetSpeed(), 0, false);
			else
				GetZone()->movementMgr->NavigateTo((Entity*)this, GetTarget()->GetX(), GetTarget()->GetY(), GetTarget()->GetZ());
		}
		else
			((Entity*)this)->HaltMovement();
	} 
}
float Spawn::GetFaceTarget(float x, float z) {
	float angle;

	double diff_x = x - GetX();
	double diff_z = z - GetZ();

	//If we're very close to the same spot don't bother changing heading
	if (sqrt(diff_x * diff_x * diff_z * diff_z) < .1) {
		return GetHeading();
	}

	if (diff_z == 0) {
		if (diff_x > 0)
			angle = 90;
		else
			angle = 270;
	}
	else
		angle = ((atan(diff_x / diff_z)) * 180) / 3.14159265358979323846;

	if (angle < 0)
		angle = angle + 360;
	else
		angle = angle + 180;

	if (diff_x < 0)
		angle = angle + 180;

	if (last_heading_angle == angle) return angle;

	return angle;
}

void Spawn::FaceTarget(float x, float z){
	float angle;

	double diff_x = x - GetX();
	double diff_z = z - GetZ();

	//If we're very close to the same spot don't bother changing heading
	if (sqrt(diff_x * diff_x * diff_z * diff_z) < .1) {
		return;
	}

	if(diff_z==0){
	   if(diff_x > 0)
		   angle = 90;
	   else
		   angle = 270;
	}
	else
		angle = ((atan(diff_x / diff_z)) * 180) / 3.14159265358979323846;

	if(angle < 0)
		angle = angle + 360;
	else
		angle = angle + 180;

	if(diff_x < 0)
		angle = angle + 180;

	if (last_heading_angle == angle) return;

	SetHeading(angle);
}

void Spawn::FaceTarget(Spawn* target){
	if(!target)
		return;
	FaceTarget(target->GetX(), target->GetZ());
	if(GetHP() > 0 && target->IsPlayer() && !EngagedInCombat()){
		GetZone()->AddHeadingTimer(this);
		SetTempActionState(0);
	}
}

bool Spawn::MeetsSpawnAccessRequirements(Player* player){
	bool ret = false;
	Quest* quest = 0;
	//Check if we meet all quest requirements first..
	m_requiredQuests.readlock(__FUNCTION__, __LINE__);
	if (player && required_quests.size() > 0) {
		map<int32, vector<int16>* >::iterator itr;
		for (itr = required_quests.begin(); itr != required_quests.end(); itr++) {
			player->AddQuestRequiredSpawn(this, itr->first);
			vector<int16>* quest_steps = itr->second;
			for (int32 i = 0; i < quest_steps->size(); i++) {
				quest = player->GetQuest(itr->first);
				if (req_quests_continued_access) {
					if (quest) {
						if (quest->GetQuestStepCompleted(quest_steps->at(i))) {
							ret = true;
							break;
						}
					}
					else if (player->GetCompletedQuest(itr->first)) {
						ret = true;
						break;
					}
				}
				if (quest && quest->QuestStepIsActive(quest_steps->at(i))) {
					ret = true;
					break;
				}
			}
		}
	}
	else
		ret = true;
	m_requiredQuests.releasereadlock(__FUNCTION__, __LINE__);
	if (!ret)
		return ret;

	//Now check if the player meets all history requirements
	m_requiredHistory.readlock(__FUNCTION__, __LINE__);
	if (required_history.size() > 0){
		map<int32, LUAHistory*>::iterator itr;
		for (itr = required_history.begin(); itr != required_history.end(); itr++){
			player->AddHistoryRequiredSpawn(this, itr->first);
			LUAHistory* player_history = player->GetLUAHistory(itr->first);
			if (player_history){
				if (player_history->Value != itr->second->Value || player_history->Value2 != itr->second->Value2)
					ret = false;
			}
			else
				ret = false;
			if (!ret)
				break;
		}
	}
	m_requiredHistory.releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

vector<Spawn*>* Spawn::GetSpawnGroup(){
	vector<Spawn*>* ret_list = 0;
	if(spawn_group_list){
		ret_list = new vector<Spawn*>();
		if(MSpawnGroup)
			MSpawnGroup->readlock(__FUNCTION__, __LINE__);
		ret_list->insert(ret_list->begin(), spawn_group_list->begin(), spawn_group_list->end());
		if(MSpawnGroup)
			MSpawnGroup->releasereadlock(__FUNCTION__, __LINE__);
	}
	return ret_list;
}

bool Spawn::HasSpawnGroup() {
	return spawn_group_list && spawn_group_list->size() > 0;
}

bool Spawn::IsInSpawnGroup(Spawn* spawn) {
	bool ret = false;
	if (HasSpawnGroup() && spawn) {
		vector<Spawn*>::iterator itr;
		for (itr = spawn_group_list->begin(); itr != spawn_group_list->end(); itr++) {
			if ((*itr) == spawn) {
				ret = true;
				break;
			}
		}
	}
	return ret;
}

void Spawn::AddSpawnToGroup(Spawn* spawn){
	if(!spawn)
		return;
	if(!spawn_group_list){
		spawn_group_list = new vector<Spawn*>();
		spawn_group_list->push_back(this);
		safe_delete(MSpawnGroup);
		MSpawnGroup = new Mutex();
		MSpawnGroup->SetName("Spawn::MSpawnGroup");
	}
	vector<Spawn*>::iterator itr;
	MSpawnGroup->writelock(__FUNCTION__, __LINE__);
	for(itr = spawn_group_list->begin(); itr != spawn_group_list->end(); itr++){
		if((*itr) == spawn){
			MSpawnGroup->releasewritelock(__FUNCTION__, __LINE__);
			return;
		}
	}
	spawn_group_list->push_back(spawn);
	spawn->SetSpawnGroupList(spawn_group_list, MSpawnGroup);
	MSpawnGroup->releasewritelock(__FUNCTION__, __LINE__);
}


void Spawn::SetSpawnGroupList(vector<Spawn*>* list, Mutex* mutex){
	spawn_group_list = list;
	MSpawnGroup = mutex;
}

void Spawn::RemoveSpawnFromGroup(bool erase_all){
	SetSpawnGroupID(0);
	bool del = false;
	if(MSpawnGroup){
		MSpawnGroup->writelock(__FUNCTION__, __LINE__);
		if(spawn_group_list){
			vector<Spawn*>::iterator itr;
			Spawn* spawn = 0;
			if(spawn_group_list->size() == 1)
				erase_all = true;
			for(itr = spawn_group_list->begin(); itr != spawn_group_list->end(); itr++){
				spawn = *itr;
				if (spawn) {
					if(!erase_all){
						if(spawn == this){
							spawn_group_list->erase(itr);
							MSpawnGroup->releasewritelock(__FUNCTION__, __LINE__);
							spawn_group_list = 0;						
							MSpawnGroup = 0;
							return;
						}
					}
					else{
						if (spawn != this)
							spawn->SetSpawnGroupList(0, 0);
					}
				}
			}
			if (erase_all)
				spawn_group_list->clear();
			del = (spawn_group_list->size() == 0);
		}
		MSpawnGroup->releasewritelock(__FUNCTION__, __LINE__);
		if (del){
			safe_delete(MSpawnGroup);
			safe_delete(spawn_group_list);
		}
	}
}

void Spawn::SetSpawnGroupID(int32 id){
	group_id = id;
}

int32 Spawn::GetSpawnGroupID(){
	return group_id;
}

void Spawn::AddChangedZoneSpawn(){
	if(send_spawn_changes && GetZone())
		GetZone()->AddChangedSpawn(this);
}

void Spawn::RemoveSpawnAccess(Spawn* spawn) {
	if (allowed_access.count(spawn->GetID()) > 0) {
		allowed_access.erase(spawn->GetID());
		GetZone()->HidePrivateSpawn(this);
	}
}

void Spawn::SetFollowTarget(Spawn* spawn, int32 follow_distance) {
	if (spawn && spawn != this) {
		m_followTarget = spawn->GetID();
		m_followDistance = follow_distance;
	}
	else {
		m_followTarget = 0;
		if (following)
			following = false;
		m_followDistance = 0;
	}
}

void Spawn::AddTempVariable(string var, string val) {
	m_tempVariableTypes[var] = 5;
	m_tempVariables[var] = val;
}

void Spawn::AddTempVariable(string var, Spawn* val) {
	m_tempVariableTypes[var] = 1;
	m_tempVariableSpawn[var] = val->GetID();
}

void Spawn::AddTempVariable(string var, ZoneServer* val) {
	m_tempVariableTypes[var] = 2;
	m_tempVariableZone[var] = val;
}

void Spawn::AddTempVariable(string var, Item* val) {
	m_tempVariableTypes[var] = 3;
	m_tempVariableItem[var] = val;
}

void Spawn::AddTempVariable(string var, Quest* val) {
	m_tempVariableTypes[var] = 4;
	m_tempVariableQuest[var] = val;
}

string Spawn::GetTempVariable(string var) {
	string ret = "";

	if (m_tempVariables.count(var) > 0)
		ret = m_tempVariables[var];

	return ret;
}

Spawn* Spawn::GetTempVariableSpawn(string var) {
	Spawn* ret = 0;
	
	if (m_tempVariableSpawn.count(var) > 0)
		ret = GetZone()->GetSpawnByID(m_tempVariableSpawn[var]);

	return ret;
}

ZoneServer* Spawn::GetTempVariableZone(string var) {
	ZoneServer* ret = 0;

	if (m_tempVariableZone.count(var) > 0)
		ret = m_tempVariableZone[var];

	return ret;
}

Item* Spawn::GetTempVariableItem(string var) {
	Item* ret = 0;

	if (m_tempVariableItem.count(var) > 0)
		ret = m_tempVariableItem[var];

	return ret;
}

Quest* Spawn::GetTempVariableQuest(string var) {
	Quest* ret = 0;

	if (m_tempVariableQuest.count(var) > 0)
		ret = m_tempVariableQuest[var];

	return ret;
}

int8 Spawn::GetTempVariableType(string var) {
	int8 ret = 0;

	if (m_tempVariableTypes.count(var) > 0)
		ret = m_tempVariableTypes[var];

	return ret;
}

void Spawn::DeleteTempVariable(string var) {
	int8 type = GetTempVariableType(var);

	switch (type) {
	case 1:
		m_tempVariableSpawn.erase(var);
		break;
	case 2:
		m_tempVariableZone.erase(var);
		break;
	case 3:
		m_tempVariableItem.erase(var);
		break;
	case 4:
		m_tempVariableQuest.erase(var);
		break;
	case 5:
		m_tempVariables.erase(var);
		break;
	}

	m_tempVariableTypes.erase(var);
}

Spawn* Spawn::GetRunningTo() {
	return GetZone()->GetSpawnByID(running_to);
}

Spawn* Spawn::GetFollowTarget() {
	return GetZone()->GetSpawnByID(m_followTarget);
}

void Spawn::CopySpawnAppearance(Spawn* spawn){
	if (!spawn)
		return;

	//This function copies the appearace of the provided spawn to this one
	if (spawn->IsEntity() && IsEntity()){
		memcpy(&((Entity*)this)->features, &((Entity*)spawn)->features, sizeof(CharFeatures));
		memcpy(&((Entity*)this)->equipment, &((Entity*)spawn)->equipment, sizeof(EQ2_Equipment));
	}

	SetSize(spawn->GetSize());
	SetModelType(spawn->GetModelType());
}

void Spawn::SetY(float y, bool updateFlags, bool disableYMapCheck)
{
	SetPos(&appearance.pos.Y, y, updateFlags);
	if (!disableYMapCheck)
		FixZ();
}

float Spawn::FindDestGroundZ(glm::vec3 dest, float z_offset)
{
	float best_z = BEST_Z_INVALID;
	if (GetZone() != nullptr && GetZone()->zonemap != nullptr)
	{
		dest.z += z_offset;
		best_z = zone->zonemap->FindBestZ(dest, nullptr);
	}
	return best_z;
}

float Spawn::GetFixedZ(const glm::vec3& destination, int32 z_find_offset) {
	BenchTimer timer;
	timer.reset();

	float new_z = destination.z;

	if (GetZone() != nullptr && zone->zonemap != nullptr) {

/*		if (flymode == GravityBehavior::Flying)
			return new_z;
			*/
/*		if (zone->HasWaterMap() && zone->watermap->InLiquid(glm::vec3(m_Position)))
			return new_z;
			*/
		/*
		 * Any more than 5 in the offset makes NPC's hop/snap to ceiling in small corridors
		 */
		new_z = this->FindDestGroundZ(destination, z_find_offset);
		if (new_z != BEST_Z_INVALID) {
			if (new_z < -2000) {
				new_z = GetY();
			}
		}

		auto duration = timer.elapsed();
		LogWrite(MAP__DEBUG, 0, "Map", "Mob::GetFixedZ() ([{%s}]) returned [{%f}] at [{%f}], [{%f}], [{%f}] - Took [{%f}]",
			this->GetName(),
			new_z,
			destination.x,
			destination.y,
			destination.z,
			duration);
	}

	return new_z;
}


void Spawn::FixZ(bool forceUpdate) {
	if (IsPlayer() || IsFlyingCreature() || !GetZone() || (IsObject() && GetZone()->GetInstanceType() == Instance_Type::PERSONAL_HOUSE_INSTANCE)) {
		return;
	}
	/*
	if (flymode == GravityBehavior::Flying) {
		return;
	}*/
	/*
	if (zone->watermap && zone->watermap->InLiquid(m_Position)) {
		return;
	}*/
	
	// we do the inwater check here manually to avoid double calling for a Z coordinate
	glm::vec3 current_loc(GetX(), GetZ(), GetY());
	float new_z = GetFixedZ(current_loc, 1);
	
	if ( GetZone()->regionmap != nullptr )
	{
		glm::vec3 targPos(GetY() - 1.0f, GetX(), GetZ());
		float bestZ = -999999.0f;
		if ( new_z != BEST_Z_INVALID )
			bestZ = new_z - 1.0f;
		
		if(GetZone()->regionmap->InWater(targPos, bestZ))
			return;
	}
	
	if (new_z == GetY())
		return;

	if ((new_z > -2000) && new_z != BEST_Z_INVALID) {
		SetY(new_z, forceUpdate, true);
	}
	else {
		LogWrite(MAP__DEBUG, 0, "Map", "[{%s}] is failing to find Z [{%f}]", this->GetName(), std::abs(GetY() - new_z));
	}
}

bool Spawn::CheckLoS(Spawn* target)
{
	float radiusSrc = 2.0f;
	float radiusTarg = 2.0f;

	glm::vec3 targpos(target->GetX(), target->GetZ(), target->GetY()+radiusTarg);
	glm::vec3 pos(GetX(), GetZ(), GetY()+radiusSrc);
	return CheckLoS(pos, targpos);
}

bool Spawn::CheckLoS(glm::vec3 myloc, glm::vec3 oloc)
{
	ZoneServer* zone = GetZone();
	if (zone == NULL || zone->zonemap == NULL || !zone->zonemap->IsMapLoaded())
		return true;
	else
		return zone->zonemap->CheckLoS(myloc, oloc);

	return false;
}

void Spawn::CalculateNewFearpoint()
{
	if (GetZone() && GetZone()->pathing) {
		auto Node = zone->pathing->GetRandomLocation(glm::vec3(GetX(), GetZ(), GetY()));
		if (Node.x != 0.0f || Node.y != 0.0f || Node.z != 0.0f) {
			AddRunningLocation(Node.x, Node.y, Node.z, GetSpeed(), 0, true, true, "", true);
		}
	}
}

Item* Spawn::LootItem(int32 id) {
	Item* ret = 0;
	vector<Item*>::iterator itr;
	MLootItems.lock();
	for (itr = loot_items.begin(); itr != loot_items.end(); itr++) {
		if ((*itr)->details.item_id == id) {
			ret = *itr;
			loot_items.erase(itr);
			break;
		}
	}
	MLootItems.unlock();
	return ret;
}

int32 Spawn::GetLootItemID() {
	int32 ret = 0;
	vector<Item*>::iterator itr;
	MLootItems.lock();
	for (itr = loot_items.begin(); itr != loot_items.end(); itr++) {
		ret = (*itr)->details.item_id;
		break;
	}
	MLootItems.unlock();
	return ret;
}

bool Spawn::HasLootItemID(int32 id) {
	bool ret = false;

	vector<Item*>::iterator itr;
	MLootItems.readlock(__FUNCTION__, __LINE__);
	for (itr = loot_items.begin(); itr != loot_items.end(); itr++) {
		if ((*itr)->details.item_id == id) {
			ret = true;
			break;
		}
	}
	MLootItems.releasereadlock(__FUNCTION__, __LINE__);

	return ret;
}

void Spawn::CheckProximities()
{
	if (!has_spawn_proximities)
		return;

	if (spawn_proximities.size() > 0)
	{
		MutexList<SpawnProximity*>::iterator itr = spawn_proximities.begin();
		while (itr.Next()) {
			SpawnProximity* prox = itr.value;
			map<int32, bool>::iterator spawnsItr;
			for (spawnsItr = prox->spawns_in_proximity.begin(); spawnsItr != prox->spawns_in_proximity.end(); spawnsItr++) {
				Spawn* tmpSpawn = 0;
				if (spawnsItr->first &&
					((prox->spawn_type == SPAWNPROXIMITY_DATABASE_ID && (tmpSpawn = GetZone()->GetSpawnByDatabaseID(spawnsItr->first)) != 0) ||
						(prox->spawn_type == SPAWNPROXIMITY_LOCATION_ID && (tmpSpawn = GetZone()->GetSpawnByLocationID(spawnsItr->first)) != 0)))
				{
					if (!spawnsItr->second && tmpSpawn->GetDistance(this) <= prox->distance)
					{
						if (prox->in_range_lua_function.size() > 0)
							GetZone()->CallSpawnScript(this, SPAWN_SCRIPT_CUSTOM, tmpSpawn, prox->in_range_lua_function.c_str());
						spawnsItr->second = true;
					}
					else if (spawnsItr->second && tmpSpawn->GetDistance(this) > prox->distance)
					{
						if (prox->leaving_range_lua_function.size() > 0)
							GetZone()->CallSpawnScript(this, SPAWN_SCRIPT_CUSTOM, tmpSpawn, prox->leaving_range_lua_function.c_str());
						spawnsItr->second = false;
					}
				}
			}
		}
	}
}

void Spawn::AddSpawnToProximity(int32 spawnValue, SpawnProximityType type)
{
	if (!has_spawn_proximities)
		return;

	if (spawn_proximities.size() > 0)
	{
		MutexList<SpawnProximity*>::iterator itr = spawn_proximities.begin();
		while (itr.Next()) {
			SpawnProximity* prox = itr->value;
			if (prox->spawn_value == spawnValue && prox->spawn_type == type)
				prox->spawns_in_proximity.insert(make_pair(spawnValue, false));
		}
	}
}

void Spawn::RemoveSpawnFromProximity(int32 spawnValue, SpawnProximityType type)
{
	if (!has_spawn_proximities)
		return;

	if (spawn_proximities.size() > 0)
	{
		MutexList<SpawnProximity*>::iterator itr = spawn_proximities.begin();
		while (itr.Next()) {
			SpawnProximity* prox = itr->value;
			if (prox->spawn_value == spawnValue && prox->spawn_type == type &&
				prox->spawns_in_proximity.count(spawnValue) > 0)
				prox->spawns_in_proximity.erase(spawnValue);
		}
	}
}

void Spawn::AddPrimaryEntityCommand(const char* name, float distance, const char* command, const char* error_text, int16 cast_time, int32 spell_visual, bool defaultDenyList, Player* player) {

	EntityCommand* cmd = FindEntityCommand(string(command), true);

	bool newCommand = false;
	if (!cmd)
	{
		newCommand = true;
		cmd = CreateEntityCommand(name, distance, command, error_text, cast_time, spell_visual, !defaultDenyList);
	}

	if (defaultDenyList)
		SetPermissionToEntityCommand(cmd, player, true);

	if (newCommand)
		primary_command_list.push_back(cmd);
}

void Spawn::RemovePrimaryEntityCommand(const char* command) {
	vector<EntityCommand*>::iterator itr;
	string tmpStr(command);
	for (itr = primary_command_list.begin(); itr != primary_command_list.end(); itr++) {
		EntityCommand* cmd = *itr;
		if (cmd->command.compare(tmpStr) == 0)
		{
			primary_command_list.erase(itr);
			delete cmd;
			break;
		}
	}
}

bool Spawn::SetPermissionToEntityCommand(EntityCommand* command, Player* player, bool permissionValue)
{
	if (player != NULL)
	{
		map<int32, bool>::iterator itr = command->allow_or_deny.find(player->GetCharacterID());
		if (itr == command->allow_or_deny.end())
			command->allow_or_deny.insert(make_pair(player->GetCharacterID(), permissionValue));
		else if (itr->second != permissionValue)
			itr->second = permissionValue;

		return true;
	}

	return false;
}

void Spawn::RemoveSpawnFromPlayer(Player* player)
{
	m_Update.writelock(__FUNCTION__, __LINE__);
	player->RemoveSpawn(this); // sets it as removed
	m_Update.releasewritelock(__FUNCTION__, __LINE__);
}

bool Spawn::InWater()
{
	bool inWater = false;

	if (GetZone()->regionmap != nullptr)
	{
		glm::vec3 current_loc(GetX(), GetZ(), GetY());
		float new_z = GetFixedZ(current_loc, 1);
				
		if ( GetZone()->regionmap != nullptr )
		{
			glm::vec3 targPos(GetY(), GetX(), GetZ());
			if ( IsGroundSpawn() )
				targPos.x -= 1.0f;
			
			float bestZ = -999999.0f;
			if ( new_z != BEST_Z_INVALID )
				bestZ = new_z;
					
			if(GetZone()->regionmap->InWater(targPos, bestZ))
			inWater = true;
		}
	}

	return inWater;
}