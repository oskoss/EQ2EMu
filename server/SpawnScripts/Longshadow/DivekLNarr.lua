--[[
	Script Name		: SpawnScripts/LongshadowAlley/DivekLNarr.lua
	Script Purpose	: Divek L`Narr
	Script Author	: torsten\\Dorbin - Added Dialog (Mostly fabricated)
	Script Date		: 2022.07.18
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

local DeadManEyes = 5674

function spawn(NPC)
    ProvidesQuest(NPC, DeadManEyes)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else  
    if not HasLanguage(Spawn,2)then
    Garbled(NPC,Spawn)
else
    Dialog1(NPC,Spawn)
    end
    end
end

function Dialog1(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Can't you see I'm busy organizing my collections of wisdom? I've no time for chatting. Leave me alone!")
	Dialog.AddVoiceover("voiceover/english/scribe_ommanoden/qey_village02/100_scribe_ommanoden_multhail1_becd50b2.mp3", 3010394589, 1905118172)
	Dialog.AddLanguage(2)
    if CanReceiveQuest(Spawn, DeadManEyes) then
	Dialog.AddOption("What are you going on about?", "Dialog2")
    elseif GetQuestStep(Spawn, DeadManEyes) == 2 then
	Dialog.AddOption("Here are the eyes you requested.", "Dialog5")
    end
	Dialog.AddOption("Perhaps you should lock your door then!")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
   Dialog.New(NPC, Spawn)
   Dialog.AddDialog("You must be offering your soul, because there is no other reason you should be pestering me while I try to avenge my brother's death. Even after four centuries, his untimely murder still haunts my waking thoughts. I MUST have answers!")
   Dialog.AddOption("Sitting in this filth won't help. Go dig him up!", "Dialog3")
   Dialog.AddOption("You pathetic fool. Centuries?! Get over it!")
   Dialog.Start()
end

function Dialog3(NPC, Spawn)
   Dialog.New(NPC, Spawn)
   Dialog.AddDialog("That advice is precisely what I'd expect from a lowborn such as yourself.  However, my methods are more subtle.  After years of tracking down the murderer, I've concluded that his secret indeed lies within the ancient ruins of Neriak.  If I can gain passage into its depths, I should be able to catch the murderer unaware and avenge my brother.")
   Dialog.AddOption("So, crawl through the rubble and look for it rather than crying to me!", "Dialog4")
   Dialog.AddOption("After all this time? Doubtful. You've wasted your life.")
   Dialog.Start()
end

function Dialog4(NPC, Spawn)
   Dialog.New(NPC, Spawn)
   Dialog.AddDialog("You have an impertinent manner.  Still, I may be able to use you.  I have applied myself to the dark arts so that I may one day channel my departed brother's spirit for further clues.  There is a special reagent I need to perform the channeling ritual.  If you gather it for me, you will be handsomely paid.")
   Dialog.AddOption("Dark arts? I'm intrigued. What do you need?", "Offer")
   Dialog.AddOption("You pathetic fool. Centuries?! Get over it!")
   Dialog.Start()
end

function Offer(NPC,Spawn)
   OfferQuest(NPC, Spawn, DeadManEyes)
end    

function Dialog5(NPC, Spawn)
    SetStepComplete(Spawn, DeadManEyes, 2)
   Dialog.New(NPC, Spawn)
   Dialog.AddDialog("Allow me to inspect them ... yes, these will suffice.  Now, take your coin and go.  I must perform this ritual undisturbed.  If you hear any screams, do not attempt to interfere.  If you disrupt the delicate procedure, I will use you as my next source of Dead Man's Eyes.  Do you understand?")
   Dialog.AddOption("Thanks. Screams in the Alley? Sounds like a normal night to me.")
   Dialog.Start()
end
