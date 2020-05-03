--[[
	Script Name	: SpawnScripts/OutpostoftheOverlord/AsylLysarz.lua
	Script Purpose	: Asyl Lysarz <Guard>
	Script Author	: Cynnar
	Script Date	: 2018.10.14
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
end

function LeaveRange(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)

	PlayFlavor(NPC, "", "Chef Gorga better hurry up!  I'm getting hungry.", "", 1689589577, 4560189, Spawn)
end

