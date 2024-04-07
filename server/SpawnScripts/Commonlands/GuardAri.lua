--[[
    Script Name    : SpawnScripts/Commonlands/GuardAri.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.16 03:01:07
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    FreeportGuard(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end