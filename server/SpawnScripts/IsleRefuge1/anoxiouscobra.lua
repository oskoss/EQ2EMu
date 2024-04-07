--[[
    Script Name    : SpawnScripts/IsleRefuge1/anoxiouscobra.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.14 03:09:33
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