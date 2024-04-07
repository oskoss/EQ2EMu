--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath4.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.04 10:12:18
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
	MovementLoopAddLocation(NPC, -177.27, 1.26, 3.05, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -177.27, 1.26, 3.05, 2, 0)
	MovementLoopAddLocation(NPC, -179.84, 1.84, 7.51, 2, 0)
	MovementLoopAddLocation(NPC, -179.79, 1.22, 17.7, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -179.79, 1.22, 17.7, 2, 0)
	MovementLoopAddLocation(NPC, -179.95, 1.78, 11.41, 2, 0)
	MovementLoopAddLocation(NPC, -179.93, 1.84, 8.19, 2, 0)
	MovementLoopAddLocation(NPC, -177.85, 1.26, 3.38, 2, 0)
	MovementLoopAddLocation(NPC, -172.42, 1.58, 0.45, 2, 0)
	MovementLoopAddLocation(NPC, -164.56, 1.34, -0.05, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -164.56, 1.34, -0.05, 2, 0)
	MovementLoopAddLocation(NPC, -167.88, 1.34, -0.15, 2, 0)
	MovementLoopAddLocation(NPC, -170, 1.63, 3.13, 2, 0)
	MovementLoopAddLocation(NPC, -169.79, 1.42, 2.27, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -169.79, 1.42, 2.27, 2, 0)
	MovementLoopAddLocation(NPC, -169.25, 1.34, 0.89, 2, 0)
	MovementLoopAddLocation(NPC, -171.89, 1.58, 0.03, 2, 0)
	MovementLoopAddLocation(NPC, -175.71, 1.26, 1.46, 2, 0)
	MovementLoopAddLocation(NPC, -179.08, 1.26, 5.37, 2, 0)
	MovementLoopAddLocation(NPC, -180.1, 1.71, 10.48, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -180.1, 1.71, 10.48, 2, 0)
	MovementLoopAddLocation(NPC, -179.87, 1.26, 5.32, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -179.87, 1.26, 5.32, 2, 0)
	MovementLoopAddLocation(NPC, -172.95, 1.52, 0.93, 2, 0)
	MovementLoopAddLocation(NPC, -169.55, 1.75, -3.46, 2, 0)
	MovementLoopAddLocation(NPC, -170.27, 1.34, -2.1, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -170.27, 1.34, -2.1, 2, 0)
	MovementLoopAddLocation(NPC, -170.79, 1.53, -1.11, 2, 0)
	MovementLoopAddLocation(NPC, -168.54, 1.34, -0.15, 2, 0)
	MovementLoopAddLocation(NPC, -164.76, 1.34, -0.01, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -164.76, 1.34, -0.01, 2, 0)
	MovementLoopAddLocation(NPC, -171.21, 1.58, 0.18, 2, 0)
	MovementLoopAddLocation(NPC, -174.94, 1.26, 1.33, 2, 0)
	MovementLoopAddLocation(NPC, -178.65, 1.26, 5.03, 2, 0)
	MovementLoopAddLocation(NPC, -180.14, 1.64, 8.87, 2, 0)
	MovementLoopAddLocation(NPC, -179.92, 1.76, 11.48, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -179.92, 1.76, 11.48, 2, 0)
	MovementLoopAddLocation(NPC, -180.22, 1.6, 9.41, 2, 0)
	MovementLoopAddLocation(NPC, -182.65, 1.8, 8.99, 2, 0)
	MovementLoopAddLocation(NPC, -182.1, 1.69, 9.29, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.1, 1.69, 9.29, 2, 0)
	MovementLoopAddLocation(NPC, -180.53, 1.84, 8.2, 2, 0)
end

