function spawn(NPC)
	MovementLoopAddLocation(NPC, 26.57, 195.46, -5.59, 297.98, 7, 0)
	MovementLoopAddLocation(NPC, 56.13, 193.93, -21.29, 297.98, 7, 0)
	MovementLoopAddLocation(NPC, 70.06, 193.00, -56.62, 338.49, 7, 0)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end