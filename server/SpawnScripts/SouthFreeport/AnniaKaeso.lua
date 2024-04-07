--[[
    Script Name    : SpawnScripts/SouthFreeport/AnniaKaeso.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.02 08:10:32
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
	Dialog.AddDialog("Hello.  Hello.  Welcome.  You look out of place here in Freeport.  Almost as if you were something blown in by the wind or swept ashore by the tide.  No wait.  It was that dream!")
	Dialog.AddVoiceover("voiceover/english/annia_kaeso/fprt_south/mer_anniakaeso.mp3", 3665529784, 3634349576)
    PlayFlavor(NPC,"","","smile",0,0,Spawn)
    if HasQuest(Spawn,5906) and GetQuestStep(Spawn,5906) == 3 then
	Dialog.AddOption("Have you been selling any type of foreign plant?", "Plant")
    end       
    Dialog.AddOption("Thank you for your time.  I must be going now.")
	Dialog.Start()
end

function Plant(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I have these purple flowers that an adventurer brought to me from across the ocean, or so she claimed.  I've sold a couple of them to some shady looking character.  He seemed rather excited when he saw that I had them... I don't know if that helps.")
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddVoiceover("voiceover/english/armorsmith_annia_kaeso/fprt_south/mer_anniakaeso002.mp3", 678467425, 386573512)
	Dialog.AddOption("Do you remember who purchased them?", "Plant2")
	Dialog.Start()
end


function Plant2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("No, I don't.  He had a very tired look in his eyes, and was a bit jumpy, but that's about it.  He was wearing a cloak, so I don't even know what his race was.  You can have one of these flowers if it helps.")
    PlayFlavor(NPC,"","","no",0,0,Spawn)
	Dialog.AddVoiceover("voiceover/english/armorsmith_annia_kaeso/fprt_south/mer_anniakaeso003.mp3", 955262143, 3659545208)
	Dialog.AddOption("I'll take one. Thank you.", "Plant2")
    Dialog.AddOption("You fool! This may be spreading disease throughout the city! Give it to me!", "Plant4")
	Dialog.Start()
end

function Plant3(NPC,Spawn)
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC,"","","thanks",0,0,Spawn)
    SetStepComplete(Spawn,5906,3)
end

function Plant4(NPC,Spawn)
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC,"","","cringe",0,0,Spawn)
    SetStepComplete(Spawn,5906,3)
end