--[[
    Script Name    : SpawnScripts/NorthFreeport/ElmaLowe.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.19 04:06:22
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local Fighter = 5898

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
	Dialog.AddDialog("Come in. Come in.  Welcome to the Jade Tiger's Den, the finest tavern in all of Freeport.  Feel free to browse our menu. I personally guarantee that we serve only the highest-quality food and brews. ")
	Dialog.AddVoiceover("voiceover/english/elma_lowe/fprt_north/elmalowe000.mp3", 3610495310, 1230069492)
	if HasQuest(Spawn,Fighter) and GetQuestStep(Spawn,Fighter)>=3 and  GetQuestStep(Spawn,Fighter)<=5  and GetQuestStepProgress(Spawn,Fighter,3)==0 then
	Dialog.AddOption("[Hit her to get her attention]","Dialog1a")
	end
	Dialog.AddOption("I'll take a look around. ")
	Dialog.Start()
end

function Dialog1a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    AddTimer(NPC,800,"Dialog2",1,Spawn)
    PlayFlavor(Spawn, "", "", "pugilist_attack01", 0, 0, NPC)
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ouch!  Why did you do that?")
    PlayFlavor(NPC, "", "", "1h_thrown_ouch_down", 0, 0, Spawn)
    ApplySpellVisual(NPC,249)
	Dialog.AddVoiceover("voiceover/english/elma_lowe/fprt_north/elmalowe001.mp3", 434677831, 1032175372)
	Dialog.AddOption("Lucan doesn't want you serving the Gutternsnipes. [punch her again, harder]","Dialog2a")
	Dialog.Start()
end

function Dialog2a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "pugilist_attack", 0, 0, NPC)
    AddTimer(NPC,800,"Dialog2b",1,Spawn)
end


function Dialog2b(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(NPC, "", "", "1h_thrown_ouch_forehand", 0, 0, Spawn)
    ApplySpellVisual(NPC,249)
    AddTimer(NPC,1300,"Dialog3",1,Spawn)
end


function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Okay, okay!!!!  I won't serve them anymore!")
	SetStepComplete(Spawn,Fighter,3)
    PlayFlavor(NPC, "", "", "cringe", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/elma_lowe/fprt_north/elmalowe002.mp3", 2594071441, 2925543161)
	Dialog.AddOption("Good.")
	Dialog.Start()
end