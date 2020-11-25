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
#include "SpellProcess.h"
#include "../common/Log.h"
#include "Tradeskills/Tradeskills.h"
#include "ClientPacketFunctions.h"
#include "Rules/Rules.h"

extern MasterSpellList master_spell_list;
extern MasterSkillList master_skill_list;
extern ConfigReader configReader;
extern LuaInterface* lua_interface;
extern Commands commands;
extern World world;
extern RuleManager rule_manager;

SpellProcess::SpellProcess(){
	last_checked_time = 0;
	MSpellProcess.SetName("SpellProcess::MSpellProcess");
	MRemoveTargetList.SetName("SpellProcess::MRemoveTargetList");
	MSoloHO.SetName("SpellProcess::m_soloHO");
	MGroupHO.SetName("SpellProcess:m_groupHO");
	MSpellCancelList.SetName("SpellProcess::SpellCancelList");
}

SpellProcess::~SpellProcess(){
	RemoveAllSpells();
}

void SpellProcess::RemoveAllSpells(){
	MSpellProcess.lock();	
	ClearSpellScriptTimerList();

	MutexList<LuaSpell*>::iterator active_spells_itr = active_spells.begin();
	while(active_spells_itr.Next()){
		DeleteCasterSpell(active_spells_itr->value);
	}

	active_spells_itr = active_spells.begin();
	while(active_spells_itr.Next()){
		active_spells.Remove(active_spells_itr->value, true);
	}
	active_spells.clear();	

	InterruptStruct* interrupt = 0;
	MutexList<InterruptStruct*>::iterator interrupt_list_itr = interrupt_list.begin();
	while(interrupt_list_itr.Next()){
		interrupt = interrupt_list_itr->value;
		CheckInterrupt(interrupt);
		interrupt_list.Remove(interrupt_list_itr->value, true);		
	}
	interrupt_list.clear();

	MutexList<CastTimer*>::iterator cast_timers_itr = cast_timers.begin();	
	while(cast_timers_itr.Next()){
		safe_delete(cast_timers_itr->value->timer);
		safe_delete(cast_timers_itr->value->spell);
		cast_timers.Remove(cast_timers_itr->value, true);
	}
	cast_timers.clear();

	MutexList<RecastTimer*>::iterator recast_timers_itr = recast_timers.begin();
	while(recast_timers_itr.Next()){
		recast_timers.Remove(recast_timers_itr->value, true);
	}

	MRemoveTargetList.writelock(__FUNCTION__, __LINE__);
	remove_target_list.clear();
	MRemoveTargetList.releasewritelock(__FUNCTION__, __LINE__);

	map<Client*, HeroicOP*>::iterator solo_ho_itr;
	MSoloHO.writelock(__FUNCTION__, __LINE__);
	for (solo_ho_itr = m_soloHO.begin(); solo_ho_itr != m_soloHO.end(); solo_ho_itr++)
		safe_delete(solo_ho_itr->second);
	m_soloHO.clear();
	MSoloHO.releasewritelock(__FUNCTION__, __LINE__);

	map<int32, HeroicOP*>::iterator group_ho_itr;
	MGroupHO.writelock(__FUNCTION__, __LINE__);
	for (group_ho_itr = m_groupHO.begin(); group_ho_itr != m_groupHO.end(); group_ho_itr++)
		safe_delete(group_ho_itr->second);
	m_groupHO.clear();
	MGroupHO.releasewritelock(__FUNCTION__, __LINE__);

	recast_timers.clear();
	spell_que.clear();
	
	MSpellCancelList.writelock(__FUNCTION__, __LINE__);
	SpellCancelList.clear();
	MSpellCancelList.releasewritelock(__FUNCTION__, __LINE__);

	MSpellProcess.unlock();
}

void SpellProcess::Process(){
	if(last_checked_time > Timer::GetCurrentTime2())
		return;
	last_checked_time = Timer::GetCurrentTime2() + 50;
	MSpellProcess.lock();
	CheckSpellScriptTimers();
	if(active_spells.size(true) > 0){		
		LuaSpell* spell = 0;
		MutexList<LuaSpell*>::iterator itr = active_spells.begin();
		map<LuaSpell*, vector<Spawn*> >::iterator remove_itr;
		vector<Spawn*>::iterator target_itr;
		vector<Spawn*>::iterator remove_target_itr;
		while(itr.Next()){
			spell = itr->value;
			if (!spell->spell->GetSpellData()->duration_until_cancel && spell->timer.Check()){
				spell->num_calls++;
				// ProcessSpell(spell, flase) will atempt to call the tick() function in the lua script
				// if there is no tick function it will return false, this will cause the server to crash in the event
				// of a spell that has a duration but is not a "until canceled" spell or a spell with a tick (tradeskill buffs)
				// to counter this check to see if the spell has a call_frequency > 0 before we call ProcessSpell()
				if (spell->spell->GetSpellData()->call_frequency > 0 && !ProcessSpell(spell, false))
					active_spells.Remove(spell, true, 2000);
				else if ((spell->timer.GetDuration() * spell->num_calls) >= spell->spell->GetSpellData()->duration1 * 100)
					DeleteCasterSpell(spell, "expired");
			}
			else
				CheckRemoveTargetFromSpell(spell);
		}
	}
	if (SpellCancelList.size() > 0){
		std::vector<LuaSpell*> tmpList;
		MSpellCancelList.writelock(__FUNCTION__, __LINE__);
		vector<LuaSpell*>::iterator itr = SpellCancelList.begin();
		while (itr != SpellCancelList.end()){
			tmpList.push_back(*itr);
			itr++;
		}
		SpellCancelList.clear();
		MSpellCancelList.releasewritelock(__FUNCTION__, __LINE__);

		itr = tmpList.begin();
		while (itr != tmpList.end()) {
			DeleteCasterSpell(*itr, "canceled");
			itr++;
		}
	}
	if(interrupt_list.size(true) > 0){		
		InterruptStruct* interrupt = 0;
		MutexList<InterruptStruct*>::iterator itr = interrupt_list.begin();
		while(itr.Next()){
			interrupt = itr->value;
			CheckInterrupt(interrupt);
			safe_delete(interrupt);
		}
		interrupt_list.clear();
	}
	if(cast_timers.size(true) > 0){
		CastTimer* cast_timer = 0;
		MutexList<CastTimer*>::iterator itr = cast_timers.begin();
		while (itr.Next()) {
			cast_timer = itr->value;
			if (cast_timer) {
				if (cast_timer->timer->Check(false)) {
					if (cast_timer->spell) {
						Client* client = cast_timer->zone->GetClientBySpawn(cast_timer->spell->caster);
						if (client) {
							PacketStruct* packet = configReader.getStruct("WS_FinishCastSpell", client->GetVersion());
							if (packet) {
								packet->setMediumStringByName("spell_name", cast_timer->spell->spell->GetSpellData()->name.data.c_str());
								client->QueuePacket(packet->serialize());
								safe_delete(packet);
							}
						}
						if (cast_timer->spell && cast_timer->spell->caster)
							cast_timer->spell->caster->IsCasting(false);
						cast_timer->delete_timer = true;
						CastProcessedSpell(cast_timer->spell, false, cast_timer->in_heroic_opp);
					}
					else if (cast_timer->entity_command) {
						if (cast_timer->timer->Check(false)) {
							cast_timer->delete_timer = true;
							Spawn* target = cast_timer->zone->GetSpawnByID(cast_timer->target_id);
							CastProcessedEntityCommand(cast_timer->entity_command, cast_timer->caster, target, cast_timer->in_heroic_opp);
						}
					}
				}
				if (cast_timer->delete_timer) {
					safe_delete(cast_timer->timer);
					cast_timers.Remove(cast_timer, true);
				}
			}
		}
	}
	if (recast_timers.size(true) > 0) {
		RecastTimer* recast_timer = 0;
		MutexList<RecastTimer*>::iterator itr = recast_timers.begin();
		vector<Spell*>::iterator remove_recast_itr;
		while(itr.Next()){
			recast_timer = itr->value;
			if(recast_timer->timer->Check(false)){
				UnlockSpell(recast_timer->client, recast_timer->spell);
				safe_delete(recast_timer->timer);
				recast_timers.Remove(recast_timer, true);
			}
		}
	}
	if(spell_que.size(true) > 0){
		MutexMap<Entity*, Spell*>::iterator itr = spell_que.begin();
		while(itr.Next()){
			if(itr->first->IsCasting() == false && IsReady(itr->second, itr->first)){
				RemoveSpellFromQueue(itr->second, itr->first);
				ProcessSpell(itr->first->GetZone(), itr->second, itr->first, itr->first->GetTarget());
			}
		}
	}

	// Check solo HO timers
	MSoloHO.writelock(__FUNCTION__, __LINE__);
	if (m_soloHO.size() > 0) {
		map<Client*, HeroicOP*>::iterator itr = m_soloHO.begin();
		map<Client*, HeroicOP*>::iterator delete_itr;
		while (itr != m_soloHO.end()) {
			if (itr->second->GetWheel() && Timer::GetCurrentTime2() >= (itr->second->GetStartTime() + (itr->second->GetTotalTime() * 1000))) {
				itr->second->SetComplete(1);
				ClientPacketFunctions::SendHeroicOPUpdate(itr->first, itr->second);
				safe_delete(itr->second);
				itr = m_soloHO.erase(delete_itr);
				continue;
			}
			else
				itr++;
		}
	}
	MSoloHO.releasewritelock(__FUNCTION__, __LINE__);

	// Check group HO timers
	MGroupHO.writelock(__FUNCTION__, __LINE__);
	if (m_groupHO.size() > 0) {
		map<int32, HeroicOP*>::iterator itr = m_groupHO.begin();
		map<int32, HeroicOP*>::iterator delete_itr;
		while (itr != m_groupHO.end()) {
			if (itr->second->GetWheel() && Timer::GetCurrentTime2() >= (itr->second->GetStartTime() + (itr->second->GetTotalTime() * 1000))) {
				itr->second->SetComplete(1);

				world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);
				deque<GroupMemberInfo*>::iterator itr2;
				PlayerGroup* group = world.GetGroupManager()->GetGroup(itr->first);
				if (group)
				{
					group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
					deque<GroupMemberInfo*>* members = group->GetMembers();
					for (itr2 = members->begin(); itr2 != members->end(); itr2++) {
						if ((*itr2)->client)
							ClientPacketFunctions::SendHeroicOPUpdate((*itr2)->client, itr->second);
					}
					group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
				}
				world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);

				safe_delete(itr->second);
				itr = m_groupHO.erase(delete_itr);
				continue;
			}
			else
				itr++;
		}
	}
	MGroupHO.releasewritelock(__FUNCTION__, __LINE__);

	MSpellProcess.unlock();
}
bool SpellProcess::IsReady(Spell* spell, Entity* caster){
	if(caster->IsCasting())
		return false;
	bool ret = true;	
	RecastTimer* recast_timer = 0;
	MutexList<RecastTimer*>::iterator itr = recast_timers.begin();
	while(itr.Next()){
		recast_timer = itr->value;
		if(recast_timer->spell == spell && recast_timer->caster == caster){
			ret = false;
			break;
		}
	}
	return ret;
}
void SpellProcess::CheckRecast(Spell* spell, Entity* caster, float timer_override, bool check_linked_timers) {
	if(spell && caster && spell->GetSpellData()->recast > 0){
		RecastTimer* timer = new RecastTimer;
		timer->caster = caster;
		if(caster->IsPlayer())
			timer->client = caster->GetZone()->GetClientBySpawn(caster);
		else
			timer->client = 0;
		timer->spell = spell;
		if(timer_override == 0)
			timer->timer = new Timer((int32)(spell->GetSpellData()->recast*1000));
		else
			timer->timer = new Timer((int32)(timer_override*1000));
		recast_timers.Add(timer);
		if(caster->IsPlayer()){
			if(timer_override == 0)
				((Player*)caster)->LockSpell(spell, (int16)(spell->GetSpellData()->recast * 10));
			else
				((Player*)caster)->LockSpell(spell, timer_override * 10);

			if (check_linked_timers && spell->GetSpellData()->linked_timer > 0) {
				vector<Spell*> linkedSpells = ((Player*)caster)->GetSpellBookSpellsByTimer(spell->GetSpellData()->linked_timer);
				for (int8 i = 0; i < linkedSpells.size(); i++) {
					Spell* spell2 = linkedSpells.at(i);
					if (spell2)
						CheckRecast(spell2, caster, timer_override, false);
				}
			}
		}
	}
}
void SpellProcess::CheckInterrupt(InterruptStruct* interrupt){
	if(!interrupt || !interrupt->interrupted || !interrupt->interrupted->IsEntity())
		return;
	Entity* entity = (Entity*)interrupt->interrupted;
	Client* client = entity->GetZone()->GetClientBySpawn(entity);
	if(client)
		SendFinishedCast(GetLuaSpell(entity), client);
	RemoveSpellTimersFromSpawn(entity, false);
	entity->IsCasting(false);
	entity->GetZone()->SendInterruptPacket(entity, interrupt->spell);
	if(interrupt->error_code > 0)
		entity->GetZone()->SendSpellFailedPacket(client, interrupt->error_code);
}

bool SpellProcess::DeleteCasterSpell(Spawn* caster, Spell* spell, string reason){

	bool ret = false;
	// need to use size(true) to get pending updates to the list as well
	if (caster && spell && active_spells.size() > 0) {
		LuaSpell* lua_spell = 0;
		MutexList<LuaSpell*>::iterator itr = active_spells.begin();
		while (itr.Next()){
			lua_spell = itr->value;
			if (lua_spell->spell == spell && lua_spell->caster == caster) {
				ret = DeleteCasterSpell(lua_spell, reason);
				break;
			}
		}
	}
	return ret;
}

bool SpellProcess::DeleteCasterSpell(LuaSpell* spell, string reason){
	bool ret = false;
	Spawn* target = 0;
	if(spell) {
		if (active_spells.count(spell) > 0)
			active_spells.Remove(spell);
		if (spell->caster) {
			if (spell->spell->GetSpellData()->cast_type == SPELL_CAST_TYPE_TOGGLE){
				CheckRecast(spell->spell, spell->caster);
				if (spell->caster && spell->caster->IsPlayer())
					SendSpellBookUpdate(spell->caster->GetZone()->GetClientBySpawn(spell->caster));
			}
			spell->caster->RemoveProc(0, spell);
			spell->caster->RemoveMaintainedSpell(spell);
			CheckRemoveTargetFromSpell(spell, false);
			ZoneServer* zone = spell->caster->GetZone();
			spell->MSpellTargets.readlock(__FUNCTION__, __LINE__);
			for (int32 i = 0; i < spell->targets.size(); i++) {
				target = zone->GetSpawnByID(spell->targets.at(i));
				if(target && target->IsEntity()){
					((Entity*)target)->RemoveSpellEffect(spell);
					if(spell->spell->GetSpellData()->det_type > 0 && (spell->spell->GetSpellDuration() > 0 || spell->spell->GetSpellData()->duration_until_cancel))
						((Entity*)target)->RemoveDetrimentalSpell(spell);
				}
				else{
					spell->caster->RemoveSpellEffect(spell);
					if(spell->spell->GetSpellData()->det_type > 0 && (spell->spell->GetSpellDuration() > 0 || spell->spell->GetSpellData()->duration_until_cancel))
						spell->caster->RemoveDetrimentalSpell(spell);
				}
				if(target && target->IsPlayer() && spell->spell->GetSpellData()->fade_message.length() > 0){
					Client* client = target->GetZone()->GetClientBySpawn(target);
					if(client){
						bool send_to_sender = true;
						string fade_message = spell->spell->GetSpellData()->fade_message;
						if(fade_message.find("%t") != string::npos)
							fade_message.replace(fade_message.find("%t"), 2, target->GetName());						
						client->Message(CHANNEL_SPELLS_OTHER, fade_message.c_str());
					}
				}
				if (target && target->IsPlayer() && spell->spell->GetSpellData()->fade_message.length() > 0) {
					Client* client = target->GetZone()->GetClientBySpawn(target);
					if (client) {
						bool send_to_sender = true;
						string fade_message_others = spell->spell->GetSpellData()->fade_message_others;
						if (fade_message_others.find("%t") != string::npos)
							fade_message_others.replace(fade_message_others.find("%t"), 2, target->GetName());
						if (fade_message_others.find("%c") != string::npos)
							fade_message_others.replace(fade_message_others.find("%c"), 2, spell->caster->GetName());
						if (fade_message_others.find("%T") != string::npos) {
							fade_message_others.replace(fade_message_others.find("%T"), 2, target->GetName());
							send_to_sender = false;
						}
						if (fade_message_others.find("%C") != string::npos) {
							fade_message_others.replace(fade_message_others.find("%C"), 2, spell->caster->GetName());
							send_to_sender = false;
						}
						spell->caster->GetZone()->SimpleMessage(CHANNEL_SPELLS_OTHER, fade_message_others.c_str(), target, 50, send_to_sender);
					}
				}
			}
			spell->MSpellTargets.releasereadlock(__FUNCTION__, __LINE__);
			ret = true;
		}
		if(lua_interface)
			lua_interface->RemoveSpell(spell, true, SpellScriptTimersHasSpell(spell), reason);
	}
	return ret;
}

bool SpellProcess::ProcessSpell(LuaSpell* spell, bool first_cast, const char* function, SpellScriptTimer* timer) {
	bool ret = false;
	if(!spell->state)
	{
		LogWrite(SPELL__ERROR, 0, "Spell", "Error: State is NULL!  SpellProcess::ProcessSpell for Spell '%s'", (spell->spell != nullptr) ? spell->spell->GetName() : "Unknown");
	}
	else if(lua_interface && !spell->interrupted){
		lua_interface->AddSpawnPointers(spell, first_cast, false, function, timer);
		vector<LUAData*>* data = spell->spell->GetLUAData();
		for(int32 i=0;i<data->size();i++){
			switch(data->at(i)->type){
				case 0:{
					lua_interface->SetSInt32Value(spell->state, data->at(i)->int_value);
					break;
				}
				case 1:{
					lua_interface->SetFloatValue(spell->state, data->at(i)->float_value);
					break;
				}
				case 2:{
					lua_interface->SetBooleanValue(spell->state, data->at(i)->bool_value);
					break;
				}
				case 3:{
					lua_interface->SetStringValue(spell->state, data->at(i)->string_value.c_str());
					break;
				}
				default:{
					LogWrite(SPELL__ERROR, 0, "Spell", "Error: Unknown LUA Type '%i' in SpellProcess::ProcessSpell for Spell '%s'", (int)data->at(i)->type, spell->spell->GetName());
					return false;
				}
			}
		}
		ret = lua_interface->CallSpellProcess(spell, 2 + data->size());
	}
	return ret;
}

bool SpellProcess::CastPassives(Spell* spell, Entity* caster, bool remove) {
	CastInstant(spell, caster, caster, remove, true);
	return true;
}

bool SpellProcess::CastInstant(Spell* spell, Entity* caster, Entity* target, bool remove, bool passive) {
	LuaSpell* lua_spell = 0;

	if(lua_interface)
		lua_spell = lua_interface->GetSpell(spell->GetSpellData()->lua_script.c_str());

	if(!lua_spell)
	{
		string lua_script = spell->GetSpellData()->lua_script;
		lua_script.append(".lua");
		lua_spell = 0;

		if(lua_interface)
			lua_spell = lua_interface->GetSpell(lua_script.c_str());

		if(!lua_spell) {
			LogWrite(SPELL__ERROR, 0, "Spell", "Failed to get a LuaSpell for %s (%u)", spell->GetName(), spell->GetSpellID());
			return false;
		}
		else
			spell->GetSpellData()->lua_script = lua_script;
	}

	lua_spell->caster = caster;
	lua_spell->spell = spell;
	lua_spell->initial_target = target->GetID();
	GetSpellTargets(lua_spell);

	if (!lua_spell->spell->IsCopiedSpell())
	{
		lua_getglobal(lua_spell->state, "customspell");
		if (lua_isfunction(lua_spell->state, lua_gettop(lua_spell->state))) {
			lua_pop(lua_spell->state, 1);
			Spell* tmpSpell = lua_spell->spell;
			lua_spell->spell = new Spell(lua_spell->spell);
			lua_interface->AddCustomSpell(lua_spell);
			lua_interface->AddSpawnPointers(lua_spell, false, false, "customspell",0,true);
			if (lua_pcall(lua_spell->state, 3, 3, 0) != 0) {
				lua_interface->RemoveCustomSpell(lua_spell->spell->GetSpellID());
				lua_interface->ResetFunctionStack(lua_spell->state);
				safe_delete(lua_spell->spell);
				lua_spell->spell = tmpSpell;
			}
			else
				lua_interface->ResetFunctionStack(lua_spell->state);
		}
		else
			lua_interface->ResetFunctionStack(lua_spell->state);
	}

	caster->GetZone()->SendCastSpellPacket(lua_spell, caster);

	if (!remove)
		return CastProcessedSpell(lua_spell, passive);

	lua_interface->RemoveSpell(lua_spell, true, SpellScriptTimersHasSpell(lua_spell));
	return true;
}

void SpellProcess::SendStartCast(LuaSpell* spell, Client* client){
	if(client){
		PacketStruct* packet = configReader.getStruct("WS_StartCastSpell", client->GetVersion());
		if(packet){
			packet->setDataByName("cast_time", spell->spell->GetSpellData()->cast_time*.01);
			packet->setMediumStringByName("spell_name", spell->spell->GetSpellData()->name.data.c_str());
			EQ2Packet* outapp = packet->serialize();
			//DumpPacket(outapp);
			client->QueuePacket(outapp);
			safe_delete(packet);	
		}
	}
}

void SpellProcess::SendFinishedCast(LuaSpell* spell, Client* client){
	if(client && spell && spell->spell){
		if (spell->spell->GetSpellData()->cast_type == SPELL_CAST_TYPE_TOGGLE)
			UnlockAllSpells(client, spell->spell);
		else
			UnlockAllSpells(client);
		if(spell->resisted && spell->spell->GetSpellData()->recast > 0)
			CheckRecast(spell->spell, client->GetPlayer(), 0.5); // half sec recast on resisted spells
		else if (!spell->interrupted && spell->spell->GetSpellData()->cast_type != SPELL_CAST_TYPE_TOGGLE)
			CheckRecast(spell->spell, client->GetPlayer());
		PacketStruct* packet = configReader.getStruct("WS_FinishCastSpell", client->GetVersion());
		if(packet){
			packet->setMediumStringByName("spell_name", spell->spell->GetSpellData()->name.data.c_str());			
			client->QueuePacket(packet->serialize());
			safe_delete(packet);	
		}
		SendSpellBookUpdate(client);		
 	}
	if (spell) {
		if (!spell->interrupted) {
			TakePower(spell);
			TakeHP(spell);
			TakeSavagery(spell);
			AddDissonance(spell);
			AddConcentration(spell);
			if (client && spell->spell && !spell->spell->GetSpellData()->friendly_spell)
				client->GetPlayer()->InCombat(true);
			if(client && spell->caster)
				client->CheckPlayerQuestsSpellUpdate(spell->spell);
		}
	}
}

void SpellProcess::LockAllSpells(Client* client){
	if(client){
		client->GetPlayer()->LockAllSpells();
		SendSpellBookUpdate(client);
	}
}

void SpellProcess::UnlockAllSpells(Client* client, Spell* exception){
	if(client)
		client->GetPlayer()->UnlockAllSpells(false, exception);
}

void SpellProcess::UnlockSpell(Client* client, Spell* spell){
	if(client && client->GetPlayer() && spell) {
		client->GetPlayer()->UnlockSpell(spell);
		SendSpellBookUpdate(client);
	}
}

bool SpellProcess::CheckPower(LuaSpell* spell){
	int16 req = 0;
	if(spell->caster){
		req = spell->spell->GetPowerRequired(spell->caster);
		if(spell->caster->GetPower() >= req)
			return true;
	}
	return false;
}

bool SpellProcess::TakePower(LuaSpell* spell){
	int16 req = 0;
	if(spell->caster){
		req = spell->spell->GetPowerRequired(spell->caster);
		if(spell->caster->GetPower() >= req){
			spell->caster->SetPower(spell->caster->GetPower() - req);
			if(spell->caster->IsPlayer())
				spell->caster->GetZone()->TriggerCharSheetTimer();
			return true;
		}
	}
	return false;
}

bool SpellProcess::CheckHP(LuaSpell* spell) { 
   int16 req = 0; 
   if(spell->caster){  
     req = spell->spell->GetHPRequired(spell->caster); 
     if(spell->caster->GetHP() >= req)
        return true; 
   } 
   return false; 
}

bool SpellProcess::TakeHP(LuaSpell* spell) { 
   int16 req = 0; 
   if(spell->caster && spell->caster->IsPlayer()){ 
     req = spell->spell->GetHPRequired(spell->caster); 
     if(spell->caster->GetHP() >= req){ 
        spell->caster->SetHP(spell->caster->GetHP() - req);
		if(spell->caster->IsPlayer())
			spell->caster->GetZone()->TriggerCharSheetTimer(); 
        return true; 
     } 
   } 
   return false; 
}

bool SpellProcess::CheckConcentration(LuaSpell* spell) {
	if (spell && spell->caster) {
		int8 req = spell->spell->GetSpellData()->req_concentration / 256;
		int8 current_avail = 5 - spell->caster->GetConcentrationCurrent();
		if (current_avail >= req)
			return true;
	}
	return false;
}

bool SpellProcess::AddConcentration(LuaSpell* spell) {
	if (spell && spell->caster) {
		int8 req = spell->spell->GetSpellData()->req_concentration / 256;
		int8 current_avail = 5 - spell->caster->GetConcentrationCurrent();
		if (current_avail >= req) {
			spell->caster->GetInfoStruct()->cur_concentration += req;
			if (spell->caster->IsPlayer())
				spell->caster->GetZone()->TriggerCharSheetTimer();
			LogWrite(SPELL__DEBUG, 0, "Spell", "Concentration is now %u on %s", spell->caster->GetInfoStruct()->cur_concentration, spell->caster->GetName());
			return true;
		}
	}
	return false;
}

bool SpellProcess::CheckSavagery(LuaSpell* spell) {
	if (spell && spell->caster) {
		int16 req = spell->spell->GetSavageryRequired(spell->caster); 
		if(spell->caster->GetSavagery() >= req)
			return true; 
	}
	return false;
}

bool SpellProcess::TakeSavagery(LuaSpell* spell) { 
   int16 req = 0; 
   if(spell && spell->caster && spell->caster->IsPlayer()){ 
     req = spell->spell->GetSavageryRequired(spell->caster); 
     if(spell->caster->GetSavagery() >= req){ 
        spell->caster->SetSavagery(spell->caster->GetSavagery() - req);
		if(spell->caster->IsPlayer())
			spell->caster->GetZone()->TriggerCharSheetTimer(); 
        return true; 
     } 
   } 
   return false; 
}

bool SpellProcess::CheckDissonance(LuaSpell* spell) {
	if (spell && spell->caster) {
		int16 req = spell->spell->GetDissonanceRequired(spell->caster); 
		if(spell->caster->GetDissonance() <= req)
			return true; 
	}
	return false;
}

bool SpellProcess::AddDissonance(LuaSpell* spell) { 
   int16 req = 0; 
   if(spell && spell->caster && spell->caster->IsPlayer()){ 
     req = spell->spell->GetDissonanceRequired(spell->caster); 
     if(spell->caster->GetDissonance() >= req){ 
        spell->caster->SetDissonance(spell->caster->GetDissonance() - req);
		if(spell->caster->IsPlayer())
			spell->caster->GetZone()->TriggerCharSheetTimer(); 
        return true; 
     } 
   } 
   return false; 
}

void SpellProcess::AddSpellToQueue(Spell* spell, Entity* caster){
	if(caster && caster->IsPlayer() && spell){
		spell_que.Put(caster, spell);
		((Player*)caster)->QueueSpell(spell);
		Client* client = caster->GetZone()->GetClientBySpawn(caster);
		if(client)
			SendSpellBookUpdate(client);
	}
}

void SpellProcess::RemoveSpellFromQueue(Spell* spell, Entity* caster){
	if(caster && caster->IsPlayer() && spell){
		spell_que.erase(caster);
		((Player*)caster)->UnQueueSpell(spell);
		Client* client = caster->GetZone()->GetClientBySpawn(caster);
		if(client)
			SendSpellBookUpdate(client);
	}
}

void SpellProcess::RemoveSpellFromQueue(Entity* caster, bool hostile_only) {
	if (caster && spell_que.count(caster) > 0) {
		Spell* spell = spell_que.Get(caster);
		if (spell) {
			bool remove = true;
			if (hostile_only && spell->GetSpellData()->target_type != SPELL_TARGET_ENEMY)
				remove = false;
			if (remove) {
				spell_que.erase(caster);
				((Player*)caster)->UnQueueSpell(spell);
				Client* client = caster->GetZone()->GetClientBySpawn(caster);
				if (client)
					SendSpellBookUpdate(client);
			}
		}
	}
}

void SpellProcess::CheckSpellQueue(Entity* caster){
	if(caster && caster->IsPlayer()){
		if(spell_que.count(caster) > 0)
			RemoveSpellFromQueue(spell_que.Get(caster), caster);	
	}
}

void SpellProcess::CheckSpellQueue(Spell* spell, Entity* caster){
	if(caster->IsPlayer()){
		bool add = true;
		bool remove = false;
		if(spell_que.count(caster) > 0){
			remove = true;
			if(spell_que.Get(caster) == spell)
				add = false;
		}
		if(remove)
			RemoveSpellFromQueue(spell, caster);
		if(add)
			AddSpellToQueue(spell, caster);		
	}
}

void SpellProcess::SendSpellBookUpdate(Client* client){
	if(client){
		EQ2Packet* app = client->GetPlayer()->GetSpellBookUpdatePacket(client->GetVersion());
		if(app)
			client->QueuePacket(app);
	}
}

LuaSpell* SpellProcess::GetLuaSpell(Entity* caster){
	LuaSpell* spell = 0;
	if(caster && cast_timers.size() > 0){		
		CastTimer* cast_timer = 0;
		MutexList<CastTimer*>::iterator itr = cast_timers.begin();
		while(itr.Next()){
			 cast_timer = itr->value;
			 if(cast_timer && cast_timer->spell && cast_timer->spell->caster == caster){
				spell = cast_timer->spell;
				break;
			 }
		}
	}
	return spell;
}

Spell* SpellProcess::GetSpell(Entity* caster){
	Spell* spell = 0;
	if(cast_timers.size() > 0){		
		CastTimer* cast_timer = 0;
		MutexList<CastTimer*>::iterator itr = cast_timers.begin();
		while(itr.Next()){
			 cast_timer = itr->value;
			 if(cast_timer && cast_timer->spell && cast_timer->spell->caster == caster){
				spell = cast_timer->spell->spell;
				break;
			 }
		}
	}
	return spell;
}

Spawn* SpellProcess::GetSpellTarget(Entity* caster){
	Spawn* target = 0;
	if(cast_timers.size() > 0){		
		CastTimer* cast_timer = 0;
		MutexList<CastTimer*>::iterator itr = cast_timers.begin();
		while(itr.Next()){
			 cast_timer = itr->value;
			 if(cast_timer && cast_timer->spell->caster == caster){
				target = caster->GetZone()->GetSpawnByID(cast_timer->spell->initial_target);
				break;
			 }
		}
	}
	return target;
}

void SpellProcess::ProcessSpell(ZoneServer* zone, Spell* spell, Entity* caster, Spawn* target, bool lock, bool harvest_spell, LuaSpell* customSpell, int16 custom_cast_time, bool in_heroic_opp)
{
	if((customSpell != 0 || spell != 0) && caster)
	{
		Client* client = 0;
		//int16 version = 0;

		LuaSpell* lua_spell = 0;

		if (customSpell)
		{
			lua_spell = customSpell;
			spell = lua_spell->spell;
		}
		else if(lua_interface)
			lua_spell = lua_interface->GetSpell(spell->GetSpellData()->lua_script.c_str());

		// this will only hit if customSpell is null and we go through the lua_interface
		if(!lua_spell)
		{
			string lua_script = spell->GetSpellData()->lua_script;
			lua_script.append(".lua");

			if(lua_interface)
				lua_spell = lua_interface->GetSpell(lua_script.c_str());

			if(!lua_spell)
				return;
			else
				spell->GetSpellData()->lua_script = lua_script;
		}

		if (!target)
			target = caster;

		int8 target_type = spell->GetSpellData()->target_type;

		lua_spell->caster = caster;
		lua_spell->spell = spell;

		int32 target_id = target->GetID();
		lua_spell->initial_target = target_id;

		if (!harvest_spell)
			GetSpellTargets(lua_spell);
		else{
			lua_spell->MSpellTargets.writelock(__FUNCTION__, __LINE__);
			lua_spell->targets.push_back(target_id);
			lua_spell->MSpellTargets.releasewritelock(__FUNCTION__, __LINE__);
		}
			

		if (target_id == lua_spell->initial_target)
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s is casting %s on %s.", caster->GetName(), spell->GetName(), ( target ) ? target->GetName() : "No Target" );
		}
		else
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Casting on %s through %s as target.", spell->GetName(), caster->GetZone()->GetSpawnByID(lua_spell->initial_target)->GetName(), target->GetName());
		}

		target = lua_spell->caster->GetZone()->GetSpawnByID(lua_spell->initial_target);

		if(caster->IsPlayer() && zone)
		{
			client = zone->GetClientBySpawn(caster);
			//version = client->GetVersion();
		}

		if (!customSpell && !lua_spell->spell->IsCopiedSpell())
		{
			lua_getglobal(lua_spell->state, "customspell");
			if (lua_isfunction(lua_spell->state, lua_gettop(lua_spell->state))) {
				lua_pop(lua_spell->state, 1);
				Spell* tmpSpell = lua_spell->spell;
				lua_spell->spell = new Spell(lua_spell->spell);
				lua_interface->AddCustomSpell(lua_spell);
				lua_interface->AddSpawnPointers(lua_spell, false, false, "customspell", 0, true);
				if (lua_pcall(lua_spell->state, 3, 3, 0) != 0) {
					lua_interface->RemoveCustomSpell(lua_spell->spell->GetSpellID());
					lua_interface->ResetFunctionStack(lua_spell->state);
					safe_delete(lua_spell->spell);
					lua_spell->spell = tmpSpell;
				}
				else
					lua_interface->ResetFunctionStack(lua_spell->state);
			}
			else
				lua_interface->ResetFunctionStack(lua_spell->state);
		}

		//If this spell is the toggle cast type and is being toggled off, do this now
		if (spell->GetSpellData()->cast_type == SPELL_CAST_TYPE_TOGGLE)
		{
			bool ret_val = DeleteCasterSpell(caster, spell, "purged");

			if (ret_val)
			{
				int8 actual_concentration = spell->GetSpellData()->req_concentration / 256;

				if (actual_concentration > 0)
				{
					caster->GetInfoStruct()->cur_concentration -= actual_concentration;
					if (caster->IsPlayer())
						caster->GetZone()->TriggerCharSheetTimer();
				}

				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}
		}

		// If a player is casting the spell AND spell is a tradeskill spell
		if (client && spell->GetSpellData()->spell_book_type == SPELL_BOOK_TYPE_TRADESKILL)
		{
			// If the player is currently crafting
			if (client->IsCrafting()) 
			{
				Tradeskill* tradeskill = 0;
				zone->GetTradeskillMgr()->ReadLock(__FUNCTION__, __LINE__);
				tradeskill = zone->GetTradeskillMgr()->GetTradeskill(client);

				// Can not cast a crafting spell that doesn't match the current crafting technique
				if (spell->GetSpellData()->mastery_skill != tradeskill->recipe->GetTechnique()) 
				{
					// send a message to the client, used chat_relationship to match other tradeskill messages, not sure if it is accurate though
					client->Message(CHANNEL_COLOR_CHAT_RELATIONSHIP, "You are not using %s on this recipe.", master_skill_list.GetSkill(spell->GetSpellData()->mastery_skill)->name.data.c_str());

					// Write a spell debug message on why we couldn't cast
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s could not cast tradeskill spell (%s), skills did not match. spell mastery skill = %u, tradeskill technique = %u", caster->GetName(), spell->GetName(), spell->GetSpellData()->mastery_skill, tradeskill->recipe->GetTechnique());
					
					// make sure to release the lock before we return out
					zone->GetTradeskillMgr()->ReleaseReadLock(__FUNCTION__, __LINE__);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}
				// need to make sure the lock is released if the if passed
				zone->GetTradeskillMgr()->ReleaseReadLock(__FUNCTION__, __LINE__);
			}
			else // If the player is not currently crafting
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s cannot cast a tradeskill spell (%s) while not crafting.", caster->GetName(), spell->GetName());
				zone->SendSpellFailedPacket(client, SPELL_ERROR_ONLY_WHEN_CRAFTING);
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}
		}

		if (caster != target && target != NULL && !caster->CheckLoS(target))
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s cannot see target %s.", caster->GetName(), target->GetName());
			zone->SendSpellFailedPacket(client, SPELL_ERROR_CANT_SEE_TARGET);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if ((caster->IsMezzed() && !spell->CastWhileMezzed()) || (caster->IsStunned() && !spell->CastWhileStunned())) 
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s cannot cast (mezzed or stunned).", caster->GetName());
			zone->SendSpellFailedPacket(client, SPELL_ERROR_CANNOT_CAST_STUNNED);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if (caster->IsStifled() && !spell->CastWhileStifled())
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s cannot cast (stifled).", caster->GetName());
			zone->SendSpellFailedPacket(client, SPELL_ERROR_CANNOT_CAST_STIFFLED);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if (caster->IsFeared() && !spell->CastWhileFeared())
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s cannot cast (feared).", caster->GetName());
			zone->SendSpellFailedPacket(client, SPELL_ERROR_CANNOT_CAST_FEARED);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if(caster->IsPlayer() && !IsReady(spell, caster))
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "Queuing spell for %s.", caster->GetName());
			CheckSpellQueue(spell, caster);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if (target_type != SPELL_TARGET_SELF && target_type != SPELL_TARGET_GROUP_AE && target_type != SPELL_TARGET_NONE && spell->GetSpellData()->max_aoe_targets == 0)
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Not Self, Not Group AE, Not None, Max Targets = 0", spell->GetName());

			if (!target)
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: No target.", spell->GetName());
				zone->SendSpellFailedPacket(client, SPELL_ERROR_NO_ELIGIBLE_TARGET);
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}

			float tmpRange = spell->GetSpellData()->range;

			if (client && target != caster && !spell->GetSpellData()->range)
			{
				bool match = false;
				int tmpTier = 0;
				Spell* tmpSpell = 0;
				for (tmpTier = 0; tmpTier < spell->GetSpellTier(); tmpTier++)
				{
					tmpSpell = master_spell_list.GetSpell(spell->GetSpellData()->id, tmpTier);
					if (tmpSpell && tmpSpell->GetSpellData()->range)
					{
						match = true;
						break;
					}
				}
				if (tmpSpell)
					tmpRange = tmpSpell->GetSpellData()->range;

				if (!match)
					tmpTier = -1;

				char msg[512];
				snprintf(msg, 512, "SpellCasted without proper spell range set %s ID %i Tier %i Range obtained from tier %i range %f", spell->GetName(), spell->GetSpellID(), spell->GetSpellTier(), tmpTier, tmpRange);
				if (!world.CheckTempBugCRC(msg))
					commands.Command_ReportBug(client, new Seperator(msg));
			}

			if(caster->GetDistance(target) > tmpRange)
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Too far.", spell->GetName());
				zone->SendSpellFailedPacket(client, SPELL_ERROR_TOO_FAR_AWAY);
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}

			if (caster->GetDistance(target) < spell->GetSpellData()->min_range) 
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Too close.", spell->GetName());
				zone->SendSpellFailedPacket(client, SPELL_ERROR_TOO_CLOSE);
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}
		}

		if(target_type == SPELL_TARGET_SELF && spell->GetSpellData()->max_aoe_targets == 0)
		{
			if (harvest_spell)
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Harvest, Target Self, Max Targets = 0", spell->GetName());

				if (!target || !target->IsGroundSpawn())
				{
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: No target or not groundspawn.", spell->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NO_ELIGIBLE_TARGET);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}
			}
			else
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Target '%s' is Caster '%s'.", spell->GetName(), ( target ) ? target->GetName() : "None", caster->GetName());
				target = caster;
			}
		}

		// Is enemy spell AND direct-damage (no AE)
		if (target_type == SPELL_TARGET_ENEMY && spell->GetSpellData()->max_aoe_targets == 0)
		{
			LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Target Enemy (%s) and Max AE Targets = 0.", spell->GetName(), target->GetName());

			if (spell->GetSpellData()->friendly_spell && target->IsPlayer() )
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Is Friendly, Target is Player (%s).", spell->GetName(), target->GetName());

				if (!target->IsEntity()) 
				{
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: No target.", spell->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NO_ELIGIBLE_TARGET);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}
				/*if (target->appearance.attackable) {
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_A_FRIEND);
					return;
				}*/
			}
			else if (spell->GetSpellData()->friendly_spell && target->IsNPC() && target->appearance.attackable)
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Is Not Friendly (friendly and NPC)", spell->GetName());

				if (target->IsPet())
				{
					if (((NPC*)target)->GetOwner()->IsNPC())
					{
						zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_A_FRIEND);
						lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
						DeleteSpell(lua_spell);
						return;
					}
				}
				else if (target->IsBot() && (caster->IsPlayer() || caster->IsBot())) {
					// Needed so bots or player can cast friendly spells on bots
				}
				else
				{
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_A_FRIEND);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}
			}
			else if (spell->GetSpellData()->friendly_spell && target->IsNPC() && caster->IsNPC()) {
				// TODO: faction checks? some other checks to prevent an npc casting a friendly spell on another npc
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: NPC Cast", spell->GetName());
			}
			else
			{
				LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Is Not Friendly (catch all)", spell->GetName());

				if (!target->IsEntity())
				{
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: No target.", spell->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NO_ELIGIBLE_TARGET);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}

				if (caster == target || (!target->IsPlayer() && !target->appearance.attackable)) 
				{
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Not an Enemy (Target: %s).", spell->GetName(), target->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_AN_ENEMY);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}

				if (!target->Alive()) 
				{
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Target is not alive (Target: %s).", spell->GetName(), target->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_ALIVE);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}

				if (target->GetInvulnerable()) 
				{
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Target is invulnerable (Target: %s).", spell->GetName(), target->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_TARGET_INVULNERABLE);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}

				if ((target->IsPlayer() || target->IsBot()) && (caster->IsPlayer() || caster->IsBot())) 
				{
					bool attackAllowed = (Entity*)caster->AttackAllowed((Entity*)target, 0);
					if (!attackAllowed)
					{
						LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Target (%s) is player and not attackable.", spell->GetName(), target->GetName());
						zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_AN_ENEMY);
						lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
						DeleteSpell(lua_spell);
						return;
					}
				}

				if (target->IsPet() && ((NPC*)target)->GetOwner() && ((NPC*)target)->GetOwner() == caster) {
					LogWrite(SPELL__DEBUG, 1, "Spell", "%s: Target (%s) is casters pet and not attackable by caster.", spell->GetName(), target->GetName());
					zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_AN_ENEMY);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}
			}
		}

		if (lua_spell->targets.size() == 0 && spell->GetSpellData()->max_aoe_targets == 0) 
		{
			LogWrite(SPELL__ERROR, 0, "Spell", "SpellProcess::ProcessSpell Unable to find any spell targets for spell '%s'.", spell->GetName());
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if(target_type == SPELL_TARGET_ENEMY_CORPSE || target_type == SPELL_TARGET_GROUP_CORPSE)
		{
			if(target->Alive())
			{
				zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_DEAD);
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}
			if(target->IsPlayer() && zone->GetClientBySpawn(target)->GetCurrentRez()->active){
				zone->SendSpellFailedPacket(client, SPELL_ERROR_ALREADY_CAST);
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}
		}

		if(!CheckPower(lua_spell)) 
		{
			zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_ENOUGH_POWER);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if (!CheckHP(lua_spell)) 
		{ 
			zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_ENOUGH_HEALTH);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return; 
		}

		if (!CheckSavagery(lua_spell))
		{
			zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_ENOUGH_SAVAGERY);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if (!CheckDissonance(lua_spell))
		{
			zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_ENOUGH_DISSONANCE);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		if (!CheckConcentration(lua_spell)) 
		{
			zone->SendSpellFailedPacket(client, SPELL_ERROR_NOT_ENOUGH_CONC);
			lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
			DeleteSpell(lua_spell);
			return;
		}

		// Precast in lua
		if (lua_interface) {
			bool result = false;
			lua_interface->AddSpawnPointers(lua_spell, false, true);
			if (lua_pcall(lua_spell->state, 2, 2, 0) == 0) {
				result = lua_interface->GetBooleanValue(lua_spell->state, 1);
				int8 error = lua_interface->GetInt8Value(lua_spell->state, 2) == 0 ? SPELL_ERROR_CANNOT_PREPARE : lua_interface->GetInt8Value(lua_spell->state, 2);
				lua_interface->ResetFunctionStack(lua_spell->state);

				if (!result) {
					zone->SendSpellFailedPacket(client, error);
					lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
					DeleteSpell(lua_spell);
					return;
				}
			}
			else {
				LogWrite(SPELL__DEBUG, 1, "Spell", "No precast function found for %s", lua_spell->spell->GetName());
				lua_interface->ResetFunctionStack(lua_spell->state);
			}
		}
		else
			LogWrite(SPELL__DEBUG, 1, "Spell", "Unable to do precast check as there was no lua_interface");
		
		if (custom_cast_time > 0)
			spell->GetSpellData()->cast_time = custom_cast_time;

		//Apply casting speed mod
		spell->ModifyCastTime(caster);

		LockAllSpells(client);

		//cancel stealth effects on cast
		if(caster->IsStealthed() || caster->IsInvis())
			caster->CancelAllStealth();

		SendStartCast(lua_spell, client);
			
		if(spell->GetSpellData()->cast_time > 0)
		{
			CastTimer* cast_timer = new CastTimer;
			cast_timer->entity_command = 0;
			cast_timer->target_id = target ? target->GetID() : 0;
			cast_timer->spell = lua_spell;
			cast_timer->spell->caster = caster;
			cast_timer->delete_timer = false;
			cast_timer->timer = new Timer(spell->GetSpellData()->cast_time * 10);
			cast_timer->zone = zone;
			cast_timer->in_heroic_opp = in_heroic_opp;
			cast_timers.Add(cast_timer);
			if(caster)
				caster->IsCasting(true);
		}
		else
		{
			if(!CastProcessedSpell(lua_spell, false, in_heroic_opp))
			{
				lua_spell->caster->GetZone()->GetSpellProcess()->RemoveSpellScriptTimerBySpell(lua_spell);
				DeleteSpell(lua_spell);
				return;
			}
		}

		if(caster)
			caster->GetZone()->SendCastSpellPacket(lua_spell, caster);

	}
}

void SpellProcess::ProcessEntityCommand(ZoneServer* zone, EntityCommand* entity_command, Entity* caster, Spawn* target, bool lock, bool in_heroic_opp)  {
	if (zone && entity_command && caster && target && !target->IsPlayer()) {
		Client* client = zone->GetClientBySpawn(caster);
		if (caster->GetDistance(target) > entity_command->distance) {
			zone->SendSpellFailedPacket(client, SPELL_ERROR_TOO_FAR_AWAY);
			return;
		}
		if (entity_command->cast_time > 0) {
			PacketStruct* packet = configReader.getStruct("WS_StartCastSpell", client->GetVersion());
			if (packet) {
				LockAllSpells(client);
				packet->setDataByName("cast_time", entity_command->cast_time * 0.01);
				packet->setMediumStringByName("spell_name", entity_command->name.c_str());
				EQ2Packet* outapp = packet->serialize();
				client->QueuePacket(outapp);
				safe_delete(packet);

				CastTimer* cast_timer = new CastTimer;
				cast_timer->caster = client;
				cast_timer->target_id = target ? target->GetID() : 0;
				cast_timer->entity_command = entity_command;
				cast_timer->spell = 0;
				cast_timer->delete_timer = false;
				cast_timer->timer = new Timer(entity_command->cast_time * 10);
				cast_timer->zone = zone;
				cast_timer->in_heroic_opp = in_heroic_opp;
				cast_timers.Add(cast_timer);
				caster->IsCasting(true);
			}
		}
		else if (!CastProcessedEntityCommand(entity_command, client, target, in_heroic_opp))
			return;
		if (entity_command && entity_command->spell_visual > 0)
			caster->GetZone()->SendCastEntityCommandPacket(entity_command, caster->GetID(), target->GetID());
	}
}

bool SpellProcess::CastProcessedSpell(LuaSpell* spell, bool passive, bool in_heroic_opp){
	if(!spell || !spell->caster || !spell->spell || spell->interrupted)
		return false;
	Client* client = 0;
	if(spell->caster && spell->caster->IsPlayer())
		client = spell->caster->GetZone()->GetClientBySpawn(spell->caster);
	if (spell->spell->GetSpellData()->max_aoe_targets > 0 && spell->targets.size() == 0) {
		GetSpellTargetsTrueAOE(spell);
		if (spell->targets.size() == 0) {
			spell->caster->GetZone()->SendSpellFailedPacket(client, SPELL_ERROR_NO_TARGETS_IN_RANGE);
			return false;
		}
	}
	MutexList<LuaSpell*>::iterator itr = active_spells.begin();
	bool processedSpell = false;
	LuaSpell* replace_spell = 0;
	// Check to see if we already casted this spell and it is in the active_spells list
	/*while (itr.Next()) {
		LuaSpell* luaspell = itr.value;
		// Check to see if this is the same spell by comparing caster, spell id, and spell tier
		if (luaspell->caster == spell->caster && luaspell->spell->GetSpellID() == spell->spell->GetSpellID() && luaspell->spell->GetSpellTier() == spell->spell->GetSpellTier() && luaspell->targets.size() == spell->targets.size()) {
			vector<Spawn*>::iterator itr;
			vector<Spawn*>::iterator itr2;
			bool all_match = true;
			// compare the target vector to make sure this is the same spell
			for (itr = luaspell->targets.begin(); itr != luaspell->targets.end(); itr++) {
				bool match = false;
				for (itr2 = spell->targets.begin(); itr2 != spell->targets.end(); itr2++) {
					if ((*itr) == (*itr2)) {
						match = true;
						break;
					}
				}
				if (!match) {
					all_match = false;
					break;
				}
			}
			if (all_match) {
				// set a pointer to replace the spell in the active spell list so we don't have to run this loop again
				replace_spell = luaspell;
				// if friendly skip the calling of the lua function as they have already been called for the previous version of this spell
				if (spell->spell->GetSpellData()->friendly_spell == 1)
					processedSpell = true;

				break;
			}
		}
	}*/
	if (!processedSpell)
		processedSpell = ProcessSpell(spell);

	// Quick hack to prevent a crash on spells that zones the caster (Gate)
	if (!spell->caster)
		return true;

	ZoneServer* zone = spell->caster->GetZone();
	Spawn* target = 0;
	if(processedSpell){
		for (int32 i = 0; i < spell->targets.size(); i++) {
			target = zone->GetSpawnByID(spell->targets[i]);
			if (!target)
				continue;

			if (client && client->IsZoning())
				continue;

			// TODO: Establish actual hate per spell
			if (!spell->spell->GetSpellData()->friendly_spell && target->IsNPC())
				((NPC*)target)->AddHate((Entity*)spell->caster, 50);

			if(spell->spell->GetSpellData()->success_message.length() > 0){
				if(client){
					string success_message = spell->spell->GetSpellData()->success_message;
					if(success_message.find("%t") != string::npos)
						success_message.replace(success_message.find("%t"), 2, spell->caster->GetName());
					client->Message(CHANNEL_SPELLS, success_message.c_str());
				}
			}
			if(spell->spell->GetSpellData()->effect_message.length() > 0){
				string effect_message = spell->spell->GetSpellData()->effect_message;
				bool send_to_sender = true;
				if(effect_message.find("%t") != string::npos)
					effect_message.replace(effect_message.find("%t"), 2, target->GetName());
				if (effect_message.find("%c") != string::npos)
					effect_message.replace(effect_message.find("%c"), 2, spell->caster->GetName());
				if (effect_message.find("%T") != string::npos) {
					effect_message.replace(effect_message.find("%T"), 2, target->GetName());
					send_to_sender = false;
				}
				if (effect_message.find("%C") != string::npos) {
					effect_message.replace(effect_message.find("%C"), 2, spell->caster->GetName());
					send_to_sender = false;
				}
				spell->caster->GetZone()->SimpleMessage(CHANNEL_SPELLS_OTHER, effect_message.c_str(), target, 50, send_to_sender);
			}
			target->GetZone()->CallSpawnScript(target, SPAWN_SCRIPT_CASTED_ON, spell->caster, spell->spell->GetName());
		}
	}
	else{
		if (!passive)
			SendFinishedCast(spell, client);
		return false;
	}
	if(!spell->resisted && (spell->spell->GetSpellDuration() > 0 || spell->spell->GetSpellData()->duration_until_cancel)) {
		for (int32 i = 0; i < spell->targets.size(); i++) {
			
			//LogWrite(SPELL__ERROR, 0, "Spell", "No precast function found for %s", ((Entity*)target)->GetName());
			target = zone->GetSpawnByID(spell->targets.at(i));
			if (!target && spell->targets.at(i) == spell->caster->GetID()) {
				target = spell->caster;
			}
			if (!target) {
				client->SimpleMessage(CHANNEL_COLOR_YELLOW, "Zone has not finished loading process yet.  Try again later.");
				continue;
			}
			if (i == 0 && !spell->spell->GetSpellData()->not_maintained) {
				spell->caster->AddMaintainedSpell(spell);
				//((Entity*)target)->AddMaintainedSpell(spell);
				LogWrite(SPELL__DEBUG, 0, "Spell", "AddMaintained on %s", ((Entity*)target)->GetName());
			}
			
			SpellEffects* effect = ((Entity*)target)->GetSpellEffect(spell->spell->GetSpellID());
			if (effect && effect->tier > spell->spell->GetSpellTier()) {
				if(client) {
					spell->caster->GetZone()->SendSpellFailedPacket(client, SPELL_ERROR_TAKE_EFFECT_MOREPOWERFUL);
					client->SimpleMessage(CHANNEL_COLOR_YELLOW, "The spell did not take hold as the target already has a better spell of this type.");
				}
			}
			else{
				((Entity*)target)->AddSpellEffect(spell);
				if(spell->spell->GetSpellData()->det_type > 0)
					((Entity*)target)->AddDetrimentalSpell(spell);
			}
		}

		if (replace_spell) {
			active_spells.Remove(replace_spell);
			active_spells.Add(spell);
		}
		else {
			active_spells.Add(spell);
		}

		if (spell->num_triggers > 0)
			ClientPacketFunctions::SendMaintainedExamineUpdate(client, spell->slot_pos, spell->num_triggers, 0);
		if (spell->damage_remaining > 0)
			ClientPacketFunctions::SendMaintainedExamineUpdate(client, spell->slot_pos, spell->damage_remaining, 1);

		spell->caster->GetZone()->TriggerCharSheetTimer();
	}
	spell->num_calls = 1;
	if(!spell->resisted && spell->spell->GetSpellData()->duration1 > 0){
		spell->timer.Start();
		if(spell->spell->GetSpellData()->call_frequency > 0)
			spell->timer.SetTimer(spell->spell->GetSpellData()->call_frequency*100);
		else
			spell->timer.SetTimer(spell->spell->GetSpellData()->duration1*100);
		if (active_spells.count(spell) > 0) {
			active_spells.Add(spell);
		}
	}

	// if the caster is a player and the spell is a tradeskill spell check for a tradeskill event
	if (client && spell->spell->GetSpellData()->spell_book_type == SPELL_BOOK_TYPE_TRADESKILL)
		client->GetCurrentZone()->GetTradeskillMgr()->CheckTradeskillEvent(client, spell->spell->GetSpellData()->icon);


	if (spell->spell->GetSpellData()->friendly_spell && zone->GetSpawnByID(spell->initial_target))
		spell->caster->CheckProcs(PROC_TYPE_BENEFICIAL, zone->GetSpawnByID(spell->initial_target));
	// Check HO's
	if (client && !in_heroic_opp) {
		HeroicOP* ho = nullptr;
		Spell* ho_spell = nullptr;
		int32 ho_target = 0;

		MSoloHO.writelock(__FUNCTION__, __LINE__);
		MGroupHO.writelock(__FUNCTION__, __LINE__);
		map<Client*, HeroicOP*>::iterator soloItr = m_soloHO.find(client);
		if (soloItr != m_soloHO.end()) {
			ho = soloItr->second;
			bool match = false;
			LogWrite(SPELL__ERROR, 0, "HO", "target = %u", ho->GetTarget());
			spell->MSpellTargets.readlock(__FUNCTION__, __LINE__);
			for (int8 i = 0; i < spell->targets.size(); i++) {
				LogWrite(SPELL__ERROR, 0, "HO", "%u", spell->targets.at(i));
				if (spell->targets.at(i) == ho->GetTarget()) {
					match = true;
					LogWrite(SPELL__ERROR, 0, "HO", "match found");
					break;
				}
			}
			spell->MSpellTargets.releasereadlock(__FUNCTION__, __LINE__);
			if (match && ho->UpdateHeroicOP(spell->spell->GetSpellIconHeroicOp())) {
				ClientPacketFunctions::SendHeroicOPUpdate(client, ho);
				if (ho->GetComplete() > 0) {
					ho_spell = master_spell_list.GetSpell(ho->GetWheel()->spell_id, 1);
					ho_target = ho->GetTarget();
					if (!ho_spell)
						LogWrite(SPELL__ERROR, 0, "HO", "Invalid spell for a HO, spell id = %u", ho->GetWheel()->spell_id);

					safe_delete(ho);
					m_soloHO.erase(soloItr);
				}
			}
		}
		else if (client->GetPlayer()->GetGroupMemberInfo()) {
			map<int32, HeroicOP*>::iterator groupItr = m_groupHO.find(client->GetPlayer()->GetGroupMemberInfo()->group_id);
			if (groupItr != m_groupHO.end()) {
				ho = groupItr->second;
				int32 group_id = client->GetPlayer()->GetGroupMemberInfo()->group_id;
				spell->MSpellTargets.readlock(__FUNCTION__, __LINE__);
				if (spell->targets.at(0) == ho->GetTarget() && ho->UpdateHeroicOP(spell->spell->GetSpellIconHeroicOp())) {
					spell->MSpellTargets.releasereadlock(__FUNCTION__, __LINE__);

					world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);
					deque<GroupMemberInfo*>::iterator itr;
					PlayerGroup* group = world.GetGroupManager()->GetGroup(group_id);
					if (group)
					{
						group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
						deque<GroupMemberInfo*>* members = group->GetMembers();
						for (itr = members->begin(); itr != members->end(); itr++) {
							if ((*itr)->client)
								ClientPacketFunctions::SendHeroicOPUpdate((*itr)->client, ho);
						}
						group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
					}
					world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);

					if (ho->GetComplete() > 0) {
						ho_spell = master_spell_list.GetSpell(ho->GetWheel()->spell_id, 1);
						ho_target = ho->GetTarget();
						if (!ho_spell)
							LogWrite(SPELL__ERROR, 0, "HO", "Invalid spell for a HO, spell id = %u", ho->GetWheel()->spell_id);

						safe_delete(ho);
						m_groupHO.erase(groupItr);
					}
				}
				else
					spell->MSpellTargets.releasereadlock(__FUNCTION__, __LINE__);
			}
		}
		MGroupHO.releasewritelock(__FUNCTION__, __LINE__);
		MSoloHO.releasewritelock(__FUNCTION__, __LINE__);

		if (ho_spell && ho_target != 0)
			client->GetCurrentZone()->ProcessSpell(ho_spell, client->GetPlayer(), spell->caster->GetZone()->GetSpawnByID(ho_target));

	}

	if (spell->spell->GetSpellData()->friendly_spell == 1 && spell->initial_target)
		spell->caster->CheckProcs(PROC_TYPE_BENEFICIAL, spell->caster->GetZone()->GetSpawnByID(spell->initial_target));

	if (!passive)
		SendFinishedCast(spell, client);

	return true;
}

bool SpellProcess::CastProcessedEntityCommand(EntityCommand* entity_command, Client* client, Spawn* target, bool in_heroic_opp) {
	bool ret = false;
	if (entity_command && client) {
		UnlockAllSpells(client);
		client->GetPlayer()->IsCasting(false);
		if (entity_command->cast_time == 0) {
			client->GetPlayer()->GetZone()->CallSpawnScript(target, SPAWN_SCRIPT_CASTED_ON, client->GetPlayer(), entity_command->command.c_str());
			ret = true;
		}
		if (!ret) {
			PacketStruct* packet = configReader.getStruct("WS_FinishCastSpell", client->GetVersion());
			if (packet) {
				packet->setMediumStringByName("spell_name", entity_command->name.c_str());		
				client->QueuePacket(packet->serialize());
				safe_delete(packet);
				SendSpellBookUpdate(client);
				client->GetPlayer()->GetZone()->CallSpawnScript(target, SPAWN_SCRIPT_CASTED_ON, client->GetPlayer(), entity_command->command.c_str());
				ret = true;
			}
		}
		if (ret) {
			EQ2_16BitString command;
			command.data = entity_command->command;
			command.size = entity_command->command.length();
			int32 handler = commands.GetCommandHandler(command.data.c_str());
			if (handler != 0xFFFFFFFF && handler < 999)
				commands.Process(handler, &command, client, target);
		}
	}
	return ret;
}

void SpellProcess::Interrupted(Entity* caster, Spawn* interruptor, int16 error_code, bool cancel, bool from_movement)
{
	if(caster)
	{
		LogWrite(SPELL__DEBUG, 0, "Spell", "'%s' is Interrupting spell of '%s'...", interruptor ? interruptor->GetName() : "unknown", caster->GetName());
		LuaSpell* spell = GetLuaSpell(caster);

		if (spell && ((from_movement && !spell->spell->GetSpellData()->cast_while_moving) || (!from_movement && spell->spell->GetSpellData()->interruptable) ||
			cancel)) 
		{
			Spawn* target = GetSpellTarget(caster);
			InterruptStruct* interrupt = new InterruptStruct;
			interrupt->interrupted = caster;
			interrupt->spell = spell;
			interrupt->target = target;
			interrupt->error_code = error_code;
			spell->interrupted = true;
			interrupt_list.Add(interrupt);

			Client* client = 0;
			if(interruptor && interruptor->IsPlayer())
			{
				client = interruptor->GetZone()->GetClientBySpawn(interruptor);
				client->Message(CHANNEL_SPELLS_OTHER, "You interrupt %s's ability to cast!", interruptor->GetName());
			}
			
		}
	}
}

void SpellProcess::RemoveSpellTimersFromSpawn(Spawn* spawn, bool remove_all, bool delete_recast){
	int32 i = 0;
	if(cast_timers.size() > 0){		
		CastTimer* cast_timer = 0;
		MutexList<CastTimer*>::iterator itr = cast_timers.begin();
		while(itr.Next()){
			 cast_timer = itr->value;
			 if(cast_timer && cast_timer->spell && cast_timer->spell->caster == spawn){
				cast_timer->spell->caster = 0;
				cast_timer->delete_timer = true;
			 }
		}
	}
	if(remove_all){				
		LuaSpell* spell = 0;
		MutexList<LuaSpell*>::iterator itr = active_spells.begin();
		while(itr.Next()){
			spell = itr->value;
			if (!spell)
				continue;
			if (spell->spell->GetSpellData()->persist_though_death)
				continue;
			if(spell->caster == spawn){
				DeleteCasterSpell(spell, "expired");
				continue;
			}

			spell->MSpellTargets.readlock(__FUNCTION__, __LINE__);
			for (i = 0; i < spell->targets.size(); i++){
				if (spawn->GetID() == spell->targets.at(i)){
					if (spawn->IsEntity())
						((Entity*)spawn)->RemoveSpellEffect(spell);
					RemoveTargetFromSpell(spell, spawn);
					break;
				}
			}
			spell->MSpellTargets.releasereadlock(__FUNCTION__, __LINE__);
		}
		if(recast_timers.size() > 0 && delete_recast){			
			RecastTimer* recast_timer = 0;
			MutexList<RecastTimer*>::iterator itr = recast_timers.begin();
			while(itr.Next()){
				recast_timer = itr->value;
				if(recast_timer && recast_timer->caster == spawn){
					safe_delete(recast_timer->timer);
					recast_timers.Remove(recast_timer, true);
				}
			}
		}
		if(spell_que.size() > 0 && spawn->IsEntity()){
			spell_que.erase((Entity*)spawn);
		}
		if(interrupt_list.size() > 0){			
			InterruptStruct* interrupt = 0;
			MutexList<InterruptStruct*>::iterator itr = interrupt_list.begin();
			while(itr.Next()){
				interrupt = itr->value;
				if(interrupt && interrupt->interrupted == spawn){
					interrupt_list.Remove(interrupt);
				}
			}
		}
	}
}

void SpellProcess::GetSpellTargets(LuaSpell* luaspell) 
{
	if (luaspell && luaspell->spell && luaspell->caster && luaspell->spell->GetSpellData()->max_aoe_targets == 0) 
	{
		int8 target_type = luaspell->spell->GetSpellData()->target_type;
		Spawn* caster = luaspell->caster;
		Spawn* target = caster->GetZone()->GetSpawnByID(luaspell->initial_target);
		SpellData* data = luaspell->spell->GetSpellData();
		bool implied = false;
		Spawn* secondary_target = nullptr;
		
		//implied target check -- only use this for players
		if (target && (target_type == SPELL_TARGET_ENEMY || target_type == SPELL_TARGET_ENEMY_CORPSE || target_type == SPELL_TARGET_GROUP_CORPSE || target_type == SPELL_TARGET_OTHER_GROUP_AE))
		{
			if (caster->IsPlayer() && target->HasTarget())
			{
				secondary_target = target->GetTarget();
				if (secondary_target) {
					// check if spell is friendly
					if (data->friendly_spell) {
						//if target is NPC (and not a bot) on friendly spell, check to see if target is friendly
						if (target->IsNPC() && !target->IsBot()) {
							if (!target->IsPet() || (target->IsPet() && ((NPC*)target)->GetOwner()->IsNPC())) {
								if (secondary_target->IsPlayer()) {
									implied = true;
								}
								else if (secondary_target->IsPet() && ((NPC*)secondary_target)->GetOwner()->IsPlayer())
									implied = true;
							}
						}
					}   // if spell is not friendly
					else {   // check if there is an implied target for this non-friendly spell
						if (target->IsPlayer() || (target->IsPet() && ((NPC*)target)->GetOwner()->IsPlayer())) {
							if (secondary_target->IsNPC()) {
								if (!secondary_target->IsPet() || (secondary_target->IsPet() && ((NPC*)secondary_target)->GetOwner()->IsNPC())) {
									implied = true;
								}
							}
							else if (target->IsPlayer() && ((Entity*)caster)->AttackAllowed((Entity*)target))
							{
								secondary_target = target;
								implied = true;
								luaspell->initial_target = target->GetID();
								luaspell->targets.push_back(target->GetID());
								GetPlayerGroupTargets((Player*)target, caster, luaspell);

							}
							else if (target->IsPlayer() && ((Entity*)caster)->AttackAllowed((Entity*)secondary_target))
							{
								implied = true;
								luaspell->initial_target = secondary_target->GetID();
								luaspell->targets.push_back(secondary_target->GetID());
								GetPlayerGroupTargets((Player*)secondary_target, caster, luaspell);
							}
						}
					} // end friendly spell check
				}
			}
			else if (caster->IsPlayer()) {
				if (data->friendly_spell) {
					if (target->IsNPC() && !target->IsBot()) {
						if (!target->IsPet() || (target->IsPet() && ((NPC*)target)->GetOwner()->IsNPC())) {
							target = caster;
							luaspell->initial_target = caster->GetID();
						}
					}
				}
				else
				{
					if (target->IsPlayer() && ((Entity*)caster)->AttackAllowed((Entity*)target)) {
						luaspell->initial_target = target->GetID();
						luaspell->targets.push_back(target->GetID());
					}
				}
			}
		}
		else if (target_type == SPELL_TARGET_GROUP_AE || target_type == SPELL_TARGET_RAID_AE) {

			// player handling
			if (target)
			{
				if (data->icon_backdrop == 316) // using TARGET backdrop icon
				{
					// PLAYER LOGIC:
					if ((target->IsPlayer() && luaspell->caster->IsPlayer() && target != luaspell->caster && ((Player*)target)->GetGroupMemberInfo() != NULL && ((Player*)luaspell->caster)->GetGroupMemberInfo() != NULL
						&& ((Player*)target)->GetGroupMemberInfo()->group_id == ((Player*)luaspell->caster)->GetGroupMemberInfo()->group_id))
					{
						GetPlayerGroupTargets((Player*)target, caster, luaspell, true, false);
					}//TODO: NEED RAID SUPPORT

					// NPC LOGIC:
					else if (target->group_id > 0 && target->group_id == luaspell->caster->group_id)
					{

					}
					else
					{
						// add self
						target = NULL;
						luaspell->targets.push_back(caster->GetID());
						luaspell->initial_target = 0;
					}
				}
				else // default self cast for group/raid AE
				{
					target = caster;
					luaspell->initial_target = caster->GetID();
				}
				// spell target versus self cast
			}
			else  if (data->icon_backdrop != 316) // default self cast for group/raid AE and not using TARGET backdrop icon
			{
				target = caster;
				luaspell->initial_target = caster->GetID();
			}
		}
		else if (target_type == SPELL_TARGET_SELF){
			target = caster;
			luaspell->initial_target = caster->GetID();
		}

		//if using implied target, target = the implied target
		if (implied)
		{
			target = secondary_target;
			luaspell->initial_target = secondary_target->GetID();
		}

		luaspell->MSpellTargets.writelock(__FUNCTION__, __LINE__);
		// Group AE type                            NOTE: Add support for RAID AE to affect raid members once raids have been completed
		if (target_type == SPELL_TARGET_GROUP_AE || target_type == SPELL_TARGET_RAID_AE) 
		{
			if (data->icon_backdrop == 316) // single target in a group/raid
			{
				if (target)
					luaspell->targets.push_back(target->GetID());
			}
			// is friendly
			else if (data->friendly_spell) 
			{
				// caster is an Entity
				if (luaspell->caster->IsEntity()) 
				{
					// entity caster is in a player group
					if (((Entity*)caster)->GetGroupMemberInfo()) 
					{
						world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);

						// get group members
						PlayerGroup* group = world.GetGroupManager()->GetGroup(((Entity*)caster)->GetGroupMemberInfo()->group_id);
						if (group)
						{
							group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
							deque<GroupMemberInfo*>* members = group->GetMembers();
							deque<GroupMemberInfo*>::iterator itr;

							// iterate through list of group members
							for (itr = members->begin(); itr != members->end(); itr++)
							{
								// get group member player info
								Entity* group_member = (*itr)->member;

								// if the group member is in the casters zone, and is alive
								if (group_member->GetZone() == luaspell->caster->GetZone() && group_member->Alive()) {
									luaspell->targets.push_back(group_member->GetID());
									if (group_member->HasPet()) {
										Entity* pet = group_member->GetPet();
										if (!pet)
											pet = group_member->GetCharmedPet();
										if (pet)
											luaspell->targets.push_back(pet->GetID());
									}
								}
							}
							group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
						}

						world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);
					}
					else
						luaspell->targets.push_back(caster->GetID()); // else caster is not in a group, thus alone
				}
				else if (caster->IsNPC()) // caster is NOT a player
				{
					// caster is NPC and in a spawn group with other NPCs
					vector<Spawn*>* group = ((NPC*)caster)->GetSpawnGroup();
					if (group) 
					{
						vector<Spawn*>::iterator itr;

						for (itr = group->begin(); itr != group->end(); itr++) 
						{
							Spawn* group_member = *itr;

							if (group_member->IsNPC() && group_member->Alive()){
								luaspell->targets.push_back(group_member->GetID());
								if (((Entity*)group_member)->HasPet()){
									Entity* pet = ((Entity*)group_member)->GetPet();
									if (pet)
									    luaspell->targets.push_back(pet->GetID());
									pet = ((Entity*)group_member)->GetCharmedPet();
									if (pet)
										luaspell->targets.push_back(pet->GetID());
								}
							}
						}
					}
					else
						luaspell->targets.push_back(caster->GetID());

					safe_delete(group);
				} // end is player
			} // end is friendly
		} // end is Group AE

		else if (target_type == SPELL_TARGET_SELF && caster)
			luaspell->targets.push_back(caster->GetID()); // if spell is SELF, return caster

		else if (target_type == SPELL_TARGET_CASTER_PET && caster && caster->IsEntity() && ((Entity*)caster)->HasPet()) {
			if (((Entity*)caster)->GetPet())
				luaspell->targets.push_back(((Entity*)caster)->GetPet()->GetID());
			if (((Entity*)caster)->GetCharmedPet())
				luaspell->targets.push_back(((Entity*)caster)->GetCharmedPet()->GetID());
		}

		else if (target_type == SPELL_TARGET_ENEMY && target && target->Alive()) // if target is enemy, and is alive
		{
			// if friendly spell
			if (data->friendly_spell > 0) 
			{
				// if caster is a player
				if (caster->IsPlayer()) 
				{
					// if spell can affect raid, only group members or is a group spell
					if (data->can_effect_raid > 0 || data->affect_only_group_members > 0 || data->group_spell > 0) 
					{
						// if caster is in a group, and target is a player and targeted player is a group member
						if (((Player*)caster)->GetGroupMemberInfo() && (target->IsPlayer() || target->IsBot()) && ((Player*)caster)->IsGroupMember((Entity*)target))
							luaspell->targets.push_back(target->GetID()); // return the target
						else
							luaspell->targets.push_back(caster->GetID()); // else return the caster
					}
					else if (target->IsPlayer() || target->IsBot()) // else it is not raid, group only or group spell
						luaspell->targets.push_back(target->GetID()); // return target for single spell
					else
						luaspell->targets.push_back(caster->GetID()); // and if no target, cast on self
				}
				else if (caster->IsNPC()) // caster is an NPC
				{
					// if NPC's spell can affect raid, only group members or is a group spell
					if (data->can_effect_raid > 0 || data->affect_only_group_members > 0 || data->group_spell > 0) 
					{
						if (caster->IsBot() && (target->IsBot() || target->IsPlayer())) {
							GroupMemberInfo* gmi = ((Entity*)caster)->GetGroupMemberInfo();
							if (gmi && target->IsEntity() && world.GetGroupManager()->IsInGroup(gmi->group_id, (Entity*)target)) {
								luaspell->targets.push_back(target->GetID()); // return the target
							}
							else
								luaspell->targets.push_back(caster->GetID()); // else return the caster
						}
						// if NPC caster is in a group, and target is a player and targeted player is a group member
						else if (((NPC*)caster)->HasSpawnGroup() && target->IsNPC() && ((NPC*)caster)->IsInSpawnGroup((NPC*)target))
							luaspell->targets.push_back(target->GetID()); // return the target
						else
							luaspell->targets.push_back(caster->GetID()); // else return the caster
					}
					else if (target->IsNPC())
						luaspell->targets.push_back(target->GetID()); // return target for single spell
					else {
						if (caster->IsBot() && (target->IsBot() || target->IsPlayer()))
							luaspell->targets.push_back(target->GetID());
						else
							luaspell->targets.push_back(caster->GetID()); // and if no target, cast on self
					}
				} // end is player
			} // end is friendly

			else if (target && data->group_spell > 0 || data->icon_backdrop == 312) // is not friendly, but is a group spell, icon_backdrop 312 is green (encounter AE)
			{
				// target is non-player
				if (target->IsNPC())
				{
					// Check to see if the npc is a spawn group by getting the group and checikng if valid
					vector<Spawn*>* group = ((NPC*)target)->GetSpawnGroup();
					if (group) 
					{
						vector<Spawn*>::iterator itr;

						// iterate through spawn group members
						for (itr = group->begin(); itr != group->end(); itr++) 
						{
							Spawn* group_member = *itr;

							// if NPC group member is (still) an NPC (wtf?) and is alive, send the NPC group member back as a successful target of non-friendly spell
							if (group_member->IsNPC() && group_member->Alive() && !((Entity*)group_member)->IsAOEImmune() && (!((Entity*)group_member)->IsMezzed() || group_member == target))
								luaspell->targets.push_back(group_member->GetID());

							// note: this should generate some hate towards the caster
						}
					} // end is spawngroup
					else
						luaspell->targets.push_back(target->GetID()); // return single target NPC for non-friendly spell

					safe_delete(group);
				} // end is NPC

				else if (target->IsPlayer() && caster->IsNPC()) // the NPC is casting on a player
				{
					// player is in a group
					if (((Player*)target)->GetGroupMemberInfo()) 
					{
						world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);

						deque<GroupMemberInfo*>::iterator itr;
						PlayerGroup* group = world.GetGroupManager()->GetGroup(((Player*)target)->GetGroupMemberInfo()->group_id);
						if (group)
						{
							group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
							deque<GroupMemberInfo*>* members = group->GetMembers();

							// iterate through players group members
							for (itr = members->begin(); itr != members->end(); itr++)
							{
								Entity* group_member = (*itr)->member;

								// if the group member is in the same zone as caster, and group member is alive, and group member is within distance
								if (group_member->GetZone() == caster->GetZone() && group_member->Alive() && caster->GetDistance(group_member) <= data->range
									&& (group_member == target || !group_member->IsAOEImmune()))
									luaspell->targets.push_back(group_member->GetID()); // add as target
							}
							group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
						}

						world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);
					}
					else
						luaspell->targets.push_back(target->GetID()); // player not in group
				} // end is caster player or npc
			}
			else if (target)
				luaspell->targets.push_back(target->GetID()); // is not friendly nor a group spell
		}
		//Rez spells
		else if(target && target_type == SPELL_TARGET_ENEMY_CORPSE){
			//is friendly
			if(data->friendly_spell){
				//target is player
				if(target->IsPlayer()){
					luaspell->targets.push_back(target->GetID());
				}
			}
		}
		else if(target_type == SPELL_TARGET_GROUP_CORPSE){
			//is friendly
			if(data->friendly_spell){
				//target is player
				if(target && target->IsPlayer()){
					//if target has group
					if(((Player*)target)->GetGroupMemberInfo()) {
						world.GetGroupManager()->GroupLock(__FUNCTION__, __LINE__);

						deque<GroupMemberInfo*>::iterator itr;
						PlayerGroup* group = world.GetGroupManager()->GetGroup(((Player*)target)->GetGroupMemberInfo()->group_id);
						if (group)
						{
							group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
							deque<GroupMemberInfo*>* members = group->GetMembers();
							Entity* group_member = 0;
							for (itr = members->begin(); itr != members->end(); itr++) {
								group_member = (*itr)->member;
								//Check if group member is in the same zone in range of the spell and dead
								if (group_member->GetZone() == target->GetZone() && !group_member->Alive() && target->GetDistance(group_member) <= data->radius) {
									luaspell->targets.push_back(group_member->GetID());
								}
							}
							group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
						}

						world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);
					}
					else
						luaspell->targets.push_back(target->GetID());
				}
			}
		}
		luaspell->MSpellTargets.releasewritelock(__FUNCTION__, __LINE__);
	}

	if (luaspell && luaspell->targets.size() > 20)
		LogWrite(SPELL__WARNING, 0, "Spell", "Warning in %s: Size of targets array is %u", __FUNCTION__, luaspell->targets.size());
}

void SpellProcess::GetPlayerGroupTargets(Player* target, Spawn* caster, LuaSpell* luaspell, bool bypassSpellChecks, bool bypassRangeChecks)
{
	if (bypassSpellChecks || luaspell->spell->GetSpellData()->group_spell > 0 || luaspell->spell->GetSpellData()->icon_backdrop == 312)
	{
		if (((Player*)target)->GetGroupMemberInfo())
		{
			PlayerGroup* group = world.GetGroupManager()->GetGroup(((Player*)target)->GetGroupMemberInfo()->group_id);
			if (group)
			{
				group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
				deque<GroupMemberInfo*>* members = group->GetMembers();
				deque<GroupMemberInfo*>::iterator itr;
				GroupMemberInfo* info = 0;

				for (itr = members->begin(); itr != members->end(); itr++) {
					info = *itr;
					if (info == ((Player*)target)->GetGroupMemberInfo())
						continue;
					else if (info && info->client &&
						info->client->GetPlayer()->GetZone() == ((Player*)target)->GetZone() && info->client->GetPlayer()->Alive()
						&& (bypassRangeChecks || caster->GetDistance((Entity*)info->client->GetPlayer()) <= luaspell->spell->GetSpellData()->range))
					{
						luaspell->targets.push_back(info->client->GetPlayer()->GetID());
					}
				}
				group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
			}
		}
	}
}

void SpellProcess::GetSpellTargetsTrueAOE(LuaSpell* luaspell) {
	if (luaspell && luaspell->caster && luaspell->spell && luaspell->spell->GetSpellData()->max_aoe_targets > 0) {
		if (luaspell->caster->HasTarget() && luaspell->caster->GetTarget() != luaspell->caster){
			//Check if the caster has an implied target
			if (luaspell->caster->GetDistance(luaspell->caster->GetTarget()) <= luaspell->spell->GetSpellData()->radius)
				luaspell->initial_target = luaspell->caster->GetTarget()->GetID();
		}
		int32 ignore_target = 0;
		vector<Spawn*> spawns = luaspell->caster->GetZone()->GetAttackableSpawnsByDistance(luaspell->caster, luaspell->spell->GetSpellData()->radius);
		luaspell->MSpellTargets.writelock(__FUNCTION__, __LINE__);
		for (int8 i = 0; i < spawns.size(); i++) {
			Spawn* spawn = spawns.at(i);
			if (i == 0){
				if (luaspell->initial_target && luaspell->caster->GetID() != luaspell->initial_target){
					//this is the "Direct" target and aoe can't be avoided
					luaspell->targets.push_back(luaspell->initial_target);
					ignore_target = luaspell->initial_target;
				}
				if (luaspell->targets.size() >= luaspell->spell->GetSpellData()->max_aoe_targets)
					break;
			}
			//If we have already added this spawn, check the next spawn in the list
			if (spawn && spawn->GetID() == ignore_target){
				i++;
				if (i < spawns.size())
					spawn = spawns.at(i);
				else
					break;
			}
			if (spawn){
				//If this spawn is immune to aoe, continue
				if (((Entity*)spawn)->IsAOEImmune() || ((Entity*)spawn)->IsMezzed())
					continue;
				luaspell->targets.push_back(spawn->GetID());
			}

			if (luaspell->targets.size() >= luaspell->spell->GetSpellData()->max_aoe_targets)
				break;
		}
		luaspell->MSpellTargets.releasewritelock(__FUNCTION__, __LINE__);
	}
	if (luaspell->targets.size() > 20)
		LogWrite(SPELL__DEBUG, 0, "Spell", "Warning in  SpellProcess::GetSpellTargetsTrueAOE Size of targets array is %u", luaspell->targets.size());
}

void SpellProcess::AddSpellScriptTimer(SpellScriptTimer* timer) {
	MSpellScriptTimers.writelock(__FUNCTION__, __LINE__);
	m_spellScriptList.push_back(timer);
	MSpellScriptTimers.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::RemoveSpellScriptTimer(SpellScriptTimer* timer, bool locked) {
	if (m_spellScriptList.size() == 0)
		return;

	vector<SpellScriptTimer*>::iterator itr;
	if(!locked)
		MSpellScriptTimers.writelock(__FUNCTION__, __LINE__);
	for (itr = m_spellScriptList.begin(); itr != m_spellScriptList.end(); itr++) {
		if ((*itr) == timer) {
			SpellScriptTimer* timer = *itr;
			if ((*itr) && (*itr)->deleteWhenDone && lua_interface) {
				lua_interface->AddPendingSpellDelete(timer->spell);
			}
			m_spellScriptList.erase(itr);
			safe_delete(timer);
			break;
		}
	}

	if(!locked)
		MSpellScriptTimers.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::RemoveSpellScriptTimerBySpell(LuaSpell* spell, bool clearPendingDeletes) {
	vector<SpellScriptTimer*>::iterator itr;
	MSpellScriptTimers.writelock(__FUNCTION__, __LINE__);

	if (lua_interface && clearPendingDeletes)
		lua_interface->DeletePendingSpell(spell);

	if (m_spellScriptList.size() == 0)
	{
		MSpellScriptTimers.releasewritelock(__FUNCTION__, __LINE__);
		return;
	}

	for (itr = m_spellScriptList.begin(); itr != m_spellScriptList.end(); ) {
		if ((*itr)->spell == spell)
		{
			vector<SpellScriptTimer*>::iterator cur = itr;
			SpellScriptTimer* timer = *itr;
			m_spellScriptList.erase(cur);
			safe_delete(timer);
			break;
		}
		else
			itr++;
	}
	MSpellScriptTimers.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::CheckSpellScriptTimers() {
	vector<SpellScriptTimer*>::iterator itr;
	vector<SpellScriptTimer*> temp_list;
	
	MSpellScriptTimers.writelock(__FUNCTION__, __LINE__);
	for (itr = m_spellScriptList.begin(); itr != m_spellScriptList.end(); itr++) {
		if (Timer::GetCurrentTime2() >= (*itr)->time) {
			temp_list.push_back((*itr));
			ProcessSpell((*itr)->spell, false, (*itr)->customFunction.c_str(), (*itr));
		}
	}

	for (itr = temp_list.begin(); itr != temp_list.end(); itr++) {
		RemoveSpellScriptTimer(*itr, true);
	}
	MSpellScriptTimers.releasewritelock(__FUNCTION__, __LINE__);
}

bool SpellProcess::SpellScriptTimersHasSpell(LuaSpell* spell) {
	bool ret = false;
	vector<SpellScriptTimer*>::iterator itr;

	MSpellScriptTimers.readlock(__FUNCTION__, __LINE__);
	for (itr = m_spellScriptList.begin(); itr != m_spellScriptList.end(); itr++) {
		SpellScriptTimer* timer = *itr;
		if (timer && timer->spell == spell) {
			ret = true;
			break;
		}
	}
	MSpellScriptTimers.releasereadlock(__FUNCTION__, __LINE__);

	return ret;
}

void SpellProcess::ClearSpellScriptTimerList() {
	vector<SpellScriptTimer*>::iterator itr;
	MSpellScriptTimers.writelock(__FUNCTION__, __LINE__);

	for(itr = m_spellScriptList.begin(); itr != m_spellScriptList.end(); itr++) {
		if ((*itr) && (*itr)->deleteWhenDone && lua_interface)
			lua_interface->AddPendingSpellDelete((*itr)->spell);

		safe_delete((*itr));
	}

	m_spellScriptList.clear();
	MSpellScriptTimers.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::RemoveTargetFromSpell(LuaSpell* spell, Spawn* target){
	if (!spell || !target)
		return;

	MRemoveTargetList.writelock(__FUNCTION__, __LINE__);

	if (!remove_target_list[spell])
		remove_target_list[spell] = new vector<int32>;
	remove_target_list[spell]->push_back(target->GetID());
	
	MRemoveTargetList.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::CheckRemoveTargetFromSpell(LuaSpell* spell, bool allow_delete){
	if (!spell)
		return;

	if (remove_target_list.size() > 0){
		map<LuaSpell*, vector<int32>*>::iterator remove_itr;
		vector<int32>::iterator remove_target_itr;
		vector<int32>::iterator target_itr;
		vector<int32>* targets;
		vector<int32>* remove_targets = 0;
		Spawn* remove_spawn = 0;
		bool should_delete = false;

		MRemoveTargetList.writelock(__FUNCTION__, __LINE__);
		for (remove_itr = remove_target_list.begin(); remove_itr != remove_target_list.end(); remove_itr++){
			if (remove_itr->first == spell){
				targets = &spell->targets;
				remove_targets = remove_itr->second;
				if (remove_targets && targets){
					for (remove_target_itr = remove_targets->begin(); remove_target_itr != remove_targets->end(); remove_target_itr++){
						remove_spawn = spell->caster->GetZone()->GetSpawnByID((*remove_target_itr));
						if (remove_spawn) {
							spell->MSpellTargets.writelock(__FUNCTION__, __LINE__);
							for (target_itr = targets->begin(); target_itr != targets->end(); target_itr++) {
								((Entity*)remove_spawn)->RemoveProc(0, spell);
								((Entity*)remove_spawn)->RemoveMaintainedSpell(spell);

								if (remove_spawn->GetID() == (*target_itr)) {
									targets->erase(target_itr);
									if (remove_spawn->IsEntity())
										((Entity*)remove_spawn)->RemoveEffectsFromLuaSpell(spell);
									break;
								}
							}
							spell->MSpellTargets.releasewritelock(__FUNCTION__, __LINE__);
							if (targets->size() == 0 && allow_delete) {
								should_delete = true;
								break;
							}
						}
					}
				}
				break;
			}
		}
		remove_target_list.erase(spell);
		if (remove_targets)
			remove_targets->clear();
		safe_delete(remove_targets);
		MRemoveTargetList.releasewritelock(__FUNCTION__, __LINE__);
		if (should_delete)
			DeleteCasterSpell(spell, "purged");
	}
}

bool SpellProcess::AddHO(Client* client, HeroicOP* ho) {
	bool ret = true;

	if (client && ho) {
		MSoloHO.writelock(__FUNCTION__, __LINE__);
		if (m_soloHO.count(client) > 0) {
			if (m_soloHO[client]->GetWheel()) {
				ret = false;
			}
			else {
				safe_delete(m_soloHO[client]);
				m_soloHO[client] = ho;
			}
		}
		else
			m_soloHO[client] = ho;
		MSoloHO.releasewritelock(__FUNCTION__, __LINE__);
	}

	return ret;
}

bool SpellProcess::AddHO(int32 group_id, HeroicOP* ho) {
	bool ret = true;

	if (group_id > 0 && ho) {
		MGroupHO.writelock(__FUNCTION__, __LINE__);
		if (m_groupHO.count(group_id) > 0) {
			if (m_groupHO[group_id]->GetWheel()) {
				ret = false;
			}
			else {
				safe_delete(m_groupHO[group_id]);
				m_groupHO[group_id] = ho;
			}
		}
		else
			m_groupHO[group_id] = ho;
		MGroupHO.releasewritelock(__FUNCTION__, __LINE__);
	}

	return ret;
}

void SpellProcess::KillHOBySpawnID(int32 spawn_id) {
	// Check solo HO's
	MSoloHO.writelock(__FUNCTION__, __LINE__);
	map<Client*, HeroicOP*>::iterator itr = m_soloHO.begin();
	map<Client*, HeroicOP*>::iterator delete_itr;
	while (itr != m_soloHO.end()) {
		if (itr->second->GetTarget() == spawn_id) {
			itr->second->SetComplete(1);
			ClientPacketFunctions::SendHeroicOPUpdate(itr->first, itr->second);
			delete_itr = itr;
			safe_delete(itr->second);
			itr++;
			m_soloHO.erase(delete_itr);
		}
		else
			itr++;
	}
	MSoloHO.releasewritelock(__FUNCTION__, __LINE__);

	// Check Group HO's
	MGroupHO.writelock(__FUNCTION__, __LINE__);
	map<int32, HeroicOP*>::iterator itr2 = m_groupHO.begin();
	map<int32, HeroicOP*>::iterator delete_itr2;
	while (itr2 != m_groupHO.end()) {
		if (itr2->second->GetTarget() == spawn_id) {
			itr2->second->SetComplete(1);

			world.GetGroupManager()->GroupLock(__FUNCTION__ , __LINE__);
			deque<GroupMemberInfo*>::iterator itr3;
			PlayerGroup* group = world.GetGroupManager()->GetGroup(itr2->first);
			if (group)
			{
				group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
				deque<GroupMemberInfo*>* members = group->GetMembers();
				for (itr3 = members->begin(); itr3 != members->end(); itr3++) {
					if ((*itr3)->client)
						ClientPacketFunctions::SendHeroicOPUpdate((*itr3)->client, itr2->second);
				}
				group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
			}
			world.GetGroupManager()->ReleaseGroupLock(__FUNCTION__, __LINE__);

			delete_itr2 = itr2;
			safe_delete(itr2->second);
			itr2++;
			m_groupHO.erase(delete_itr2);
		}
		else
			itr2++;
	}
	MGroupHO.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::AddSpellCancel(LuaSpell* spell){
	MSpellCancelList.writelock(__FUNCTION__, __LINE__);
	SpellCancelList.push_back(spell);
	MSpellCancelList.releasewritelock(__FUNCTION__, __LINE__);
}

void SpellProcess::DeleteSpell(LuaSpell* spell)
{
	RemoveSpellFromQueue(spell->spell, spell->caster);

	if (spell->spell->IsCopiedSpell())
	{
		lua_interface->RemoveCustomSpell(spell->spell->GetSpellID());
		safe_delete(spell->spell);
	}

	safe_delete(spell);
}
