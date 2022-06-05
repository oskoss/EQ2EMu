--[[
    Script Name    : Spells/Traits/ShadowStalker.lua
    Script Author  : neatz09
    Script Date    : 2020.12.19 02:12:41
    Script Purpose : 
                   : 
--]]

-- Increases stealth or invisible movement speed of caster by 15.0%

function cast(Caster, Target, BonusAmt)
	AddSpellBonus(Target, 676, BonusAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end