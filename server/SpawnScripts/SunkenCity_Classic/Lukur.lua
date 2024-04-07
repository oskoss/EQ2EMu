--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/Lukur.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.01 08:11:07
    Script Purpose : 
                   : 
--]]
local LukursAntiques = 374

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    ProvidesQuest(NPC,LukursAntiques)
    SetInfoStructString(NPC, "action_state", "tapfoot")
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
	Dialog.AddDialog("This place is a wellspring for me.  Look around!  Crates and barrels full of abandoned goods just waiting to be uncovered.  There are far too many for me to search alone.")
	Dialog.AddVoiceover("voiceover/english/optional1/lukur/fprt_adv01_sunken/lukur000.mp3", 1584752461, 2942049134)
	if CanReceiveQuest(Spawn, LukursAntiques) then
	Dialog.AddOption("Who are you?", "Dialog2")
	elseif GetQuestStep(Spawn, LukursAntiques)==4 then
	Dialog.AddOption("I've returned with the masks.", "Dialog3")
    end	
	Dialog.AddOption("I'm not one to be sifting through other people's things.")
	Dialog.Start()
end



function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My name's Lukur, and I deal antiques.  I was told of the riches waiting to be discovered here, but I didn't believe it until I arrived.  Will you help me search for some valuables?")
	Dialog.AddVoiceover("voiceover/english/optional1/lukur/fprt_adv01_sunken/lukur001.mp3", 3143062912, 3824299878)
	Dialog.AddOption("I think I can help you.", "Offer")
	Dialog.AddOption("Not right now, sorry.")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,LukursAntiques)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Look at the amazing quality of these ancient masks! You did well. Here is your reward.")
	Dialog.AddVoiceover("voiceover/english/optional1/lukur/fprt_adv01_sunken/lukur003.mp3", 1196217033, 2873878783)
    PlayFlavor(NPC,"","","boggle",0,0,Spawn)
	Dialog.AddOption("Thank you.")
	Dialog.Start()
	SetStepComplete(Spawn,LukursAntiques,4)
end




