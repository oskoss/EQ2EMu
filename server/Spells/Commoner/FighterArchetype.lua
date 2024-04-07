--[[
    Script Name    : Spells/Commoner/FighterArchetype.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.05.26 09:05:15
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target)
    class = GetClass(Caster)
    if class == 1 then
        fighter()
    elseif class == 2 then
        warrior()
    elseif class == 3 then
        guardian()
    elseif class == 4 then
        berserker()
    elseif class == 5 then
        brawler()
    elseif class == 6 then
        monk()
    elseif class == 7 then
        bruiser()
    elseif class == 8 then
        crusader()
    elseif class == 9 then
        shadowknight()
    elseif class == 10 then
        paladin()
    end
end

function fighter(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 2, 2) --Agility
end

function warrior(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 2) --Stamina
    AddSpellBonus(Caster, 2, 3) --Agility
end

function crusader(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 3, 2) --Wisdom
end

function brawler(Caster, Target)
    AddSpellBonus(Caster, 0, 3) --Strength
    AddSpellBonus(Caster, 1, 2) --Stamina
    AddSpellBonus(Caster, 2, 5) --Agility
    block()
end

function guardian(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 2, 2) --Agility
end

function berserker(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 2) --Stamina
    AddSpellBonus(Caster, 2, 3) --Agility
end

function bruiser(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 2, 2) --Agility
    block()
end

function monk(Caster, Target)
    AddSpellBonus(Caster, 0, 2) --Strength
    AddSpellBonus(Caster, 1, 3) --Stamina
    AddSpellBonus(Caster, 2, 5) --Agility
    block()
end

function paladin(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 2, 3) --Agility
    AddSpellBonus(Caster, 3, 2) --Wisdom
end

function shadowknight(Caster, Target)
    AddSpellBonus(Caster, 0, 5) --Strength
    AddSpellBonus(Caster, 2, 3) --Agility
    AddSpellBonus(Caster, 4, 2) --Intelligence
end

function block(Caster, Target)
    AddSpellBonus(Caster, 651, 5) --Block
    --AddSpellBonus(Caster, 670, 5) --Block    
end

function remove(Caster, Target)
    RemoveSpellBonus(Caster)
end


