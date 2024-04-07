--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullmason.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 05:01:37
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    SetInfoStructString(NPC, "action_state", "mining_digging")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end