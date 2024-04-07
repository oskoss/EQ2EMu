--[[
    Script Name    : Spells/Commoner/LadonDragonHide.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.28 10:02:18
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddImmunitySpell(4, Caster)
    AddSpellBonus(Caster, 205, 10000)
    AddSpellBonus(Caster, 201, 10000)
    AddSpellBonus(Caster, 641, 100)

end
