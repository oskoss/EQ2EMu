--[[
	Script Name	: SpawnScripts/QeynosCapitolDistrict/ElspethAstley.lua
	Script Purpose	: Elspeth Astley 
	Script Author	: Shatou
	Script Date	: 2020.01.06
	Script Notes	: Modified w/ new format and VOs included.
--]]
require "SpawnScripts/Generic/DialogModule"

local ALABASTER_FOR_THE_MAGES_QUEST_ID = 501

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "cast_priest_buff_01")
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,11)>0 then
Dialog1(NPC, Spawn)
else

end
end



function Dialog1(NPC, Spawn)
--	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The winds of time change many things.  One thing remains the same, the might of the sorcerer.")
	Dialog.AddVoiceover("voiceover/english/elspeth_astley/qey_south/elspethastley000.mp3", 280090355, 624466296)
	if GetQuestStep(Spawn, ALABASTER_FOR_THE_MAGES_QUEST_ID) == 2 then
	Dialog.AddOption("I have some alabaster you might be interested in.", "Dialog4")
    end
	Dialog.AddOption("Thanks for the information. ")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
--	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Perfect. I'll buy all of it.")
	SetStepComplete(Spawn, ALABASTER_FOR_THE_MAGES_QUEST_ID, 2)
	Dialog.AddVoiceover("voiceover/english/elspeth_astley/qey_south/elspethastley002.mp3", 2497015346, 2351178305)
	Dialog.AddOption("Thank you.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
--	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The winds of time change many things.  One thing remains the same, the might of the sorcerer.")
	Dialog.AddVoiceover("voiceover/english/elspeth_astley/qey_south/elspethastley000.mp3", 280090355, 624466296)
	Dialog.AddOption("Thanks for the information. ")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
--	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Interesting ... how much are you selling? We can always use more alabaster to make wands.")
	Dialog.AddVoiceover("voiceover/english/elspeth_astley/qey_south/elspethastley001.mp3", 1116477690, 1540248539)
	Dialog.AddOption("I've five blocks worth.", "Dialog2")
	Dialog.Start()
end

