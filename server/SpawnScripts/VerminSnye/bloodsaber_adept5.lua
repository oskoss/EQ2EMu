--[[
	Script Name		:	bloodsaber_adept5.lua
	Script Purpose	:	Waypoint Path for bloodsaber_adept5.lua
	Script Author	:	Devn00b
	Script Date		:	06/14/2020 03:23:53 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 =13
    local level2 = 14
    local difficulty1 = 9
    local hp1 = 2360
    local power1 = 1085
    local difficulty2 = 9
    local hp2 = 2730
    local power2 = 1205
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
	MovementLoopAddLocation(NPC, 65.15, -0.7, -168.39, 2, 0)
	MovementLoopAddLocation(NPC, 61.91, -0.7, -168.22, 2, 0)
	MovementLoopAddLocation(NPC, 62.39, -0.08, -165.41, 2, 0)
	MovementLoopAddLocation(NPC, 53.84, -0.28, -173.76, 2, 0)
	MovementLoopAddLocation(NPC, 53.39, -0.08, -180.78, 2, 0)
	MovementLoopAddLocation(NPC, 41.52, -0.22, -194.74, 2, 0)
	MovementLoopAddLocation(NPC, 40.5, -0.08, -189.15, 2, 0)
	MovementLoopAddLocation(NPC, 52.19, -0.26, -184.33, 2, 0)
	MovementLoopAddLocation(NPC, 51.38, -0.58, -181.19, 2, 0)
	MovementLoopAddLocation(NPC, 52.37, -0.46, -175.19, 2, 0)
	MovementLoopAddLocation(NPC, 61.75, -0.11, -165.59, 2, 0)
	MovementLoopAddLocation(NPC, 52.37, -0.46, -175.19, 2, 0)
	MovementLoopAddLocation(NPC, 51.38, -0.58, -181.19, 2, 0)
	MovementLoopAddLocation(NPC, 52.19, -0.26, -184.33, 2, 0)
	MovementLoopAddLocation(NPC, 40.5, -0.08, -189.15, 2, 0)
	MovementLoopAddLocation(NPC, 41.52, -0.22, -194.74, 2, 0)
	MovementLoopAddLocation(NPC, 53.39, -0.08, -180.78, 2, 0)
	MovementLoopAddLocation(NPC, 53.84, -0.28, -173.76, 2, 0)
	MovementLoopAddLocation(NPC, 62.39, -0.08, -165.41, 2, 0)
	MovementLoopAddLocation(NPC, 61.91, -0.7, -168.22, 2, 0)
	MovementLoopAddLocation(NPC, 65.15, -0.7, -168.39, 2, 0)
end


