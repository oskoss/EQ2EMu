--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath5.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.04 10:12:27
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
	MovementLoopAddLocation(NPC, -177.42, 1.22, 58.23, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -177.42, 1.22, 58.23, 2, 0)
	MovementLoopAddLocation(NPC, -179.46, 1.22, 54.32, 2, 0)
	MovementLoopAddLocation(NPC, -179.94, 1.34, 50.47, 2, 0)
	MovementLoopAddLocation(NPC, -180.08, 1.34, 46.74, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -180.08, 1.34, 46.74, 2, 0)
	MovementLoopAddLocation(NPC, -180.22, 1.34, 51.5, 2, 0)
	MovementLoopAddLocation(NPC, -178.44, 1.22, 57.61, 2, 0)
	MovementLoopAddLocation(NPC, -172.79, 1.78, 60.97, 2, 0)
	MovementLoopAddLocation(NPC, -166.2, 1.78, 61.18, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -166.2, 1.78, 61.18, 2, 0)
	MovementLoopAddLocation(NPC, -171, 1.55, 61.31, 2, 0)
	MovementLoopAddLocation(NPC, -176.15, 1.22, 59.93, 2, 0)
	MovementLoopAddLocation(NPC, -179.6, 1.22, 55.01, 2, 0)
	MovementLoopAddLocation(NPC, -183.47, 1.71, 50.56, 2, 0)
	MovementLoopAddLocation(NPC, -183.06, 1.57, 50.9, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -183.06, 1.57, 50.9, 2, 0)
	MovementLoopAddLocation(NPC, -181.63, 1.47, 51.74, 2, 0)
	MovementLoopAddLocation(NPC, -179.88, 1.34, 49.92, 2, 0)
	MovementLoopAddLocation(NPC, -179.79, 1.34, 47.3, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -179.79, 1.34, 47.3, 2, 0)
	MovementLoopAddLocation(NPC, -180.05, 1.58, 52.73, 2, 0)
	MovementLoopAddLocation(NPC, -178.42, 1.22, 57.97, 2, 0)
	MovementLoopAddLocation(NPC, -172.08, 1.78, 60.98, 2, 0)
	MovementLoopAddLocation(NPC, -168.4, 1.71, 64.72, 2, 0)
	MovementLoopAddLocation(NPC, -168.55, 1.63, 64.47, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -168.55, 1.63, 64.47, 2, 0)
	MovementLoopAddLocation(NPC, -168.99, 1.29, 62.96, 2, 0)
	MovementLoopAddLocation(NPC, -171.79, 1.78, 61.36, 2, 0)
end

