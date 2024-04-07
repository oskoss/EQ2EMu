--[[
    Script Name    : Spells/Scout/Ensnare.lua
    Script Author  : LordPazuzu
    Script Date    : 3/17/2024
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, Snare)
    Slow = 1.0 - Snare
    SetSpellSnareValue(Target, Slow) 
    AddControlEffect(Target, 11)
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 11)
end