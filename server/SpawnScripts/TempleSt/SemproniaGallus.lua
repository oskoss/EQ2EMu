--[[
    Script Name    : SpawnScripts/TempleSt/SemproniaGallus.lua
    Script Author  : Dorbin
    Script Date    : 2023.06.28 05:06:22
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

local Citizenship = 5864
local Keys = 5921

function spawn(NPC)
    ProvidesQuest(NPC,Keys)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
end

function InRange(NPC, Spawn)
if HasQuest(Spawn,Citizenship) and GetQuestStep(Spawn,Citizenship)==4 then
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "", "Are you the one opening the new account?", "bye", 0, 0, Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)

if GetFactionAmount(Spawn,12) <0 then
	PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn)
elseif HasQuest(Spawn,Citizenship) and GetQuestStep(Spawn,Citizenship)==4 then
Dialog2(NPC, Spawn)
else
Dialog1(NPC, Spawn)
end
end



function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes, you look like the one Valthun described.  Before we can open your account, we need some information from you.  What's your name?")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/bnk_semproniagallus_hail005.mp3", 261268347, 2512652131)
	Dialog.AddOption(""..GetName(Spawn).."","Dialog2a")
	Dialog.Start()
end

function Dialog2a(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Occupation?")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/bnk_semproniagallus_hail006.mp3", 1872994041, 2564550567)
	Dialog.AddOption("Adventurer","Dialog2b")
	Dialog.AddOption("Crafter","Dialog2b")
    if GetRace(Spawn)==5 then
	Dialog.AddOption("Making things explode... Demolition expert?","Dialog2b")
    elseif GetRace(Spawn)==13 then
	Dialog.AddOption("I can sniff out all the best treasures!","Dialog2b")
    end
	Dialog.Start()
end

function Dialog2b(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Any surviving relatives, do you ever leave your house unarmed, and are you a deep sleeper?")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/bnk_semproniagallus_hail007.mp3", 482951073, 2945397215)
	PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddOption("No, no, and no.","Dialog2c")
	Dialog.AddOption("[Lie] No, no, and no.","Dialog2c")
	Dialog.AddOption("No - Wait... what?","Dialog2c")
	Dialog.Start()
end

function Dialog2c(NPC, Spawn)
if HasQuest(Spawn,Citizenship) and GetQuestStep(Spawn,Citizenship)==4 then
    SetStepComplete(Spawn, Citizenship,4)
end
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("How convenient for you.  Very well ... we've set aside a place for you within the Freeport Reserve vaults. Feel free to deposit large amounts of coin or valuable artifacts with us anytime.  We'll be sure to keep it ... safe.  Is there anything else?")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/bnk_semproniagallus_hail008.mp3", 2091439632, 2628015098)
	PlayFlavor(NPC, "", "", "scheme", 0, 0, Spawn)
	Dialog.AddOption("Not right now.")
	Dialog.Start()
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("This is the Freeport Reserve. Please make sure all deposits are in exact change and recognizable currency, thank you.")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/bnk_semproniagallus_hail.mp3", 2059269441, 1111799165)
        if CanReceiveQuest(Spawn,Keys) then
        Dialog.AddOption("Aren't you a little tall for a place like this?","Quest1")
        elseif GetQuestStep(Spawn,Keys) == 2 then
        Dialog.AddOption("The ratonga has been \"cured\". Here are your keys. ","Quest1Done")
        end        
        Dialog.AddOption("Thank you.")
	Dialog.Start()
end

function Quest1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It seems you are painfully unaware of the consequences of allowing either Ratonga or Gnomes handling and distributing large amounts of money. The Coalition of Tradesfolke have sent me to this district to try to prevent anymore mishaps that are a result of allowing these races a position with the bank. As it stands, we are still looking for a Ratonga who has all of the keys to our safety deposit vaults.")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/quests/semproniagallus/sempronia_x1_initial.mp3", 986781087, 1487041958)
	    PlayFlavor(NPC, "", "", "scold", 0, 0, Spawn)
        Dialog.AddOption("Is there something I could do?","Quest1Offer")
        Dialog.AddOption("Lost bank keys?! I want nothing to do with this bank!")
	Dialog.Start()
end

function Quest1Offer(NPC,Spawn)
  	FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Keys)
end

function Quest1Done(NPC, Spawn)
    SetStepComplete(Spawn, Keys,2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Excellent... were the Coalition to have found out someone managed to abscond with the vault keys.... well, I don't even like thinking about it.  As per our agreement, here are some coins for your time.  Perhaps you may wish to deposit them within the Reserves?")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/quests/semproniagallus/sempronia_x1_finish.mp3", 1236347558, 864344705)
	PlayFlavor(NPC, "", "", "thanks", 0, 0, Spawn)
    Dialog.AddOption("I'll consider it.")
	Dialog.Start()
end