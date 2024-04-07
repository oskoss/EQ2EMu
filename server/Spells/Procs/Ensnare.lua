--[[
    Script Name    : Spells/Procs/Ensnare.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.28 10:11:00
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, Snare)
    local Slow = 100.0 - Snare
    SetSpellSnareValue(Target, Slow)  
    AddControlEffect(Target, 11)
    
end


function remove(Caster, Target)
    RemoveControlEffect(Target, 11)
end

