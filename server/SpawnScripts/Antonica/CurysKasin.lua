--[[
	Script Name		:	CurysKasin-Say.lua
	Script Purpose	:	Curys Kasin
	Script Author	:	Jabantiz
	Script Date		:	08/29/2019
	Script Notes	:	Auto-Generated from a chat log using SpawnScriptDesigner, Say()'s ONLY
--]]

require "SpawnScripts/Generic/DialogModule"

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 373.29, -20.73, 371.98, 2, 0)
	MovementLoopAddLocation(NPC, 361.65, -20.73, 394.13, 2, 0)
	MovementLoopAddLocation(NPC, 250.8, -10.73, 440.87, 2, 0)
	MovementLoopAddLocation(NPC, 166.83, -9.52, 588.67, 2, 0)
end


function spawn(NPC)
	waypoints(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)


	Say(NPC, "All praise Rodcet Nife and his greatness!", Spawn)

end