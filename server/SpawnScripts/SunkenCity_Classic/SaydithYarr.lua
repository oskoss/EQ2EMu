--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/SaydithYarr.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.01 07:11:51
    Script Purpose : 
                   : 
--]]

local QUEST_1_FROM_THORSON = 376

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
	Dialog.AddDialog("Searched this place I have.  Seen the dark and the light.  Know the stories and the tragedies.")
	Dialog.AddVoiceover("voiceover/english/saydith_yarr/fprt_adv01_sunken/saydith_yarr000.mp3", 1548752498, 2730978939)
    PlayFlavor(NPC,"","","sniff",0,0,Spawn)
	Dialog.AddOption("Where am I?", "Dialog2")
	Dialog.AddOption("What do you mean by 'dark and light'?","Dialog4")
	Dialog.AddOption("What tragedies?", "Dialog3")
	Dialog.AddOption("I know all I need to about this place.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You're on the docks of the Sunken City.")
	Dialog.AddVoiceover("voiceover/english/saydith_yarr/fprt_adv01_sunken/saydith_yarr001.mp3", 2390191821, 3206926055)
    PlayFlavor(NPC,"","","nod",0,0,Spawn)
	Dialog.AddOption("What do you mean by 'dark and light'?","Dialog4")
	Dialog.AddOption("What tragedies?", "Dialog3")
	Dialog.AddOption("I know all I need to about this place.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("This place was once a district of Freeport, much like the others.  Those that lived here were swallowed up by the seas and dragged to the bottom of the ocean, doomed to an eternal existence under the crushing depths.")
	Dialog.AddVoiceover("voiceover/english/saydith_yarr/fprt_adv01_sunken/saydith_yarr002.mp3", 2458221458, 1657163845)
	Dialog.AddOption("Where am I?", "Dialog2")
	Dialog.AddOption("What do you mean by 'dark and light'?","Dialog4")
	Dialog.AddOption("I know all I need to about this place.")
	Dialog.Start()
end



function Dialog4(NPC, Spawn)
	if HasQuest(Spawn, QUEST_1_FROM_THORSON) and GetQuestStep(Spawn, QUEST_1_FROM_THORSON) == 1 then
		SetStepComplete(Spawn, QUEST_1_FROM_THORSON, 1)
	end
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Things change here when it gets cold and dark.  Zombies crawl from the shadows to drag the living back with them to their watery grave.  Search for the cross if you are looking for death.")
	Dialog.AddVoiceover("voiceover/english/saydith_yarr/fprt_adv01_sunken/saydith_yarr003.mp3", 3245604695, 2963905971)
	Dialog.AddOption("Where am I?", "Dialog2")
	Dialog.AddOption("What tragedies?", "Dialog3")
	Dialog.AddOption("I know all I need to about this place.")
	Dialog.Start()
end
