--[[
    Script Name    : SpawnScripts/TempleStreetOld/ChuggleValvesplitter.lua
    Script Author  : Premierio015
    Script Date    : 2021.06.29 09:06:14
    Script Purpose : 
    Script Notes   :  full dialogue is missing
--]]
require "SpawnScripts/Generic/DialogModule"

local ChugglesToolbox = 483

function spawn(NPC)

end

function hailed(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Sorry, sorry.  What is it?  I can't really help out much since those local 858 union members stole my blasted toolbox!")
	Dialog.AddVoiceover("voiceover/english/chuggle_valvesplitter/fprt_hood03/hail_chuggle000.mp3", 986790684, 3595790226)
    if GetQuestStep(Spawn,ChugglesToolbox) ==6 then
	Dialog.AddOption("I have your toolbox and tools right here.  Let's talk reward.", "Dialog2")
    end
	Dialog.AddOption("I'll leave you to your depression. ")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Thank you! Thank you! Thank you! Yes! Yes! Yes! A reward! Tell you what I'll do. I need these tools to make my newest invention. I'll make an invention for you and give it to you as a reward! This piece of equipment will be all the rage! Functional and stylish if I do say so myself!")
    PlayFlavor(NPC,"","","","happy",0,0,Spawn)
	Dialog.AddVoiceover("voiceover/english/chuggle_valvesplitter/fprt_hood03/hail_chuggle001.mp3", 3252705361, 2081071070)
	Dialog.AddOption("That'll do, I suppose.","complete")
	Dialog.Start()
end

function complete(NPC, Spawn)
    PlayFlavor(NPC,"","","","thanks",0,0,Spawn)
    SetStepComplete(Spawn, ChugglesToolbox, 6)
end



function respawn(NPC)
	spawn(NPC)
end