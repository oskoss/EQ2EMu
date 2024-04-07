--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothlaborerPonder.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 08:09:39
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin1.lua")
require "SpawnScripts/Generic/CombatModule"


function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
    local Level = GetLevel(NPC)
    local level1 = 3
    local level2 = 4
    local difficulty1 = 6
    local hp1 = 75
    local power1 = 45
    local difficulty2 = 6
    local hp2 = 110
    local power2 = 55
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
    SpawnSet(NPC, "visual_state", 12030)
    SetInfoStructUInt(NPC, "hp_regen_override", 1)
    SetInfoStructSInt(NPC, "hp_regen", 0)
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