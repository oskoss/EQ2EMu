--[[
    Script Name    : SpawnScripts/NorthFreeport/TorligtheAlchemist.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.19 01:06:20
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
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Shhhh! Don't distract me ... I need a steady hand to ensure I combine this potion correctly. One mistake and the blast will reduce this building to rubble. Deal with my apprentices if you want to buy something.")
	Dialog.AddVoiceover("voiceover/english/torlig_the_alchemist/fprt_north/torlig_the_alchemist.mp3", 4161370754, 1751042550)
    if HasQuest(Spawn,5906) and GetQuestStep(Spawn,5906) == 3 then
	Dialog.AddOption("Have you been selling any type of foreign plant?", "Plant")
    end        
    Dialog.AddOption("Fine then, I will leave you to your perfumes and snake oils.")
	Dialog.Start()
end


function Plant(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "","", "boggle", 0, 0, Spawn)
    Dialog.AddDialog("Foreign plant?  Are you stupid?  What the heck would I do with a foreign plant?  This isn't Qeynos, fool.  Now either buy something or quit wasting my time.")
	Dialog.AddVoiceover("voiceover/english/torlig_the_alchemist/fprt_north/quests/proctorfergus/torlig_fergus_x1_initial.mp3", 3361820512, 517804863)
    Dialog.AddOption("Alright. Sorry to bother you.")
	Dialog.Start()
end