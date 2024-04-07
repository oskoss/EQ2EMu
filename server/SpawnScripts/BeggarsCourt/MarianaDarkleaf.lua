--[[
	Script Name		: SpawnScripts/BeggarsCourt/MarianaDarkleaf.lua
	Script Purpose	: Mariana Darkleaf
	Script Author	: torsten\\Dorbin - Dialog is fabricated.
	Script Date		: 2022.07.17
	Script Notes	: 
--]]
dofile("SpawnScripts/Generic/UnknownLanguage.lua")
require "SpawnScripts/Generic/DialogModule"

local ToSpiteaDarkleaf = 5665
local RunningForACandidate = 5666

function spawn(NPC)
    ProvidesQuest(NPC, ToSpiteaDarkleaf)
    ProvidesQuest(NPC, RunningForACandidate)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
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
if not HasLanguage(Spawn,7) then
        Garbled(NPC,Spawn)       
   elseif CanReceiveQuest(Spawn, ToSpiteaDarkleaf) then
		PlayFlavor(NPC, "voiceover/english/mariana_darkleaf/fprt_hood04/100_std_mariana_darkleaf_elf_f_callout1_3a667a53.mp3", "Elowyn is a treat for the eyes ... and even better, he's as handsome as he is stupid ...", "", 578977669, 3350940430, Spawn, 7)
   elseif CanReceiveQuest(Spawn, RunningForACandidate) then
		PlayFlavor(NPC, "", "You again? Haven't you bothered me enough?!", "", 578977669, 3350940430, Spawn, 7)
    end
end
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif not HasLanguage(Spawn,7) then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)   
elseif CanReceiveQuest(Spawn, ToSpiteaDarkleaf) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, ToSpiteaDarkleaf) and GetQuestStep(Spawn,ToSpiteaDarkleaf) >=1 then  
    DialogWait_Quest1(NPC,Spawn)
elseif CanReceiveQuest(Spawn, RunningForACandidate) then  
    Dialog3_Quest2 (NPC,Spawn)
elseif HasQuest(Spawn, RunningForACandidate) and GetQuestStep(Spawn,RunningForACandidate) ==1  then  
    DialogWait_Quest2(NPC,Spawn)
else     
     Dialog1(NPC,Spawn)
   end
end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Elowyn is a treat for the eyes ... and even better, he's as handsome as he is stupid ...")
	Dialog.AddVoiceover("voiceover/english/mariana_darkleaf/fprt_hood04/100_std_mariana_darkleaf_elf_f_callout1_3a667a53.mp3", 578977669, 3350940430)
    PlayFlavor(NPC,"","","sit_exit",0,0,Spawn)
    if CanReceiveQuest(Spawn, ToSpiteaDarkleaf) then 
    Dialog.AddOption("Excuse me... what about Elowyn?","Dialog1_Quest1")
    end
    Dialog.AddOption("Whatever you say...")
	Dialog.Start()
end

function Dialog1_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You seem lost ... Do you often wander into people's homes and start asking questions? Perhaps if the Militia were made aware of the worthless filth entering our streets, we might have less skulking about attempting to listen in on other's thoughts ... Oh, if only someone would deal with this rubbish...")
 	PlayFlavor(NPC, "", "", "shame", 0, 0, Spawn)
    Dialog.AddOption("Hey! I'm not rubbish!","Offer1")
    Dialog.AddOption("Fine. Sit here in your hovel, fool.")
	Dialog.Start()
end


function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, ToSpiteaDarkleaf)
end

function DialogWait_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm pretty sure I told you to get out of my face! Begone!")
 	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1023.mp3",  0, 0)
	PlayFlavor(NPC, "", "", "sit_exit", 0, 0, Spawn)
    if GetQuestStep(Spawn, ToSpiteaDarkleaf)==2  then 
    Dialog.AddOption("Even snakes can't get rid of me. ","Dialog2_Quest1")
    else
    Dialog.AddOption("...")
    end
    Dialog.Start()
end

function Dialog2_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    SetStepComplete(Spawn, ToSpiteaDarkleaf, 2)
	Dialog.AddDialog("UHG! You survived?! Why can't a single thing go right?! Why why WHY?!... Fine. No matter. You refuse to die? Perhaps you have other uses. Still, why must you be so infuriating?!")
 	PlayFlavor(NPC, "", "", "swear", 0, 0, Spawn)
    Dialog.AddOption("I'm glad I could dissapoint you.")
	Dialog.Start()
end


function Dialog3_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("If you keep pestering me, I will have to report you to the Freeport Militia.")
 	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1023.mp3",  0, 0)
 	PlayFlavor(NPC, "", "", "sit_exit", 0, 0, Spawn)
    if CanReceiveQuest(Spawn,RunningForACandidate) then
    Dialog.AddOption("Perhaps you should. I'm not going anywhere.","Dialog4_Quest2")
    end
    Dialog.AddOption("Fine.")
	Dialog.Start()
end

function Dialog4_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Your insolence has no limit... I have a task you can do if it will get you out of my hair. I've been keeping my eye open for someone to... protect... a friend of mine. We need to look out for eachother here in Beggar's Court, and sometimes we need a little help keeping our households in one piece... Do something with yourself and deliver this message for me?")
    Dialog.AddOption("Perhaps, but I expect payment.","Offer2")
    Dialog.AddOption("Nope. I just enjoy pestering you.")
	Dialog.Start()
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, RunningForACandidate)
end