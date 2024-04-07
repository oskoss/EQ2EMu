--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/TheSpiritofValeron.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 05:08:45
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGhost1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(24 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(42 + dmgMod))

end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end