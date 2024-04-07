--[[
    Script Name    : Spells/Scout/Bard/PerformersTalent.lua
    Script Author  : LordPazuzu
    Script Date    : 3/29/2024
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, Agi, Arcane)
    Level = GetLevel(Caster)
    SpellLevel = 13
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    AgiBonus = (StatBonus + LvlBonus) * 0.2 
    ArcaneBonus = (StatBonus + LvlBonus) * 2 
    
    AddSpellBonus(Target, 2, Agi + AgiBonus)
    AddSpellBonus(Target, 203, Arcane + ArcaneBonus)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end