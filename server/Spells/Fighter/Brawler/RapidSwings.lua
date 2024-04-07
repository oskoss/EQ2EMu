--[[
    Script Name    : Spells/Fighter/Brawler/RapidSwings.lua
    Script Author  : LordPazuzu
    Script Date    : 9/29/2023
    Script Purpose : 
                   : 
--]]
-- Inflicts 19 - 32 melee damage on target
-- Inflicts 19 - 32 melee damage on target
-- Inflicts 19 - 32 melee damage on target
-- Inflicts 19 - 32 melee damage on target
-- If facing target

function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 19
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus) * 2 + MaxVal
    MinDmg = math.floor(DmgBonus) * 2 + MinVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
		if LastSpellAttackHit() then
			SpellDamage(Target, DmgType, MinDmg, MaxDmg)
			SpellDamage(Target, DmgType, MinDmg, MaxDmg)
			SpellDamage(Target, DmgType, MinDmg, MaxDmg)
				end
end


