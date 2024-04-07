--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/Axefist.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.16 09:11:51
    Script Purpose : 
                   : 
--]]

function spawn(NPC, Spawn)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(6 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(12 + dmgMod))
    
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end