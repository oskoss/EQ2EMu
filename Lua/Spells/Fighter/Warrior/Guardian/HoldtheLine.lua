--[[
    Script Name    : Spells/Fighter/Warrior/Guardian/HoldtheLine.lua
    Script Author  : John Adams
    Script Date    : 2013.08.11 03:08:12
    Script Purpose : Waiting for SpellProc() functionality
                   : Passing only 1 value since they seem to be the same regardless which effect procs
--]]

-- Info from spell_display_effects (remove from script when done)
-- When damaged this spell has a 50% chance to cast Holding the Line on target's attacker.  
--     Increases Threat to target by 27 
-- On a block this spell will cast Holding the Line on target's victim.  
--     Increases Threat to target by 27 

function cast(Caster, Target, AddHate)

    AddHate(Caster, Target)

end
