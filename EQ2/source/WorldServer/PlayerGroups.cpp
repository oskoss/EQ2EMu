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

#include "PlayerGroups.h"
#include "../common/Log.h"
#include "World.h"
#include "Spells.h"
#include "LuaInterface.h"
#include "Bots/Bot.h"
#include "SpellProcess.h"
#include "Rules/Rules.h"

extern ZoneList	zone_list;
extern RuleManager rule_manager;

/******************************************************** PlayerGroup ********************************************************/

PlayerGroup::PlayerGroup(int32 id) {
	m_id = id;
	MGroupMembers.SetName("MGroupMembers");
}

PlayerGroup::~PlayerGroup() {
	Disband();
}

bool PlayerGroup::AddMember(Entity* member) {
	// Check to make sure the entity we are adding is valid
	if (!member) {
		LogWrite(GROUP__ERROR, 0, "Group", "New member is null");
		return false;
	}

	// Make sure entity we are adding isn't already in a group by checking if it has a GroupMemberInfo pointer
	if (member->GetGroupMemberInfo()) {
		LogWrite(GROUP__ERROR, 0, "Group", "New member (%s) already has a group", member->GetName());
		return false;
	}

	// Create a new GroupMemberInfo and assign it to the new member
	GroupMemberInfo* gmi = new GroupMemberInfo;
	gmi->group_id = m_id;
	gmi->member = member;
	gmi->leader = false;
	if (member->IsPlayer())
		gmi->client = member->GetZone()->GetClientBySpawn(member);
	else
		gmi->client = 0;
	gmi->mentor_target_char_id = 0;

	member->SetGroupMemberInfo(gmi);
	member->group_id = gmi->group_id;
	MGroupMembers.writelock();
	m_members.push_back(gmi);
	member->UpdateGroupMemberInfo(true, true);
	MGroupMembers.releasewritelock();

	SendGroupUpdate();
	return true;
}

bool PlayerGroup::RemoveMember(Entity* member) {
	GroupMemberInfo* gmi = member->GetGroupMemberInfo();
	if (!gmi) {
		return false;
	}

	bool ret = false;

	MGroupMembers.writelock();
	member->SetGroupMemberInfo(0);

	deque<GroupMemberInfo*>::iterator erase_itr = m_members.end();
	deque<GroupMemberInfo*>::iterator itr;
	for (itr = m_members.begin(); itr != m_members.end(); itr++) {
		if (gmi == *itr)
			erase_itr = itr;
		
		if(member->IsPlayer() && (*itr)->mentor_target_char_id == ((Player*)member)->GetCharacterID() && (*itr)->client)
		{
			(*itr)->mentor_target_char_id = 0;
			(*itr)->client->GetPlayer()->EnableResetMentorship();
		}

		if ((*itr)->client)
			(*itr)->client->GetPlayer()->SetCharSheetChanged(true);
	}
	if (erase_itr != m_members.end()) {
		ret = true;
		m_members.erase(erase_itr);
	}
	MGroupMembers.releasewritelock();

	member->SetGroupMemberInfo(nullptr);
	safe_delete(gmi);
	if (member->IsBot())
		((Bot*)member)->Camp();

	return ret;
}

void PlayerGroup::Disband() {
	deque<GroupMemberInfo*>::iterator itr;
	MGroupMembers.writelock();
	for (itr = m_members.begin(); itr != m_members.end(); itr++) {
		if ((*itr)->member) {
			(*itr)->member->SetGroupMemberInfo(0);
			if ((*itr)->member->IsBot())
				((Bot*)(*itr)->member)->Camp();
		}
		if((*itr)->mentor_target_char_id && (*itr)->client)
		{
			(*itr)->mentor_target_char_id = 0;
			(*itr)->client->GetPlayer()->EnableResetMentorship();
		}

		if ((*itr)->client)
			(*itr)->client->GetPlayer()->SetCharSheetChanged(true);

		safe_delete(*itr);
	}

	m_members.clear();
	MGroupMembers.releasewritelock();
}

void PlayerGroup::SendGroupUpdate(Client* exclude) {
	deque<GroupMemberInfo*>::iterator itr;
	MGroupMembers.readlock(__FUNCTION__, __LINE__);
	for (itr = m_members.begin(); itr != m_members.end(); itr++) {
		GroupMemberInfo* gmi = *itr;
		if (gmi->client && gmi->client != exclude && !gmi->client->IsZoning())
			gmi->client->GetPlayer()->SetCharSheetChanged(true);
	}
	MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
}

void PlayerGroup::SimpleGroupMessage(const char* message) {
	deque<GroupMemberInfo*>::iterator itr;
	MGroupMembers.readlock(__FUNCTION__, __LINE__);
	for(itr = m_members.begin(); itr != m_members.end(); itr++) {
		GroupMemberInfo* info = *itr;
		if(info->client)
			info->client->SimpleMessage(CHANNEL_GROUP_CHAT, message);
	}
	MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
}

void PlayerGroup::GroupChatMessage(Spawn* from, const char* message) {
	deque<GroupMemberInfo*>::iterator itr;
	MGroupMembers.readlock(__FUNCTION__, __LINE__);
	for(itr = m_members.begin(); itr != m_members.end(); itr++) {
		GroupMemberInfo* info = *itr;
		if(info && info->client && info->client->GetCurrentZone())
			info->client->GetCurrentZone()->HandleChatMessage(info->client, from, 0, CHANNEL_GROUP_SAY, message, 0);
	}
	MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
}

void PlayerGroup::MakeLeader(Entity* new_leader) {
	deque<GroupMemberInfo*>::iterator itr;
	MGroupMembers.readlock(__FUNCTION__, __LINE__);
	for (itr = m_members.begin(); itr != m_members.end(); itr++) {
		GroupMemberInfo* info = *itr;
		if (info->leader) {
			info->leader = false;
			break;
		}
	}
	MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);

	new_leader->GetGroupMemberInfo()->leader = true;
	SendGroupUpdate();
}



/******************************************************** PlayerGroupManager ********************************************************/

PlayerGroupManager::PlayerGroupManager() {
	m_nextGroupID = 1;

	MGroups.SetName("PlayerGroupManager::m_groups");
	MPendingInvites.SetName("PlayerGroupManager::m_pendingInvites");
}

PlayerGroupManager::~PlayerGroupManager() {
	MPendingInvites.writelock(__FUNCTION__, __LINE__);
	m_pendingInvites.clear();
	MPendingInvites.releasewritelock(__FUNCTION__, __LINE__);

	MGroups.writelock(__FUNCTION__, __LINE__);
	map<int32, PlayerGroup*>::iterator itr;
	for (itr = m_groups.begin(); itr != m_groups.end(); itr++)
		safe_delete(itr->second);

	m_groups.clear();
	MGroups.releasewritelock(__FUNCTION__, __LINE__);
}

bool PlayerGroupManager::AddGroupMember(int32 group_id, Entity* member) {
	bool ret = false;
	MGroups.writelock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0) {
		PlayerGroup* group = m_groups[group_id];
		ret = group->AddMember(member);
	}

	MGroups.releasewritelock(__FUNCTION__, __LINE__);

	return ret;
}

bool PlayerGroupManager::RemoveGroupMember(int32 group_id, Entity* member) {
	bool ret = false;
	bool remove = false;
	Client* client = 0;
	if(member->GetGroupMemberInfo()->mentor_target_char_id)
	{
		if(member->IsPlayer())
		{
			Player* tmpPlayer = (Player*)member;
			member->GetGroupMemberInfo()->mentor_target_char_id = 0;
			tmpPlayer->EnableResetMentorship();
		}
	}
	MGroups.writelock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0) {
		PlayerGroup* group = m_groups[group_id];

		LogWrite(MISC__TODO, 0, "TODO", "Update PlayerGroupManager::RemoveGroupMember() to support removing buffs from NPC group members");
		if (member->IsPlayer())
			client = member->GetGroupMemberInfo()->client;

		ret = group->RemoveMember(member);

		// If only 1 person left in the group set a flag to remove the group
		if (group->Size() == 1)
			remove = true;
	}

	MGroups.releasewritelock(__FUNCTION__, __LINE__);

	if (client)
		RemoveGroupBuffs(group_id, client);

	// Call RemoveGroup outside the locks as it uses the same locks
	if (remove)
		RemoveGroup(group_id);

	return ret;
}

void PlayerGroupManager::NewGroup(Entity* leader) {
	MGroups.writelock(__FUNCTION__, __LINE__);

	// Highly doubt this will ever be needed but putting it in any way, basically bump the id and ensure
	// no active group is currently using this id, if we hit the max for an int32 then reset the id to 1
	while (m_groups.count(m_nextGroupID) > 0) {
		// If m_nextGroupID is at its max then reset it to 1, else increment it
		if (m_nextGroupID == 4294967295)
			m_nextGroupID = 1;
		else
			m_nextGroupID++;
	}

	// Create a new group with the valid ID we got from above
	PlayerGroup* new_group = new PlayerGroup(m_nextGroupID);

	// Add the new group to the list (need to do this first, AddMember needs ref to the PlayerGroup ptr -> UpdateGroupMemberInfo)
	m_groups[m_nextGroupID] = new_group;

	// Add the leader to the group
	new_group->AddMember(leader);

	leader->GetGroupMemberInfo()->leader = true;

	MGroups.releasewritelock(__FUNCTION__, __LINE__);
}

void PlayerGroupManager::RemoveGroup(int32 group_id) {
	MGroups.writelock(__FUNCTION__, __LINE__);

	// Check to see if the id is in the list
	if (m_groups.count(group_id) > 0) {
		// Get a pointer to the group
		PlayerGroup* group = m_groups[group_id];
		// Erase the group from the list
		m_groups.erase(group_id);
		// Delete the group
		safe_delete(group);
	}

	MGroups.releasewritelock(__FUNCTION__, __LINE__);
}

int8 PlayerGroupManager::Invite(Player* leader, Entity* member) {
	int8 ret = 255; // Should be changed, if it is not then we have an unknown error

	// Lock the pending invite list so we can work with it
	MPendingInvites.writelock(__FUNCTION__, __LINE__);

	if (!member)
		ret = 6; // failure, not a valid target
	else if (member->IsNPC() && (!member->IsBot() /*|| !member->IsMec()*/))
		ret = 6;
	else if (leader == member)
		ret = 5; // failure, can't invite yourself
	else if (member->GetGroupMemberInfo())
		ret = 1; // failure, member already in a group
	// Check to see if the target of the invite already has a pending invite
	else if (m_pendingInvites.count(member->GetName()) > 0)
		ret = 2; // Target already has an invite
	// Check to see if the player that invited is already in a group
	else if (leader->GetGroupMemberInfo()) {
		// Read lock the group list so we can get the size of the inviters group
		MGroups.readlock(__FUNCTION__, __LINE__);
		int32 group_size = m_groups[leader->GetGroupMemberInfo()->group_id]->Size();
		MGroups.releasereadlock(__FUNCTION__, __LINE__);

		// Check to see if the group is full
		if (m_groups[leader->GetGroupMemberInfo()->group_id]->Size() >= 6)
			ret = 3; // Group full
		// Group isn't full so add the member to the pending invite list
		else {
			m_pendingInvites[member->GetName()] = leader->GetName();
			ret = 0; // Success
		}
	}
	// Inviter is not in a group
	else { 
		// Check to see if the inviter has a pending invite himself
		if (m_pendingInvites.count(leader->GetName()) > 0)
			ret = 4;	// inviter already has a pending group invite
		// No pending invites for the inviter add both the inviter and the target of the invite to the list
		else {
			m_pendingInvites[leader->GetName()] = leader->GetName();
			m_pendingInvites[member->GetName()] = leader->GetName();
			ret = 0; // success
		}
	}
	// Release the lock on pending invites
	MPendingInvites.releasewritelock(__FUNCTION__, __LINE__);

	/* testing purposes only */
	if (ret == 0 && member->IsNPC())
		AcceptInvite(member);

	return ret; 
}

int8 PlayerGroupManager::AcceptInvite(Entity* member) {
	int8 ret = 3; // default to unknown error

	MPendingInvites.writelock(__FUNCTION__, __LINE__);

	if (m_pendingInvites.count(member->GetName()) > 0) {
		string leader = m_pendingInvites[member->GetName()];
		Client* client_leader = zone_list.GetClientByCharName(leader);

		if (client_leader) {
			if (m_pendingInvites.count(leader) > 0) {
				NewGroup(client_leader->GetPlayer());
				m_pendingInvites.erase(leader);
			}

			// Remove from invite list and add to the group
			m_pendingInvites.erase(member->GetName());
			AddGroupMember(client_leader->GetPlayer()->GetGroupMemberInfo()->group_id, member);
			ret = 0; // success
		}
		else {
			// Was unable to find the leader, remove from the invite list
			m_pendingInvites.erase(member->GetName());
			ret = 2; // failure, can't find leader
		}
	}
	else
		ret = 1; // failure, no pending invite

	MPendingInvites.releasewritelock(__FUNCTION__, __LINE__);

	return ret;
}

void PlayerGroupManager::DeclineInvite(Entity* member) {
	MPendingInvites.writelock(__FUNCTION__, __LINE__);

	if (m_pendingInvites.count(member->GetName()) > 0) {
		string leader = m_pendingInvites[member->GetName()];
		m_pendingInvites.erase(member->GetName());
		if (m_pendingInvites.count(leader) > 0)
			m_pendingInvites.erase(leader);
	}

	MPendingInvites.releasewritelock(__FUNCTION__, __LINE__);
}

bool PlayerGroupManager::IsGroupIDValid(int32 group_id) {
	bool ret = false;
	MGroups.readlock(__FUNCTION__, __LINE__);
	ret = m_groups.count(group_id) > 0;
	MGroups.releasereadlock(__FUNCTION__, __LINE__);
	return ret;
}

void PlayerGroupManager::SendGroupUpdate(int32 group_id, Client* exclude) {
	MGroups.writelock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0) {
		m_groups[group_id]->SendGroupUpdate(exclude);
	}

	MGroups.releasewritelock(__FUNCTION__, __LINE__);
}

PlayerGroup* PlayerGroupManager::GetGroup(int32 group_id) {
	if (m_groups.count(group_id) > 0)
		return m_groups[group_id];

	return 0;
}

void PlayerGroupManager::ClearPendingInvite(Entity* member) {
	MPendingInvites.writelock(__FUNCTION__, __LINE__);

	if (m_pendingInvites.count(member->GetName()) > 0)
		m_pendingInvites.erase(member->GetName());

	MPendingInvites.releasewritelock(__FUNCTION__, __LINE__);
}

void PlayerGroupManager::RemoveGroupBuffs(int32 group_id, Client* client) {
	SpellEffects* se = 0;
	Spell* spell = 0;
	LuaSpell* luaspell = 0;
	EQ2Packet* packet = 0;
	Entity* pet = 0;
	Player* player = 0;
	Entity* charmed_pet = 0;
	PlayerGroup* group = 0;

	MGroups.readlock(__FUNCTION__, __LINE__);
	if (m_groups.count(group_id) > 0)
		group = m_groups[group_id];

	if (group && client) {
		/* first remove all spell effects this group member has on them from other group members */
		player = client->GetPlayer();
		se = player->GetSpellEffects();
		for (int i = 0; i < NUM_SPELL_EFFECTS; i++) {
			if (se[i].spell_id != 0xFFFFFFFF) {
				//If the client is the caster, don't remove the spell
				if (se[i].caster == player)
					continue;

				luaspell = se[i].spell;
				spell = luaspell->spell;
				/* is this a friendly group spell? */
				if (spell && spell->GetSpellData()->group_spell && spell->GetSpellData()->friendly_spell) {

					//Remove all group buffs not cast by this player
					player->RemoveSpellEffect(luaspell);
					player->RemoveSpellBonus(luaspell);
					player->RemoveSkillBonus(spell->GetSpellID());

					//Also remove group buffs from pets
					pet = 0;
					charmed_pet = 0;
					if (player->HasPet()){
						pet = player->GetPet();
						pet = player->GetCharmedPet();
					}
					if (pet){
						pet->RemoveSpellEffect(luaspell);
						pet->RemoveSpellBonus(luaspell);
					}
					if (charmed_pet){
						charmed_pet->RemoveSpellEffect(luaspell);
						charmed_pet->RemoveSpellBonus(luaspell);
					}
				}
			}
		}
		packet = client->GetPlayer()->GetSkills()->GetSkillPacket(client->GetVersion());
		if (packet)
			client->QueuePacket(packet);
	}
	MGroups.releasereadlock(__FUNCTION__, __LINE__);
}

int32 PlayerGroupManager::GetGroupSize(int32 group_id) {
	int32 ret = 0;
	MGroups.readlock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0)
		ret = m_groups[group_id]->Size();

	MGroups.releasereadlock(__FUNCTION__, __LINE__);

	return ret;
}

void PlayerGroupManager::SendGroupQuests(int32 group_id, Client* client) {
	GroupMemberInfo* info = 0;
	MGroups.readlock(__FUNCTION__, __LINE__);
	if (m_groups.count(group_id) > 0) {
		m_groups[group_id]->MGroupMembers.readlock(__FUNCTION__, __LINE__);
		deque<GroupMemberInfo*>* members = m_groups[group_id]->GetMembers();
		deque<GroupMemberInfo*>::iterator itr;
		for (itr = members->begin(); itr != members->end(); itr++) {
			info = *itr;
			if (info->client) {
				LogWrite(PLAYER__DEBUG, 0, "Player", "Send Quest Journal...");
				info->client->SendQuestJournal(false, client);
				client->SendQuestJournal(false, info->client);
			}
		}
		m_groups[group_id]->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
	}
	MGroups.releasereadlock(__FUNCTION__, __LINE__);
}

bool PlayerGroupManager::HasGroupCompletedQuest(int32 group_id, int32 quest_id) {
	bool questComplete = true;
	GroupMemberInfo* info = 0;
	MGroups.readlock(__FUNCTION__, __LINE__);
	if (m_groups.count(group_id) > 0) {
		m_groups[group_id]->MGroupMembers.readlock(__FUNCTION__, __LINE__);
		deque<GroupMemberInfo*>* members = m_groups[group_id]->GetMembers();
		deque<GroupMemberInfo*>::iterator itr;
		for (itr = members->begin(); itr != members->end(); itr++) {
			info = *itr;
			if (info->client) {
				bool isComplete = info->client->GetPlayer()->GetCompletedQuest(quest_id);
				if(!isComplete)
				{
					questComplete = isComplete;
					break;
				}
			}
		}
		m_groups[group_id]->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
	}
	MGroups.releasereadlock(__FUNCTION__, __LINE__);
	return questComplete;
}

void PlayerGroupManager::SimpleGroupMessage(int32 group_id, const char* message) {
	MGroups.readlock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0)
		m_groups[group_id]->SimpleGroupMessage(message);

	MGroups.releasereadlock(__FUNCTION__, __LINE__);
}

void PlayerGroupManager::GroupMessage(int32 group_id, const char* message, ...) {
	va_list argptr;
	char buffer[4096];
	buffer[0] = 0;
	va_start(argptr, message);
	vsnprintf(buffer, sizeof(buffer), message, argptr);
	va_end(argptr);
	SimpleGroupMessage(group_id, buffer);
}

void PlayerGroupManager::GroupChatMessage(int32 group_id, Spawn* from, const char* message) {
	MGroups.readlock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0)
		m_groups[group_id]->GroupChatMessage(from, message);

	MGroups.releasereadlock(__FUNCTION__, __LINE__);
}

void PlayerGroupManager::MakeLeader(int32 group_id, Entity* new_leader) {
	MGroups.writelock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0)
		m_groups[group_id]->MakeLeader(new_leader);

	MGroups.releasewritelock(__FUNCTION__, __LINE__);
}

void PlayerGroupManager::UpdateGroupBuffs() {
	map<int32, PlayerGroup*>::iterator itr;
	deque<GroupMemberInfo*>::iterator member_itr;
	deque<GroupMemberInfo*>::iterator target_itr;
	map<int32, SkillBonusValue*>::iterator itr_skills;
	MaintainedEffects* me = nullptr;
	LuaSpell* luaspell = nullptr;
	Spell* spell = nullptr;
	Entity* group_member = nullptr;
	SkillBonus* sb = nullptr;
	EQ2Packet* packet = nullptr;
	int32 i = 0;
	PlayerGroup* group = nullptr;
	Player* caster = nullptr;
	vector<int32> new_target_list;
	vector<int32> char_list;
	Client* client = nullptr;
	bool has_effect = false;
	vector<BonusValues*>* sb_list = nullptr;
	BonusValues* bv = nullptr;
	Entity* pet = nullptr;
	Entity* charmed_pet = nullptr;



	for (itr = m_groups.begin(); itr != m_groups.end(); itr++) {
		group = itr->second;

		/* loop through the group members and see if any of them have any maintained spells that are group buffs and friendly.
		if so, update the list of targets and apply/remove effects as needed */
		vector<Player*> players;

		group->MGroupMembers.readlock(__FUNCTION__, __LINE__);
		for (member_itr = group->GetMembers()->begin(); member_itr != group->GetMembers()->end(); member_itr++) {
			if ((*member_itr)->client)
				caster = (*member_itr)->client->GetPlayer();
			else caster = 0;

			if (!caster)
				continue;

			if (!caster->GetMaintainedSpellBySlot(0))
				continue;

			players.push_back(caster);
		}
		group->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);

		vector<Player*>::iterator vitr;

		for (vitr = players.begin(); vitr != players.end(); vitr++) {
			caster = *vitr;
			caster->GetMaintainedMutex()->readlock(__FUNCTION__, __LINE__);
			// go through the player's maintained spells
			me = caster->GetMaintainedSpells();
			for (i = 0; i < NUM_MAINTAINED_EFFECTS; i++) {
				if (me[i].spell_id == 0xFFFFFFFF)
					continue;
				luaspell = me[i].spell;

				if (!luaspell)
					continue;
				
				if (!luaspell->caster)
				{
					LogWrite(PLAYER__ERROR, 0, "Player", "Bad luaspell, caster is NULL, spellid: %u", me[i].spell_id);
					continue;
				}

				spell = luaspell->spell;

				if (spell && spell->GetSpellData()->group_spell && spell->GetSpellData()->friendly_spell &&
					(spell->GetSpellData()->target_type == SPELL_TARGET_GROUP_AE || spell->GetSpellData()->target_type == SPELL_TARGET_RAID_AE)) {

					luaspell->MSpellTargets.writelock(__FUNCTION__, __LINE__);
					luaspell->char_id_targets.clear();

					for (target_itr = group->GetMembers()->begin(); target_itr != group->GetMembers()->end(); target_itr++) {
						group_member = (*target_itr)->member;

						if (!group_member)
							continue;

						if (group_member == caster)
							continue;

						client = (*target_itr)->client;

						has_effect = false;
						
						if (group_member->GetSpellEffect(spell->GetSpellID(), caster)) {
							has_effect = true;
						}
						if(!has_effect && (std::find(luaspell->removed_targets.begin(), 
							luaspell->removed_targets.end(), group_member->GetID()) != luaspell->removed_targets.end())) {
							continue;
						}
						// Check if player is within range of the caster
						if (!rule_manager.GetGlobalRule(R_Spells, EnableCrossZoneGroupBuffs)->GetInt8() && 
								(group_member->GetZone() != caster->GetZone() || caster->GetDistance(group_member) > spell->GetSpellData()->radius)) {
							if (has_effect) {
								group_member->RemoveSpellEffect(luaspell);
								group_member->RemoveSpellBonus(luaspell);
								group_member->RemoveSkillBonus(spell->GetSpellID());
								if (client) {
									packet = ((Player*)group_member)->GetSkills()->GetSkillPacket(client->GetVersion());
									if (packet)
										client->QueuePacket(packet);
								}
								//Also remove group buffs from pet
								if (group_member->HasPet()) {
									pet = group_member->GetPet();
									charmed_pet = group_member->GetCharmedPet();
									if (pet) {
										pet->RemoveSpellEffect(luaspell);
										pet->RemoveSpellBonus(luaspell);
									}
									if (charmed_pet) {
										charmed_pet->RemoveSpellEffect(luaspell);
										charmed_pet->RemoveSpellBonus(luaspell);
									}
								}
							}
							continue;
						}

						if(group_member->GetZone() != caster->GetZone())
						{
							SpellProcess::AddSelfAndPetToCharTargets(luaspell, group_member);		
						}
						else
						{
							//this group member is a target of the spell
							new_target_list.push_back(group_member->GetID());
						}

						if (has_effect)
							continue;

						pet = 0;
						charmed_pet = 0;

						if (group_member->HasPet()) {
							pet = group_member->GetPet();
							charmed_pet = group_member->GetCharmedPet();
						}

						group_member->AddSpellEffect(luaspell, luaspell->timer.GetRemainingTime() != 0 ? luaspell->timer.GetRemainingTime() : 0);
						if (pet)
							pet->AddSpellEffect(luaspell, luaspell->timer.GetRemainingTime() != 0 ? luaspell->timer.GetRemainingTime() : 0);
						if (charmed_pet)
							charmed_pet->AddSpellEffect(luaspell, luaspell->timer.GetRemainingTime() != 0 ? luaspell->timer.GetRemainingTime() : 0);

						if (pet)
							new_target_list.push_back(pet->GetID());
						if (charmed_pet)
							new_target_list.push_back(charmed_pet->GetID());


						// look for a spell bonus on caster's spell
						sb_list = caster->GetAllSpellBonuses(luaspell);
						for (int32 x = 0; x < sb_list->size(); x++) {
							bv = sb_list->at(x);
							group_member->AddSpellBonus(luaspell, bv->type, bv->value, bv->class_req, bv->race_req, bv->faction_req);
							if (pet)
								pet->AddSpellBonus(luaspell, bv->type, bv->value, bv->class_req, bv->race_req, bv->faction_req);
							if (charmed_pet)
								charmed_pet->AddSpellBonus(luaspell, bv->type, bv->value, bv->class_req, bv->race_req, bv->faction_req);
						}

						sb_list->clear();
						safe_delete(sb_list);

						// look for a skill bonus on the caster's spell
						sb = caster->GetSkillBonus(me[i].spell_id);
						if (sb) {
							for (itr_skills = sb->skills.begin(); itr_skills != sb->skills.end(); itr_skills++)
								group_member->AddSkillBonus(sb->spell_id, (*itr_skills).second->skill_id, (*itr_skills).second->value);
						}

						if (client) {
							packet = ((Player*)group_member)->GetSkills()->GetSkillPacket(client->GetVersion());
							if (packet)
								client->QueuePacket(packet);
						}
					}

					luaspell->targets.swap(new_target_list);
					SpellProcess::AddSelfAndPet(luaspell, caster);
					luaspell->MSpellTargets.releasewritelock(__FUNCTION__, __LINE__);
					new_target_list.clear();
				}
			}
			caster->GetMaintainedMutex()->releasereadlock(__FUNCTION__, __LINE__);
		}
	}
}

bool PlayerGroupManager::IsInGroup(int32 group_id, Entity* member) {
	bool ret = false;

	MGroups.readlock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0) {
		m_groups[group_id]->MGroupMembers.readlock(__FUNCTION__, __LINE__);
		deque<GroupMemberInfo*>* members = m_groups[group_id]->GetMembers();
		for (int8 i = 0; i < members->size(); i++) {
			if (member == members->at(i)->member) {
				ret = true;
				break;
			}
		}
		m_groups[group_id]->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
	}

	MGroups.releasereadlock(__FUNCTION__, __LINE__);

	return ret;
}

Entity* PlayerGroupManager::IsPlayerInGroup(int32 group_id, int32 character_id) {
	Entity* ret = nullptr;

	MGroups.readlock(__FUNCTION__, __LINE__);

	if (m_groups.count(group_id) > 0) {
		m_groups[group_id]->MGroupMembers.readlock(__FUNCTION__, __LINE__);
		deque<GroupMemberInfo*>* members = m_groups[group_id]->GetMembers();
		for (int8 i = 0; i < members->size(); i++) {
			if (members->at(i)->member && members->at(i)->member->IsPlayer() && character_id == ((Player*)members->at(i)->member)->GetCharacterID()) {
				ret = members->at(i)->member;
				break;
			}
		}
		m_groups[group_id]->MGroupMembers.releasereadlock(__FUNCTION__, __LINE__);
	}

	MGroups.releasereadlock(__FUNCTION__, __LINE__);

	return ret;
}

void PlayerGroup::RemoveClientReference(Client* remove) {
	deque<GroupMemberInfo*>::iterator itr;
	MGroupMembers.writelock();
	for (itr = m_members.begin(); itr != m_members.end(); itr++) {
		GroupMemberInfo* gmi = *itr;
		if (gmi->client && gmi->client == remove)
		{
			gmi->client = 0;
			gmi->member = 0;
			break;
		}
	}
	MGroupMembers.releasewritelock();
}

void PlayerGroup::UpdateGroupMemberInfo(Entity* ent, bool groupMembersLocked) {
	Player* player = (Player*)ent;

	if (!player || !player->GetGroupMemberInfo())
		return;

	if(!groupMembersLocked)
		MGroupMembers.writelock();

	GroupMemberInfo* group_member_info = player->GetGroupMemberInfo();
	player->GetGroupMemberInfo()->class_id = player->GetAdventureClass();
	group_member_info->hp_max = player->GetTotalHP();
	group_member_info->hp_current = player->GetHP();
	group_member_info->level_max = player->GetLevel();
	group_member_info->level_current = player->GetLevel();
	group_member_info->name = string(player->GetName());
	group_member_info->power_current = player->GetPower();
	group_member_info->power_max = player->GetTotalPower();
	group_member_info->race_id = player->GetRace();
	if (player->GetZone())
		group_member_info->zone = player->GetZone()->GetZoneDescription();
	else
		group_member_info->zone = "Unknown";

	if(!groupMembersLocked)
		MGroupMembers.releasewritelock();
}