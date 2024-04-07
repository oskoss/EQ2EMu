--[[
    Script Name    : SpawnScripts/IsleRefuge1/atimberwolfpup.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.05 08:09:17
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