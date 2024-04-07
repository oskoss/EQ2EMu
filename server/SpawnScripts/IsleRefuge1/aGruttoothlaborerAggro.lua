--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothlaborerAggro.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.06 11:02:30
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SpawnSet(NPC, "faction", 1)
    local ID = GetSpawnID(NPC)
    if ID ==3250122 then
    SetInfoStructString(NPC, "action_state", "cooking_idle")
    elseif ID ==3250104 then
    SetInfoStructString(NPC, "action_state", "mining_digging")
    elseif ID ==3250105 then
    SetInfoStructString(NPC, "action_state", "forestry_chopping")
    elseif ID ==3250095 then
    SetInfoStructString(NPC, "action_state", "woodworking_idle")
    end
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end