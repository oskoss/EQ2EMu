--[[
    Script Name    : Spells/Scout/Bard/RousingTune.lua
    Script Author  : LordPazuzu
    Script Date    : 3/27/2024
    Script Purpose : 
                   : 
--]]

-- Increases STR and AGI of group members (AE) by 8.1

function cast(Caster, Target, BonusAmt)
    Level = GetLevel(Caster)
    SpellLevel = 10
    Mastery = SpellLevel + 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    AddSpellBonus(Target, 0, LvlBonus * 0.2 + BonusAmt)
    AddSpellBonus(Target, 1, LvlBonus * 0.2 + BonusAmt)
    AddSpellBonus(Target, 2, LvlBonus * 0.2 + BonusAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end