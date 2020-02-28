--[[
	Script Name	: SpawnScripts/OutpostoftheOverlord/CoercerZlith.lua
	Script Purpose	: Coercer Zlith 
	Script Author	: Vo1d
	Script Date	: 2019.10.04
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

-- Quest ID's
local DisruptionForDistraction = 366

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
end

function LeaveRange(NPC, Spawn)
end

function hailed(NPC, Spawn)
	  FaceTarget(NPC, Spawn)
	  conversation = CreateConversation()
    
  if not HasCompletedQuest(Spawn, DisruptionForDistraction) then
    if HasQuest(Spawn, DisruptionForDistraction) then
      if GetQuestStep(Spawn, DisruptionForDistraction) == 1 then
        SetStepComplete(Spawn, DisruptionForDistraction, 1)
      elseif GetQuestStep(Spawn, DisruptionForDistraction) == 4 then
        SetStepComplete(Spawn, DisruptionForDistraction, 4)
      elseif GetQuestStep(Spawn, DisruptionForDistraction) == 6 then
        SetStepComplete(Spawn, DisruptionForDistraction, 6)
      elseif CanReceiveQuest(Spawn, DisruptionForDistraction) then
        NotReady(NPC, Spawn)
      end
    end
  end
end

function NotReady(NPC, Spawn)
  FaceTarget(NPC, Spawn)
  conversation = CreateConversation()
  
  PlayFlavor(NPC, "voiceover/english/tutorial_revamp/coercer_zlith/tutorial_island02_evil_revamp/quests/citizenship/coercerzlith/coercerzlith009.mp3", "", "", 2204153066, 1989322276, Spawn)
  AddConversationOption(conversation, "Very well.", "dlg_3_1")
  StartConversation(conversation, NPC, Spawn, "You are not yet ready to take on the tasks I will offer you. Return to Tayil N'Velex outside Sythor's Spire if you are unsure how to prepare yourself.")
  
end