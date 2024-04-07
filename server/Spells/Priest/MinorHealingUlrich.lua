--[[
    Script Name    : Spells/Priest/MinorHealingUlrich.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.30 07:10:15
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    local zone = GetZone(Caster)
    local Ulrich = GetSpawnByLocationID(zone, 133787319)
        
        SpellHeal("Heal", 65, 85, Ulrich)
end
