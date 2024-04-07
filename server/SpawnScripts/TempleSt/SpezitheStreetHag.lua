--[[
    Script Name    : SpawnScripts/TempleSt/SpezitheStreetHag.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.22 05:10:59
    Script Purpose : 
                   : 
--]]
local KrasaWontTakeIt = 5924
local TheMissingBook = 5681

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "flirt")
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
	Dialog.AddDialog("Take a good look!  There are nots many as attractive as I, Spezi. You want somes company?")
	Dialog.AddVoiceover("voiceover/english/spezi_the_street_hag/fprt_hood03/qst_streethagspezi.mp3", 1064590659, 1345460348)
    PlayFlavor(NPC,"","","flustered",0,0,Spawn)
    if GetQuestStep(Spawn, TheMissingBook) == 1 then
    Dialog.AddOption("Enough! Where is the stolen tome from Longshadow Alley?","Dialog2")
    end
    if GetQuestStep(Spawn, KrasaWontTakeIt) == 1 then
    Dialog.AddOption("I have a message from Krasa. She says Krysa's door will be open tonight.","Dialog3")
    end
    Dialog.AddOption("Yes, there are very few with your level of attractiveness.  I have to be someplace else now.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I do nots know who you speaks of! You mistakes me for someoneses else!")
	Dialog.AddVoiceover("voiceover/english/spezi_the_street_hag/fprt_hood05/quests/lotniklria/falseratonga_lotni_x1_initial.mp3", 1342345543, 1293466742)
    PlayFlavor(NPC,"","","confused",0,0,Spawn)
    Dialog.AddOption("Alright.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
    SetStepComplete(Spawn,KrasaWontTakeIt,1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aha! Krysa thinks she's sooo pretty, and tells everyone not to see Spezi! That ratznitch Krysa will pay tonight! She's going to smile from ear to ear tonight! Hahaha!!! You tell Krasa I give her thanks, and I tell no one what she do for us.")
	Dialog.AddVoiceover("voiceover/english/spezi_the_street_hag/fprt_hood03/quests/krasa/spezi_krasa_x1_initial.mp3", 3124201712, 3516119767)
    PlayFlavor(NPC,"","","scheme",0,0,Spawn)
    Dialog.AddOption("I'm glad to see you understand.")
	Dialog.Start()
end