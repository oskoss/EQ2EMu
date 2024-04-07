--[[
    Script Name    : Spells/Commoner/LadonFieryBreath.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.26 08:02:45
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    SpellDamage(Target, 3, 100, 125)
end

function tick(Caster, Target)
    SpellDamage(Target, 3, 30, 50)
end

function remove(Caster, Target)
    
end
