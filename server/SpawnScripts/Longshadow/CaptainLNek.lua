--[[
	Script Name		: SpawnScripts/LongshadowAlley/CaptainLNek.lua
	Script Purpose	: Captain L`Nek
	Script Author	: torsten
	Script Date		: 2022.07.20
	Script Notes	: 
--]]
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")
require "SpawnScripts/Generic/DialogModule"

local TheTruthisoutThere = 5684
local SilencedSpeech = 5685

function spawn(NPC)
    ProvidesQuest(NPC, TheTruthisoutThere)
    ProvidesQuest(NPC, SilencedSpeech)
	SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")
    SetTempVariable(NPC, "CalloutTimer", "false")
    SetTempVariable(NPC, "CalloutTimer1", "false")
    SetTempVariable(NPC, "CalloutTimer2", "false")
    SetTempVariable(NPC, "CalloutTimer3", "false")
end

function InRange(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if CanReceiveQuest(Spawn, TheTruthisoutThere) or
         HasCompletedQuest(Spawn, TheTruthisoutThere) and
        CanReceiveQuest(Spawn,SilencedSpeech) then
    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,10000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
 		    PlayFlavor(NPC, "voiceover/english/captain_l_nek/fprt_hood05/100_captain_lnek_callout_c7c2fcfb.mp3", "Come closer; I've something to say to you!", "salute_freeport", 1023446507, 848958092, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "true")

        elseif GetTempVariable(NPC, "CalloutTimer2")== "false"then
		    PlayFlavor(NPC, "voiceover/english/captain_l_nek/fprt_hood05/100_captain_lnek_multhail1_ceb19390.mp3", "Hmm ... you are clearly not ready to serve our Militia in any capacity.  This is disappointing.", "sniff", 562398108, 1978987267, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer2", "true")

        elseif GetTempVariable(NPC, "CalloutTimer3")== "false"then
		    PlayFlavor(NPC, "voiceover/english/captain_l_nek/fprt_hood05/100_captain_lnek_multhail5_54f94dfc.mp3", "Hmm ... I am mistaken.  You are not the one I seek.", "sniff", 3750262963, 2820443341, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer3", "true")

        else
            SetTempVariable(NPC, "CalloutTimer1", "false")
            SetTempVariable(NPC, "CalloutTimer2", "false")
            SetTempVariable(NPC, "CalloutTimer3", "false")
		    PlayFlavor(NPC, "voiceover/english/captain_l_nek/fprt_hood05/100_captain_lnek_multhail6_f7ddb289.mp3", "Ah, yes.  You are the one to assist me.", "nod", 3388282438, 3532241672, Spawn, 0)
        end
    end
    end
end
end

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end



function respawn(NPC)
	spawn(NPC)
end


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif not HasCompletedQuest (Spawn,SilencedSpeech)then 
    Dialog1(NPC,Spawn)
else
    Dialog2(NPC,Spawn)
    end
end


function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It would serve you well to consider joining the militia. The militia is where the true power lies within this city.")
    PlayFlavor(NPC, "","","agree",0,0, Spawn)
	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/grd_captain_lnek.mp3",730672231,3077726269)
	
    if CanReceiveQuest(Spawn, TheTruthisoutThere) then
	Dialog.AddOption("What's so great about the Militia?", "Dialog1a")
    elseif GetQuestStep(Spawn, TheTruthisoutThere)==2 then
	Dialog.AddOption("I found out the culprit is Kirs G'viz, here in Longshadow Alley.", "Dialog1b")
    end

    if CanReceiveQuest(Spawn, SilencedSpeech) then
	Dialog.AddOption("Have the Militia dealt with the Thexian yet?", "Dialog1c")
    elseif GetQuestStep(Spawn, SilencedSpeech)==2 then
	Dialog.AddOption("I've found a signet ring on who I believe to be Kirs.", "Dialog2")
    end

	Dialog.AddOption("Alright! I'm going.")
	Dialog.Start()
end

--QUEST 1

function Dialog1a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It carries the sole burden of peace.  You must have noticed how sedition has lately saturated every district of the city.  A treasonous faction of bad blood, calling itself the Thexians, has been spreading lies into every street and alley, preaching the resurrection of Neriak upon the bones of Freeport.  I trust you can see the villainy in such talk.  We clearly need more information about these traitors.  If you wish to prove your loyalty to Freeport, you will assist us.")
	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/quests/captainlnek/lnek_x1_initial.mp3",1419069236,794084834)
	Dialog.AddOption("I am willing to prove myself!", "OfferQuest1")
	Dialog.AddOption("Don't worry. I'll see myself out.")
	Dialog.Start()
end


function OfferQuest1(NPC,Spawn)
    if CanReceiveQuest(Spawn, TheTruthisoutThere) then
    OfferQuest(NPC, Spawn, TheTruthisoutThere)
    end
end

function Dialog1b(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Really?  Interesting ... I did not foresee it, and yet it makes sense.  He incessantly questions us about the Militia, as if intending to join.  But I see now he has merely been gathering information to use against us.  He will pay for this treachery even if I have to exact the ... penalty ... myself.  It will be unpleasant.  As for you, there may yet be a promising career for you within our ranks.")
 	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/quests/captainlnek/lnek_x1_finish.mp3",3372615479,4263501678)
   PlayFlavor(NPC, "","","ponder",0,0, Spawn)
	Dialog.AddOption("I look forward to proving my worth.")
	Dialog.Start()
    SetStepComplete(Spawn, TheTruthisoutThere, 2)
end



--QUEST 2

function Dialog1c(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I regret my hands have been tied in that matter.  A passel of Inquisitors is scheduled to arrive, but they could be interrogating G'Viz for weeks.  I grow impatient to see our traitor under the blade of justice.  Hmm ... of course, if someone else were to take care of the problem behind my back ...")
	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/quests/captainlnek/lnek_x2_initial.mp3",3788373781,4065934543)
	Dialog.AddOption("It would be a shame if something happened to this troublemaker...", "OfferQuest2")
	Dialog.AddOption("Would you look at that? I must be going.")
	Dialog.Start()
end


function OfferQuest2(NPC,Spawn)
    if CanReceiveQuest(Spawn, SilencedSpeech) then
    OfferQuest(NPC, Spawn, SilencedSpeech)
    end
end

function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmmm ... I seem to have found a hangnail on my thumb.  Eh, who are you?  What nonsense are you about?  I don't waste my time chattering with the rabble.  Inquisitors have arrived to interrogate an important prisoner, and I must inform them of a complication.  So, unless you're here to report seditious speech, you had best be on your way, sirrah!")
 	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/quests/captainlnek/lnek_x2_finish.mp3",657243154,2443782081)
    PlayFlavor(NPC, "","","sniff",0,0, Spawn)
	Dialog.AddOption("I see... as you were.", "Dialog2a")
	Dialog.Start()
    if GetQuestStep(Spawn, SilencedSpeech)==2 then
    SetStepComplete(Spawn, SilencedSpeech, 2)
    end
end

