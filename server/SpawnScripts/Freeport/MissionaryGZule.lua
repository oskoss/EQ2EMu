--[[
    Script Name    : SpawnScripts/Freeport/MissionaryGZule.lua
    Script Author  : Premierio015
    Script Date    : 2020.07.15 06:07:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local RustySymbolOfMarr = 584
local DeathCert = 5872

function spawn(NPC)
ProvidesQuest(NPC,DeathCert)
end

function hailed(NPC, Spawn)
 if GetFactionAmount(Spawn,12)<0 then
     PlayFlavor(NPC,"","","cutthroat",0,0,Spawn)
 else
     Dialog1(NPC,Spawn)
end
end


function respawn(NPC)

end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You better watch your step if you choose to enter the Temple of War. I would suspect the greeting for a person like yourself would be a dagger in the back rather than a handshake.")
	Dialog.AddVoiceover("voiceover/english/missionary_g_zule/fprt_north/qst_gzule.mp3", 1791825577, 3485372568)
	Dialog.AddOption("Is that why you are afraid to go in yourself, hmm? ", "Dialog2")
    if HasQuest(Spawn, RustySymbolOfMarr) then
    Dialog.AddOption("I found something that may be of interest to you.", "quest")
    end
    if CanReceiveQuest(Spawn,DeathCert) then
    Dialog.AddOption("Give me a task worthy of proving myself then!","Offer")
    end
    Dialog.AddOption("I think I can handle myself just fine, thanks.")
	Dialog.Start()
end

function Offer(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,DeathCert)
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It is my station to be here, you worm.  Soon enough I'll take my place inside the temple.")
	Dialog.AddVoiceover("voiceover/english/missionary_g_zule/fprt_north/qst_gzule001.mp3", 1035950997, 818649186)
	Dialog.AddOption("What's the problem?  You haven't done enough sacrificing to sit with the big boys yet?", "Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'll have you know that I have done all the sacrificing I need to do, lucky for your worthless carcass.  I only have to find a symbol of the old paladins to desecrate to fulfill my advancement.")
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/missionary_g_zule/fprt_north/qst_gzule002.mp3", 2865163916, 2862700718)
	Dialog.AddOption("For some reason I see you standing here for a while.")
	Dialog.Start()
end



function quest(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog( "I could take the symbol of Marr off your hands.  You certainly don't want to carry that thing openly around here.  I won't even charge the usual fee to dispose of it.")
	Dialog.AddVoiceover("voiceover/english/missionary_g_zule/fprt_north/qst_gzule003.mp3", 212622032, 1987675547)
    Dialog.AddOption("You won't charge me?  How about you pay me for it.  I know you need this.", "complete")
    Dialog.Start()
end

function complete(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
    Dialog.AddDialog( "Fine, here is a small pouch of coins for the symbol.  You know it's worthless to you anyway.")
	Dialog.AddVoiceover("voiceover/english/missionary_g_zule/fprt_north/qst_gzule004.mp3", 2506235491, 1587607096)
    Dialog.AddOption("A pleasure doing business with you.")
    Dialog.Start()
  SetStepComplete(Spawn, RustySymbolOfMarr, 1)
end
