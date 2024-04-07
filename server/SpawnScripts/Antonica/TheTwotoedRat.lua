--[[
    Script Name    : SpawnScripts/Antonica/TheTwotoedRat.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.07 07:01:35
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    DmgBonus = math.floor(GetStr(NPC) /10)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 6 + DmgBonus) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 12 + DmgBonus)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end