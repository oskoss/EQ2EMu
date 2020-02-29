--[[
	Script Name	: CaptainTyreth.lua
	Script Purpose	: Captain Tyreth
	Script Author	: vo1d
	Script Date	: 10/12/2019
        Script Notes    : WIP, Tyreth isn't functioning yet.
--]]

require "SpawnScripts/Generic/DialogModule"

-- Quest ID's
local TheFinalAssault = 367

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
	-- Face the player
	FaceTarget(NPC, Spawn)
	
	-- Create a conversation
	Conversation = CreateConversation()
	
	-- Dialogue
	AddConversationOption(Conversation, "That's me.", "dlg_2")
	AddConversationOption(Conversation, "I need to be leaving.")

	-- Start conversation
        StartConversation(Conversation, NPC, Spawn, "Hahaha! The attack has begun and the enemy shall fall! You must be " .. GetName(Spawn) .. ", here to take part in the festivities.")
end

function dlg_2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	Dialog.AddDialog("Ah, you were the one who coerced these sentries out of the area before the attack. Nicely done! It is time to complete our domination. The Militia are advancing and beginning to clear the area. It is time to strike, quickly!")
	Dialog.AddVoiceover("voiceover/english/tutorial_revamp/captain_tyreth/tutorial_island02_evil_revamp/quests/citizenship/captaintyreth/captaintyreth002.mp3", 3182304037, 930301833)
	Dialog.AddOption("What must I do?", "dlg_3")

	Dialog.Start()
end

function dlg_3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

        SummonItem(Spawn, 48997, 1)
	Dialog.AddDialog("Take this torch. Work your way in and set fire to two of the nearby tents. Others have begun the razing as well. If another's flame fails, make sure you finish the job. This island will soon be ours!")
	Dialog.AddVoiceover("voiceover/english/tutorial_revamp/captain_tyreth/tutorial_island02_evil_revamp/quests/citizenship/captaintyreth/captaintyreth003.mp3", 3312554119, 4055641204)
	Dialog.AddOption("I'll burn the tents of the Qeynosians.")
	SetStepComplete(Spawn, TheFinalAssault, 1)

	Dialog.Start()
end