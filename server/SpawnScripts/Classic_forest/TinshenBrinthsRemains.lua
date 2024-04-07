--[[
    Script Name    : SpawnScripts/Classic_forest/TinshenBrinthsRemains.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.17 01:10:57
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton1.lua")

function spawn(NPC)
    SetSpawnAnimation(NPC, 13016)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(18 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(32 + dmgMod))
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end