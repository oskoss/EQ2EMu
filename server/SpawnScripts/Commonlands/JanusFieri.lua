--[[
    Script Name    : SpawnScripts/Commonlands/JanusFieri.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.24
    Script Purpose : 
    Note           : All dialog after step 2 is fabricated.
--]]
require "SpawnScripts/Generic/DialogModule"
require "SpawnScripts/Generic/NPCModule"
local DeliverHelptoJanusFieri = 5660

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    FreeportGuard(NPC)
end
function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if not HasCompletedQuest(Spawn,DeliverHelptoJanusFieri) then
    Dialog1(NPC, Spawn)
    else
    Dialog11(NPC, Spawn)
    end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Greetings.  Janus Fieri, at your service.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri001.mp3", 2406224045, 2387293986)
    if GetQuestStep(Spawn,DeliverHelptoJanusFieri) ==1 then
	Dialog.AddOption("I have a note for you from Marcus Cantarius.","Dialog2")
	elseif GetQuestStep(Spawn,DeliverHelptoJanusFieri) ==2 then
	Dialog.AddOption("Remind me about your investigation.","Dialog3")
	elseif GetQuestStep(Spawn,DeliverHelptoJanusFieri) ==3 then
	Dialog.AddOption("I've found a tattered journal in the nomad's camp.","Dialog6")
	elseif GetQuestStep(Spawn,DeliverHelptoJanusFieri) ==5 then
	Dialog.AddOption("I've found a tattered journal in the nomad's camp.","Dialog10")
	end
	Dialog.AddOption("That's good to know.  See you around!")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("A note from Marcus?  Let me see it!  Ah ... interesting.  Very good.  He writes that you're willing to help with my investigation.  That's excellent news.  Here's something to compensate you for your time.  I have to remain at the Crossroads in case one of my assistants gets a good lead.  Are you ready for this challenge?")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri002.mp3", 1036520282, 2045542405)
    PlayFlavor(NPC,"","","ponder",0,0,Spawn)
	Dialog.AddOption("I'm here, aren't I?","Dialog3")
	Dialog.AddOption("What should I know?","Dialog3")
	Dialog.Start()
	SetStepComplete(Spawn,DeliverHelptoJanusFieri,1)
	AddCoin(Spawn, 11)
    SendMessage(Spawn, "You receive 11 Copper from Janus Fieri.")
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("First, a brief background:  Not a fortnight ago, a local farmhand was found slain not too far from here.  At first, we thought it was simply a case of wrong place, wrong time.  However, as his body was prepared for burial we noticed something ... unusual.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri003.mp3", 3185527532, 167873804)
    PlayFlavor(NPC,"","","nod",0,0,Spawn)
	Dialog.AddOption("Unusual, how?","Dialog4")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Glyph-style marks were carved directly into the poor fellow's chest.  In order to locate the murderer, I need to know who carved them.  Marcus' note indicates that nomads here in the Commonlands might know.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri004.mp3", 2109604446, 3373930418)
	Dialog.AddOption("I'll see what I can find at the nomad camps.","Dialog5")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Be very cautious. They might not give out much information if questioned directly. However, you might be able to gather clues at their campsite. They often pick up items they find to sell later; I hope they kept clues to this murder. Good luck. I will wait for word from you.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri005.mp3",3131386048, 1502184408)
    PlayFlavor(NPC,"","","sniff",0,0,Spawn)
	Dialog.AddOption("I'll return when I find something.")
	Dialog.Start()
end

--Update 3

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ah, this is a find! Let me look through it and see if anything can be gleaned from its pages.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri006.mp3", 0, 0)
    PlayFlavor(NPC,"","","boggle",0,0,Spawn)
	Dialog.AddOption("Sure. Take a look.","Dialog7")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It says here... that there were skirmishes between the Dervish and Bloodskull orcs. Sightings, positions, movements- its all here... My brother kept very maticulous notes.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri007.mp3", 0, 0)
    PlayFlavor(NPC,"","","ponder",0,0,Spawn)
	Dialog.AddOption("Your brother?","Dialog8")
	Dialog.Start()
end

function Dialog8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes... it appears the last movements recorded were taking record of orcs gathering supplies for their war machines... Wait. It is hard to make out but, I think something scribbled here says \"SPOTTED\"... I knew he would get in over his head! I warned him!")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri008.mp3", 0, 0)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("What does it mean? What can I do?")
	Dialog.Start()
end

function Dialog9(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My brother deserved better than this! They most likely performed some sort of ritual on his body, marking deep into... No.... Go and kill those pig-nosed orcs, look for the ones gathering supplies! Lumberjacks most likely. You've helped me this far. Please, help me avenge my brother's death!")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri009.mp3", 0, 0)
	Dialog.AddOption("I'll see those orcs pay for what they've done.")
	Dialog.Start()
	SetStepComplete(Spawn,DeliverHelptoJanusFieri,3)
end

--Update 5

function Dialog10(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("So you have... My heart still twists thinking of my loss, but its grip loosens slightly knowing his murderers have met their fate. Thank you. Please, take something of mine for all your work. You've earned it.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri012.mp3", 0, 0)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("I'm glad I could help. If only it hadn't cost your brother's life.","Dialog11")
	Dialog.Start()
end

function Dialog11(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I appreciate what you've done, but I cannot dwell upon the past.")
	Dialog.AddVoiceover("voiceover/english/janus_fieri/commonlands/quests/janusfieri/janusfieri013.mp3", 1073842818, 1725876774)
	Dialog.AddOption("I understand.")
	Dialog.Start()
	SetStepComplete(Spawn,DeliverHelptoJanusFieri,5)
end