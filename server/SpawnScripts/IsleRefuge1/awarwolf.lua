--[[
    Script Name    : SpawnScripts/IsleRefuge1/awarwolf.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.14 04:09:30
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