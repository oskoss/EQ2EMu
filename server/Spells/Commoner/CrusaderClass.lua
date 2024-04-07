--[[
    Script Name    : Spells/Commoner/CrusaderClass.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.16 04:09:43
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 3, 2) --Wisdom
   

end


function remove(Caster, Target)
    RemoveSpellBonus(Caster)
end
