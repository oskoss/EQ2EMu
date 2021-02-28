--[[
    Script Name    : Spells/AA/ArrowTorrent.lua
    Script Author  : neatz09
    Script Date    : 2020.12.15 05:12:46
    Script Purpose : 
                   : 
--]]

-- Increases DPS of caster by 2.0

function cast(Caster, Target, BonusAmt)
    AddSpellBonus(Target, 629, BonusAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end