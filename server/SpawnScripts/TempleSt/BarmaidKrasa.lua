--[[
    Script Name    : SpawnScripts/TempleSt/BarmaidKrasa.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:13
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

local KrasaWontTakeIt = 5924


function spawn(NPC)
    SetPlayerProximityFunction(NPC,9, "InRange", "LeaveRange")
    SetInfoStructString(NPC, "action_state", "ponder")
    ProvidesQuest(Quest,KrasaWontTakeIt)
end


function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
end
end

function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif not HasLanguage(Spawn,26) then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)    
else
Dialog1(NPC,Spawn)
end
end

function Dialog1(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Whys, hello!  Be a dears and buys a drinks from Pshavost's bar.  He runs a cleans and honest establishment, he does.")
	Dialog.AddVoiceover("voiceover/english/barmaid_krasa/fprt_hood03/mer_barmaidkrasa_hail.mp3", 176271092, 4124908502)
    PlayFlavor(NPC, "","","hello",0,0, Spawn)
	Dialog.AddLanguage(26)
    if CanReceiveQuest(Spawn, KrasaWontTakeIt) then
	Dialog.AddOption("I could use a drink. Bring me one.", "Dialog2")
    elseif GetQuestStep(Spawn, KrasaWontTakeIt)==2 then
	Dialog.AddOption("I've told Spezi. You're right... she really does hate Krysa.", "Dialog3")
    end
	Dialog.AddOption("I'll consider it.")
	Dialog.Start()
end

function Dialog2(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That's it! I'm sick of being \"just the waitress.\" I ams beautiful, and I can dance better than my stupid sister Krysa! Everyone always says: \"Krysa is so pretty\" and \"Krysa is so friendly.\" No mores, you hear me? No mores! She goes down tonight! You send a message for me, yes?")
	Dialog.AddVoiceover("voiceover/english/barmaid_krasa/fprt_hood03/quests/krasa/krasa_x1_initial.mp3", 1408869566, 4041581758)
    PlayFlavor(NPC, "","","frustrated",0,0, Spawn)
	Dialog.AddLanguage(26)
	Dialog.AddOption("Take it easy! What do you need?", "Offer")
	Dialog.AddOption("I only wanted a drink! Yeesh!")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,KrasaWontTakeIt)
end

function Dialog3(NPC,Spawn)
    SetStepComplete(Spawn,KrasaWontTakeIt,2)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes. She does hate Krysa. I think I acted too fast. Maybe I don't keeps the doors open after all. We see, eh? For now, here's some coins for sending the message.")
	Dialog.AddVoiceover("voiceover/english/barmaid_krasa/fprt_hood03/quests/krasa/krasa_x1_finish.mp3", 3356111057, 1390552450)
    PlayFlavor(NPC, "","","wince",0,0, Spawn)
	Dialog.AddLanguage(26)
	Dialog.AddOption("Thanks, I hope you know what you're doing.")
	Dialog.Start()
end

function respawn(NPC)
	spawn(NPC)
end