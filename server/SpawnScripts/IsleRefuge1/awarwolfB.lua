--[[
    Script Name    : SpawnScripts/IsleRefuge1/awarwolfB.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.26 02:09:12
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end