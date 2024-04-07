--[[
	Script Name		: SpawnScripts/LongshadowAlley/YaranaDVen.lua
	Script Purpose	: Yarana D'Ven
	Script Author	: torsten//Dorbin 
	Script Date		: 2022.07.18
	Script Notes	: Added Dialog/VOs/Level & Faction checks -16/10/2023 Dorbin
--]]
require "SpawnScripts/Generic/DialogModule"

local NoRivalsForYarana = 5675

function spawn(NPC)
    ProvidesQuest(NPC, NoRivalsForYarana)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else  
    Dialog1(NPC,Spawn)
    end
end


function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Do not waste my precious time by begging for attention.")
    PlayFlavor(NPC, "","","no",0,0, Spawn)
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven.mp3",1141324184,3432577979)
	
    if CanReceiveQuest(Spawn, NoRivalsForYarana) then
	Dialog.AddOption("Oh, sorry to bother you.", "Dialog1a")
    elseif GetQuestStepProgress(Spawn, NoRivalsForYarana)==2 then
	Dialog.AddOption("I found some of the ingredients you requested. Is this enough?", "Dialog2")
    elseif GetQuestStepProgress(Spawn, NoRivalsForYarana)==4 then
	Dialog.AddOption("These ingredients were hard to come by. Is this enough?", "Dialog3")
    elseif GetQuestStepProgress(Spawn, NoRivalsForYarana)==6 then
	Dialog.AddOption("Here. The deed is done... and I am done with all of this!", "Dialog4")
    end

	Dialog.AddOption("I wasn't even talking to you.")
	Dialog.Start()
end



function Dialog1a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Wait! Are you looking for work?  My husband is an official in Longshadow. If you do as I ask, you won't find yourself on the wrong side of the militia, if you know what I mean...")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven000.mp3",1434779341,1687984253)
	Dialog.AddOption("What is it you need?", "Dialog1b")
	Dialog.AddOption("Seems like your husband has his hands full!","Pout")
	Dialog.AddOption("I don't want ANYTHING to do with you!")
	Dialog.Start()
end

function Pout (NPC,Spawn)
    PlayFlavor(NPC, "","","pout",0,0, Spawn)
end

function Dialog1b(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I cannot risk being overheard.  Come closer and I will whisper to you what I need. You must write these instructions down in your journal.  Do what I say, and I will reward you.")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven001.mp3",4193738982,2153468807)
    PlayFlavor(NPC, "","","snicker",0,0, Spawn)
	Dialog.AddOption("It sounds like I don't have a choice.", "OfferQuest1")
	Dialog.AddOption("I don't want ANYTHING to do with you!")
	Dialog.Start()
end


function OfferQuest1(NPC,Spawn)
    if CanReceiveQuest(Spawn, NoRivalsForYarana) then
    OfferQuest(NPC, Spawn, NoRivalsForYarana)
    end
end

function Dialog2(NPC,Spawn)
    SetStepComplete(Spawn,NoRivalsForYarana,2)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Excellent. It seems one of my rivals is harvesting these things for revolutionary necromantic research--research I wish to halt. This brings me to your next task...")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven002.mp3",1415851457,630090694)
	Dialog.AddOption("Fine. Here is my journal. Write down what is needed.")
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Her research nears completion.  I must put an end to her once and for all.  She cannot surpass my power!  I have one last task for you.")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven004.mp3",2781035509,2447510323)
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
	Dialog.AddOption("You need me to end her and be done with all this?","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
    SetStepComplete(Spawn,NoRivalsForYarana,4)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I'll deal with her myself.  But she's never alone.  She often employs bodyguards. I need you to make the guards question their relationship with that horrible wretch. This note tells you where to find them.")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven005.mp3",4178387219,3896524803)
    PlayFlavor(NPC, "","","no",0,0, Spawn)
	Dialog.AddOption("Alright. I'll deal with them...")
	Dialog.Start()
end


function Dialog4(NPC,Spawn)
    SetStepComplete(Spawn,NoRivalsForYarana,6)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Yes!  With those bodyguards out of the way, nothing can protect her!  I'll take her research, and she'll no longer plague my life or consort with my husband. Take this as a token of my thanks.")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven006.mp3",4178387219,3896524803)
    PlayFlavor(NPC, "","","yes",0,0, Spawn)
	Dialog.AddOption("Finally! Thanks, but I hope we see less of eachother in the future.")
	Dialog.Start()
end
