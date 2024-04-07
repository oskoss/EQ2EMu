--[[
    Script Name    : SpawnScripts/Commonlands/MarcusWarklar.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.18 09:02:18
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    dmgMod = math.floor(GetStr(NPC)/10)
    HPRegenMod = math.floor(GetSta(NPC)/10)
    PwRegenMod = math.floor(GetAgi(NPC)/10)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(95 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(175 + dmgMod))
    SetInfoStructUInt(NPC, "hp_regen_override", 1)  
    SetInfoStructSInt(NPC, "hp_regen", 80 + HPRegenMod)           
    SetInfoStructUInt(NPC, "pw_regen_override", 1)  
    SetInfoStructSInt(NPC, "pw_regen", 30 + PwRegenMod)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end