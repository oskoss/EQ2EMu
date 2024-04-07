--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/GerbardtheSnitch.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.01 07:11:37
    Script Purpose : 
                   : 
--]]
local QUEST_1 = 387

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    ProvidesQuest(NPC,QUEST_1)
    SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")		
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC,Spawn)
    if not HasCompletedQuest(Spawn,QUEST_1) then
    PlayFlavor(NPC,"","","grumble",0,0,Spawn)
end
end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh no! I did it again!  The boys back on the boat are gonna kill me!")
	Dialog.AddVoiceover("voiceover/english/gerbard_the_snitch/fprt_adv01_sunken/gerbard_the_snitch000.mp3", 2512842567, 445857936)
    PlayFlavor(NPC,"","","sight",0,0,Spawn)
	if CanReceiveQuest(Spawn, QUEST_1) then
	Dialog.AddOption("What happened?", "Dialog2")
	elseif GetQuestStep(Spawn, QUEST_1)==2 then
	Dialog.AddOption("I've returned with the pirate coins.", "Dialog3")
    end	
	Dialog.AddOption("That sounds like something I'd rather stay out of.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I blew all my coins on a game of dice.  I just need a few more pirate coins to throw in, and I'll earn back my money in no time! Will you help me out? My crew will toss me overboard if they find out how much money I lost!")
	Dialog.AddVoiceover("voiceover/english/gerbard_the_snitch/fprt_adv01_sunken/gerbard_the_snitch001.mp3", 2460257667, 2197101465)
	Dialog.AddOption("I'll do it, whats involved?", "Offer")
	Dialog.AddOption("Not today, sorry.")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,QUEST_1)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You're a lifesaver!  Now it's time to win it all back.")
	Dialog.AddVoiceover("voiceover/english/gerbard_the_snitch/fprt_adv01_sunken/gerbard_the_snitch003.mp3", 1766615640, 492599183)
    PlayFlavor(NPC,"","","smile",0,0,Spawn)
	Dialog.AddOption("Good luck.")
	Dialog.Start()
	SetStepComplete(Spawn,QUEST_1,2)
end


