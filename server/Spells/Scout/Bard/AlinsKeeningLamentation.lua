--[[
    Script Name    : Spells/Scout/Bard/AlinsKeeningLamentation.lua
    Script Author  : LordPazuzu
    Script Date    : 3/29/2024
    Script Purpose : 
                   : 
--]]

-- Inflicts 46 - 76 mental damage on target encounter

function cast(Caster, Target, DmgType, MinVal, MaxVal)
	Level = GetLevel(Caster)
	SpellLevel = 15
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = math.floor(LvlBonus + StatBonus) *2
    MinDmg = MinVal + DmgBonus
    MaxDmg = MaxVal + DmgBonus
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
 
end