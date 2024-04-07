--[[
    Script Name    : SpawnScripts/Commonlands/arazortailbarracuda.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.25 10:02:18
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 20, -20, 2, 8, 15)
end
function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end