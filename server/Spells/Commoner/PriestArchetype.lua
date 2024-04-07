--[[
    Script Name    : Spells/Commoner/PriestArchetype.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.05.27 02:05:57
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target)
    class = GetClass(Caster)
    if class == 13 then
        templar()
        else
            priest()
    end
end

function priest(Caster, Target)
    AddSpellBonus(Caster, 0, 2) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 3, 5) --Wisdom
end


function templar(Caster, Target)
    AddSpellBonus(Caster, 0, 2) --Strength
    AddSpellBonus(Caster, 4, 3) --Intelligence
    AddSpellBonus(Caster, 3, 5) --Wisdom
end

function remove(Caster, Target)
    RemoveSpellBonus(Caster)
end