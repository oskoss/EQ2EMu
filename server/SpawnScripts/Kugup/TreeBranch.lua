--[[
    Script Name    : SpawnScripts/Kugup/TreeBranch.lua
    Script Author  : neatz09
    Script Date    : 2023.11.23 07:11:20
    Script Purpose : 
                   : 
--]]

local quest = 5932

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function casted_on(NPC, Spawn, Message)
    if Message == "Break off branch" then
		if GetQuestStep(Spawn, quest) == 1 then
			AddStepProgress(Spawn, quest, 1, 1)
end
end
end

function respawn(NPC)
	spawn(NPC)
end