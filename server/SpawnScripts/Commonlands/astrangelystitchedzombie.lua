--[[
    Script Name    : SpawnScripts/Commonlands/astrangelystitchedzombie.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.17 04:02:12
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 18 + dmgMod) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 32 + dmgMod)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 962.22, -45.14, -623.63, 2, 0)
	MovementLoopAddLocation(NPC, 952.66, -45.32, -618.78, 2, 0)
	MovementLoopAddLocation(NPC, 938.81, -45.13, -614.52, 2, 0)
	MovementLoopAddLocation(NPC, 924.32, -45.34, -612.46, 2, 0)
	MovementLoopAddLocation(NPC, 914.74, -45.19, -612.16, 2, 0)
	MovementLoopAddLocation(NPC, 903.48, -45.13, -614.14, 2, 0)
	MovementLoopAddLocation(NPC, 897.48, -45.13, -617.3, 2, 0)
	MovementLoopAddLocation(NPC, 888.66, -45.18, -623.72, 2, 0)
	MovementLoopAddLocation(NPC, 871.01, -45.43, -628.84, 2, 0)
	MovementLoopAddLocation(NPC, 845.07, -45.54, -639.19, 2, 0)
	MovementLoopAddLocation(NPC, 829.45, -45.53, -647.21, 2, 0)
	MovementLoopAddLocation(NPC, 817.98, -45.7, -649.7, 2, 0)
	MovementLoopAddLocation(NPC, 823.73, -45.61, -648.83, 2, 0)
	MovementLoopAddLocation(NPC, 855.09, -45.54, -634.45, 2, 0)
	MovementLoopAddLocation(NPC, 866.65, -45.49, -630.15, 2, 0)
	MovementLoopAddLocation(NPC, 884.78, -45.2, -625.68, 2, 0)
	MovementLoopAddLocation(NPC, 899.01, -45.13, -616.04, 2, 0)
	MovementLoopAddLocation(NPC, 909.35, -45.13, -612.69, 2, 0)
	MovementLoopAddLocation(NPC, 919.79, -45.3, -612.44, 2, 0)
	MovementLoopAddLocation(NPC, 932.64, -45.17, -613.39, 2, 0)
	MovementLoopAddLocation(NPC, 944.26, -45.13, -616.26, 2, 0)
	MovementLoopAddLocation(NPC, 962.22, -45.14, -623.63, 2, 0)
end

