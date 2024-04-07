--[[
    Script Name    : Spells/Priest/Shaman/SpiritoftheBull.lua
    Script Author  : LordPazuzu
    Script Date    : 3/16/2024
    Script Purpose : 
                   : 
--]]

-- Increases STR and STA of group members (AE) by 13.1

function cast(Caster, Target, Buff)
    Level = GetLevel(Caster)
    SpellLevel= 18
    Mastery = SpellLevel + 10
    StatBonus = GetWis(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    BonusAmt = (StatBonus + LvlBonus) * 0.2
    
    AddSpellBonus(Target, 0, BonusAmt)
	AddSpellBonus(Target, 1, BonusAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end