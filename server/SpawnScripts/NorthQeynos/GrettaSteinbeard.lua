--[[
    Script Name    : SpawnScripts/NorthQeynos/GrettaSteinbeard.lua
    Script Author  : Dorbin
    Script Date    : 2022.04.01 01:04:40
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local fish = 5535

function spawn(NPC)
ProvidesQuest(NPC, fish)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
 if GetFactionAmount(Spawn,11) <0 then
    	FaceTarget(NPC, Spawn)
        choice = math.random(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn)
	    elseif choice == 2 then
		PlayFlavor(NPC, "", "", "heckno", 0, 0, Spawn)
        end
     else   
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Greetings, traveler!  My tavern's warm, and the company's good.")
	Dialog.AddVoiceover("voiceover/english/gretta_steinbeard/qey_north/grettasteinbeard_x1.mp3", 35615365, 1303938108)
    PlayFlavor(NPC, "", "", "hello", 0, 0, Spawn)
	if not HasQuest(Spawn,fish) and not HasCompletedQuest(Spawn, fish) then
	Dialog.AddOption("You do have quite a nice place here.", "Work")
	end
    if GetQuestStep(Spawn,fish)==2 then
	Dialog.AddOption("Here's your fish, take them before they make me pale with disgust!", "Delivered")
    end
	Dialog.AddOption("I plan to enjoy myself.  Thanks.")
	Dialog.Start() 
    end
end	

function Work(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Why thank you sir!  Say, would you be willing to spend a little time to help a busy woman?")
	Dialog.AddVoiceover("voiceover/english/merchant_gretta_steinbeard/qey_north/grettasteinbeard_x000.mp3", 612712171, 2321965832)
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
	Dialog.AddOption("I've got some time.  What do you need?", "Delivery2")
	Dialog.AddOption("I really don't. Sorry.","sigh")
	Dialog.Start()
end	

function sigh(NPC,Spawn)
    PlayFlavor(NPC, "", "", "sigh", 0, 0, Spawn)
end    

function Delivery2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well, I need a delivery of fish for tonight's supper.  I'm making my specialty.  Fish stuffed with fish smothered in a fish sauce and served over a bed of fish, but I'm so busy here doing all the things I have to do that I haven't been able to go to Umli's Fish Market.  If I don't get the fish, it will be turnip stew... again.")
	Dialog.AddVoiceover("voiceover/english/merchant_gretta_steinbeard/qey_north/grettasteinbeard_x001.mp3", 179611746, 3337706668)
	Dialog.AddOption("I would be happy to lend a hand.", "Delivery3")
	Dialog.AddOption("Sounds too fishy for me.", "sigh")
	Dialog.Start()
end	

function Delivery3(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
    OfferQuest(NPC,  Spawn,fish)
    end
   
 
function Delivered(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That last comment aside, I thank ye, and so will the mudglud tavern patrons who don't have the courage to face that shale-skin Umli, and yet, complain about the turnip stew! Well, here's some coin for your pocket. You have no idea how valuable your service has been.")
	Dialog.AddVoiceover("voiceover/english/merchant_gretta_steinbeard/qey_north/grettasteinbeard_x003.mp3", 3675257953, 3697234196)
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddOption("Thanks.", "FinishQuest")
	Dialog.AddOption("Great.  Now have I have to get rid of this fish smell.", "Chuckle")
	Dialog.Start()
end	

function Chuckle(NPC,Spawn)
     PlayFlavor(NPC, "", "", "chuckle", 0, 0, Spawn)
 	FaceTarget(NPC, Spawn)
    SetStepComplete(Spawn,fish, 2)
end   

function FinishQuest(NPC,Spawn)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
 	FaceTarget(NPC, Spawn)
    SetStepComplete(Spawn,fish, 2)
end 