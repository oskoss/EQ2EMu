--[[
	Script Name		: SpawnScripts/BigBend/QuintiusCalacicus.lua
	Script Purpose	: Quintius Calacicus
	Script Author	: Dorbin
	Script Date		: 2023.06.28
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local PayingTheTab = 5625
local Citizenship = 5860

function spawn(NPC)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
end

function InRange(NPC, Spawn)
if HasQuest(Spawn,Citizenship) and GetQuestStep(Spawn,Citizenship)==4 then
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/banker_quintius_calacicus/fprt_hood1/100_bankerquintiuscalacicus_housing_quest_1_22bf58bf.mp3", "Are you the one opening the new account?", "bye", 1249171681, 483955197, Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end

--[[    if HasQuest(Spawn, PayingTheTab) and not HasCompletedQuest(Spawn, PayingTheTab) then
        SetStepComplete(Spawn, PayingTheTab, 1)
    end]]--

function hailed(NPC, Spawn)

if GetFactionAmount(Spawn,12) <0 then
	PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn)
elseif HasQuest(Spawn,Citizenship) and GetQuestStep(Spawn,Citizenship)==4 then
Dialog2(NPC, Spawn)
else
Dialog1(NPC, Spawn)
end
end



function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes, you look like the one Valthun described.  Before we can open your account, we need some information from you.  What's your name?")
	Dialog.AddVoiceover("voiceover/english/banker_quintius_calacicus/fprt_hood1/bnk_quintiuscalacicus_hail005.mp3", 1931707060, 2633731022)
	Dialog.AddOption(""..GetName(Spawn).."","Dialog2a")
	Dialog.Start()
end

function Dialog2a(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Occupation?")
	Dialog.AddVoiceover("voiceover/english/banker_quintius_calacicus/fprt_hood1/bnk_quintiuscalacicus_hail006.mp3", 237773570, 2383442663)
	Dialog.AddOption("Adventurer","Dialog2b")
	Dialog.AddOption("Crafter","Dialog2b")
    if GetRace(Spawn)==12 then
	Dialog.AddOption("Skull basher?","Dialog2b")
    elseif GetRace(Spawn)==14 then
	Dialog.AddOption("Ummm...I clobber rats good?","Dialog2b")
    end
	Dialog.Start()
end

function Dialog2b(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Any surviving relatives, do you ever leave your house unarmed, and are you a deep sleeper?")
	Dialog.AddVoiceover("voiceover/english/banker_quintius_calacicus/fprt_hood1/bnk_quintiuscalacicus_hail007.mp3", 3182562544, 987337462)
	PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddOption("No, no, and no.","Dialog2c")
	Dialog.AddOption("[Lie] No, no, and no.","Dialog2c")
	Dialog.AddOption("No - Wait... what?","Dialog2c")
	Dialog.Start()
end

function Dialog2c(NPC, Spawn)
if HasQuest(Spawn,Citizenship) and GetQuestStep(Spawn,Citizenship)==4 then
    SetStepComplete(Spawn, Citizenship,4)
end
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("How convenient for you.  Very well ... we've set aside a place for you within the Freeport Reserve vaults. Feel free to deposit large amounts of coin or valuable artifacts with us anytime.  We'll be sure to keep it ... safe.  Is there anything else?")
	Dialog.AddVoiceover("voiceover/english/banker_quintius_calacicus/fprt_hood1/bnk_quintiuscalacicus_hail008.mp3", 456708908, 2072469521)
	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddOption("Not right now.")
	Dialog.Start()
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Welcome to the Freeport Reserve. Will you entrust me with your valuables and cash? I'll take fine care of them.")
	Dialog.AddVoiceover("voiceover/english/banker_quintius_calacicus/fprt_hood1/bnk_quintiuscalacicus_hail.mp3", 3742555178, 748563821)
	Dialog.AddOption("Thank you.")
	Dialog.Start()
end

