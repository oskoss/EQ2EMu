--[[
    Script Name    : Spells/Fighter/Warrior/Guardian/SentryWatch.lua
    Script Author  : John Adams
    Script Date    : 2013.08.11 02:08:32
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    -- code to cast the spell
    Say(Caster, "Whoops! Guess this is not implemented yet!")

-- Info from spell_display_effects (remove from script when done)
-- On death this spell will cast Sentry Watch Guard on target.  Lasts for 15.0 seconds.  
--     When damaged this spell will cast Reinforcement on target's attacker.  
--         Increases Threat to target by 365 
--         Increases threat priority of target by 1 position
--     Reduces all damage done to target by 45% This spell will absorb a total of 1 attack.
--     Heals target for 3.0% of max health
--         This effect cannot be critically applied.
--     The healing of this spell cannot be modified except by direct means
--     Grants a total of 1 trigger of the spell.

end

function tick(Caster, Target)
    -- code to process each call_frequency (tick) set in spell_tiers
end

function remove(Caster, Target)
    -- code to remove the spell
end

