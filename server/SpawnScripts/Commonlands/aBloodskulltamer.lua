--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskulltamer.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 05:01:33
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    RandomMovement(NPC, Spawn, 10, -10, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end