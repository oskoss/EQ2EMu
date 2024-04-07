--[[
	Script Name		: SpawnScripts/BeggarsCourt/LuciusVulso.lua
	Script Purpose	: Lucius Vulso
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.15
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"

local CasingtheJoint = 5652
local IntoTheSewersForLucius = 5653

function spawn(NPC)
    ProvidesQuest(NPC, CasingtheJoint)
    ProvidesQuest(NPC, IntoTheSewersForLucius)
   SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    SetTempVariable(NPC, "CalloutTimer1", "false")
    SetTempVariable(NPC, "CalloutTimer2", "false")
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if CanReceiveQuest(Spawn, CasingtheJoint) or CanReceiveQuest(Spawn, IntoTheSewersForLucius) then

    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,25000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
		    PlayFlavor(NPC, "voiceover/english/lucius_vulso/fprt_hood04/100_std_lucius_vulso_hum_m_callout1_96f04ea2.mp3", "What do you need? I've no time for small talk.", "no", 1224233, 3736016050, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "true")

        elseif GetTempVariable(NPC, "CalloutTimer1")== "true" and GetTempVariable(NPC, "CalloutTimer2")== "false" then
		    PlayFlavor(NPC, "voiceover/english/lucius_vulso/fprt_hood04/100_std_lucius_vulso_hum_m_multhail1_18444fa9.mp3", "I'm in the middle of a deal. I'll talk to you later.", "sniff", 4080304669, 3804087598, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer2", "true")
        elseif GetTempVariable(NPC, "CalloutTimer1")== "true" and GetTempVariable(NPC, "CalloutTimer2")== "true" then
		    PlayFlavor(NPC, "voiceover/english/lucius_vulso/fprt_hood04/100_std_lucius_vulso_hum_m_multhail2_3c417282.mp3", "I'm in the middle of a deal. What do you need?", "nod", 1601702374, 1327844746, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "false")
            SetTempVariable(NPC, "CalloutTimer2", "false")
        end
    end
    else
end
end
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function respawn(NPC)
	spawn(NPC)
end


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn,CasingtheJoint) then    
    Dialog1(NPC, Spawn)  
elseif GetQuestStep(Spawn, CasingtheJoint)==1 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","I'm still waiting to hear about the bank... Are you up to this job or not? Get out to Stonestair Byway and find me some information!","tapfoot",0,0, Spawn)
elseif CanReceiveQuest(Spawn,IntoTheSewersForLucius) then    
    Dialog4(NPC, Spawn)    
elseif GetQuestStep(Spawn, IntoTheSewersForLucius)==1 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","Hmmm ... maybe you're not the new guy. You did have the password, but you didn't deliver Mirini's package. Deliver it now, or I'll have you arrested!","glare",0,0, Spawn)
else
    Dialog1(NPC, Spawn)  
end
end


function Offer1(NPC, Spawn)
	OfferQuest(NPC, Spawn, CasingtheJoint)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm in the middle of a deal. I'll talk to you later.")
	Dialog.AddVoiceover("voiceover/english/lucius_vulso/fprt_hood04/std_lucius_vulso.mp3", 2804190422, 1062724591)
    if CanReceiveQuest(Spawn,CasingtheJoint) then
	Dialog.AddOption("A deal? Have any work I can do?", "Dialog2")
	elseif GetQuestStep(Spawn,CasingtheJoint) ==2 then
	Dialog.AddOption("There's a rumor running around that the vault can be tunneled into through the sewers.", "Dialog3")
    else
    end	    
    Dialog.AddOption("Alright.")
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What do I look like, a goodwill ambassador? Well ... actually, I might just need your help ... Yes. I do have a job, and it pays well. Interested?")
	Dialog.AddVoiceover("voiceover/english/lucius_vulso/fprt_hood04/quests/luciusvulso/lucius_x1_initial.mp3", 23416108, 1883932119)
	PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn, 0)
	Dialog.AddOption("Sure. What's the job?", "Offer1")
	Dialog.AddOption("Wait, nevermind.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh really??? Hmmm ... I never thought of that. That just might work ... hmmm ... Why are you still here? Oh yeah ... you want money. Well, here's your coin. Thanks for helping me ...  ")
	Dialog.AddVoiceover("voiceover/english/lucius_vulso/fprt_hood04/quests/luciusvulso/lucius_x1_finish.mp3", 1554547629, 3981882396)
	PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn, 0)
	Dialog.AddOption("Sure. Good luck on that 'deal'.")
	Dialog.Start()
	SetStepComplete(Spawn,CasingtheJoint,2)
end

--Quest2

function Offer2(NPC, Spawn)
	OfferQuest(NPC, Spawn, IntoTheSewersForLucius)
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm in the middle of a deal. What do you need?")
	Dialog.AddVoiceover("voiceover/english/lucius_vulso/fprt_hood04/100_std_lucius_vulso_hum_m_multhail2_3c417282.mp3",1601702374, 1327844746)
    if CanReceiveQuest(Spawn,IntoTheSewersForLucius) then
	Dialog.AddOption("Have you broken into the bank yet?", "Dialog5")
	elseif GetQuestStep(Spawn,IntoTheSewersForLucius) ==2 then
	Dialog.AddOption("I've collected the slime from the frogs.", "Dialog6")
    else
    Dialog.AddOption("Alright.")
    end	    
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Shhh ... Keep it down! Don't broadcast my plan - someone might run off with my brilliant, moneymaking scheme and rob the bank! I need a few things before my plan is complete. Are you interested in earning more coin?")
	PlayFlavor(NPC, "", "", "heckno", 0, 0, Spawn, 0)
	Dialog.AddOption("I might regret this.", "Offer2")
	Dialog.AddOption("A heist? No, not right now.")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Great! It doesn't smell too bad. When I dig into their home, I bet I'll fit right in with those frogs. Here, take this coin, friend. If I pull off this robbery, we'll be famous. Fortunately, I'll have enough money to buy a boat and escape. You best start saving for a boat as well. Good luck...")
	PlayFlavor(NPC, "", "", "yes", 0, 0, Spawn, 0)
	Dialog.AddOption("I knew I would regret this.")
	Dialog.Start()
	SetStepComplete(Spawn,IntoTheSewersForLucius,2)
end
