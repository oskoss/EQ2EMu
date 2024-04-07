--[[
    Script Name    : SpawnScripts/NorthQeynos/GavinIronforge.lua
    Script Author  : Dorbin
    Script Date    : 2022.04.23 12:04:36
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local Delivery = 5542

function spawn(NPC)
AddTimer(NPC, 5000, "EmoteLoop")    
SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")		
   ProvidesQuest(NPC, Delivery)
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC,Spawn)
       if GetFactionAmount(Spawn,11) <0 then
    	FaceTarget(NPC, Spawn)
        choice = math.random(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "", "", "shakefist", 2088886924, 3736631596, Spawn)
	    elseif choice == 2 then
		PlayFlavor(NPC, "", "", "heckno", 1584866727, 581589457, Spawn)
        end
   else     
        if not HasCompletedQuest (Spawn, Delivery) and not HasQuest (Spawn, Delivery) then 
 	        if math.random(1, 100) <= 90 then
    	    FaceTarget(NPC, Spawn)
		    PlayFlavor(NPC, "voiceover/english/gavin_ironforge/qey_north/100_son_ironforge_gavin_g4_callout1_a27add9d.mp3", "Who enters?  You wish to help me?  I am very busy today!", "tapfoot", 66670192, 2616890614, Spawn)
            end
        else
    	    if math.random(1, 100) <= 70 then
    	    FaceTarget(NPC, Spawn)
		    PlayFlavor(NPC, "", "", "hello", 0, 0, Spawn)
            end     
        end
end
end




function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if GetFactionAmount(Spawn,11) <0 then
    choice = math.random(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "", "", "shakefist", 2088886924, 3736631596, Spawn)
	    elseif choice == 2 then
		PlayFlavor(NPC, "", "", "heckno", 1584866727, 581589457, Spawn)
        end
    else
 	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("A hail and well met!  Welcome to the Jewel Box.  I am Gavin Ironforge, an apprentice in this shop. I help Tara with her duties, but we're unusually busy today.")
	Dialog.AddVoiceover("voiceover/english/gavin_ironforge/qey_north/gavinironforge000.mp3",  57706546, 3929365008)
        	PlayFlavor(NPC, "", "", "hello", 0, 0, Spawn)
    	    if not HasQuest(Spawn,Delivery) and not HasCompletedQuest(Spawn, Delivery) then
        	Dialog.AddOption("What is it that you can't get to today?", "Delivery1")
            end
            if GetQuestStep(Spawn,Delivery)==2 then
        	Dialog.AddOption("The Temple of Life was most pleased with Tara's etchings.", "Delivered")
        	end
	Dialog.AddOption("Thank you. I'll browse around. ")
	Dialog.Start()  
    end
end

function Delivery1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I must send a package to the Temple of Life. The priests are eagerly waiting for it. I could use someone to deliver it for me, if you've any free time. We will both benefit!")
	Dialog.AddVoiceover("voiceover/english/gavin_ironforge/qey_north/gavinironforge001.mp3",  3182974274, 1240192562)
	Dialog.AddOption("If the priests of Rodcet Nife need a delivery, then they'll get one!", "Delivery2")
	Dialog.AddOption("Sounds too important for me.  I'll leave it for someone else.")
	Dialog.Start()
end	 

function Delivery2(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
    OfferQuest(NPC,  Spawn,Delivery)
    end


function Delivered(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You preserve my faith in Qeynos. Qeynosians continue to be the most trustworthy citizens in all of Norrath! Thank you!")
	Dialog.AddVoiceover("voiceover/english/gavin_ironforge/qey_north/gavinironforge003.mp3",  1393179376, 3856557471)
    PlayFlavor(NPC, "", "", "thank", 0, 0, Spawn)
	Dialog.AddOption("And thank you for adding a bit more jingle to my coin pouch!", "FinishQuest")
	Dialog.Start()
end	

function FinishQuest(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
    SetStepComplete(Spawn,Delivery, 2)
    end
    
    
function EmoteLoop(NPC)
    local emoteChoice = MakeRandomInt(1,3)

    if emoteChoice == 1 then
-- ponder
        PlayAnimation(NPC, 12030)
        AddTimer(NPC, MakeRandomInt(15000,18000), "EmoteLoop")	
    elseif emoteChoice == 2 then
-- sniff
        PlayAnimation(NPC, 12329)
        AddTimer(NPC, MakeRandomInt(6000,9000), "EmoteLoop")	
    else
-- tapfoot
        PlayAnimation(NPC, 13056)
        AddTimer(NPC, MakeRandomInt(15000,18000), "EmoteLoop")	
    end
end