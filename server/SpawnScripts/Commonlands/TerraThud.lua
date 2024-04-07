--[[
    Script Name    : SpawnScripts/Commonlands/TerraThud.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.27 05:01:09
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    local Level = GetLevel(NPC)

    if Level == 21 then
        SetMaxHP(NPC, 6885)
        ModifyHP(NPC, 6885)
        SetMaxPower(NPC, 1650)
        ModifyPower(NPC, 1650)
    elseif Level == 22 then
        SetMaxHP(NPC, 7500)
        ModifyHP(NPC, 7500)
        SetMaxPower(NPC, 1750)
        ModifyPower(NPC, 1750)
    end
    
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(75 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(125 + dmgMod))
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

