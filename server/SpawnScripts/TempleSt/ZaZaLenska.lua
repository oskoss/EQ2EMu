--[[
    Script Name    : SpawnScripts/TempleSt/ZaZaLenska.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.27 12:10:49
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local ZaZasLittleProblem = 451

function spawn(NPC)
    ProvidesQuest(NPC, ZaZasLittleProblem)
    SetInfoStructString(NPC, "action_state", "tapfoot")
end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    Dialog1(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

	
function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Have you seen my husband, Valeri?  He leaves home too often. He comes and goes as he pleases, and I never know where he is! I've had other husbands, and I know the signs of a cheater.")
	Dialog.AddVoiceover("voiceover/english/zaza_lenska/fprt_hood03/quests/zazalenska/zazalenska000.mp3", 1406443097, 3435338985)
    if  CanReceiveQuest(Spawn, ZaZasLittleProblem) then
	Dialog.AddOption("I don't know whether I have or not.  Describe him for me.", "Dialog2")
	elseif GetQuestStep(Spawn, ZaZasLittleProblem) == 4 then
	Dialog.AddOption("I've got what you needed.", "Dialog5")
	end
	Dialog.AddOption("I've got to do some visiting of my own.")
	Dialog.Start()
end	

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("He's tall and slim with jet black fur and three hoops in his left ear. He's handsome, oh, so handsome!  Surely you could not have missed him!  Unless, perhaps, his visits are in a ... private home.")
	Dialog.AddVoiceover("voiceover/english/zaza_lenska/fprt_hood03/quests/zazalenska/zazalenska001.mp3", 3365678449, 1708895230)
    PlayFlavor(NPC,"","","flustered",0,0,Spawn)
	Dialog.AddOption("Private residences?  You mean, visiting friends?", "Dialog3")
	Dialog.AddOption("Nope, haven't seen him.  Good luck in your search.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, to think of Valeri--my sweet, precious husband--in the arms of another!  No!  I cannot bear it!  I must know the truth!  And I know just the way.  Mama's potion will show me whether he's faithful to his ZaZa, or not.  Can you help this poor, unhappy wife?")
	Dialog.AddVoiceover("voiceover/english/zaza_lenska/fprt_hood03/quests/zazalenska/zazalenska002.mp3", 25646826, 3084524681)
    PlayFlavor(NPC,"","","cry",0,0,Spawn)
	Dialog.AddOption("What kind of help are you looking for?", "Dialog4")
	Dialog.AddOption("I won't be able to help.  Sorry.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I need ingredients for my potion.  Not too many and they must be fresh. I need to spread this potion on my Valeri's clothes ... and then I will have the answers I need.  Let me write this down for you; it's complex.")
	Dialog.AddVoiceover("voiceover/english/zaza_lenska/fprt_hood03/quests/zazalenska/zazalenska003.mp3", 1627354695, 3008513581)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("I will help you.  What will you need?", "Offer")
	Dialog.AddOption("Perhaps another time.")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,ZaZasLittleProblem)
end

function Dialog5(NPC, Spawn)
    SetStepComplete(Spawn, ZaZasLittleProblem, 4)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, yes ... I'm sure you do.  Well, then, you helped me, and I can repay you.  It's not much, considering what you did for me and my Valeri, but it's all I can give you.  At least for now...")
	Dialog.AddVoiceover("voiceover/english/zaza_lenska/fprt_hood03/quests/zazalenska/zazalenska008.mp3", 2402358505, 3193482805)
    PlayFlavor(NPC,"","","happy",0,0,Spawn)
	Dialog.AddOption("I hope your potion works.  Whatever it does.")
	Dialog.Start()
end
