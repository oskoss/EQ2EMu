--[[
    Script Name    : SpawnScripts/EastFreeport/PulcherAmandio.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 05:10:20
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

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
	Dialog.AddDialog("Leave me be. Leave me be!")
	Dialog.AddVoiceover("pulcher_amandio/liveevents/jul_07/pulcher001.mp3", 3642849910, 492507522)
	Dialog.AddOption("I'm going. I'm going!")
	Dialog.Start()
end