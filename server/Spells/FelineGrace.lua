--[[
    Script Name    : Spells/FelineGrace.lua
    Script Author  : neatz09
    Script Date    : 2020.08.14 04:08:27
    Script Purpose : 
                   : 
--]]

-- Grants the skill Safefall.

function cast(Caster, Target)
    AddControlEffect(Caster, 14)
end

function remove(Caster, Target)
    RemoveControlEffect(Caster, 14)
end

