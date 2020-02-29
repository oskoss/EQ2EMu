--[[
    Script Name    : Spells/Scout/Predator/Assassin/AssassinsFlurry.lua
    Script Author  : John Adams
    Script Date    : 2013.08.12 06:08:47
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    -- code to cast the spell
    Say(Caster, "Whoops! Guess this is not implemented yet!")

-- Info from spell_display_effects (remove from script when done)
-- Caster has a 15.0% chance of having one of their weapons' autoattack strike the target multiple times.
-- On a combat hit this spell may cast Flurry of Poison on target of attack.  Lasts for 12.0 seconds.  Triggers about 2.4 times per minute. 
-- Increases Crit Chance of caster by 15.0
-- Inflicts 648 - 972 poison damage on target
-- Cannot be modified except by direct means
-- Increases the damage of stealth attacks by 30%.
-- Cannot be modified except by direct means

end

function tick(Caster, Target)
    -- code to process each call_frequency (tick) set in spell_tiers
end

function remove(Caster, Target)
    -- code to remove the spell
end

