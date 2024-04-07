--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adiseasedratongaPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.04 09:12:17
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
	MovementLoopAddLocation(NPC, -182.73, 0, 158.29, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.73, 0, 158.29, 2, 0)
	MovementLoopAddLocation(NPC, -182.56, 0, 167.8, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.56, 0, 167.8, 2, 0)
	MovementLoopAddLocation(NPC, -182.22, 0, 146.22, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.22, 0, 146.22, 2, 0)
	MovementLoopAddLocation(NPC, -181.9, 0.24, 160.91, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -181.9, 0.24, 160.91, 2, 0)
	MovementLoopAddLocation(NPC, -182.89, 0.29, 152.36, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.89, 0.29, 152.36, 2, 0)
	MovementLoopAddLocation(NPC, -182.96, 0, 165.75, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.96, 0, 165.75, 2, 0)
	MovementLoopAddLocation(NPC, -185.57, 0.38, 156.66, 2, 0)
	MovementLoopAddLocation(NPC, -184.82, 0.1, 157.24, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -184.82, 0.1, 157.24, 2, 0)
	MovementLoopAddLocation(NPC, -182.96, 0, 157.36, 2, 0)
	MovementLoopAddLocation(NPC, -182.5, 0, 150.66, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -182.5, 0, 150.66, 2, 0)
end