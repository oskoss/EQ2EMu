--[[
	Script Name		: SpawnScripts/BeggarsCourt/AntiusVedrix.lua
	Script Purpose	: Antius Vedrix
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.15
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"
local AntiusPackage = 5651

function spawn(NPC)
    ProvidesQuest(NPC, AntiusPackage)
    SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    SetTempVariable(NPC, "CalloutTimer1", "false")
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if CanReceiveQuest(Spawn, AntiusPackage) then

    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,10000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
		    PlayFlavor(NPC, "voiceover/english/antius_vedrix/fprt_hood04/100_std_antius_vedrix_hum_m_callout_ad73c4ec.mp3", "Halt, traveler! What brings you to Beggar's Court?", "", 2768553746, 584609282, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "true")

        elseif GetTempVariable(NPC, "CalloutTimer1")== "true"then
		    PlayFlavor(NPC, "voiceover/english/antius_vedrix/fprt_hood04/100_std_antius_vedrix_hum_m_multhail1_cd2636f5.mp3", "Who are you? You're not the new guy! Get out of here!", "stare", 3883094832, 1572266881, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "false")
        end
    end
    else
	PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn, 0)
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
elseif GetQuestStep(Spawn, AntiusPackage)==1 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","Hmmm ... maybe you're not the new guy. You did have the password, but you didn't deliver Mirini's package. Deliver it now, or I'll have you arrested!","glare",0,0, Spawn)
else    
 Dialog1(NPC, Spawn)    
end
end

function Offer(NPC, Spawn)
	OfferQuest(NPC, Spawn, AntiusPackage)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You're the new guy, eh? You don't look like someone they'd send.")
	Dialog.AddVoiceover("voiceover/english/antius_vedrix/fprt_hood04/std_antius_vedrix.mp3", 3589010304, 1953824103)
    if CanReceiveQuest(Spawn,AntiusPackage) then
	Dialog.AddOption("I could break your face just for looking at me, fool!", "DialogFail")
	Dialog.AddOption("[Lie] Looks can be deceiving... What is going on?", "Dialog2")
	Dialog.AddOption("What are you going on about?", "Dialog2")
	Dialog.AddOption("I'm not. Bye.")

	elseif GetQuestStep(Spawn,AntiusPackage) ==2 then
	Dialog.AddOption("Mirin said that it's getting bigger and that he needs more hooks. WHAT IS GOING ON?!", "Dialog3")
    else
    Dialog.AddOption("Nope. Not today.")
    end	    
	Dialog.Start()
end

function DialogFail(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Who are you? You're not the new guy! Get out of here!")
	Dialog.AddVoiceover("voiceover/english/antius_vedrix/fprt_hood04/100_std_antius_vedrix_hum_m_multhail1_cd2636f5.mp3", 3883094832, 1572266881)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
	Dialog.AddOption("...")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Good, good, you know the password. All right, so you are the new guy. Okay, I tied up the package nice and tight like Mirini wanted ...  it even has flowers on it. Go ahead, do your thing, and make sure Mirini gets it!")
	Dialog.AddVoiceover("voiceover/english/antius_vedrix/fprt_hood04/quests/antiusvedrix/antius_x1_initial.mp3", 3222236480, 2970401654)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn, 0)
	Dialog.AddOption("No, really. What is going on here!?", "Offer")
	Dialog.AddOption("This whole thing is a mixup. I'm leaving!")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Haha! Good one, sir, good one. Okay, I'll set up the hooks. It was an honor working with you. Here's the payment as promised. Every coin is there.")
	Dialog.AddVoiceover("voiceover/english/antius_vedrix/fprt_hood04/quests/antiusvedrix/antius_x1_finish.mp3", 90111985, 3240949963)
	PlayFlavor(NPC, "", "", "chuckle", 0, 0, Spawn, 0)
	Dialog.AddOption("Thanks...")
	Dialog.AddOption("[Lie] Thanks.")
	Dialog.AddOption("I still have no idea what is happening...")
	Dialog.Start()
	SetStepComplete(Spawn,AntiusPackage,2)
end


function respawn(NPC)
	spawn(NPC)
end




   