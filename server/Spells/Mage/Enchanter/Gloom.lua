--[[
    Script Name    : Spells/Mage/Enchanter/Gloom.lua
    Script Author  : LordPazuzu
    Script Date    : 11/5/2023
    Script Purpose : 
                   : 
--]]

-- Inflicts 12 - 14 mental damage on target instantly and every 6 seconds
-- Decreases Mitigation of target vs arcane damage by 141

function cast(Caster, Target, DmgType, MinVal, MaxVal, Mit)
    damage(Caster,Target, DmgType, MinVal, MaxVal)
    AddSpellBonus(Target, 203, Mit)
end


function tick(Caster, Target, DmgType, MinVal, MaxVal, Mit)
    damage(Caster, Target, DmgType,  MinVal, MaxVal)
end


function damage(Caster,Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 14
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus) * 2 + MaxVal
    MinDmg = math.floor(DmgBonus) * 2 + MinVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
end

function remove(Caster, Target)
    RemoveSpellBonus(Target)
end