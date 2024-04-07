--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshieldbrutePath.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.31 04:01:07
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC)
    setrace = MakeRandomInt(1,2)
    if setrace == 1 then
        human(NPC)
    elseif setrace == 2 then
        halfelf(NPC)
    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -439.81, -91.17, -985.86, 2, 0)
	MovementLoopAddLocation(NPC, -439.81, -91.17, -985.86, 2, 0)
	MovementLoopAddLocation(NPC, -455.42, -91.13, -950.57, 2, 0)
	MovementLoopAddLocation(NPC, -456.95, -90.49, -941.3, 2, 0)
	MovementLoopAddLocation(NPC, -454.34, -90.06, -925.04, 2, 0)
	MovementLoopAddLocation(NPC, -448.7, -89.43, -914.43, 2, 0)
	MovementLoopAddLocation(NPC, -440.22, -86.28, -909.22, 2, 0)
	MovementLoopAddLocation(NPC, -426.85, -81.18, -903.59, 2, 0)
	MovementLoopAddLocation(NPC, -401.21, -69.53, -895.18, 2, 0)
	MovementLoopAddLocation(NPC, -376.3, -55.13, -885.09, 2, 0)
	MovementLoopAddLocation(NPC, -369.95, -51.79, -882.46, 2, 0)
	MovementLoopAddLocation(NPC, -369.95, -51.79, -882.46, 2, 0)
	MovementLoopAddLocation(NPC, -378.3, -56.12, -885.14, 2, 0)
	MovementLoopAddLocation(NPC, -390.51, -63.11, -889.06, 2, 0)
	MovementLoopAddLocation(NPC, -404.6, -70.49, -893.59, 2, 0)
	MovementLoopAddLocation(NPC, -424.65, -79.59, -900.03, 2, 0)
	MovementLoopAddLocation(NPC, -436.5, -84.88, -905.41, 2, 0)
	MovementLoopAddLocation(NPC, -444.98, -88.09, -913.17, 2, 0)
	MovementLoopAddLocation(NPC, -456.1, -90.34, -930.99, 2, 0)
	MovementLoopAddLocation(NPC, -457.02, -90.34, -939.59, 2, 0)
	MovementLoopAddLocation(NPC, -439.81, -91.17, -985.86, 2, 0)
	MovementLoopAddLocation(NPC, -439.81, -91.17, -985.86, 2, 0)
end
