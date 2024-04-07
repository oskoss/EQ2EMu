--[[
    Script Name    : SpawnScripts/Commonlands/TheUnderwurm.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.10 09:02:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(55 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(95 + dmgMod))
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 484.03, -66.27, -408.75, 4, 0)
	MovementLoopAddLocation(NPC, 440.04, -68.04, -442.62, 4, 0)
	MovementLoopAddLocation(NPC, 434.75, -68.63, -470.9, 4, 0)
	MovementLoopAddLocation(NPC, 445.29, -69.55, -497.05, 4, 0)
	MovementLoopAddLocation(NPC, 457.91, -58.87, -520.84, 4, 0)
	MovementLoopAddLocation(NPC, 479.26, -62.15, -539.2, 4, 0)
	MovementLoopAddLocation(NPC, 517.41, -60.04, -535.75, 4, 0)
	MovementLoopAddLocation(NPC, 570.84, -65.14, -486.74, 4, 0)
	MovementLoopAddLocation(NPC, 587.98, -67.09, -447.26, 4, 0)
	MovementLoopAddLocation(NPC, 578.77, -68.6, -410.72, 4, 0)
	MovementLoopAddLocation(NPC, 554.09, -67.24, -387.26, 4, 0)
	MovementLoopAddLocation(NPC, 554.09, -67.24, -387.26, 4, 0)
	MovementLoopAddLocation(NPC, 515.52, -64.61, -368.86, 4, 0)
	MovementLoopAddLocation(NPC, 515.52, -64.61, -368.86, 4, 0)
	MovementLoopAddLocation(NPC, 488.48, -61.81, -369.14, 4, 0)
	MovementLoopAddLocation(NPC, 458.84, -60.92, -414.05, 4, 0)
	MovementLoopAddLocation(NPC, 437.7, -59.51, -392.08, 4, 0)
	MovementLoopAddLocation(NPC, 419.02, -51.63, -376.95, 4, 0)
	MovementLoopAddLocation(NPC, 386.75, -51.18, -362.51, 4, 0)
	MovementLoopAddLocation(NPC, 363.5, -51.39, -349.16, 4, 0)
	MovementLoopAddLocation(NPC, 277.39, -51.65, -346.53, 4, 0)
	MovementLoopAddLocation(NPC, 223.49, -57.4, -340.24, 4, 0)
	MovementLoopAddLocation(NPC, 246.49, -57.49, -343.19, 4, 0)
	MovementLoopAddLocation(NPC, 279.33, -51.36, -347.26, 4, 0)
	MovementLoopAddLocation(NPC, 355.61, -51.39, -345.24, 4, 0)
	MovementLoopAddLocation(NPC, 353.76, -51.34, -316.14, 4, 0)
	MovementLoopAddLocation(NPC, 353.23, -52.65, -292.41, 4, 0)
	MovementLoopAddLocation(NPC, 374.68, -52.83, -261.43, 4, 0)
	MovementLoopAddLocation(NPC, 394.45, -52.67, -236.52, 4, 0)
	MovementLoopAddLocation(NPC, 415.14, -52.96, -215.42, 4, 0)
	MovementLoopAddLocation(NPC, 420.27, -51.87, -183.13, 4, 0)
	MovementLoopAddLocation(NPC, 406.4, -52.88, -154.21, 4, 0)
	MovementLoopAddLocation(NPC, 398.86, -52.72, -130.21, 4, 0)
	MovementLoopAddLocation(NPC, 404.17, -51.31, -50.44, 4, 0)
	MovementLoopAddLocation(NPC, 396.19, -52.02, -112.56, 4, 0)
	MovementLoopAddLocation(NPC, 402.8, -52.7, -148.2, 4, 0)
	MovementLoopAddLocation(NPC, 419.93, -52.88, -167.05, 4, 0)
	MovementLoopAddLocation(NPC, 420.47, -52.56, -210.51, 4, 0)
	MovementLoopAddLocation(NPC, 395.74, -52.86, -234.12, 4, 0)
	MovementLoopAddLocation(NPC, 374.76, -52.88, -261.05, 4, 0)
	MovementLoopAddLocation(NPC, 352.11, -52.89, -291.46, 4, 0)
	MovementLoopAddLocation(NPC, 361.43, -51.39, -345.68, 4, 0)
	MovementLoopAddLocation(NPC, 389.64, -51.11, -361.08, 4, 0)
	MovementLoopAddLocation(NPC, 408.9, -51.25, -371.33, 4, 0)
	MovementLoopAddLocation(NPC, 423.25, -53.36, -380.85, 4, 0)
	MovementLoopAddLocation(NPC, 444.57, -60.57, -404.01, 4, 0)
	MovementLoopAddLocation(NPC, 484.03, -66.27, -408.75, 4, 0)
end