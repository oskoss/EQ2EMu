--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath9.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.07 10:12:04
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
	MovementLoopAddLocation(NPC, -26.02, 1.34, 22.89, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -26.02, 1.34, 22.89, 2, 0)
	MovementLoopAddLocation(NPC, -23.12, 1.34, 20.3, 2, 0)
	MovementLoopAddLocation(NPC, -18.26, 1.94, 19.71, 2, 0)
	MovementLoopAddLocation(NPC, -10.57, 1.34, 19.83, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -10.57, 1.34, 19.83, 2, 0)
	MovementLoopAddLocation(NPC, -8.41, 1.34, 14.14, 2, 0)
	MovementLoopAddLocation(NPC, -8.69, 1.34, 14.8, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -8.69, 1.34, 14.8, 2, 0)
	MovementLoopAddLocation(NPC, -9.01, 1.34, 18.04, 2, 0)
	MovementLoopAddLocation(NPC, -13.47, 1.34, 19.33, 2, 0)
	MovementLoopAddLocation(NPC, -17.64, 1.85, 19.66, 2, 0)
	MovementLoopAddLocation(NPC, -21.69, 1.34, 19.86, 2, 0)
	MovementLoopAddLocation(NPC, -25.67, 1.34, 22.48, 2, 0)
	MovementLoopAddLocation(NPC, -27.56, 1.34, 25.45, 2, 0)
	MovementLoopAddLocation(NPC, -27.6, 1.34, 37.28, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -27.6, 1.34, 37.28, 2, 0)
	MovementLoopAddLocation(NPC, -27.48, 1.34, 30.7, 2, 0)
	MovementLoopAddLocation(NPC, -28.48, 1.35, 28.98, 2, 0)
	MovementLoopAddLocation(NPC, -30.83, 1.83, 29.18, 2, 0)
	MovementLoopAddLocation(NPC, -30.09, 1.58, 29.06, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -30.09, 1.58, 29.06, 2, 0)
	MovementLoopAddLocation(NPC, -28.33, 1.34, 28.41, 2, 0)
	MovementLoopAddLocation(NPC, -26.61, 1.34, 24.11, 2, 0)
	MovementLoopAddLocation(NPC, -23.33, 1.34, 21.07, 2, 0)
	MovementLoopAddLocation(NPC, -14.96, 1.34, 19.3, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -14.96, 1.34, 19.3, 2, 0)
	MovementLoopAddLocation(NPC, -17.01, 1.73, 19.7, 2, 0)
	MovementLoopAddLocation(NPC, -21.57, 1.34, 20.55, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -21.57, 1.34, 20.55, 2, 0)
	MovementLoopAddLocation(NPC, -21.25, 1.34, 20, 2, 0)
	MovementLoopAddLocation(NPC, -14.81, 1.34, 19.21, 2, 0)
	MovementLoopAddLocation(NPC, -8.46, 1.34, 18.9, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -8.46, 1.34, 18.9, 2, 0)
	MovementLoopAddLocation(NPC, -14.51, 1.34, 19.73, 2, 0)
	MovementLoopAddLocation(NPC, -21.71, 1.34, 19.82, 2, 0)
end

