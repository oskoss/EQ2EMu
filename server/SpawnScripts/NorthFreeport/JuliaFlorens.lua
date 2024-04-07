--[[
    Script Name    : SpawnScripts/NorthFreeport/JuliaFlorens.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.19 04:06:22
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
	Dialog.AddDialog("Come in, please come in.  Welcome to the Jade Tiger's Den.  I'm Hostess Julia.   Perhaps you came to try a Jade Tiger cocktail?")
	Dialog.AddVoiceover("voiceover/english/julia_florens/fprt_north/mer_juliaflorens.mp3", 381228226, 4204129286)
	Dialog.AddOption("What's a Jade Tiger cocktail?", "Dialog2")
    if HasQuest(Spawn,5906) and GetQuestStep(Spawn,5906) == 3 then
	Dialog.AddOption("Have you been selling any type of foreign plant?", "Plant")
    end        
    Dialog.AddOption("Argh!  Leave me be....")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Honey, if you have to ask it's not for you.")
	Dialog.AddVoiceover("voiceover/english/julia_florens/fprt_north/mer_juliaflorens000.mp3", 437471813, 724586510)
	Dialog.AddOption("Right.")
	Dialog.Start()
end

function Plant(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "","", "shrug", 0, 0, Spawn)
    Dialog.AddDialog("Foreign plant?  You won't find that sort of thing here. You're best to try the shops near the docks. They have better access to that sort of ... 'thing'.")
	Dialog.AddVoiceover("voiceover/english/julia_florens/fprt_north/mer_juliaflorens.mp3", 0, 0)
    Dialog.AddOption("Alright. Thank you.")
	Dialog.Start()
end

