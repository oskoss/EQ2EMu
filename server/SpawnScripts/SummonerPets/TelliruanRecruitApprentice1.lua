--[[
    Script Name    : SpawnScripts/SummonerPets/TelliruanRecruitApprentice1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.12 08:11:52
    Script Purpose : 
                   : 
--]]

function spawn(NPC, Spawn)
    
end

function attacked(NPC)
    SetInfoStructSInt(Spawn, "hp_regen", 9)
    SetInfoStructSInt(Spawn, "power_regen", 12)
    
end


function CombatReset(NPC)
    SetInfoStructSInt(Spawn, "hp_regen", 37)
    SetInfoStructSInt(Spawn, "power_regen", 22)
end


function respawn(NPC)
	spawn(NPC)
end