--[[
    Script Name    : Spells/Fighter/Crusader/RighteousBlow.lua
    Script Author  : LordPazuzu
    Script Date    : 3/17/2023
    Script Purpose : 
                   : 
--]]

-- Applies Blessed Strike on termination.
--     Inflicts 23 - 38 divine damage on target
-- Inflicts 9 - 16 divine damage on target

function cast(Caster, Target, Dmg1, Dmg1Min, Dmg1Max, Dmg2, Dmg2Min, Dmg2Max)
    Level = GetLevel(Caster)
    SpellLevel = 11
    Mastery = SpellLevel + 10
    StrBonus = GetStr(Caster) / 10
    IntBonus = GetInt(Caster) / 10
    Spell = GetSpell(2550392, GetSpellTier())  
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus1 = LvlBonus + IntBonus
    DmgBonus2 = LvlBonus + StrBonus
    MaxDmg1 = math.floor(DmgBonus1) * 2 + Dmg1Max
    MinDmg1 = math.floor(DmgBonus1) * 2 + Dmg1Min
    MaxDmg2 = math.floor(DmgBonus2) * 2 + Dmg2Max
    MinDmg2 = math.floor(DmgBonus2) * 2 + Dmg2Min 
    
    SpellDamage(Target, Dmg2, MinDmg2, MaxDmg2)
    
    if LastSpellAttackHit() then
		SetSpellDataIndex(Spell, 0, Dmg1)
		SetSpellDataIndex(Spell, 1, MinDmg1)
		SetSpellDataIndex(Spell, 2, MaxDmg1)
		CastCustomSpell(Spell, Caster, Target)

        end
end

