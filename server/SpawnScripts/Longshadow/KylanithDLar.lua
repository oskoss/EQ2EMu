--[[
	Script Name	: SpawnScripts/Longshadow/KylanithDLar.lua
	Script Purpose	: Kylanith D`Lar 
	Script Author	: John Adams//Dorbin (Restructured w/ DialogMod & garbled 15/10/2023)
	Script Date	: 2008.09.29 (20.7.2022 by torsten)
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
require "SpawnScripts/Generic/DialogModule"
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

local TheStolenArtifactsofThex = 5683

function spawn(NPC)
    ProvidesQuest(NPC, TheStolenArtifactsofThex)
	SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
    elseif not HasLanguage(Spawn,2)then
	FaceTarget(NPC, Spawn)
    Garbled(NPC,Spawn)
else    
end
end


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else  
    if not HasLanguage(Spawn,2)then
	FaceTarget(NPC, Spawn)
    Garbled(NPC,Spawn)
    else
    Dialog1(NPC,Spawn)
    end
    end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("They call this the Age of Destiny. It's the age of someone's or some empire's claim to destiny. The world is in ruins. And now here we are, in Freeport, begging for acceptance and the embrace of its mighty walls.")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/qst_kylanith_hail.mp3", 387692981, 2731095766)
	Dialog.AddLanguage(2)
	Dialog.AddOption("I cannot chat now. Farewell.")
    if not HasQuest(Spawn, TheStolenArtifactsofThex) and not HasCompletedQuest(Spawn, TheStolenArtifactsofThex) then
	Dialog.AddOption("Freeport is strong! Qeynos is weak!", "Dialog2")
    elseif GetQuestStep(Spawn, TheStolenArtifactsofThex) == 5 then
	Dialog.AddOption("I could only find four monuments.", "Dialog8")
    elseif GetQuestStep(Spawn, TheStolenArtifactsofThex) == 7 then
	Dialog.AddOption("I found the last monument, but it was illegible.", "Dialog9")
    end
	Dialog.Start()
	
end




function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Qeynos or Freeport? There was no choice for my kind. The Antonicans fear the greatness of the Teir'Dal. And the Overlord? I believe he knows he cannot rule us, but better to keep an eye on us than let us claim our destiny.  We only exist within Longshadow Alley by the will of the Foci, not Lucan!")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_01.mp3", 1570701615, 3622138466)
    PlayFlavor(NPC, "","","shrug",0,0, Spawn)
	Dialog.AddLanguage(2)
	Dialog.AddOption("Careful! Do not speak the Overlord's name or we shall both die!", "Dialog3")
	Dialog.AddOption("I cannot chat now. Farewell.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I would rather welcome death than give Lucan allegiance! To those who bask in the light, we have done little more than pose a threat to their existence. He and his puppet they call Foci will tremble when Neriak roars again! Our past grandeur shall rise again.")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_02.mp3", 1956578837, 2860993398)
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
	Dialog.AddLanguage(2)
	Dialog.AddOption("What grandeur?", "Dialog4")
	Dialog.AddOption("I cannot chat now. Farewell.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The grandeur of an empire that spans greater than the Shattered Lands. An empire that has existed longer than man or elf ruled these lands. All that most know of us is a city called Neriak, never knowing truth.")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_03.mp3", 4093915268, 1190295502)
	Dialog.AddLanguage(2)
	Dialog.AddOption("What happened to Neriak?", "Dialog5")
	Dialog.AddOption("I cannot chat now. Farewell.")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Many say it has been consumed by the Underfoot that once sheltered it. Crushed under the weight of the falling surface as quakes rend this land asunder, creating what we now know as the Shattered Lands. We know only of the relics that remain.")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_09.mp3", 1273569291, 3869823159)
    PlayFlavor(NPC, "","","orate",0,0, Spawn)
	Dialog.AddLanguage(2)
	Dialog.AddOption("What relics?", "Dialog6")
	Dialog.AddOption("I cannot chat now. Farewell.")
	Dialog.Start()
end


function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Ashlands, or should I say, Nektulos? That was once the surface territory of the dark elf empire. It is littered with remnants of that ancient occupation. Even here in Freeport you can find dark elf artifacts.")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_10.mp3", 1404555822, 3452180553)
	Dialog.AddLanguage(2)
	if CanReceiveQuest(Spawn,TheStolenArtifactsofThex)then
	Dialog.AddOption("Where can I find these relics in Freeport?", "Dialog7")
    end
    Dialog.AddOption("I cannot chat now. Farewell.")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Gossip is circulating that within the walls of Freeport our ancient allies have betrayed us yet again! The wretched oafs of Big Bend have claimed five artifacts of Thexian past. I must know if this is true!")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_11.mp3", 568372124, 1694164407)
	Dialog.AddLanguage(2)
	Dialog.AddOption("I can find the five artifacts.", "Offer")
	Dialog.AddOption("I cannot chat now. Farewell.")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,TheStolenArtifactsofThex)
	FaceTarget(NPC, Spawn)
end


function Dialog8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I was afraid of that. Recent reports from fellow Thexians have placed another Thex monument being used as a grave marker within the graveyard of Freeport. Go there and seek it out. ")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/quests/kylanithdlar/kylanith_lore_12.mp3", 250824677, 1536158300)
	Dialog.AddLanguage(2)
	Dialog.AddOption("I shall find the gravestone.","Update7")
	Dialog.Start()
end

function Update7(NPC,Spawn)
    SetStepComplete(Spawn,TheStolenArtifactsofThex,5)
end


function Dialog9(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm pleased with your find. Now my fellow Thexians and I can conspire to retrieve these artifacts. No one will dare claim such things in the future, lest they encounter the wrath of the Thexians.")
	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/language/thexian/lan_5_kylanith_x1_initial02.mp3", 3166325585, 1383277729)
	Dialog.AddLanguage(2)
	Dialog.AddOption("Farewell Kylanith.")
	Dialog.Start()
	SetStepComplete(Spawn,TheStolenArtifactsofThex,7)
end
