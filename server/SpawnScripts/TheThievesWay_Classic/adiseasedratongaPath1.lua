--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.04 04:12:19
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
	MovementLoopAddLocation(NPC, -182.56, 0, 203.83, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.56, 0, 203.83, 2, 0)
	MovementLoopAddLocation(NPC, -182.73, 0.2, 208.53, 2, 0)
	MovementLoopAddLocation(NPC, -180.7, 0, 213.35, 2, 0)
	MovementLoopAddLocation(NPC, -176.72, 0, 216.35, 2, 0)
	MovementLoopAddLocation(NPC, -173.58, 0, 217.19, 2, 0)
	MovementLoopAddLocation(NPC, -171.36, 0, 217.15, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -171.36, 0, 217.15, 2, 0)
	MovementLoopAddLocation(NPC, -174.03, 0, 217.04, 2, 0)
	MovementLoopAddLocation(NPC, -177.77, 0, 215.88, 2, 0)
	MovementLoopAddLocation(NPC, -180.27, 0, 213.44, 2, 0)
	MovementLoopAddLocation(NPC, -181.36, 0.25, 209.84, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -181.36, 0.25, 209.84, 2, 0)
	MovementLoopAddLocation(NPC, -180.65, 0, 212.52, 2, 0)
	MovementLoopAddLocation(NPC, -178.36, 0, 215.05, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -178.36, 0, 215.05, 2, 0)
	MovementLoopAddLocation(NPC, -174.43, 0, 216.72, 2, 0)
	MovementLoopAddLocation(NPC, -172.66, 0, 216.63, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -172.66, 0, 216.63, 2, 0)
	MovementLoopAddLocation(NPC, -175.89, 0, 215.99, 2, 0)
	MovementLoopAddLocation(NPC, -180.61, 0, 213.79, 2, 0)
	MovementLoopAddLocation(NPC, -181.99, 0.24, 209.14, 2, 0)
end