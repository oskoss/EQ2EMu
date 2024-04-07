--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothlaborer.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 07:09:03
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
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

function aggro(NPC,Spawn)
    SpawnSet(NPC, "visual_state", 0)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end