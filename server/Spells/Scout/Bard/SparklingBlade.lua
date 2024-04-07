--[[
    Script Name    : Spells/Scout/Bard/SparklingBlade.lua
    Script Author  : LordPazuzu
    Script Date    : 3/18/2024
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, MinVal, MaxVal, Mit)
    Level = GetLevel(Caster)
    SpellLevel = 11
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MinDmg = math.floor(DmgBonus) * 2 + MinVal
    MaxDmg = math.floor(DmgBonus) * 2 + MaxVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    
		if LastSpellAttackHit(Target) then
			AddSpellBonus(Target, 206, Mit)
		end
end

function remove(Caster, Target)
    RemoveSpellBonus()
end
