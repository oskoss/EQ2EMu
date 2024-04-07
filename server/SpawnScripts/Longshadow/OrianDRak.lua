--[[
	Script Name		: SpawnScripts/LongshadowAlley/OrianDRak.lua
	Script Purpose	: Orian D`Rak
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"

local OgreWatch = 5676
local InformationGatheringFromaFishmonger = 5677

function spawn(NPC)
    ProvidesQuest(NPC, OgreWatch)
    ProvidesQuest(NPC, InformationGatheringFromaFishmonger)
	SetPlayerProximityFunction(NPC, 11, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end


function InRange(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if not HasCompletedQuest(Spawn, OgreWatch) and not HasQuest(Spawn, OgreWatch) then
        if MakeRandomInt(0, 100) <= 100 then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "", "How dare you barge into my house! Who do you think you are, fool?", "frustrated", 0, 0, Spawn, 0)
        end
    elseif HasCompletedQuest(Spawn, OgreWatch) and not HasCompletedQuest(Spawn, InformationGatheringFromaFishmonger) and not HasQuest(Spawn, InformationGatheringFromaFishmonger) then
        if MakeRandomInt(0, 100) <= 85 then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "", "Get out before I call the Militia, you disrespectful worm!", "shakefist", 0, 0, Spawn, 0)
        end
    end
end
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn, OgreWatch) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, OgreWatch) and GetQuestStep(Spawn,OgreWatch) ==1 then  
    Dialog2(NPC,Spawn)
elseif CanReceiveQuest(Spawn, InformationGatheringFromaFishmonger) then  
    Dialog3 (NPC,Spawn)
elseif HasQuest(Spawn, InformationGatheringFromaFishmonger)  then  
    Dialog4 (NPC,Spawn)
else     
     Dialog1(NPC,Spawn)
   end
end


function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("What on Norrath are you doing here?  Get out of my house this instant!")
	Dialog.AddVoiceover("voiceover/english/master_malvonicus/tutorial_island02/mastermalvonicus001.mp3", 2916930572, 3452710584)
    if CanReceiveQuest(Spawn, OgreWatch) then 
    Dialog.AddOption("What happened here? It's a mess!","Dialog1a")
    end
    Dialog.AddOption("Yeesh! Okay, I'm leaving.")
	Dialog.Start()
end


function Dialog1a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well apparently a group of undesirables, I can only assume ogres by the damage, decided to tear up my place while I was out! My house! I don't even know where to start! Oh, some of these heirlooms from Neriak were irreplaceable! ...and now YOU appear. What do you want?!")
 	PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
    Dialog.AddOption("I'm just looking to make a few coins.","Dialog2a")
    Dialog.AddOption("Well that IS too bad. Good luck with... whatever.")
	Dialog.Start()
end

function Dialog2a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmmm... perahps I could make use of you. Is your brain matter solid enough to make a deilvery and not lose it? I have a plan to discover what happened here that requires this message to be delievered in ONE piece... unlike these broken furniture pieces you see strewn about.")
    if CanReceiveQuest(Spawn, OgreWatch) then 
    Dialog.AddOption("I'm sure I can deliver your letter in one piece.","Offer1")
    end
    Dialog.AddOption("Nope. NO time for that.")
	Dialog.Start()
end

function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, OgreWatch)
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, InformationGatheringFromaFishmonger)
end

function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("Why haven't you delivered my letter? Azreana must know of my plan!")
    Dialog.AddOption("I'm going!")
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
	Dialog.AddDialog("Ah... It is only you again. I've recieved word Azreana has recieved my package as I requrested. Nice work... Perhaps these ogres will keep their noses out of my buisness!")
    Dialog.AddOption("She said the raid on your home was a ruse for a bigger plot in the districts.","Offer2")
    Dialog.AddOption("And I'll stay out of your buisness as well...")
	Dialog.Start()
end

function Dialog4(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("Did you find Tilzak N'lim?  I must know that fishmonger's true motives!")
    if GetQuestStep(Spawn,InformationGatheringFromaFishmonger) ==2 then
    Dialog.AddOption("He is no ordinary fishmonger. He works undercover for the Overlord and is planning to entrap the fools who started all this!","Dialog4a")
    end
    Dialog.AddOption("And I'll stay out of your buisness as well...")
	Dialog.Start()
end

function Dialog4a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "pout", 0, 0, Spawn)
	Dialog.AddDialog("Well then... this does change things. If you claim the fishmonger is an agent of the Overlord... can he be trusted?")
    Dialog.AddOption("He seemed honest enough?","Dialog4b")
    Dialog.AddOption("Perhaps you shouldn't?","Dialog4b")
	Dialog.Start()
end


function Dialog4b(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddDialog("Better yet, can YOU be trusted?! How do I know you're speaking the truth!? Are you part of this whole plot?!?")
    Dialog.AddOption("You'll just have to take my word for it.","Dialog4c")
    Dialog.AddOption("You see this face? How can you not trust this face?","Dialog4c")
    Dialog.AddOption("[Lie] The Overlord's agents told me you might not see reason.","Dialog4c")
	Dialog.Start()
end

function Dialog4c(NPC,Spawn)
        SetStepComplete(Spawn, InformationGatheringFromaFishmonger, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
	Dialog.AddDialog("...Fine! Take these things and get out of my sight. If I find out you're behind any of this, I will make you pay! I can't take ANYMORE FOOLISHNESS!")
    Dialog.AddOption("Thanks, and good luck resolving all of... 'this'.")
	Dialog.Start()
end

