--[[
	Script Name	: SpawnScripts/BeggarsCourt/CrispinLuviniusBC.lua
	Script Purpose	: Crispin Luvinius 
	Script Author	: Scatman\\torsten\\Dorbin
	Script Date	: 2009.07.26 (17.7.2022 by torsten, moved both quests from The Sprawl to Beggar's Court as in classic EverQuest)
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local ProblemSolving = 5661
local AdvancedProblemSolving = 5662

function spawn(NPC)
	ProvidesQuest(NPC, ProblemSolving)
	ProvidesQuest(NPC, AdvancedProblemSolving)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
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
    if CanReceiveQuest(Spawn, ProblemSolving) or CanReceiveQuest(Spawn, AdvancedProblemSolving) then

    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,30000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
		    PlayFlavor(NPC, "voiceover/english/crispin_luvinius/fprt_hood04/100_std_crispin_luvinius_hum_m_callout1_eb27037a.mp3", "Are you looking for trouble?  It'll find you if you don't keep walking.", "", 3293258894, 514248132, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "true")

        elseif GetTempVariable(NPC, "CalloutTimer1")== "true"then
		    PlayFlavor(NPC, "voiceover/english/crispin_luvinius/fprt_hood04/100_std_crispin_luvinius_hum_m_multhail1_e039d831.mp3", "Are you looking for trouble?  It'll find you if you don't keep walking.", "glare", 2395364912, 2338408737, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "false")
        end
    end
    elseif HasQuest(Spawn, ProblemSolving) or HasQuest(Spawn, AdvancedProblemSolving) then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,30000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
        PlayFlavor(NPC, "voiceover/english/crispin_luvinius/fprt_hood04/100_std_crispin_luvinius_hum_m_multhail3_69ad5b7d.mp3","I thought you weren't looking for trouble, problem solver? I suggest you solve my problem or trouble will find you, understand?","glare",3672937879,782097653, Spawn)
            SetTempVariable(NPC, "CalloutTimer1", "true")

        elseif GetTempVariable(NPC, "CalloutTimer1")== "true"then
            PlayFlavor(NPC, "voiceover/english/crispin_luvinius/fprt_hood04/100_std_crispin_luvinius_hum_m_multhail3_69ad5b7d.mp3","I thought you weren't looking for trouble, problem solver? I suggest you solve my problem or trouble will find you, understand?","tapfoot",3672937879,782097653, Spawn)
            SetTempVariable(NPC, "CalloutTimer1", "false")
        end    
end
end
end


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","cutthroat",0,0, Spawn)
elseif GetQuestStep(Spawn,ProblemSolving)==1 then
 	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "voiceover/english/crispin_luvinius/fprt_hood04/100_std_crispin_luvinius_hum_m_multhail3_69ad5b7d.mp3","I thought you weren't looking for trouble, problem solver? I suggest you solve my problem or trouble will find you, understand?","glare",3672937879,782097653, Spawn)
elseif GetQuestStep(Spawn,AdvancedProblemSolving)==1 then
 	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "voiceover/english/crispin_luvinius/fprt_hood04/100_std_crispin_luvinius_hum_m_multhail3_69ad5b7d.mp3","I thought you weren't looking for trouble, problem solver? I suggest you solve my problem or trouble will find you, understand?","glare",3672937879,782097653, Spawn)
else
     Dialog1(NPC,Spawn)
   end
end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Do you have a problem? You're gonna have one soon if you don't keep walking.")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/std_crispin_luvinius.mp3", 1982819374, 703450678)
    if CanReceiveQuest(Spawn,ProblemSolving) then
	Dialog.AddOption("I don't have a problem... I solve problems. Anything you need fixed?", "Dialog2")
    elseif GetQuestStep(Spawn, ProblemSolving) == 2 then
	Dialog.AddOption("They won't be delivering ANY kind of message.", "Dialog4")
    end    
    if CanReceiveQuest(Spawn,AdvancedProblemSolving) then
	Dialog.AddOption("So... have any more problems you can't handle yourself?", "Dialog5")
    elseif GetQuestStep(Spawn, AdvancedProblemSolving) == 2 then
	Dialog.AddOption("Those Giantslayers got the 'message'.", "Dialog7")
    end  
    Dialog.AddOption("I don't want any trouble.")
	Dialog.Start()
end

--========================= Quest 1

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("A problem solver, huh? You can talk the talk, but can you walk the walk? Yeah ... I got a problem. One of our customers isn't paying us for our \"services,\" if you know what I'm saying. Maybe you can fix this problem for us, huh?")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/quests/crispinluvinius/crispin_x1_initial.mp3", 1249000377, 1908833201)
	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn, 0)
	Dialog.AddOption("Of course I can. I said I was a problem solver, didn't I?", "Offer1")
	Dialog.AddOption("Not really... I've got too many other things to do. Maybe some other time.")
	Dialog.Start()
end

function Offer1(NPC, Spawn)
	OfferQuest(NPC, Spawn, ProblemSolving)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Come back when you're done.")
	Dialog.AddOption("All right.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You mean ... you actually killed him?! Whoa ... you are tough! I never... Well, I didn't think you would actually... kill him. Okay, friend, here's your money. I don't want you thinking I'm not a man of my word ... Wow. You actually killed him! I must tell Manius about this!")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/quests/crispinluvinius/crispin_x1_finish.mp3", 439266675, 1963599984)
	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn, 0)
	Dialog.AddOption("That would be good. Do that for me.")
	Dialog.Start()
    SetStepComplete(Spawn, ProblemSolving, 2)
end

--==================== Quest 2



function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh!  I recognize you.  Glad you came along ... yeah ... very glad.  I hope your uh ... services ... are available again because ... uh ... there's this little matter... and I'm too busy to take care of it.  Yes, too busy.")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/quests/crispinluvinius/crispin_x2_initial.mp3", 1982819374, 703450678)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn, 0)
	Dialog.AddOption("As long as you have the money, I'm willing to do it.", "Offer2")
	Dialog.AddOption("Sorry... I don't work for lazy people... or cowards.")
	Dialog.Start()
end

function Offer2(NPC, Spawn)
    OfferQuest(NPC, Spawn, AdvancedProblemSolving)
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Good, maybe you'll earn some respect with us.")
	Dialog.AddOption("Yah, yah.")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I knew you'd take care of 'em!  Good show! Oh, and here's a bit-o-coin for all your hard work.  Heh, heh.")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/quests/crispinluvinius/crispin_x2_finish.mp3", 156925709, 1579873115)
	PlayFlavor(NPC, "", "", "smile", 0, 0, Spawn, 0)
	Dialog.AddOption("Maybe I might, maybe not. We'll see what my schedule is like.")
	Dialog.Start()
    SetStepComplete(Spawn, AdvancedProblemSolving, 2)
end

