--[[
    Script Name    : Spells/Mage/Enchanter/Coercer/Mesmerize.lua
    Script Author  : John Adams
    Script Date    : 2013.11.20 05:11:13
    Script Purpose : 
                   : 
--]]

-- Info from spell_display_effects (remove from script when done)
-- Mesmerizes target
-- Prevents AOE (except when direct) 
-- Dispelled when target takes damage
-- Epic targets gain an immunity to Mesmerize effects of 45.0 seconds and duration is reduced to 5.0 seconds.
-- Resistibility increases against targets higher than level 29.

function cast(Caster, Target, ControlType)
    AddControlEffect(Target, ControlType) 
end

function remove(Caster, Target, ControlType)
    RemoveControlEffect(Target, ControlType) 
end
