--[[
    Script Name    : Spells/Fighter/DragonHide.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.27 03:02:11
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddImmunitySpell(4, Caster)
    AddSpellBonus(Caster, 205, 10000)
    AddSpellBonus(Caster, 201, 10000)
    AddSpellBonus(Caster, 641, 50)

end
