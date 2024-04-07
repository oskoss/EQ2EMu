--[[
    Script Name    : SpawnScripts/ForestRuins_Classic/alakeswarmer.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.22 01:09:45
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