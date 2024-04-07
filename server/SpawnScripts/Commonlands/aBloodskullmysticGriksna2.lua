--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullmysticGriksna2.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.20 09:01:03
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    AddTimer(NPC, 9000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -573.57, -48.04, 547.36, 2, 0)
	MovementLoopAddLocation(NPC, -577, -48.04, 531.3, 2, 0)
	MovementLoopAddLocation(NPC, -568.51, -48.04, 516.51, 2, 0)
	MovementLoopAddLocation(NPC, -552.95, -47.6, 510.75, 2, 0)
	MovementLoopAddLocation(NPC, -538.6, -45.15, 507.25, 2, 0)
	MovementLoopAddLocation(NPC, -518.92, -47.09, 515.89, 2, 0)
	MovementLoopAddLocation(NPC, -508.98, -47.97, 530.34, 2, 0)
	MovementLoopAddLocation(NPC, -503.32, -48.04, 553.19, 2, 0)
	MovementLoopAddLocation(NPC, -507.41, -48.04, 579.35, 2, 0)
	MovementLoopAddLocation(NPC, -525.15, -47.82, 598.88, 2, 0)
	MovementLoopAddLocation(NPC, -545.14, -47.43, 605.57, 2, 0)
	MovementLoopAddLocation(NPC, -555.79, -47.86, 605.41, 2, 0)
	MovementLoopAddLocation(NPC, -561.06, -48.56, 595.49, 2, 0)
	MovementLoopAddLocation(NPC, -566.65, -48.3, 574.07, 2, 0)
end

