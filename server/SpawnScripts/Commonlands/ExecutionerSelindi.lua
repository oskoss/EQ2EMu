--[[
    Script Name    : SpawnScripts/Commonlands/ExecutionerSelindi.lua
    Script Author  : Premierio015
    Script Date    : 2021.05.24 06:05:32
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
	SetPlayerProximityFunction(NPC,22, "InRange", "LeaveRange")
    ProvidesQuest(NPC,5891)
end

function LeaveRange(NPC,Spawn)
if HasCompletedQuest(Spawn,5890) and CanReceiveQuest(Spawn,5891) then
    SetPosition(Spawn,-1344.42, -69.53, 333.57, 218.64)
    PlayFlavor(NPC,"","Hey! I need to speak with you!","beckon",0,0,Spawn)
end
end

function InRange(NPC,Spawn)
if HasCompletedQuest(Spawn,5890) and not HasQuest(Spawn,5891) then
    OfferQuest(NPC,Spawn,5891)
end
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if HasQuest(Spawn,5891) and GetQuestStep(Spawn,5891)==1 then
    Dialog1(NPC,Spawn)
else
    PlayFlavor(NPC, "voiceover/english/optional1/executioner_selindi/commonlands/quest/020_executioner_selindi_callout1_da9a558a.mp3", "Move along unless you want to join these skeletons.", "", 2115754705, 267010184, Spawn)
end
end


function Dialog1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Pay attention, for I only have time to say it once.  The rare poison coating my axe preserved you long enough for me to revive you.  It may be a very long time before you fully recover from the poison.  I believed your words, friend.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_3_1051.mp3", 0, 0)
    Dialog.AddOption("Friend...?","Dialog2")	
    Dialog.AddOption("I will at once.","Dialog3")	
	Dialog.Start()
end

function Dialog2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I am not what I appear to be.  I am here in Freeport to find people like you, people who turn away from the path of evil.  No one has seen past my illusion yet.  Listen!  You have to flee!  When the necromancers find your body missing, they'll come looking for you.")
    PlayFlavor(NPC,"","","no",0,0,Spawn)
    Dialog.AddOption("Where should I go?","Dialog3")	
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
    SetStepComplete(Spawn,5891,1)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Stow away on a ship and travel to Antonica.  I will send a message to my old friend, Vishra.  Seek him out near the gnoll's lair where he fights to stop their impending threat.  I will tell him that you need a home. Go before it's too late!")
    Dialog.AddOption("Thank you Selindi. I will go to Antonica!")	
	Dialog.Start()
end	
	
function respawn(NPC)
	spawn(NPC)
end


--
--
--