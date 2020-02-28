--[[
    Script Name    : Spells/Fighter/FightingChance.lua
    Script Author  : John Adams
    Script Date    : 2013.11.22 09:11:34
    Script Purpose : Begins a Heroic Opportunity
                   : 
--]]

function cast(Caster, Target)
    -- Begins a Heroic Opportunity
    Say(Caster, "Heroic Opportunities are not implemented yet.")
end

function precast(Caster, Target)
   -- Must be engaged in combat
   return IsInCombat(Caster)
end

