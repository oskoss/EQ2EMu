--[[
    Script Name    : Spells/Traits/AncestralBlessing.lua
    Script Author  : neatz09
    Script Date    : 2020.12.18 03:12:26
    Script Purpose : 
                   : 
--]]

-- Increases Health Regen of caster by 9.0

function cast(Caster, Target, BonusAmt)
	AddSpellBonus(Target, 600, BonusAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end