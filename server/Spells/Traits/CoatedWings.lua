--[[
    Script Name    : Spells/Traits/CoatedWings.lua
    Script Author  : neatz09
    Script Date    : 2020.12.18 02:12:04
    Script Purpose : 
                   : 
--]]

-- Increases Max Power of caster by 1.0%
-- Increases Max Health of caster by 2.0%

function cast(Caster, Target, Power, Hp)
	AddSpellBonus(Target, 620, Power)
	AddSpellBonus(Target, 607, Hp)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end