--[[
    Script Name    : Spells/Priest/Cleric/Inquisitor/TormentingConversion.lua
    Script Author  : John Adams
    Script Date    : 2013.08.11 06:08:11
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    -- code to cast the spell
    Say(Caster, "Whoops! Guess this is not implemented yet!")

-- Info from spell_display_effects (remove from script when done)
-- Makes target afraid
-- Applies Traumatization on termination.  Lasts for 8.8 seconds.
-- Decreases Threat to target by 759  instantly and Decreases Threat by 801  every 1.8 seconds thereafter
-- Mesmerizes target
-- Dispelled when target takes damage
-- Epic targets gain an immunity to Mesmerize effects of 26.3 seconds and duration is reduced to 2.9 seconds.
-- Resistibility increases against targets higher than level 76.
-- 30% chance to dispel when target takes damage
-- Does not affect Epic targets
-- Resistibility increases against targets higher than level 29.

end

function tick(Caster, Target)
    -- code to process each call_frequency (tick) set in spell_tiers
end

function remove(Caster, Target)
    -- code to remove the spell
end

