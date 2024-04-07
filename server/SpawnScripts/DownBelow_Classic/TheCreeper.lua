--[[
    Script Name    : SpawnScripts/DownBelow_Classic/TheCreeper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.09 09:01:25
    Script Purpose : 
                   : 
--]]


function spawn(NPC, Spawn)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(15 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(26 + dmgMod))
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end