--[[
	Script Name	: aSapswillvillagerRunner.lua
	Script Purpose	: Makes the sapswill on the Queen's Colony run around the rock.
	Script Author	: Scatman
	Script Date	: 2008.12.15
	Script Notes	: 
--]]

local ADiplomaticMission = 166

function spawn(NPC)
	SpawnSet(NPC, "visual_state", 0)
	MovementLoopAddLocation(NPC, -75.98, 0.26, -238.35, 4, 0)
	MovementLoopAddLocation(NPC, -72.04, 0.25, -240.76, 4, 0)
	MovementLoopAddLocation(NPC, -73.36, 0.26, -245.79, 4, 0)
	MovementLoopAddLocation(NPC, -78.16, 0.35, -248.07, 4, 0)
	MovementLoopAddLocation(NPC, -82.81, 1.69, -245.62, 4, 0)
	MovementLoopAddLocation(NPC, -85.91, 2.09, -240.37, 4, 0)
	MovementLoopAddLocation(NPC, -82.86, 1.75, -237.19, 4, 0)
end

function hailed(NPC, Spawn)
	--FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end
