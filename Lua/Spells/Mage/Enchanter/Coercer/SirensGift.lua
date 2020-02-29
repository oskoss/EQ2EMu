--[[
    Script Name    : Spells/Mage/Enchanter/Coercer/SirensGift.lua
    Script Author  : John Adams
    Script Date    : 2013.08.11 08:08:18
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    -- code to cast the spell
    Say(Caster, "Whoops! Guess this is not implemented yet!")

-- Info from spell_display_effects (remove from script when done)
-- Modifies mana flow to be group targeted.  Also reduces duration and fuel cost.
-- On a damage spell hit this spell has a 12% chance to cast Siren's Gift on the group.  Lasts for 10.0 seconds.  
-- Reduces the power cost of group members' spells by 20%
-- Reduces the reuse timers of all spells by 10%
-- Increases the max health of the coercer's Possess Essence by 25%
-- Cannot be modified except by direct means

end

function tick(Caster, Target)
    -- code to process each call_frequency (tick) set in spell_tiers
end

function remove(Caster, Target)
    -- code to remove the spell
end

