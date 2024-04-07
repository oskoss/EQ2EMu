--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/TheBonewatcher.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 12:08:47
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGolem1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(24 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(42 + dmgMod))

end

function hail(NPC,Spawn)
    SendMessage(NPC,"The Bonewatcher stares in your general direction... Almost as if it is looking through you.","white")
end


function respawn(NPC)
	spawn(NPC)
end