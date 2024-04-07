--[[
	Script Name		: SpawnScripts/BeggarsCourt/PavoNightfire.lua
	Script Purpose	: Pavo Nightfire
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

local ADramaticPerformance = 5679

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The guards don't patrol for our protection they patrol to keep us in line. This part of the city is a holding cell; it's more of a prison than Freeport! Ah, Freeport, I hear its streets are paved with gold!")
	Dialog.AddVoiceover("voiceover/english/pavo_nightfire/fprt_hood04/std_pavo_nightfire.mp3", 318731360, 4037507119)
    if GetQuestStep(Spawn, ADramaticPerformance) == 1 then
    Dialog.AddOption("Maliz T'Raan says his 'friend was brought to tears by the acting troupe's performance'.","Dialog2")
    end
    Dialog.AddOption("I highly doubt that.")
	Dialog.Start()
end

function Dialog2(NPC,Spawn)
    SetStepComplete(Spawn, ADramaticPerformance, 1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
	Dialog.AddDialog("What? That's impossible! Those miscreants promised me they would ma--I'm going to kill them, that's what I'm going to do! Okay, think Pavo, think, think, think, think ... got it!  Tell him not to worry. The understudies are performing tomorrow night. He needs to make sure the stage is set for the next performance. Make sure he gets that message!")
    Dialog.AddOption("I'll see that he does...")
	Dialog.Start()
end

--