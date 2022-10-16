--[[
	Script Name		:	festering_zombie12.lua
	Script Purpose	:	Waypoint Path for festering_zombie12.lua
	Script Author	:	Devn00b
	Script Date		:	06/30/2020 10:07:39 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 =14
    local level2 = 15
    local difficulty1 = 6
    local hp1 = 765
    local power1 = 240
    local difficulty2 = 6
    local hp2 = 890
    local power2 = 270
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 191.76, -6.98, -157.82, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 190.21, -6.97, -153.24, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 187.15, -6.97, -155.16, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 189.43, -6.97, -158.67, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 192.12, -6.97, -154.61, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 188.72, -7.03, -158.18, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 186.65, -6.86, -153.5, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 189.84, -6.97, -153.64, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 189.68, -7, -155.39, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 190.68, -6.97, -153.91, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 192.42, -6.97, -157.85, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 186.68, -6.97, -154.78, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 192.42, -6.97, -157.85, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 190.68, -6.97, -153.91, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 189.68, -7, -155.39, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 189.84, -6.97, -153.64, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 186.65, -6.86, -153.5, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 188.72, -7.03, -158.18, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 192.12, -6.97, -154.61, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 189.43, -6.97, -158.67, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 187.15, -6.97, -155.16, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 190.21, -6.97, -153.24, 2, math.random(0,3))
	MovementLoopAddLocation(NPC, 191.76, -6.98, -157.82, 2, math.random(0,3))
end


