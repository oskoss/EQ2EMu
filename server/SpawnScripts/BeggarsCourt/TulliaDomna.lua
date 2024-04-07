--[[
	Script Name		: SpawnScripts/BeggarsCourt/TulliaDomna.lua
	Script Purpose	: Tullia Domna
	Script Author	: Dorbin
	Script Date		: 11.17.2023
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"

local AnErrandfortheQueen = 5650

function spawn(NPC)
    ProvidesQuest(NPC, AnErrandfortheQueen)
    SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    SetTempVariable(NPC, "CalloutTimer1", "false")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if CanReceiveQuest(Spawn, AnErrandfortheQueen) then
    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,30000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
		    PlayFlavor(NPC, "voiceover/english/tullia_domna/fprt_hood04/100_std_tullia_domna_hum_f_callout1_77869ddd.mp3", "Come hither ... how can I, Queen Antonia Bayle, serve you?", "royalwave", 3532309135, 780107631, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "true")

        elseif GetTempVariable(NPC, "CalloutTimer1")== "true"then
		    PlayFlavor(NPC, "voiceover/english/tullia_domna/fprt_hood04/100_std_tullia_domna_hum_f_multhail1_d22d25ec.mp3", "A person of my fine breeding doesn't do business with lowly half-breeds. Get out of my sight, peasant.", "sniff", 3463656577, 661872862, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "false")
        end
    end
else
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
else    
 Dialog1(NPC, Spawn)    
end
end

function Offer(NPC, Spawn)
	OfferQuest(NPC, Spawn, AnErrandfortheQueen)
end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It's disgusting that a person of my fine breeding has to do business with lowly half-breeds.")
	Dialog.AddVoiceover("voiceover/english/tullia_domna/fprt_hood04/std_tullia_domna.mp3", 4000439764, 2378172444)
 	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn, 0)
    if CanReceiveQuest(Spawn,AnErrandfortheQueen) then
	Dialog.AddOption("I'm not sure what kind of breeding made you, but it certainly wasn't fine!", "Dialog2")
	elseif GetQuestStep(Spawn,AnErrandfortheQueen) ==2 then
	Dialog.AddOption("I've dealt with the Giantslayer bashers.", "Dialog3")
    elseif HasCompletedQuest(Spawn,AnErrandfortheQueen) then
    Dialog.AddOption("It IS truly digusting, my 'Queen'...")
    end	    
    Dialog.AddOption("With that, I'm out of here.")
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("HOW DARE YOU ADDRESS ME LIKE THAT!  I am Queen Antonia Bayle, lord and protector of the UNIVERSE!  I'm on a top-secret mission, so do not spread word of my presence, understand?  My mission is to eat all the cheese before my husband, Lucan, finds it.  I need my public executioner, NOW!  Is that you?")
	Dialog.AddVoiceover("voiceover/english/tullia_domna/fprt_hood04/quests/tulladomna/tulla_x1_initial.mp3", 309451026, 621524268)
	PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn, 0)
	Dialog.AddOption("Whoa, are you okay?", "Offer")
	Dialog.AddOption("Wow, talk about a basket case! I've heard enough.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Perfect timing!  The Royal Cricket King informed me that the ogres planned to blow down these walls with their beastly breath!  You just saved everyone's life!  You, noble executioner, deserve a knighting for your valor.  From here on, we shall call you Champion Knight Executioner Wall Saver Extraordinaire!  Please, let me anoint you with your sword.")
	Dialog.AddVoiceover("voiceover/english/tullia_domna/fprt_hood04/quests/tulladomna/tulla_x1_finish.mp3", 2821413761, 1097570580)
	PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn, 0)
	Dialog.AddOption("I thank you for the honor... No need to use anything sharp.")
	Dialog.Start()
	SetStepComplete(Spawn,AnErrandfortheQueen,2)
end

