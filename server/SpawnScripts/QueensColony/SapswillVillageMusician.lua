--[[
	Script Name	: SapswillVillageMusician.lua
	Script Purpose	: Spawn script for Sapswill musician.
	Script Author	: Scatman
	Script Date	: 2009.01.11
        Modified Date   : 2020.18.04
        Modified by     : premierio015
	Script Notes	: Added missing guitar visual effect
--]]

local ADiplomaticMission = 166

function spawn(NPC)
         EmoteLoop(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	if HasCompletedQuest(Spawn, ADiplomaticMission) or HasQuest(Spawn, ADiplomaticMission) then
		QuestTalk(NPC, Spawn)
	else
		NormalTalk(NPC, Spawn)
	end
	
	
end

function EmoteLoop(NPC)
         PlayAnimation(NPC, 20839)
         AddTimer(NPC, 1000, "EmoteLoop")
end

function NormalTalk(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	
	choice = math.random(1, 3)
	if choice == 1 then
		Say(NPC, "What you mean backwards? Expert I am!")
	else
		Say(NPC, "Course I know what I'm doing! What you mean backwards?")
	end
end

function QuestTalk(NPC, Spawn)
	if HasQuest(Spawn, ADiplomaticMission) and not QuestStepIsComplete(Spawn, ADiplomaticMission, 1) then
		SetStepComplete(Spawn, ADiplomaticMission, 1)
	end
	
	FaceTarget(NPC, Spawn)
	
	choice = math.random(1, 3)
	if choice == 1 then
		Say(NPC, "I play special tune for diplomats!")
	else
		Say(NPC, "Happy meeting, diplomat!")
	end
end