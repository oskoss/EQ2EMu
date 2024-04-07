--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/anetherotchanterPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.10 06:12:24
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC, Spawn)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC, Spawn)
    local race = MakeRandomInt(1,6)
    if race == 1 or race == 2 then
        human(NPC, Spawn)
    elseif race == 3 or race == 4 then
        ratonga(NPC, Spawn)
    elseif race == 5 then
        kerra(NPC, Spawn)
    elseif race == 6 then
        darkelf(NPC, Spawn)
    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -92.38, 1, 54.64, 2, 0)
	MovementLoopAddLocation(NPC, -92.38, 1, 54.64, 2, 0)
	MovementLoopAddLocation(NPC, -94.78, 1, 57.62, 2, 0)
	MovementLoopAddLocation(NPC, -95.18, 1, 60.19, 2, 0)
	MovementLoopAddLocation(NPC, -94.82, 1, 108.2, 2, 0)
	MovementLoopAddLocation(NPC, -93.11, 1, 110.93, 2, 0)
	MovementLoopAddLocation(NPC, -91.34, 1, 111.92, 2, 0)
	MovementLoopAddLocation(NPC, -86.58, 1, 112.2, 2, 0)
	MovementLoopAddLocation(NPC, -86.58, 1, 112.2, 2, 0)
	MovementLoopAddLocation(NPC, -92.51, 1, 111.53, 2, 0)
	MovementLoopAddLocation(NPC, -93.92, 1, 109.4, 2, 0)
	MovementLoopAddLocation(NPC, -94.57, 1, 58.04, 2, 0)
end