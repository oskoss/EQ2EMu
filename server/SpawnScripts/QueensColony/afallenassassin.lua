--[[
	Script Name		:	SpawnScripts/QueensColony/afallenassassin.lua
	Script Purpose	:	Path to doom, and drop skull when killed by player
	Script Author	:	Jabantiz
	Script Date		:	9/11/2016
	Script Notes	:	<special-instructions>
--]]

function spawn(NPC)
	MovementLoopAddLocation(NPC, -125.5, 4.64, -50.29, 4)
	MovementLoopAddLocation(NPC, -132.23, 4.36, -63.2, 4)
	MovementLoopAddLocation(NPC, -133.43, 4.37, -88.26, 4)
	MovementLoopAddLocation(NPC, -110.11, 4.29, -101.71, 4)
	MovementLoopAddLocation(NPC, -97.02, 4.24, -116.82, 4)
	MovementLoopAddLocation(NPC, -81.65, 4.13, -120.89, 4)
	MovementLoopAddLocation(NPC, -70.74, 4.09, -133.39, 4)
	MovementLoopAddLocation(NPC, -57.57, 2.24, -135.21, 4)
	MovementLoopAddLocation(NPC, -51.81, 2.03, -153.28, 4, 60)
end

function respawn(NPC)
	spawn(NPC)
end

function death(NPC, Spawn)
	if IsPlayer(Spawn) then
		local chance = math.random(1, 100)
		if chance <= 35 then
			local skull = SpawnMob(GetZone(Spawn), 2530192, false, GetX(NPC), GetY(NPC), GetZ(NPC))
			if skull ~= nil then
				SpawnSet(skull, "expire", "1000")
			end
		end
	end
end