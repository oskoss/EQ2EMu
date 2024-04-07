--[[
	Script Name		: SpawnScripts/BeggarsCourt/TsuulNyghtfallow.lua
	Script Purpose	: Tsuul Nyghtfallow
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.17
	Script Notes	: MANUFACTURED MOST DIALOG. NO VOs nor RECORDS. -- Dorbin
--]]
require "SpawnScripts/Generic/DialogModule"
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

local TheNyghtfallowHeirloom = 5664

function spawn(NPC)
    ProvidesQuest(NPC, TheNyghtfallowHeirloom)
end

function respawn(NPC)
	spawn(NPC)
end


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif not HasLanguage(Spawn,7) then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)    
else
    if CanReceiveQuest(Spawn, TheNyghtfallowHeirloom) then  
    Dialog1(NPC,Spawn)
    elseif  GetQuestStep(Spawn,TheNyghtfallowHeirloom) >=1 then  
    DialogWait_Quest1(NPC,Spawn)
    else     
    Dialog1(NPC,Spawn)
    end
    end
end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddLanguage(7)
	Dialog.AddDialog("Better for us to watch eachother's backs than to find a blade in them.")
	Dialog.AddVoiceover("voiceover/english/halfelf_eco_race_good/ft/eco/good/halfelf_eco_race_good_halfelf_gm_7a593271.mp3", 2010917197, 1213460588)
    PlayFlavor(NPC,"","","hello",0,0,Spawn)
    if CanReceiveQuest(Spawn, TheNyghtfallowHeirloom) then 
    Dialog.AddOption("I'd agree with that.","Dialog1_Quest1")
    end
    Dialog.AddOption("I might just stick you with one.","Whoa")
	Dialog.Start()
end

function Whoa(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC,"","","lookaway",0,0,Spawn)
end

function Dialog1_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddLanguage(7)
	Dialog.AddDialog("Ahh, it is nice to find someone who understands Ayr'Dal. Attempts to fit in here have been... stressful... to say the least... I've only come to realize something very important to me has slipped through my fingers after we arrived from the island. Good luck trying to get the Militia to help with anything! Worthless! My family's name deserves respect!")
    PlayFlavor(NPC,"","","grumble",0,0,Spawn)
    Dialog.AddOption("What are you looking for?","Dialog2_Quest1")
    Dialog.AddOption("Good luck with that.")
	Dialog.Start()
end

function Dialog2_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddLanguage(7)
	Dialog.AddDialog("My brother, in his efforts to gain citizenship to the city proper, was slain two nights ago in the Sprawl. He had a family heirloom with him when he died. I'd  like to have the pendant returned. If you can arrange this, the coin is yours.")
    Dialog.AddOption("I could use some coin. Who might have your pendant?","Offer")
    Dialog.AddOption("Your brother was weak. You don't deserve to find your trinket!","Whoa")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC, Spawn, TheNyghtfallowHeirloom)
end


function DialogWait_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddLanguage(7)
	Dialog.AddDialog("Did you find my precious heirloom? What became of my foolhardy brother? I must know!")
 	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1022.mp3",  0, 0)
	PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    if GetQuestStep(Spawn, TheNyghtfallowHeirloom)==2  then 
    Dialog.AddOption("I found your pendant on a Guttersnipe, but there was no sign of your brother.","Dialog3_Quest1")
    else
    Dialog.AddOption("Still looking...")
    end
    Dialog.Start()
end

function Dialog3_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddLanguage(7)
	Dialog.AddDialog("No luck, eh?  Well, you've been so helpful tracking down that blasted heirloom that I think it'd be downright cruel of me not to give you anything. Here, why don't you take this necklace?")
 	PlayFlavor(NPC, "", "", "shrug", 0, 0, Spawn)
    Dialog.AddOption("Sounds fair enough. Thanks.","Finish")
	Dialog.Start()
end

function Finish(NPC,Spawn)
	FaceTarget(NPC, Spawn)
    SetStepComplete(Spawn, TheNyghtfallowHeirloom, 2)
 	PlayFlavor(NPC, "", "", "thanks", 0, 0, Spawn)
end
