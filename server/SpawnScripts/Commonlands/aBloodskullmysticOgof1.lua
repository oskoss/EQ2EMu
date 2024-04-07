--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullmysticOgof1.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.20 05:01:25
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    AddTimer(NPC, 7000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -679.52, -48.04, 449.72, 2, 0)
	MovementLoopAddLocation(NPC, -681.9, -48.04, 444.6, 2, 0)
	MovementLoopAddLocation(NPC, -681.9, -48.04, 444.6, 2, 0)
	MovementLoopAddLocation(NPC, -675.41, -48.04, 432.53, 2, 0)
	MovementLoopAddLocation(NPC, -665.04, -47.89, 425.46, 2, 0)
	MovementLoopAddLocation(NPC, -655.93, -45.31, 422.47, 2, 0)
	MovementLoopAddLocation(NPC, -643.74, -46.09, 420.74, 2, 0)
	MovementLoopAddLocation(NPC, -638.71, -46.61, 423.15, 2, 0)
	MovementLoopAddLocation(NPC, -630.31, -47.98, 431.82, 2, 0)
	MovementLoopAddLocation(NPC, -626.72, -48.04, 445.24, 2, 0)
	MovementLoopAddLocation(NPC, -627.69, -48.04, 460.73, 2, 0)
	MovementLoopAddLocation(NPC, -631.15, -47.99, 469.53, 2, 0)
	MovementLoopAddLocation(NPC, -631, -47.29, 485.93, 2, 0)
	MovementLoopAddLocation(NPC, -627.93, -47.1, 501.28, 2, 0)
	MovementLoopAddLocation(NPC, -631.59, -46.99, 512.06, 2, 0)
	MovementLoopAddLocation(NPC, -644.25, -45.78, 517.3, 2, 0)
	MovementLoopAddLocation(NPC, -656.83, -46, 520.49, 2, 0)
	MovementLoopAddLocation(NPC, -671.01, -46.75, 521.89, 2, 0)
	MovementLoopAddLocation(NPC, -682.8, -45.98, 518.71, 2, 0)
	MovementLoopAddLocation(NPC, -694.56, -46.57, 509.81, 2, 0)
	MovementLoopAddLocation(NPC, -696.94, -47.24, 494.23, 2, 0)
	MovementLoopAddLocation(NPC, -686.37, -48.04, 462.16, 2, 0)
end