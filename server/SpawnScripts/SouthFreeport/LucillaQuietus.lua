--[[
    Script Name    : SpawnScripts/SouthFreeport/LucillaQuietus.lua
    Script Author  : Premierio015
    Script Date    : 2021.06.25 07:06:19
    Script Purpose : 
    Script Notes   :  New to add missing dialog for quest "Reward For A Missing Music Box".
--]]
require "SpawnScripts/Generic/DialogModule"

local  RewardForAMissingMusicBox = 5261

function spawn(NPC)

end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Either buy something or get out of the way!")
	Dialog.AddVoiceover("voiceover/english/optional1/weaponsmith_lucilla_quietus/fprt_south/100_questlucillaquietus_callout1_3d9a231a.mp3", 3790442270, 2463491720)
    PlayFlavor(NPC,"","","sniff",0,0,Spawn)
    if GetQuestStep(Spawn,RewardForAMissingMusicBox)==1 then
	Dialog.AddOption("Actually, I found a note with your name on it. Give me a few coins and you can have it.It looks like I've come across something with your name on it.  You may be interested in this music box.","Dialog2")
    end
    Dialog.AddOption("Well, show me your wares then!")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The ratonga thieves took that music box from me!  I demand you give it to me this instant! ")
    PlayFlavor(NPC,"","","boggle",0,0,Spawn)
	Dialog.AddOption("For the right price, its yours.","Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Are you always this infuriating?! Here. Take these few coins I have and give me the box!")
    PlayFlavor(NPC,"","","frustrated",0,0,Spawn)
    Dialog.AddOption("Deal.", "Dialog4")
    Dialog.AddOption("On second thought, nevermind. I'll keep it.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Finally! Give it here... It seems the nameplate hasn't been opened... and... Ah, hah! Yes! I can't believe neither you nor the filthy thief found my savings! Five years worth of business could have slipped through my fingers. Enjoy your copper \"friend\". Hahaha!")
    PlayFlavor(NPC,"","","happy",0,0,Spawn)
    Dialog.AddOption("Err...")
	Dialog.Start()
	SetStepComplete(Spawn, RewardForAMissingMusicBox, 1)
end