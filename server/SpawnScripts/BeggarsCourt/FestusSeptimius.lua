--[[
	Script Name		: SpawnScripts/BeggarsCourt/FestusSeptimius.lua
	Script Purpose	: Festus Septimius
	Script Author	: torsten\\Dorbin 
	Script Date		: 2022.07.15
	Script Notes	: Cleaned up script, added emotes/callouts/finish text - Dorbin
--]]

require "SpawnScripts/Generic/DialogModule"

local BottlesOfBeerInMyHand = 5649

function spawn(NPC)
    ProvidesQuest(NPC, BottlesOfBeerInMyHand)
    SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    SetInfoStructString(NPC, "action_state", "artificing_idle")
end

function InRange(NPC,Spawn)
if CanReceiveQuest(Spawn,BottlesOfBeerInMyHand) and GetTempVariable(NPC,"CalloutTimer") ~= "true" then    
    SetTempVariable(NPC,"CalloutTimer","true")
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "voiceover/english/festus_septimus/fprt_hood04/100_std_festus_septimius_hum_m_callout_bff82cf.mp3", "This is hand blown, custom made glass.  You break it, and I'll break something of yours, got it?", "glare", 202406317, 1807424794, Spawn, 0)
   AddTimer(NPC,60000,"ResetCallout",1,Spawn)
elseif HasCompletedQuest(Spawn,BottlesOfBeerInMyHand) and GetTempVariable(NPC,"CalloutTimer") ~= "true" then
    SetTempVariable(NPC,"CalloutTimer","true")
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "voiceover/english/festus_septimus/fprt_hood04/100_std_festus_septimius_hum_m_multhail4_73ae922d.mp3", "Leave before you break something. I no longer need your services.", "no", 266472789, 272800124, Spawn, 0)
   AddTimer(NPC,100000,"ResetCallout",1,Spawn)
end
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
        Dialog1(NPC, Spawn)
end

function Offer(NPC, Spawn)
	OfferQuest(NPC, Spawn, BottlesOfBeerInMyHand)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("This glass is all hand blown and custom made. If you break it, then I break something of yours, got it?")
	Dialog.AddVoiceover("voiceover/english/festus_septimus/fprt_hood04/std_festus_septimius.mp3", 692395193, 2329059486)
    if CanReceiveQuest(Spawn,BottlesOfBeerInMyHand) then
	Dialog.AddOption("What would you do if I broke all of them?", "Dialog2")
	elseif GetQuestStep(Spawn,BottlesOfBeerInMyHand) ==2 then
	Dialog.AddOption("I've got some of sand. Is this what you needed?", "Dialog3")
    end	    
	Dialog.AddOption("I'll be careful.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ha ha! Good luck, buddy. I'd like to see you try and break my sturdy glassware! Now, instead of throwing back and forth useless threats, how 'bout I hire you? I need someone with your attitude. Are you willing to do some hunting?")
	Dialog.AddVoiceover("voiceover/english/festus_septimus/fprt_hood04/quests/festusseptimus/festus_x1_initial.mp3", 2997850121, 1619430784)
	PlayFlavor(NPC, "", "", "chuckle", 0, 0, Spawn, 0)
	Dialog.AddOption("What did you have in mind?", "Offer")
	Dialog.AddOption("No, I'm not.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yeah, that's the stuff ... look at how gritty it is.  Using this sand in my compound, I can make bottles that don't shatter. Who wants to be in a tavern brawl with a bottle that breaks into pieces? Yes, my bottles shall break with nice, jagged edges, perfect for gutting someone.   Now, leave before you break something. I no longer need your services.")
	Dialog.AddVoiceover("voiceover/english/festus_septimus/fprt_hood04/quests/festusseptimus/festus_x1_finish.mp3", 1838584375, 682330236)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn, 0)
	Dialog.AddOption("I see. I'll think of you the next time I gut someone in a tavern.")
	Dialog.Start()
	SetStepComplete(Spawn,BottlesOfBeerInMyHand,2)
end