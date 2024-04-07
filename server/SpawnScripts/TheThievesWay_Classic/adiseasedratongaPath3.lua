--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.04 09:12:48
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
	MovementLoopAddLocation(NPC, -180.42, 0.05, 93.15, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -180.42, 0.05, 93.15, 2, 0)
	MovementLoopAddLocation(NPC, -182.39, 0.05, 97.52, 2, 0)
	MovementLoopAddLocation(NPC, -182.47, 0.36, 100.37, 2, 0)
	MovementLoopAddLocation(NPC, -182.57, 0, 114.95, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.57, 0, 114.95, 2, 0)
	MovementLoopAddLocation(NPC, -182.71, 0.27, 102.21, 2, 0)
	MovementLoopAddLocation(NPC, -181.73, 0.05, 96.71, 2, 0)
	MovementLoopAddLocation(NPC, -178.82, 0.05, 92.41, 2, 0)
	MovementLoopAddLocation(NPC, -175.04, 0.24, 90.89, 2, 0)
	MovementLoopAddLocation(NPC, -168.58, 0.05, 90.51, 2, 0)
	MovementLoopAddLocation(NPC, -159.12, 0.05, 90.2, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -159.12, 0.05, 90.2, 2, 0)
	MovementLoopAddLocation(NPC, -170.33, 0.05, 90.49, 2, 0)
	MovementLoopAddLocation(NPC, -175.1, 0.24, 90.48, 2, 0)
	MovementLoopAddLocation(NPC, -178.71, 0.05, 92.76, 2, 0)
	MovementLoopAddLocation(NPC, -181.9, 0.05, 96.84, 2, 0)
	MovementLoopAddLocation(NPC, -182.54, 0.31, 100.17, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.54, 0.31, 100.17, 2, 0)
	MovementLoopAddLocation(NPC, -181.92, 0.05, 96.39, 2, 0)
	MovementLoopAddLocation(NPC, -172.11, 0.05, 90.2, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -172.11, 0.05, 90.2, 2, 0)
	MovementLoopAddLocation(NPC, -177.29, 0.05, 90.21, 2, 0)
	MovementLoopAddLocation(NPC, -181.28, 0.05, 94.78, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -181.28, 0.05, 94.78, 2, 0)
	MovementLoopAddLocation(NPC, -182.25, 0.3, 100.17, 2, 0)
	MovementLoopAddLocation(NPC, -182.46, 0, 105.58, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.46, 0, 105.58, 2, 0)
	MovementLoopAddLocation(NPC, -182.69, 0.41, 100.33, 2, 0)
	MovementLoopAddLocation(NPC, -184.52, 0.32, 96.01, 2, 0)
	MovementLoopAddLocation(NPC, -183.52, 0.08, 97.21, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -183.52, 0.08, 97.21, 2, 0)
	MovementLoopAddLocation(NPC, -179.28, 0.05, 92.14, 2, 0)
	MovementLoopAddLocation(NPC, -173.87, 0.06, 91.12, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -173.87, 0.06, 91.12, 2, 0)
	MovementLoopAddLocation(NPC, -173.95, 0.41, 86.96, 2, 0)
	MovementLoopAddLocation(NPC, -173.85, 0.15, 88.12, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -173.85, 0.15, 88.12, 2, 0)
	MovementLoopAddLocation(NPC, -173.97, 0.05, 89.32, 2, 0)
	MovementLoopAddLocation(NPC, -178.35, 0.05, 91.43, 2, 0)
	MovementLoopAddLocation(NPC, -181.99, 0.04, 98.02, 2, 0)
	MovementLoopAddLocation(NPC, -182.52, 0, 105.38, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.52, 0, 105.38, 2, 0)
	MovementLoopAddLocation(NPC, -182.22, 0.04, 98.01, 2, 0)
end

