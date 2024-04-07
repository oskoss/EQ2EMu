--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath6.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.06 04:12:21
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
	MovementLoopAddLocation(NPC, -78.63, 0, -0.03, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -78.63, 0, -0.03, 2, 0)
	MovementLoopAddLocation(NPC, -81.33, 0, -0.02, 2, 0)
	MovementLoopAddLocation(NPC, -83.55, 1.01, -0.01, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -83.55, 1.01, -0.01, 2, 0)
	MovementLoopAddLocation(NPC, -81.05, 0, 0.04, 2, 0)
	MovementLoopAddLocation(NPC, -45.81, 0, 0.15, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -45.81, 0, 0.15, 2, 0)
	MovementLoopAddLocation(NPC, -71.99, 0, -0.24, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -71.99, 0, -0.24, 2, 0)
	MovementLoopAddLocation(NPC, -68.1, 0.16, -0.06, 2, 0)
	MovementLoopAddLocation(NPC, -65.95, 0.26, -2.78, 2, 0)
	MovementLoopAddLocation(NPC, -65.66, 0.09, -1.88, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -65.66, 0.09, -1.88, 2, 0)
	MovementLoopAddLocation(NPC, -65.62, 0, -0.57, 2, 0)
	MovementLoopAddLocation(NPC, -63.09, 0, -0.05, 2, 0)
	MovementLoopAddLocation(NPC, -56.6, 0.3, -0.14, 2, 0)
	MovementLoopAddLocation(NPC, -54.98, 0.26, 2.79, 2, 0)
	MovementLoopAddLocation(NPC, -55.37, 0.16, 2.23, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -55.37, 0.16, 2.23, 2, 0)
	MovementLoopAddLocation(NPC, -56.68, 0.29, 0.38, 2, 0)
	MovementLoopAddLocation(NPC, -73.26, 0, -0.16, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -73.26, 0, -0.16, 2, 0)
	MovementLoopAddLocation(NPC, -48.35, 0, 0.16, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -48.35, 0, 0.16, 2, 0)
	MovementLoopAddLocation(NPC, -59.18, 0.26, -0.37, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -59.18, 0.26, -0.37, 2, 0)
	MovementLoopAddLocation(NPC, -69.63, 0, -0.14, 2, 0)
end

