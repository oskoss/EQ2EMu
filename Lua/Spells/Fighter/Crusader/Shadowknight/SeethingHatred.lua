--[[
    Script Name    : Spells/Fighter/Crusader/Shadowknight/SeethingHatred.lua
    Script Author  : John Adams
    Script Date    : 2013.08.11 06:08:47
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    -- code to cast the spell
    Say(Caster, "Whoops! Guess this is not implemented yet!")

-- Info from spell_display_effects (remove from script when done)
-- Damage over time spells increase damage with each tick.  Damage ceases to increase after 5 ticks.
-- On any combat or spell hit this spell may cast Seething Hatred on target of attack.  Lasts for 15.0 seconds.  Triggers about 2.4 times per minute. 
-- Inflicts 734 - 897 disease damage on target
-- 300% of health regained from lifetaps will be applied as hate to engaged targets.
-- Cannot be modified except by direct means
-- Cannot be modified except by direct means

end

function tick(Caster, Target)
    -- code to process each call_frequency (tick) set in spell_tiers
end

function remove(Caster, Target)
    -- code to remove the spell
end

