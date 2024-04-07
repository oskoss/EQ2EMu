--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath8.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.07 10:12:06
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
	MovementLoopAddLocation(NPC, 19.93, 1.34, 30.03, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 19.93, 1.34, 30.03, 2, 0)
	MovementLoopAddLocation(NPC, 20, 1.34, 56, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 20, 1.34, 56, 2, 0)
	MovementLoopAddLocation(NPC, 20.17, 1.34, 29.6, 2, 0)
	MovementLoopAddLocation(NPC, 18, 1.34, 23.01, 2, 0)
	MovementLoopAddLocation(NPC, 11.96, 1.86, 19.84, 2, 0)
	MovementLoopAddLocation(NPC, 7.84, 1.34, 19.76, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 7.84, 1.34, 19.76, 2, 0)
	MovementLoopAddLocation(NPC, 12.59, 1.81, 19.84, 2, 0)
	MovementLoopAddLocation(NPC, 18.39, 1.34, 23.97, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 18.39, 1.34, 23.97, 2, 0)
	MovementLoopAddLocation(NPC, 15.44, 1.34, 20.61, 2, 0)
	MovementLoopAddLocation(NPC, 11.82, 1.9, 19.41, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 11.82, 1.9, 19.41, 2, 0)
	MovementLoopAddLocation(NPC, 15.05, 1.34, 20.43, 2, 0)
	MovementLoopAddLocation(NPC, 19, 1.34, 24.49, 2, 0)
	MovementLoopAddLocation(NPC, 20.28, 1.34, 33.24, 2, 0)
	MovementLoopAddLocation(NPC, 19.82, 1.34, 51.57, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 16.73, 1.75, 51.79, 2, 0)
	MovementLoopAddLocation(NPC, 17.36, 1.56, 52.04, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 17.36, 1.56, 52.04, 2, 0)
	MovementLoopAddLocation(NPC, 19.4, 1.34, 52.15, 2, 0)
	MovementLoopAddLocation(NPC, 20.25, 1.34, 50.57, 2, 0)
	MovementLoopAddLocation(NPC, 19.91, 1.34, 34.62, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 19.91, 1.34, 34.62, 2, 0)
	MovementLoopAddLocation(NPC, 21.79, 1.42, 37.67, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 21.79, 1.42, 37.67, 2, 0)
	MovementLoopAddLocation(NPC, 21.02, 1.34, 36.86, 2, 0)
	MovementLoopAddLocation(NPC, 20.28, 1.34, 27.29, 2, 0)
	MovementLoopAddLocation(NPC, 17.97, 1.34, 23.39, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 17.97, 1.34, 23.39, 2, 0)
	MovementLoopAddLocation(NPC, 19.25, 1.34, 26.71, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 19.25, 1.34, 26.71, 2, 0)
	MovementLoopAddLocation(NPC, 18.62, 1.34, 23.39, 2, 0)
	MovementLoopAddLocation(NPC, 15.98, 1.34, 20.82, 2, 0)
	MovementLoopAddLocation(NPC, 7.13, 1.34, 19.67, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 7.13, 1.34, 19.67, 2, 0)
	MovementLoopAddLocation(NPC, 13.31, 1.64, 19.66, 2, 0)
	MovementLoopAddLocation(NPC, 18.2, 1.34, 22.37, 2, 0)
	MovementLoopAddLocation(NPC, 19.17, 1.34, 24.75, 2, 0)
end
