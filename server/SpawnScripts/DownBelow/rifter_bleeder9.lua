--[[
	Script Name		:	rifter_bleeder8.lua
	Script Purpose	:	Waypoint Path for rifter_bleeder8.lua
	Script Author	:	Devn00b
	Script Date		:	05/13/2020 04:40:10 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	local follownpc = GetSpawn(NPC, 1990046)
	SetFollowTarget(NPC, follownpc, 3)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
 	local follownpc = GetSpawn(NPC, 1990046)
	SetFollowTarget(NPC, follownpc, 3)
end
