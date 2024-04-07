--[[
    Script Name    : Spells/Fighter/Brawler/PowerStrike.lua
    Script Author  : LordPazuzu
    Script Date    : 9/2/2023
    Script Purpose : 
                   : 
--]]

-- Inflicts 28 - 46 melee damage on target

-- If facing target

function cast(Caster, Target, DmgType, DmgLow, DmgHigh)
    Say(Caster, "facing target not implemented.")
    Level = GetLevel(Caster)
    SpellLevel = 10
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus) * 2 + DmgHigh
    MinDmg = math.floor(DmgBonus) * 2 + DmgLow
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    Interrupt(Caster, Target)
	
end

