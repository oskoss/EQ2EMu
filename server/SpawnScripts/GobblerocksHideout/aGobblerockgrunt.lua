--[[
    Script Name    : SpawnScripts/GobblerocksHideout/aGobblerockgrunt.lua
    Script Author  : Premierio015
    Script Date    : 2023.12.09 12:12:21
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end
function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end