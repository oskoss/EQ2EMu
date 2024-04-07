--[[
    Script Name    : Spells/Commoner/WarriorClass.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.16 04:09:44
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 2) --Stamina
    AddSpellBonus(Caster, 2, 3) --Agility
    

end


function remove(Caster, Target)
    RemoveSpellBonus(Caster)
end
