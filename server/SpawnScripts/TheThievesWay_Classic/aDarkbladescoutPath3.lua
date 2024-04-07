--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aDarkbladescoutPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.10 06:12:52
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
	MovementLoopAddLocation(NPC, -76.64, 1.31, 114.45, 2, 0)
	MovementLoopAddLocation(NPC, -66.28, 0.95, 113.56, 2, 0)
	MovementLoopAddLocation(NPC, -61.95, 1.26, 109.82, 2, 0)
	MovementLoopAddLocation(NPC, -61.76, 1, 93.22, 2, 0)
	MovementLoopAddLocation(NPC, -62.45, 1, 108.49, 2, 0)
	MovementLoopAddLocation(NPC, -65.58, 0.91, 112.14, 2, 0)
end
