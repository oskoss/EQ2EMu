--[[
    Script Name    : SpawnScripts/TheRuins_Classic/KoduhlBrokentusk.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.01 10:01:53
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(30 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(60 + dmgMod))
    AddTimer(NPC, 6000, "waypoints")

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 9.51, -4.24, 162.1, 2, 0)
	MovementLoopAddLocation(NPC, -1.32, -4.24, 161.85, 2, 0)
	MovementLoopAddLocation(NPC, -11.35, -4.24, 161.61, 2, 0)
	MovementLoopAddLocation(NPC, -19.89, -4.24, 159.03, 2, 0)
	MovementLoopAddLocation(NPC, -21.75, -4.24, 156.69, 2, 0)
	MovementLoopAddLocation(NPC, -23.38, -4.32, 148.91, 2, 0)
	MovementLoopAddLocation(NPC, -22.05, -4.34, 145.02, 2, 0)
	MovementLoopAddLocation(NPC, -24.85, -4.28, 141.44, 2, 0)
	MovementLoopAddLocation(NPC, -28.17, -4.28, 139.93, 2, 0)
	MovementLoopAddLocation(NPC, -35.27, -4.31, 132.41, 2, 0)
	MovementLoopAddLocation(NPC, -50.01, -2.94, 116.58, 2, 0)
	MovementLoopAddLocation(NPC, -59.29, -2.75, 108.84, 2, 0)
	MovementLoopAddLocation(NPC, -54.06, -2.82, 111.77, 2, 0)
	MovementLoopAddLocation(NPC, -49.66, -2.96, 117.91, 2, 0)
	MovementLoopAddLocation(NPC, -32.06, -4.28, 136.37, 2, 0)
	MovementLoopAddLocation(NPC, -24.68, -4.28, 140.58, 2, 0)
	MovementLoopAddLocation(NPC, -23.13, -4.31, 144.69, 2, 0)
	MovementLoopAddLocation(NPC, -22.38, -4.24, 155.98, 2, 0)
	MovementLoopAddLocation(NPC, -19.28, -4.25, 159.72, 2, 0)
	MovementLoopAddLocation(NPC, -12.03, -4.24, 161.17, 2, 0)
end