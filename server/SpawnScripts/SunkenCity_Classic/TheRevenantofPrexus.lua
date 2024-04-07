--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/TheRevenantofPrexus.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.22 04:10:16
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseZombie1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(16 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(28 + dmgMod))
    SetSpawnAnimation(NPC, 13016)
end

function hailed(NPC, Spawn)
    Attack(NPC,Spawn)
end

function respawn(NPC)
	spawn(NPC)
end