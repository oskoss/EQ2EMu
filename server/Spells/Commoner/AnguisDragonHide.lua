--[[
    Script Name    : Spells/Commoner/AnguisDragonHide.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.12 05:03:07
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddImmunitySpell(4, Caster)
    --AddSpellBonus(Caster, 205, 10000)
    AddSpellBonus(Caster, 201, 10000)
    AddSpellBonus(Caster, 641, 100)

end

