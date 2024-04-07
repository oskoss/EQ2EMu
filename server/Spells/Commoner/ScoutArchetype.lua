--[[
    Script Name    : Spells/Commoner/ScoutArchetype.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.05.27 02:05:04
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target)
    class = GetClass(Caster)
    if class == 35 then
        bard()
    elseif class == 36 then
        bard()
    elseif class == 37 then
        bard()
    else
        scout()
    end
end

function scout(Caster, Target)
    AddSpellBonus(Caster, 0, 3) --Strength
    AddSpellBonus(Caster, 1, 2) --Stamina
    AddSpellBonus(Caster, 2, 5) --Agility
end

function bard(Caster, Target)
    AddSpellBonus(Caster, 0, 3) --Strength
    AddSpellBonus(Caster, 4, 2) --Intelligence
    AddSpellBonus(Caster, 2, 5) --Agility
end

function remove(Caster, Target)
    RemoveSpellBonus(Caster)
end
