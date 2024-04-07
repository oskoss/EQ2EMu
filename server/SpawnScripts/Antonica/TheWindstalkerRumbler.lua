--[[
    Script Name    : SpawnScripts/Antonica/TheWindstalkerRumbler.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.15 12:05:32
    Script Purpose : 
                   : 
--]]
function spawn(NPC)
    dmgMod = math.floor(GetStr(NPC)/10)
    HPRegenMod = math.floor(GetSta(NPC)/10)
    PwRegenMod = math.floor(GetStr(NPC)/10)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(185 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(305 + dmgMod))
    SetInfoStructUInt(NPC, "hp_regen_override", 1)  
    SetInfoStructSInt(NPC, "hp_regen", 100 + HPRegenMod)           
    SetInfoStructUInt(NPC, "pw_regen_override", 1)  
    SetInfoStructSInt(NPC, "pw_regen", 50 + PwRegenMod) 
    SetSpawnAnimation(NPC, 13016)
end


function respawn(NPC)
	spawn(NPC)
end