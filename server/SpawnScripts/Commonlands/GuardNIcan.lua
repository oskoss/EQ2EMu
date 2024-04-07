--[[
    Script Name    : SpawnScripts/Commonlands/GuardNIcan.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.30 01:01:26
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