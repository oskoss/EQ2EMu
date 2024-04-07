--[[
    Script Name    : Spells/Mage/Enchanter/MindBlast.lua
    Script Author  : neatz09
    Script Date    : 2020.11.03 11:11:41
    Script Purpose : 
                   : 
--]]

-- Inflicts 31 - 41 mental damage on target
function cast(Caster, Target, DmgType, MinVal, MaxVal)
	    Level = GetLevel(Caster)
    SpellLevel = 17
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
end