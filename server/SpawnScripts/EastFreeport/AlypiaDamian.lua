--[[
    Script Name    : SpawnScripts/EastFreeport/AlypiaDamian.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.02 08:10:29
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
    if GetFactionAmount(Spawn,12) >0 then
    Dialog1(NPC, Spawn)
    else
    PlayFlavor(NPC,"","","threaten",0,0,Spawn)
end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well, hello there. Aren't you the most precious thing! Want to see what I'm selling? I've many nice things that'd do wonders for your image, and my prices are very fair.")
	Dialog.AddVoiceover("voiceover/english/merchant_alypia_damian/fprt_east/mer_alpyiamanian.mp3", 2228325168, 2657189177)
    PlayFlavor(NPC,"","","hello",0,0,Spawn)
	Dialog.AddOption("I have pressing business elsewhere. Safe journeys to you.")
    if HasQuest(Spawn,5906) and GetQuestStep(Spawn,5906) == 3 then
	Dialog.AddOption("Have you been selling any type of foreign plant?", "Plant")
    end       
	Dialog.AddOption("Can I think it over?", "Dialog2")
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Listen pal.  I don't stand here all day for people to think about buying something.  Either check out what I have to sell or move out of the way.")
    PlayFlavor(NPC,"","","tapfoot",0,0,Spawn)
	Dialog.AddVoiceover("voiceover/english/alypia_damian/fprt_east/mer_alpyiamanian000.mp3", 2608491411, 1675987239)
	Dialog.AddOption("What is wrong with you?", "Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I've a lot to do, and I don't have time to waste on someone who can't make up their mind.  So, please be a dear and go bother someone else.")
    PlayFlavor(NPC,"","","stare",0,0,Spawn)
	Dialog.AddVoiceover("voiceover/english/alypia_damian/fprt_east/mer_alpyiamanian001.mp3", 2481419509, 1914402501)
	Dialog.AddOption("Okay.")
	Dialog.Start()
end

function Plant(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "","", "boggle", 0, 0, Spawn)
    Dialog.AddDialog("Foreign plant?  Are you stupid?  What the heck would I do with a foreign plant?  This isn't Qeynos, fool.  Now either buy something or quit wasting my time.")
	Dialog.AddVoiceover("voiceover/english/alypia_damian/fprt_east/mer_alpyiamanian002.mp3", 1012015884, 2934321566)
    Dialog.AddOption("Fine! Sorry.")
	Dialog.Start()
end