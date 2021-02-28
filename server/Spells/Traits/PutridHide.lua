--[[
    Script Name    : Spells/Traits/PutridHide.lua
    Script Author  : neatz09
    Script Date    : 2020.12.20 01:12:05
    Script Purpose : 
                   : 
--]]

-- Increases Mitigation of caster vs physical damage by 3

function cast(Caster, Target, Modifier)
    Level = GetLevel(Target)
    BonusAmt = Level * Modifier
    AddSpellBonus(Target, 200, BonusAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end