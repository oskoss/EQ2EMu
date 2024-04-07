--[[
    Script Name    : SpawnScripts/BloodSkullValleyMaulicsStronghold/aBloodskullherald.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.23 10:01:53
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end