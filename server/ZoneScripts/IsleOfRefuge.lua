--[[
	Script Name		:	IsleOfRefuge.lua
	Script Purpose	:	Handles Isle of Refuge events
	Script Author	:	LethalEncounter
	Script Date		:	9/06/2020
	Script Notes	:	
--]]

function signal_changed(zone, player, signal)
	if signal == "sys_client_avatar_ready" and HasQuest(player, 1) == false and HasCompletedQuest(player, 1) == false then
		InstructionWindow(player, -1.0, "Garven Tralk can guide you on what to do next.", "voiceover/english/narrator/tutorial_island02/narrator_031_328946a9.mp3", 933085482, 646811402, "tutorial_stage_52", "", "continue")
	end
end