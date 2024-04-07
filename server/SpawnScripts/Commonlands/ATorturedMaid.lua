--[[
    Script Name    : SpawnScripts/Commonlands/ATorturedMaid.lua
    Script Author  : Premierio015
    Script Date    : 2021.06.01 09:06:00
    Script Purpose : 
                   : 
--]]

local LionManeHelm =  5249

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(55 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(95 + dmgMod))
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function death(NPC, Spawn)
if HasCompletedQuest(Spawn, LionManeHelm) then
RemoveLootItem(NPC, 3826)
end
   end