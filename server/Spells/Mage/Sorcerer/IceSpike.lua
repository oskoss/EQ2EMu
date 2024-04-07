--[[
    Script Name    : Spells/Mage/Sorcerer/IceSpike.lua
    Script Author  : neatz09
    Script Date    : 2020.11.05 02:11:15
    Script Purpose : 
                   : 
--]]

-- Inflicts 45 - 84 cold damage on target

function cast(Caster, Target, DmgType, MinVal, MaxVal, NotUsed)
    Level = GetLevel(Caster)
    SpellLevel = 15
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