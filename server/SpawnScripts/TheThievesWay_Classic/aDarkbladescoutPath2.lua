--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aDarkbladescoutPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.10 06:12:04
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC,Spawn)
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
	MovementLoopAddLocation(NPC, -81.48, 1, 56.85, 2, 0)
	MovementLoopAddLocation(NPC, -81.48, 1, 56.85, 2, 0)
	MovementLoopAddLocation(NPC, -81.35, 1, 80.67, 2, 0)
	MovementLoopAddLocation(NPC, -76.09, 1, 86.15, 2, 0)
	MovementLoopAddLocation(NPC, -65.57, 1, 85.87, 2, 0)
	MovementLoopAddLocation(NPC, -76.36, 1, 85.41, 2, 0)
	MovementLoopAddLocation(NPC, -80.74, 1, 81.84, 2, 0)
	MovementLoopAddLocation(NPC, -81.41, 1, 79.69, 2, 0)
end

