--[[
    Script Name    : SpawnScripts/DownBelow_Classic/aBloodsaberCenterPatrol.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.11 02:11:18
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BloodSabers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    --if not HasLanguage(Spawn,26) then
        --Garbled(NPC,Spawn)
    --end
    
    if GetSpawnID(NPC) == 8340015 then
        dmgMod = GetStr(NPC)/10
        SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
        SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(12 + dmgMod)) 
        SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(24 + dmgMod))
    else
        NPCModule(NPC, Spawn)
        ratonga(NPC)
    end
    
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 6.82, -4, -160.27, 2, 5)
	MovementLoopAddLocation(NPC, 6.8, -3.95, -154.26, 2, 0)
	MovementLoopAddLocation(NPC, 7.5, -2.48, -151.34, 2, 0)
	MovementLoopAddLocation(NPC, 6.67, -1.12, -148.5, 2, 0)
	MovementLoopAddLocation(NPC, 6.78, -0.02, -146.19, 2, 0)
	MovementLoopAddLocation(NPC, 6.87, 0.11, -143.39, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 6.87, 0.11, -143.39, 2, 0)
	MovementLoopAddLocation(NPC, 7.06, 0, -146.06, 2, 0)
	MovementLoopAddLocation(NPC, 7.43, -1.74, -149.85, 2, 0)
	MovementLoopAddLocation(NPC, 6.75, -3.9, -154.11, 2, 0)
	MovementLoopAddLocation(NPC, 6.82, -4, -160.27, 2, 2)
end

