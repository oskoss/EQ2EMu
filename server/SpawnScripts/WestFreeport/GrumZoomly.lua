--[[
    Script Name    : SpawnScripts/WestFreeport/GrumZoomly.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.05 05:10:43
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local Fighter = 5898
local Scout = 5910

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
 Dialog1(NPC, Spawn)
 end


--
function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I don't want any trouble here in my bar, understand?  People really hate it when I get angry.")
	Dialog.AddVoiceover("voiceover/english/grum_zoomly/fprt_west/grumzoomly000.mp3", 894167480, 1838777111)
	if HasQuest(Spawn,Fighter) and GetQuestStep(Spawn,Fighter)>=3 and  GetQuestStep(Spawn,Fighter)<=5  and GetQuestStepProgress(Spawn,Fighter,5)==0 then
	Dialog.AddOption("Lucan is disappointed that you've been serving the Guttersnipes.","Dialog2")
	end
	if HasQuest(Spawn,Scout) and GetQuestStep(Spawn,Scout)>=3 and  GetQuestStep(Spawn,Scout)<=4  and GetQuestStepProgress(Spawn,Scout,3)==0 then
	Dialog.AddOption("Hey, want to dance?! [Show off your moves]","Dialog4")
	end
	Dialog.AddOption("Got it.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What Lucan doesn't know won't hurt him.")
    PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/grum_zoomly/fprt_west/grumzoomly001.mp3", 144241661, 2143125475)
	Dialog.AddOption("You're right, but it'll hurt you. How about a punch to the gut!","Dialog2a")
	Dialog.Start()
end

function Dialog2a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "pugilist_attack02", 0, 0, NPC)
    AddTimer(NPC,800,"Dialog2b",1,Spawn)
end


function Dialog2b(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(NPC, "", "", "ouch", 0, 0, Spawn)
    ApplySpellVisual(NPC,249)
    AddTimer(NPC,800,"Dialog3",1,Spawn)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ughhh! Stop it!!!  I take it this is his idea of a warning?  Fine, I'll stop serving them.")
    PlayFlavor(NPC, "", "", "gutcramp", 0, 0, Spawn)
	SetStepComplete(Spawn,Fighter,5)
	Dialog.AddVoiceover("voiceover/english/grum_zoomly/fprt_west/grumzoomly002.mp3", 3096589689, 3928464974)
	Dialog.AddOption("I'm glad we could come to an understanding.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "dance", 0, 0)
    AddTimer(NPC,1800,"Dialog4a",1,Spawn)
end

function Dialog4a(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What in the heck are you doing, you idiot!?  Get out of here before I bash your head in!")
    PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/grum_zoomly/fprt_west/grumzoomly003.mp3", 466250040, 3587098228)
	Dialog.AddOption("I am an entertainer! I am always available to hire!","Dialog5")
	Dialog.Start()
end


function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Entertain? You're a moron! And soon you'll be a dead moron, I'll make sure of it!")
    PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/grum_zoomly/fprt_west/grumzoomly004.mp3", 415190010, 1464682173)
	Dialog.AddOption("Think of all the extra coin you'll get if your patrons stick around! I'd only need a small bit and the rest is yours.","Dialog6")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "flirt", 0, 0, NPC)
    AddTimer(NPC,1800,"Dialog6a",1,Spawn)
end

function Dialog6a(NPC, Spawn)
	SetStepComplete(Spawn,Scout,3)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You fool! You're going to kill yourself! Heck, I'll hire you just to see how long it takes! You'll have to wait till I'm done counting today's take. Stop by after I close, and we'll discuss payment.")
    PlayFlavor(NPC, "", "", "scold", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/grum_zoomly/fprt_west/grumzoomly005.mp3", 4032144186, 3733276565)
	Dialog.AddOption("Thank you, but my act must hit the road!")
	Dialog.Start()
end