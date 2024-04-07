--[[
    Script Name    : SpawnScripts/Antonica/aWindstalkerCitizen2.lua
    Script Author  : Premierio015
    Script Date    : 2021.08.16 08:08:43
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Windstalkers.lua")
require "SpawnScripts/Generic/NPCModule"

local LichaDancingQueen = 5342

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseRace(NPC)
    SetTempVariable(NPC, "QUEST_HAILED", "false")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	if HasQuest(Spawn, LichaDancingQueen) and GetTempVariable(NPC, "QUEST_HAILED") == "false" then
	local conversation = CreateConversation()    
	AddConversationOption(conversation, "Licha asked me to tell the villagers that she is going to dance.", "Option3")
	AddConversationOption(conversation, "Never mind.")
	StartConversation(conversation, NPC, Spawn, "What can I do for you?")
	elseif GetTempVariable(NPC, "QUEST_HAILED") == "true" or HasCompletedQuest(Spawn, LichaDancingQueen) then
	local choice = MakeRandomInt(1, 2)
	if choice == 1 then
	PlayFlavor(NPC, "", "I heard you the first time.", "", 0, 0, Spawn)
	elseif choice == 2 then
	PlayFlavor(NPC, "", "I know, I know. You already told me.", "", 0, 0, Spawn)
	end
else
    if GetClass(Spawn) >= 15 and GetClass(Spawn) <= 17 or GetClass(Spawn)==39 then
    	local choice = MakeRandomInt(1, 2)
    	if choice == 1 then
        SendMessage(Spawn,"The Windstalker Citizen eyes you approvingly.","white")
        elseif choice == 2 then
       SendMessage(Spawn,"The Windstalker Citizen gives you a friendly nod of acknowledgement.","white")
    	PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    	end	
    else
        local choice = MakeRandomInt(1, 3)
    	if choice == 1 then
        SendMessage(Spawn,"The Windstalker Citizen eyes closely in a disapproving manner.","white")
     	PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
       elseif choice == 2 then
       SendMessage(Spawn,"The Windstalker Citizen does not want to engage with you.","white")
    	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
       elseif choice == 3 then
       SendMessage(Spawn,"The Windstalker Citizen stares sniffs the air around you.","white")
    	PlayFlavor(NPC, "", "", "peer", 0, 0, Spawn)
    	end	
    end    
end
   end

function Option3(NPC, Spawn) -- we don't use easy ways to sort.
    SetTempVariable(NPC, "QUEST_HAILED", "true")
    if QuestStepIsComplete(Spawn, LichaDancingQueen, 1) and QuestStepIsComplete(Spawn, LichaDancingQueen, 2) then
    SetStepComplete(Spawn, LichaDancingQueen, 3)
    elseif QuestStepIsComplete(Spawn, LichaDancingQueen, 2) and QuestStepIsComplete(Spawn, LichaDancingQueen, 3) then
    SetStepComplete(Spawn, LichaDancingQueen, 1)
    elseif QuestStepIsComplete(Spawn, LichaDancingQueen, 3) and QuestStepIsComplete(Spawn, LichaDancingQueen, 1) then
    SetStepComplete(Spawn, LichaDancingQueen, 2)
    elseif not QuestStepIsComplete(Spawn, LichaDancingQueen, 1) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 2) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 3) then
    SetStepComplete(Spawn, LichaDancingQueen, 1)
    elseif QuestStepIsComplete(Spawn, LichaDancingQueen, 1) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 2) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 3) then
    local random_step = MakeRandomInt(1, 2)
    if random_step == 1 then
    SetStepComplete(Spawn, LichaDancingQueen, 2)
    elseif random_step == 2 then
    SetStepComplete(Spawn, LichaDancingQueen, 3)
    end
    elseif QuestStepIsComplete(Spawn, LichaDancingQueen, 2) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 1) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 3) then
    local random_step = MakeRandomInt(1, 2)
    if random_step == 1 then
    SetStepComplete(Spawn, LichaDancingQueen, 1)
    elseif random_step == 2 then
    SetStepComplete(Spawn, LichaDancingQueen, 3)
    end
elseif QuestStepIsComplete(Spawn, LichaDancingQueen, 3) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 1) and not QuestStepIsComplete(Spawn, LichaDancingQueen, 2) then
    local random_step = MakeRandomInt(1, 2)
    if random_step == 1 then
    SetStepComplete(Spawn, LichaDancingQueen, 2)
    elseif random_step == 2 then
    SetStepComplete(Spawn, LichaDancingQueen, 1)
    end
       end
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
    AddConversationOption(conversation, "Good to know.")
	StartConversation(conversation, NPC, Spawn, "Great, I haven't had a good laugh all day.")
	AddTimer(NPC, 600000, "reset")
end

function reset(NPC, Spawn)
if GetTempVariable(NPC, "QUEST_HAILED") == "true" then
SetTempVariable(NPC, "QUEST_HAILED", "false")
end
   end

function respawn(NPC)
	spawn(NPC)
end

function ChooseRace(NPC)
    SetRace = MakeRandomInt(1,2)
    if SetRace == 1 then
        human(NPC)
    elseif SetRace == 2 then
        halfelf(NPC)
    end
end


