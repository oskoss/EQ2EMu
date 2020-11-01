function spawn(NPC)
	MovementLoopAddLocation(NPC, 338.72, -9.34, 810.21, 353.57, 7, 0)
	MovementLoopAddLocation(NPC, 339.82, -13.68, 788.88, 356.62, 7, 0)
	MovementLoopAddLocation(NPC, 341.05, -16.82, 738.47, 327.01, 7, 0)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end