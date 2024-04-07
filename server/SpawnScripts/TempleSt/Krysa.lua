--[[
    Script Name    : SpawnScripts/TempleSt/Krysa.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.22 02:10:54
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local Makeup = 5925
local EnchantedEvening = 5926
local TheMissingBook = 5681


function spawn(NPC)
    ProvidesQuest(NPC, Makeup)
    ProvidesQuest(NPC, EnchantedEvening)
    SetInfoStructString(NPC, "action_state", "dance")
    SetTempVariable(NPC,"CalloutTimer","false")
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
end

function respawn(NPC)
	spawn(NPC)
end


function InRange(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif GetTempVariable(NPC,"CalloutTimer")=="false"then   
    SetTempVariable(NPC,"CalloutTimer","true")
    AddTimer(NPC,24000,"ResetCallout",1,Spawn)
   if not HasCompletedQuest(Spawn, Makeup) and not HasQuest(Spawn, Makeup) then
        if MakeRandomInt(0, 100) <= 100 then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/krysa/fprt_hood03/100_barentertainerkrysa_callout_a56d9ec5.mp3", "Welcome to Pshavost's bar!  You want a drink?", "flustered", 3717169563, 2070235233, Spawn, 0)
        end
    elseif HasQuest(Spawn,Makeup) then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/krysa/fprt_hood03/100_barentertainerkrysa_multhail3_1c499723.mp3", "Where's my makeup? I need makeup for my pretty face!", "grumble", 840511031, 3336551011, Spawn, 0)
   elseif HasCompletedQuest(Spawn, Makeup) and not HasCompletedQuest(Spawn, EnchantedEvening) and not HasQuest(Spawn, EnchantedEvening) then
        if MakeRandomInt(0, 100) <= 85 then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/krysa/fprt_hood03/100_barentertainerkrysa_multhail2_7c1029d0.mp3", "Welcome to Pshavost's bar. If you want a drink, find my ugly sister Krasa or see Pshavost at the bar.", "bye", 766013067, 711037507, Spawn, 0)
        end
    end
end
end


function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn, Makeup) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, Makeup) and GetQuestStep(Spawn,Makeup) ==1 then  
    DialogWait_Quest1(NPC,Spawn)
elseif HasQuest(Spawn, Makeup) and GetQuestStep(Spawn,Makeup) ==2 then  
    DialogWait_Quest1(NPC,Spawn)
elseif CanReceiveQuest(Spawn, EnchantedEvening) then  
    Dialog3_Quest2 (NPC,Spawn)
elseif HasQuest(Spawn, EnchantedEvening) and GetQuestStep(Spawn,EnchantedEvening) ==1  then  
    Dialog3_Quest2 (NPC,Spawn)
elseif HasQuest(Spawn, EnchantedEvening) and GetQuestStep(Spawn,EnchantedEvening) ==2  then  
    Dialog3_Quest2 (NPC,Spawn)
else     
     Dialog1(NPC,Spawn)
   end
end



function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Welcome to Pshavost's bar.  If you want a drink, find my ugly sister Krasa or see Pshavost at the bar.")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/mer_barentertainerkrysa_hail.mp3", 2129178406, 2161516525)
    PlayFlavor(NPC,"","","hello",0,0,Spawn)
    if CanReceiveQuest(Spawn, Makeup) then 
    Dialog.AddOption("Your sister?","Dialog1_Quest1")
    end
    if GetQuestStep(Spawn, TheMissingBook) == 1 then
    Dialog.AddOption("Enough! Where is the stolen tome from Longshadow Alley?","Dialog6")
    end
    Dialog.AddOption("I just might.")
	Dialog.Start()
end

function Dialog1_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Can't you see her from here? She's the ugliest ratonga in the street. That's why I'm an entertainer, and she does dirty work like picking up rubbish! Haha! Perhaps I'll tell her to give you a free drink if you help pretty, pretty Krysa.")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/quests/krysa/krysa_x1_initial.mp3", 4232264280, 1676289715)
 	PlayFlavor(NPC, "", "", "giggle", 0, 0, Spawn)
    Dialog.AddOption("I could use a drink...","Offer1")
    Dialog.AddOption("I wouldn't trust you to scrub my boots, much less fetch me a drink.")
	Dialog.Start()
end


function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, Makeup)
end

function DialogWait_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Where's my makeup? I need makeup for my pretty face!")
 	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/100_barentertainerkrysa_multhail3_1c499723.mp3",  840511031, 3336551011)
	PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    if GetQuestStep(Spawn, Makeup)==2  then 
    Dialog.AddOption("Brashk said he didn't have any more makeup.","Dialog2_Quest1")
    else
    Dialog.AddOption("I'm still on my way!")
    end
    if GetQuestStep(Spawn, TheMissingBook) == 1 then
    Dialog.AddOption("Enough! Where is the stolen tome from Longshadow Alley?","Dialog6")
    end
    Dialog.Start()
end

function Dialog2_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    SetStepComplete(Spawn, Makeup, 2)
	Dialog.AddDialog("Wahaaa?! That filthy rubbish picker lied to me!! He said he had all the makeups I would ever need! Bah! Spit on that dirt licker next time I sees him.  Now I must make my ugly sister look even uglier! You no bring me any makeups, so I no tell Krasa to give you's a free drink. Go away from me! You stink like a rubbish picker!")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/quests/krysa/krysa_x1_finish.mp3", 34509770, 2231226281)
 	PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn)
    Dialog.AddOption("Hey... That was uncalled for!","Continue")
    Dialog.AddOption("Well, no amount of makup will help 'that' face!","Continue")
	Dialog.Start()
end

function Continue(NPC,Spawn)
end

function Dialog3_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
	Dialog.AddDialog("Krysa no help you now. She busy with other customers. You come back later, yes?")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/100_barentertainerkrysa_multhail1_e0137dd4.mp3", 1716069852, 2277389123)
    if CanReceiveQuest(Spawn,EnchantedEvening) then
    Dialog.AddOption("Have you managed to get any more makeup?","Dialog4_Quest2")
    end
    if GetQuestStep(Spawn, EnchantedEvening)==2  then 
    Dialog.AddOption("Raban said she would perform the enchantments asked about for free.","Dialog5_Quest2")
    end    
    if GetQuestStep(Spawn, TheMissingBook) == 1 then
    Dialog.AddOption("Enough! Where is the stolen tome from Longshadow Alley?","Dialog6")
    end
    Dialog.AddOption("Fine.")
	Dialog.Start()
end

function Dialog4_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("No, I didn't get more makeups. Are you rubbing it in Krysa's face, eh? If you are then I'll cuts you! I warn you! If you want to HELP pretty, pretty Krysa, then I can use you...")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/quests/krysa/krysa_x2_initial.mp3", 2921023636, 1840780338)
    Dialog.AddOption("What did you have in mind?","Offer2")
    Dialog.AddOption("Pretty pretty sure I don't.")
	Dialog.Start()
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, EnchantedEvening)
end


function Dialog5_Quest2(NPC,Spawn)
    SetStepComplete(Spawn, EnchantedEvening, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn)
	Dialog.AddDialog("She will? She will! Ohhh ... that Erudite is the most wonderful person I ever met! She cares so much about me that she gives me more spells! Haha! If only Spezi and Krasa knew what I was doing to them. Hahaha!!! They are stupid and ugly! Hahaha! Now you go! I no want Krasa to know what I am doing.")
 	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/quests/krysa/krysa_x2_finish.mp3", 1881536618, 1447012024)
    Dialog.AddOption("Good luck!","Continue")
    Dialog.AddOption("I wonder if you'll ever figure out that... wait, nevermind.","Continue")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I do nots know who you speaks of! You mistakes me for someoneses else!")
	Dialog.AddVoiceover("voiceover/english/spezi_the_street_hag/fprt_hood05/quests/lotniklria/falseratonga_lotni_x1_initial.mp3", 1342345543, 1293466742)
    PlayFlavor(NPC,"","","confused",0,0,Spawn)
    Dialog.AddOption("Alright.")
	Dialog.Start()
end