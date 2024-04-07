--[[
	Script Name		: SpawnScripts/BigBend/CrantiktheCrazed.lua
	Script Purpose	: Crantik the Crazed
	Script Author	: torsten
	Script Date		: 2022.07.13
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"
local MucksQuest = 5874

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
	Dialog.AddDialog("Up is down and down is up, yet both are still sideways!  Hoooooooo hee hee haaaaaaaa!")
	Dialog.AddVoiceover("voiceover/english/crantik_the_crazed/fprt_hood1/qst_crantikthecrazed.mp3", 1553641466, 3781649488)
	
    if GetQuestStep(Spawn,MucksQuest)==1 then	
	Dialog.AddOption("I need a vial of the something that Old Man Muckwort wants.","Dialog2")
    end

	Dialog.AddOption("Um, ya....right....")
	Dialog.Start()
end

function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Whooo hooo heee heee! Crantik makes some more of the droopy-gloppy! Muckwort always gets my droopy-gloppy, weee heee!!! Crantik makes it from his own body, he does! Ratsies and Catsies drop dead when they do the licky licky licky, then they make a lot of sizzzzzzzle sounds! Yeeee wooo heee! Crantik gives you a vial!")
 	Dialog.AddVoiceover("voiceover/english/crantik_the_crazed/fprt_hood03/quests/oldmanmuckwort/crantik_muckwort_x1_initial.mp3",3426325136,2692118135)
    PlayFlavor(NPC, "","","scratch",0,0, Spawn)
	Dialog.AddOption("Err... Thanks.")
	Dialog.Start()
    SetStepComplete(Spawn, MucksQuest, 1)
end