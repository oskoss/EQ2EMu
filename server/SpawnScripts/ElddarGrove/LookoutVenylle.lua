--[[
	Script Name	: SpawnScripts/ElddarGrove/LookoutVenylle.lua
	Script Purpose	: Lookout Venylle 
	Script Author	: Dorbin
	Script Date	: 09.19.2023
	Script Notes	: Quests,VOs added 5.3.2022 - Dorbin
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    ProvidesQuest(NPC, 5515)
    ProvidesQuest(NPC, 5516)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
 if GetFactionAmount(Spawn,11) <0 then
    PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn)
    else
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well, greetings, friend. I'm sorry I've no time for chatting. We rangers must be ever watchful. Many dangers lurk in the dark. Some natural, some ... unnatural.")
	Dialog.AddVoiceover("voiceover/english/lookout_venylle/qey_elddar/lookoutvenylle000.mp3",487024690, 2845985258)
	PlayFlavor(NPC, "", "", "hello", 0, 0, Spawn)
    if not HasQuest(Spawn,5515)	and not HasCompletedQuest (Spawn,5515) then
	Dialog.AddOption("What dangers have you heard about?", "Holly1")
	end
    if not HasQuest(Spawn,5516)	and not HasCompletedQuest (Spawn,5516) and GetLevel(Spawn) >=9 then
	Dialog.AddOption("Do any unnatural dangers threaten Qeynos?", "DangerQuest")
    elseif GetQuestStep(Spawn,5516)==2 then
	Dialog.AddOption("I was able to deal with some of the undead from Antonica as you mentioned.", "Dangers2")
    end
    Dialog.AddOption("Don't let me keep you from your vigilance.  ")
	Dialog.Start()
end
end

function Holly1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It is ill to speak of the dead, but knowing the dangers that prowl in the dark is for your own safety. Rumor has it, that Holly Windstalker once again walks the hills.  I won't guarantee this is true, but neither will I discount it. What I do know is a grave bearing her name sits on a hill overlooking the village.  You'll see for yourself; she was laid to rest years ago.")
	Dialog.AddVoiceover("voiceover/english/lookout_venylle/qey_elddar/lookoutvenylle001.mp3",3608144910, 1097856081)
	PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
	Dialog.AddOption("I've heard of the name Holly Windstalker.  I think I'd like to see the grave.", "Holly2")
	Dialog.AddOption("I tend to stay away from graves that may not be able to hold their dead. ")
	Dialog.Start()
end


function Holly2(NPC, Spawn)
if not HasQuest(Spawn,5515)	and not HasCompletedQuest (Spawn,5515) then
OfferQuest(NPC,Spawn, 5515)
FaceTarget(NPC, Spawn)
end
end


function DangerQuest(NPC, Spawn)
OfferQuest(NPC,Spawn, 5516)
FaceTarget(NPC, Spawn)
end

function Dangers2(NPC, Spawn)
    SetStepComplete(Spawn,5516,3)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ahh, you've done well adventurer!  This is just one of the many valuable lessons you'll learn on your adventures.  Please, take this reward for serving Qeynos.")
	Dialog.AddVoiceover("voiceover/english/lookout_venylle/qey_elddar/lookoutvenylle004.mp3",1813659207, 4263570557)
	PlayFlavor(NPC, "", "", "thank", 0, 0, Spawn)
	Dialog.AddOption("Thank you. I'll keep that in mind.")
	Dialog.Start()
end


