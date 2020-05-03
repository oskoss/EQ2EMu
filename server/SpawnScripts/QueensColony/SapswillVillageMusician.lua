--[[
	Script Name	: SapswillVillageMusician.lua
	Script Purpose	: Spawn script for Sapswill musician.
	Script Author	: Scatman
	Script Date	: 2009.01.11
	Script Notes	: 
--]]

local ADiplomaticMission = 166

function spawn(NPC)
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