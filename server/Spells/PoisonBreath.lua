--[[
    Script Name    : Spells/PoisonBreath.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.12 05:03:07
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target)
    SpellDamage(Target, 2, 300, 425)
end

function tick(Caster, Target)
    SpellDamage(Target, 2, 90, 150)
end

function remove(Caster, Target)
    
end

