--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath7.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.07 09:12:58
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile ("SpawnScripts/Generic/MonsterCallouts/BaseRatonga1.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ratonga(NPC, Spawn)
    class(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function class(NPC,Spawn)
    local class = MakeRandomInt(1,3)
    if class == 1 then
        SpawnSet(NPC, "class", 1 )
        SetSpellList(NPC, 291)
    elseif class == 2 then
        SpawnSet(NPC, "class", 11)
        SetSpellList(NPC, 297)
    elseif class == 3 then
        SpawnSet(NPC, "class", 31)
        SetSpellList(NPC, 294)
    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 20.22, 1.34, 74.07, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 20.22, 1.34, 74.07, 2, 0)
	MovementLoopAddLocation(NPC, 20.18, 1.81, 77.16, 2, 0)
	MovementLoopAddLocation(NPC, 20.1, 1.57, 82.94, 2, 0)
	MovementLoopAddLocation(NPC, 19.95, 1.59, 102.63, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 19.95, 1.59, 102.63, 2, 0)
	MovementLoopAddLocation(NPC, 20.14, 1.34, 71.48, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 20.14, 1.34, 71.48, 2, 0)
	MovementLoopAddLocation(NPC, 20.09, 1.34, 91.81, 2, 0)
	MovementLoopAddLocation(NPC, 16.65, 1.77, 91.29, 2, 0)
	MovementLoopAddLocation(NPC, 17.52, 1.53, 91.54, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 17.52, 1.53, 91.54, 2, 0)
	MovementLoopAddLocation(NPC, 19.35, 1.34, 91.22, 2, 0)
	MovementLoopAddLocation(NPC, 20.08, 1.34, 89.48, 2, 0)
	MovementLoopAddLocation(NPC, 20.19, 1.34, 86.2, 2, 0)
	MovementLoopAddLocation(NPC, 23.46, 1.83, 85.54, 2, 0)
	MovementLoopAddLocation(NPC, 23.02, 1.68, 85.4, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 23.02, 1.68, 85.4, 2, 0)
	MovementLoopAddLocation(NPC, 21.12, 1.35, 85.1, 2, 0)
	MovementLoopAddLocation(NPC, 20.2, 1.34, 87.27, 2, 0)
	MovementLoopAddLocation(NPC, 20.02, 1.74, 101.46, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 20.02, 1.74, 101.46, 2, 0)
	MovementLoopAddLocation(NPC, 20.21, 1.6, 76.04, 2, 0)
	MovementLoopAddLocation(NPC, 16.49, 1.83, 74.46, 2, 0)
	MovementLoopAddLocation(NPC, 17.55, 1.52, 74.39, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 17.55, 1.52, 74.39, 2, 0)
	MovementLoopAddLocation(NPC, 19.97, 1.34, 73.65, 2, 0)
	MovementLoopAddLocation(NPC, 20.09, 1.34, 69.49, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 20.09, 1.34, 69.49, 2, 0)
end

