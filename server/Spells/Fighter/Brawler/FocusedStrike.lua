--[[
    Script Name    : Spells/Fighter/Brawler/FocusedStrike.lua
    Script Author  : LordPazuzu
    Script Date    : 9/6/2023
    Script Purpose : 
                   : 
--]]

-- Inflicts melee damage on target at range.

function cast(Caster, Target, DmgType, DmgLow, DmgHigh)
    Level = GetLevel(Caster)
    SpellLevel = 10
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    
    DmgBonus = LvlBonus + StatBonus
    MinDmg = math.floor(DmgBonus) * 2 + DmgLow
    MaxDmg = math.floor(DmgBonus) * 2 + DmgHigh
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
end