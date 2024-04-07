--[[
    Script Name    : SpawnScripts/NorthQeynos/AndreaDovesong.lua
    Script Author  : Dorbin
    Script Date    : 2022.04.25 03:04:17
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
require "SpawnScripts/Generic/DialogModule"

local claymore = 5547
local papers = 5536
local duvo = 5524

function spawn(NPC)
SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")		
ProvidesQuest(NPC, claymore)
ProvidesQuest(NPC, papers)
    SetInfoStructString(NPC, "action_state", "orate")
end


function respawn(NPC)
	spawn(NPC)
end


function InRange(NPC,Spawn)
    if GetFactionAmount(Spawn,11) <0 then
    FactionCheckingCallout(NPC, Spawn, faction)
    else
  if math.random(1, 100) <= 70 then
   FaceTarget(NPC,Spawn)
        choice = math.random(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "", "", "curstey", 0, 0, Spawn)
	    elseif choice == 2 then
		PlayFlavor(NPC, "", "", "royalwave", 0, 0, Spawn)
        end    
    end
    end
end


function hailed(NPC, Spawn)
 if GetFactionAmount(Spawn,11) <0 then
    	FaceTarget(NPC, Spawn)
        FactionChecking(NPC, Spawn, faction)
    else
	    FaceTarget(Spawn, NPC)
        local conversation = CreateConversation()
	    local conversation = CreateConversation()

    	StartConversation(conversation, NPC, Spawn, "")


	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("'Tis a lovely day for a tune, isn't it?")
	Dialog.AddVoiceover("voiceover/english/andrea_dovesong/qey_north/andreadovesong000.mp3", 2876603945, 556916518)
    PlayFlavor(NPC, "", "", "hello", 0, 0, Spawn)
 	    	if not HasQuest(Spawn,claymore) and not HasCompletedQuest(Spawn, claymore) and HasQuest(Spawn,papers) or HasCompletedQuest(Spawn, papers) and not HasQuest(Spawn,claymore)and not HasCompletedQuest(Spawn, claymore) then
        	Dialog.AddOption("You were saying there are more statues like this one?", "Claymore2")
            end
            if GetQuestStep(Spawn,papers)==2 then
        	Dialog.AddOption("Here is the parchment you requested from Duvo.  He said he has plenty more if you need.", "Delivered")
        	end
	    	if not HasQuest(Spawn,claymore) and not HasCompletedQuest(Spawn, claymore) and not HasQuest(Spawn,papers) and not HasCompletedQuest(Spawn, papers)then
        	Dialog.AddOption("What kind of songs do you sing?", "Work")
            end
	    	if HasQuest(Spawn,claymore) or HasCompletedQuest(Spawn, claymore) then
        	Dialog.AddOption("Tell me again what you like to sing about.", "Work")
            end
            if not HasQuest(Spawn,papers) and not HasCompletedQuest(Spawn, papers) and HasQuest(Spawn, claymore) or not HasQuest(Spawn,papers) and not HasCompletedQuest(Spawn, papers) and HasCompletedQuest(Spawn, claymore)then
        	Dialog.AddOption("You seem quite busy here.  Can I help you with anything while you perform?", "Work2")
            end
        AddConversationOption(conversation, "It is indeed!","kiss")
        AddConversationOption(conversation, "If you say so.")
	    Dialog.Start()
        end
    end	    


function kiss(NPC,Spawn)
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "", "", "kiss", 0, 0, Spawn)
end    



function Work(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I sing songs about many different things. But my favorite songs are the ones about this monument right here, the mighty Qeynos Claymore. I sing songs that tell of ancient Vallius Bayle who first brought the sword to our world from its planar home. I sing stories of Antonius Bayle winning the sword in tournaments that were held between the early human clans, and how he used it to unite the human people within one kingdom.  Aye, the Qeynos Claymore has a long and storied history.")
	Dialog.AddVoiceover("voiceover/english/andrea_dovesong/qey_north/andreadovesong001.mp3", 3368204937, 3549759451)
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("The claymore must be quite powerful with such a storied history.", "Claymore1")
    Dialog.AddOption("Fascinating. Thanks for sharing.","agree")
	Dialog.Start()
end	


function Claymore1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aye, it is!  Now Antonia Bayle is the owner of the fine blade.  Unfortunately it is hidden away in the castle for its protection.  Many agents of evil would like nothing better than to lay their hands upon it.  For now though, we only have these monuments to remind us of the Claymore.")
	Dialog.AddVoiceover("voiceover/english/andrea_dovesong/qey_north/andreadovesong001.mp3", 2179201684, 4109286437)
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
	if not HasQuest(Spawn,claymore) and not HasCompletedQuest(Spawn, claymore) then
    Dialog.AddOption("There are monuments like this one somewhere else?", "Claymore2")
    end	
	if HasQuest(Spawn,claymore) or HasCompletedQuest(Spawn, claymore) then
    Dialog.AddOption("Wait, I've forgotten.  You said there are more monuments like this one?", "Claymore2")
    end
    Dialog.AddOption("Well, thankfully we can enjoy reflecting unpon our city's history with places like this.","agree")
	Dialog.Start()
end	
 
 function agree(NPC,Spawn)
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
end   

    
function Claymore2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aye, there are others.  In fact, another monument stands out in the Antonican hills.  A small contingent of guards look over the Claymore monument.  People often visit there to pray and meditate. Good travels to you if you plan on venturing out to see it.")
	Dialog.AddVoiceover("voiceover/english/andrea_dovesong/qey_north/andreadovesong003.mp3", 4096047886, 1484152928)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	if not HasQuest(Spawn,claymore) and not HasCompletedQuest(Spawn, claymore) then
    Dialog.AddOption("I think I will.  Thank you for sharing the story.", "Claymore3")
    end	
	if HasCompletedQuest(Spawn, claymore) then
    Dialog.AddOption("I've been to the one in Antonica since we last spoke.  It is quite the sight overlooking the hills and coastline.", "agree")
    end
	if not HasQuest(Spawn,papers) and not HasCompletedQuest(Spawn, papers) then
    Dialog.AddOption("You seem quite busy here.  Can I help you with anything while you perform?", "Work2")
    end
    Dialog.AddOption("Well, thankfully we can enjoy reflecting unpon our city's history with places like this.","agree")
	Dialog.Start()
end	    
   
 function Claymore3(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
	if not HasQuest(Spawn,claymore) and not HasCompletedQuest(Spawn, claymore) then
    OfferQuest(NPC,  Spawn,claymore)
    end
    end  
  
function Work2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Looking for work are you?  Well, I could use some new parchment to scribe my sonata.  Scribe Duvo always has plenty.  You'll  find him at the Elddar Grove. Bring me the parchment and I'll pay you for your troubles.")
	Dialog.AddVoiceover("voiceover/english/andrea_dovesong/qey_north/andreadovesong004.mp3", 2245604238, 844371971)
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
	if HasQuest(Spawn,duvo) or HasCompletedQuest(Spawn, duvo) then
	Dialog.AddOption("I've actually had dealings with Duvo.  I'll stop by and see him.", "StartPapers")
    end
	Dialog.AddOption("Gladly.  I'll be back with the parchment", "StartPapers")
	Dialog.AddOption("Parchment?  Afraid I don't have the time.", "shrug")
	Dialog.Start()
end	    

 function shrug(NPC,Spawn)
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "", "", "shrug", 0, 0, Spawn)
end  

function StartPapers(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
    OfferQuest(NPC,  Spawn,papers)
    end  
    
function Delivered(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("How sweet and swift you are! Take these coins as a token of my appreciation.")
	Dialog.AddVoiceover("voiceover/english/andrea_dovesong/qey_north/andreadovesong005.mp3", 3610265582, 997287857)
    PlayFlavor(NPC, "", "", "thanks", 0, 0, Spawn)
	Dialog.AddOption("Thank you.", "FinishPapers")
	Dialog.Start()
end	 

function FinishPapers(NPC,Spawn)
     PlayFlavor(NPC, "", "", "curtsey", 0, 0, Spawn)
 	FaceTarget(NPC, Spawn)
    SetStepComplete(Spawn,papers, 2)
end  
