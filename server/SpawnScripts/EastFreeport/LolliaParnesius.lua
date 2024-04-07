--[[
    Script Name    : SpawnScripts/EastFreeport/LolliaParnesius.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.08 04:10:12
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
	Dialog.AddDialog("Oh, hello there! Perhaps my eyes fail me, but you look like you're handy with a quill. Can you do some scribe work for me?")
	Dialog.AddVoiceover("voiceover/english/optional1/lollia_parnesius/fprt_east/mer_lolliaparnesius.mp3", 2582198165, 1582491385)
	Dialog.AddOption("I would sooner use the quill to stab you than to write with it...")
	Dialog.Start()
end
