--[[
    Script Name    : SpawnScripts/TempleSt/RegiasFlutzrubble.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:56
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
Dialog9(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Uuuummm... no, well, yes, I mean yes, a war ship, but it's so much more than that! Don't you see! It'll be able to carry an army of a thousand men, and will be able to traverse any part of the Shattered Seas with ease!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_002.mp3", 3970511826, 4107157131)
	Dialog.AddOption("Sounds a bit ambitious. Why do you want to do this?", "Dialog12")
	Dialog.AddOption("I have to go now.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmmm?  You're interested in my work, are you?  Well, why didn't you say so?!  Please, please, have a seat and listen!  I'm currently working on schematics for a very powerful, very sturdy ship that can withstand even the worst of the Shattered Seas' fits!  It's all very exciting!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_001.mp3", 1795784999, 3837102654)
	Dialog.AddOption("You're trying to make a war ship?", "Dialog5")
	Dialog.AddOption("What's wrong with Freeport's vessels?  We seem to have a capable navy.", "Dialog3")
	Dialog.AddOption("On second thought, I should leave you to your work.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Are you mad?!  The seas are too terrible, too unpredictable!  The effects of the great cataclysms haven't subsided entirely, you know.  We need powerful, secure and sturdy vessels in order to travel and explore the unexplored reaches of the world!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_004.mp3", 16821237, 3341915909)
	Dialog.AddOption("Why are the seas so terrible?", "Dialog11")
	Dialog.AddOption("So you're making a war ship to traverse the seas?", "Dialog5")
	Dialog.AddOption("You're the one who's mad.  Good bye.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmmm? You're interested in my work, are you? Well, why didn't you say so?! Please, please, have a seat and listen! I'm currently working on schematics for a very powerful, very sturdy ship that can withstand even the worst of the Shattered Seas' fits!  It's all very exciting!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_001.mp3", 1795784999, 3837102654)
	Dialog.AddOption("You're trying to make a war ship?", "Dialog1")
	Dialog.AddOption("What's wrong with Freeport's vessels? We seem to have a capable navy.", "Dialog6")
	Dialog.AddOption("On second thought, I should leave you to your work.")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Uuuummm... no, well, yes, I mean yes, a war ship, but it's so much more than that!  Don't you see!  It'll be able to carry an army of a thousand men, and will be able to traverse any part of the Shattered Seas with ease!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_002.mp3", 3970511826, 4107157131)
	Dialog.AddOption("Sounds a bit ambitious.  Why do you want to do this?", "Dialog12")
	Dialog.AddOption("I have to go now.")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Are you mad?! The seas are too terrible, too unpredictable! The effects of the great cataclysms haven't subsided entirely, you know. We need powerful, secure and sturdy vessels in order to travel and explore the unexplored reaches of the world!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_004.mp3", 16821237, 3341915909)
	Dialog.AddOption("Why are the seas so terrible?", "Dialog10")
	Dialog.AddOption("So you're making a war ship to traverse the seas?", "Dialog1")
	Dialog.AddOption("You're the one who's mad. Good bye.")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, that's common knowledge!  What else would have caused the water levels to rise so high so quickly?  Yes, yes, the ice of the world is all gone.  I'm eager to go to the rock of Velious and see what sort of mysteries and treasures the ice left behind!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_007.mp3", 2431672398, 3998434397)
	Dialog.AddOption("Well, good luck with that, I guess.")
	Dialog.Start()
end

function Dialog8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("No! Go away! You're disrupting my concentration! I must have total and complete and utter quiet if I'm going to finish these schematics! Now, go away! Away!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_000.mp3", 2585802283, 4039166261)
	Dialog.AddOption("What you working on?", "Dialog4")
	Dialog.AddOption("Alright, I'm going! I'm going!")
	Dialog.Start()
end

function Dialog9(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("No!  Go away!  You're disrupting my concentration!  I must have total and complete and utter quiet if I'm going to finish these schematics!  Now, go away!  Away!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_000.mp3", 2585802283, 4039166261)
	Dialog.AddOption("What you working on?", "Dialog2")
	Dialog.AddOption("Alright, I'm going! I'm going!")
	Dialog.Start()
end

function Dialog10(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It takes thousands of years for such dramatic environmental effects to subside, don't you know anything?! The seas are still raging, and besides, the known shores of the world are as of yet uncharted. Who knows what sort of troubles one could run into.")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_005.mp3", 3259471582, 1564630871)
	Dialog.AddOption("What do you mean the shores are uncharted? We have maps for reference.", "Dialog14")
	Dialog.AddOption("This is all very interesting, but I'm going to go now.")
	Dialog.Start()
end

function Dialog11(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It takes thousands of years for such dramatic environmental effects to subside, don't you know anything?!  The seas are still raging, and besides, the known shores of the world are as of yet uncharted.  Who knows what sort of troubles one could run into.")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_005.mp3", 3259471582, 1564630871)
	Dialog.AddOption("What do you mean the shores are uncharted?  We have maps for reference.", "Dialog15")
	Dialog.AddOption("This is all very interesting, but I'm going to go now.")
	Dialog.Start()
end

function Dialog12(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aside from creating the greatest invention ever invented in Freeport, I've always dreamed of traveling the world's oceans, just like my great, great, great grandfather, Captain Nalot! ")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_003.mp3", 1152684026, 1730897113)
	Dialog.AddOption("Why don't you just go out and explore them?", "Dialog6")
	Dialog.AddOption("I have to go now.")
	Dialog.Start()
end

function Dialog13(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, that's common knowledge! What else would have caused the water levels to rise so high so quickly? Yes, yes, the ice of the world is all gone. I'm eager to go to the rock of Velious and see what sort of mysteries and treasures the ice left behind!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_007.mp3", 2431672398, 3998434397)
	Dialog.AddOption("Well, good luck with that, I guess.")
	Dialog.Start()
end

function Dialog14(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Maps schmaps! They don't mean nothin' anymore! Since the ice of Velious and Everfrost melted, the sea levels have risen so high that we don't know how shorelines have shifted. Not to mention all the earthquakes. The continents may have shifted to other hemispheres!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_006.mp3", 3492338575, 1829255468)
	Dialog.AddOption("Okay, I've enough of this foolishness. Good bye.")
	Dialog.AddOption("Velious and Everfrost have melted?! How do you know?", "Dialog13")
	Dialog.Start()
end

function Dialog15(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Maps schmaps!  They don't mean nothin' anymore!  Since the ice of Velious and Everfrost melted, the sea levels have risen so high that we don't know how shorelines have shifted. Not to mention all the earthquakes. The continents may have shifted to other hemispheres!")
	Dialog.AddVoiceover("voiceover/english/regias_flutzrubble/fprt_hood03/quests/regiasflutzrubble/lore_regias_006.mp3", 3492338575, 1829255468)
	Dialog.AddOption("Ok, I've enough of this foolishness.  Good bye.")
	Dialog.AddOption("Velious and Everfrost have melted?!  How do you know?", "Dialog7")
	Dialog.Start()
end
