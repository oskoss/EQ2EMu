--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/EngineerVeebert.lua
    Script Author  : dorbin
    Script Date    : 2024.01.05 09:01:29
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "tapfoot")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Get out of the way! Get OUT OF THE WAY! I need to keep this clanking-heap working!")
	Dialog.AddVoiceover("voiceover/english/engineer_veebert/fprt_sewer01/quests/engineerveebert000.mp3", 3787332000, 2245703769)
	PlayFlavor(NPC, "", "", "frustrated", 0, 0, Spawn, 0)
	Dialog.AddOption("Okay! I'm going!")
	Dialog.Start()
end

function respawn(NPC)
	spawn(NPC)
end