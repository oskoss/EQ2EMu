--[[
	Script Name	: SpawnScripts/Longshadow/InnuraeVTarris.lua
	Script Purpose	: Innurae V`Tarris 
	Script Author	: John Adams
	Script Date	: 2008.09.29//Restructured completely w/ dialog mod - Dorbin 10/19/2023
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]


function Intro(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Don't expect anything from me, young one. This place is but a mere rest stop before I move on.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae.mp3", 505131296, 528063113)
    PlayFlavor(NPC,"","","no",0,0,Spawn)
	Dialog.AddOption("And where, pray tell, shall you be moving on to?", "Dialog0")
	Dialog.AddOption("Then move on, hag, and leave the space for those who can provide some use!")
	Dialog.Start()
end

function Dialog0(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Neriak is the place of my birth, and it shall be the place of my death.  While you remain here in the care of the humans, I will be home. ")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae000.mp3", 3567010242, 2488453546)
	Dialog.AddOption("Home, what home, you foolish old woman?! Neriak was destroyed centuries ago!", "Dialog1")
	Dialog.AddOption("Ha!  While you die searching for your lost Neriak, I will be prospering and gaining power!")
	Dialog.Start()
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes, Neriak was once lost to us, but not all of us chose to debase ourselves in a contemptible union with the humans.  Those of us who care about our heritage, those of us who are truly Teir`Dal, are searching for a way to return to the grace and legacy of our people.  It would seem that such a way has already been found...")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae001.mp3", 4044045516, 2985844795)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("Neriak has been found?!", "Dialog2")
	Dialog.AddOption("Wake up and accept reality!  Neriak is gone!")
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Not entirely. The loyalists to the cause believe that they have uncovered what was once an entrance to the Foreign Quarter.  However, as that portion of the city was destroyed in the siege, we may have some time left before we can find our home.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae002.mp3", 3686330680, 1121720833)
    PlayFlavor(NPC,"","","no",0,0,Spawn)
	Dialog.AddOption("What siege?", "Dialog3")
	Dialog.AddOption("Who are the loyalists?","Dialog8")
	Dialog.AddOption("How was the foreign quarter destroyed?","Dialog7")
	Dialog.AddOption("So you found some ruins, eh?  Yeah, good luck with that.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("During the age of Turmoil, Neriak was besieged by Leatherfoot Raiders. The forces of Neriak were thin, as Faydwer had deployed most of the Indigo Brotherhood. So we were unsuspecting and unprepared for such an attack. ")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae003.mp3", 4154815778, 4054614513)
	Dialog.AddOption("So, Neriak fell to a group of halflings?", "Dialog4")
	Dialog.AddOption("What happened in Faydwer?", "Dialog9")
	Dialog.AddOption("I have no time to listen to this now.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("In a way, yes, but the city also fell to the greedy ambitions of a warlord king who neglected the needs of his people and soiled the legacy of his great heritage in pursuit of conquest over the refuse and swine that slithers upon the surface of this world.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae004.mp3", 2883566286, 1697596405)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("You obviously have no love for your ruler; why return to Neriak then?", "Dialog5")
	Dialog.AddOption("I have no time to listen to this now.")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("If the city has been shut out from the rest of the world and returned to its proper place of dominion in the Underfoot, then there are no longer any wasteful attempts at conquering this abominable haven of refuse, now are there?")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae005.mp3", 895354264, 3005681462)
	Dialog.AddOption("Why are you so against conquering the surface world?", "Dialog6")
	Dialog.AddOption("I have no time to listen to this now.")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("No surface campaign has proved fruitful.  The Teir`Dal are the ruling force in the Underfoot.  No subterranean race rivals our power and none can withstand our dominion.  Besides, ownership of the surface world would be tantamount to owning a dung hill festering with maggots and flies.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae006.mp3", 1523175183, 964525033)
    PlayFlavor(NPC,"","","orate",0,0,Spawn)
	Dialog.AddOption("So, now that Neriak is found, you will return home?", "Dialog10")
	Dialog.AddOption("I have no time to listen to this now.")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I was very young when the siege began, but I saw the entrance collapsing as I fought in the forest with the other dragoons.  It became silent as the rumbling destruction came to pass.  All fighting ceased; everyone was in awe of the unexpected event.  I can't be certain of what happened, exactly.  All that I know is that a great force collapsed the cavern.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae007.mp3", 1084233029, 4258746911)
	Dialog.AddOption("If Neriak has been found, will you return to it?", "Dialog10")
	Dialog.AddOption("I have no time to listen to this now.")
	Dialog.Start()
end

function Dialog8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The loyalists are all that is left of the Teir`Dal; all the others are traitorous whelps who only wear our dark skin and fair hair.  The loyalists are dedicated to the cause of being restored to our nation.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae008.mp3", 787145551, 4172782462)
	Dialog.AddOption("So the loyalists have been successful?  Why are you still here then, woman?!", "Dialog10")
	Dialog.Start()
end

function Dialog9(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("After Neriak became shut out from the world, the forces on Faydwer began to fall. They were without reinforcement and were eventually overrun by the alliance of elves and dwarves. The folly of our war-mongering ruler was their downfall.")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae009.mp3", 762073917, 1481455239)
	Dialog.AddOption("So, now you're going to return to the rule of this \"war-mongerer\"?", "Dialog5")
	Dialog.AddOption("I have no time to listen to this now.")
	Dialog.Start()
end

function Dialog10(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I long for the day when I return home. While I am still here, though, I choose to educate curiosity-seekers. Would you like to know anything else?")
	Dialog.AddVoiceover("voiceover/english/innurae_v_tarris/fprt_hood05/quests/innuraevtarris/lore_innurae010.mp3", 852727047, 1895315430)
	Dialog.AddOption("What about the siege?", "Dialog3")
	Dialog.AddOption("Who are the loyalists?", "Dialog8")
	Dialog.AddOption("How was the foreign quarter destroyed?", "Dialog7")
	Dialog.AddOption("Not at the moment. If I need any more information, I'll be back.")
	Dialog.Start()
end

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
Intro(NPC, Spawn)
end





