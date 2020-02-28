--[[
    Script Name    : Spells/Scout/Rogue/Brigand/BarroomNegotiation.lua
    Script Author  : Zcoretri
    Script Date    : 14.March.2014
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, MinDmg, MaxDmg)
-- Inflicts melee damage on targets in Area of Effect
-- Interrupts targets in Area of Effect
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    Interrupt(Caster, Target)
end


