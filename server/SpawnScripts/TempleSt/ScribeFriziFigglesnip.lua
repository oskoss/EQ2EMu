--[[
    Script Name    : SpawnScripts/TempleSt/ScribeFriziFigglesnip.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.07 04:11:22
    Script Purpose : 
                   : 
--]]
--Didn't you hear what I said? Sorry. I thought you were asking something else. Some loathsome, unkempt fiends called Guttersnipes accosted me.

require "SpawnScripts/Generic/DialogModule"
local Books = 5922
local Ingredients = 5923

function spawn(NPC)
    ProvidesQuest(NPC, Books)
    ProvidesQuest(NPC, Ingredients)
    SetInfoStructString(NPC, "action_state", "ponder")
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn, Books) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, Books) and GetQuestStep(Spawn,Books) ==1 then  
    DialogWait_Quest1(NPC,Spawn)
elseif HasQuest(Spawn, Books) and GetQuestStep(Spawn,Books) ==2 then  
    Dialog1(NPC,Spawn)
elseif CanReceiveQuest(Spawn, Ingredients) then  
    Dialog3_Quest2 (NPC,Spawn)
elseif HasQuest(Spawn, Ingredients) and GetQuestStep(Spawn,Ingredients) <5  then  
    Dialog3_Quest2 (NPC,Spawn)
elseif HasQuest(Spawn, Ingredients) and GetQuestStep(Spawn,Ingredients) ==5  then  
    Dialog3_Quest2 (NPC,Spawn)
else     
     Dialog1(NPC,Spawn)
   end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm busy with other customers. Come back later.")
	Dialog.AddVoiceover("voiceover/english/optional5/scribe_frizi_figglesnip/scribefigglesnip_multhail1_edit_64.mp3", 3159692842, 3138177466)
    PlayFlavor(NPC,"","","sniff",0,0,Spawn)
    if CanReceiveQuest(Spawn, Books) then 
    Dialog.AddOption("Sorry, but what customers?","Dialog1_Quest1")
    elseif GetQuestStep(Spawn, Books)==2  then 
    Dialog.AddOption("I've exacted your revenge on the Guttersnipe crooks!","Dialog2_Quest1")
    end
    Dialog.AddOption("I'm just browsing your wares.")
	Dialog.Start()
end

function Dialog1_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The ones who come in here and STEAL ALL OF MY BOOKS! They notebooks may have been blank, but have you SEEN the walls here in Temple Street?! I've run out of paper and notebooks so many times that everyone is writing WHATEVER they want on any surface they can reach!... All because some Crooks came in here and ran off with my books...")
 	PlayFlavor(NPC, "", "", "swear", 0, 0, Spawn)
    Dialog.AddOption("I could try to find your books if that would help?","Offer1")
    Dialog.AddOption("So it is 'your' fault the streets are covered in graffiti!")
	Dialog.Start()
end

function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, Books)
end

function DialogWait_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well? Are the worthless Crooks dead and in the ground yet? Don't come back until you've killed the 'lot!")
	PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    Dialog.AddOption("Soon enough.")
    Dialog.Start()
end

function Dialog2_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    SetStepComplete(Spawn, Books, 2)
	Dialog.AddDialog("YESSSsss!... *coughs*... That will do nicely. Even though my books are a lost cause, at least I don't have to worry about that rabble coming in here to steal more of my things. Please, take this coin for performing... 'justice'. Now I just need to take inventory of what I have left.  Now, off with you.")
 	PlayFlavor(NPC, "", "", "howl", 0, 0, Spawn)
    Dialog.AddOption("I'm glad I could be of assistance.")
	Dialog.Start()
end

function Dialog3_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
	Dialog.AddDialog("Ah ... yes, you killed the Guttersnipes. Unfortunately, that doesn't solve my book problem. Leave me alone. I've no further use for you.")
	Dialog.AddVoiceover("voiceover/english/optional5/scribe_frizi_figglesnip/scribefigglesnip_multhail4_edit_64.mp3", 4232546415, 1790498085)
    if CanReceiveQuest(Spawn,Ingredients) then
    Dialog.AddOption("What seems to be the problem Frizi? Don't I deserve some credit?","Dialog4_Quest2")
    end
    if GetQuestStep(Spawn, Ingredients)==5  then 
    Dialog.AddOption("Here are your ingredients. Please take them... now!","Dialog5_Quest2")
    end    
    Dialog.AddOption("Fine.")
	Dialog.Start()
end


function Dialog4_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("You know what? Sure, I could use some assistance if it will stop you from pestering me. I've taken tally of my suppiles and realized those Guttersnipes took more than just books. They took my entire collection of... 'reagents', and they are my best sellers! Would you be a sweet little thing and gather a few things for me?")
    Dialog.AddOption("Sure. Write them down in my journal.","Offer2")
    Dialog.AddOption("This sounds suspicious. I'm out of here.")
	Dialog.Start()
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, Ingredients)
end

function Dialog5_Quest2(NPC,Spawn)
    SetStepComplete(Spawn, Ingredients, 5)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "lookaway", 0, 0, Spawn)
	Dialog.AddDialog("Oh dear. You brought them all back, but you not wear protection handling all that?! You poor thing... Let me take those now... and... Here, take some of these gloves for protection in the future. It might be too late now, but better late than never I suppose? Also, if that spot -right there- on you gets any worse, I recomend you have it looked at... Now, I must prepare this inventory.")
    Dialog.AddOption("Thanks, I think?")
	Dialog.Start()
end

function respawn(NPC)
	spawn(NPC)
end