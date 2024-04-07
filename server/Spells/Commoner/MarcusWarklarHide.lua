--[[
    Script Name    : Spells/Commoner/MarcusWarklarHide.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.29 10:02:05
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddImmunitySpell(4, Caster)
    AddSpellBonus(Caster, 641, 100)

end