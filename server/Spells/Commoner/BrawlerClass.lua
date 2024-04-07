--[[
    Script Name    : Spells/Commoner/BrawlerClass.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.16 03:09:24
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddSpellBonus(Caster, 0, 3) --Strength
    AddSpellBonus(Caster, 1, 2) --Stamina
    AddSpellBonus(Caster, 2, 5) --Agility
    AddSpellBonus(Caster, 651, 5) --Block
    --AddSpellBonus(Caster, 670, 5) --Block

end


function remove(Caster, Target)
    RemoveSpellBonus(Caster)
end
