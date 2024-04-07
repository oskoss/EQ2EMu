--[[
    Script Name    : SpawnScripts/IsleRefuge1/anemeraldsnake.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 01:09:59
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