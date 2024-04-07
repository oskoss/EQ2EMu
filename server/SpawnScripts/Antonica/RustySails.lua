--[[
    Script Name    : SpawnScripts/Antonica/RustySails.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.17 02:09:05
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"
local ZekAccess = 1

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
	Dialog.AddDialog("Hail yourself, stranger.  State your purpose, or be on your way.")
	Dialog.AddVoiceover("voiceover/english/optional1/rusty_sails/antonica/rustysails001.mp3", 3878527655, 4076294218)
    if GetQuestStepProgress(Spawn,ZekAccess,1) == 0 then
	Dialog.AddOption("Captain Coranis sent me.", "Dialog2")
	end
	Dialog.AddOption("I'm just leaving.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well, I'm glad she sent someone.  The attacks have been constant, and we've lost too many able bodies to withstand another attack ...  What in Thule!?  Another wave of Maruaders!")
	Dialog.AddVoiceover("voiceover/english/optional1/rusty_sails/antonica/rustysails002.mp3", 2886366918, 4198367939)
	Dialog.AddOption("Where?")
	Dialog.Start()
end

