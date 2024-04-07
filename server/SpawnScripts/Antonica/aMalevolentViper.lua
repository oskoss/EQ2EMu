--[[
    Script Name    : SpawnScripts/Antonica/aMalevolentViper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 04:09:12
    Script Purpose : 
                   : 
--]]
function spawn(NPC, Spawn)
    DmgBonus = math.floor(GetStr(NPC) /10)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 8 + DmgBonus) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 15 + DmgBonus)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end