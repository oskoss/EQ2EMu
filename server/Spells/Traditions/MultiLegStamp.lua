--[[
    Script Name    : Spells/Traditions/MultiLegStamp.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.25 04:09:44
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, LowDmg, HighDmg)
    Level = GetLevel(Caster)
    SpellLevel = 10
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    TotalLow = LowDmg + math.floor(DmgBonus)
    TotalHigh = HighDmg + math.floor(DmgBonus)
    
	SpellDamage(Target, DmgType, TotalLow, TotalHigh)
		if LastSpellAttackHit() then
			SpellDamage(Target, DmgType, TotalLow, TotalHigh)
			SpellDamage(Target, DmgType, TotalLow, TotalHigh)
			
				end
end
