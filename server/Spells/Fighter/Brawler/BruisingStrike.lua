--[[
    Script Name    : Spells/Fighter/Brawler/BruisingStrike.lua
    Script Author  : LordPazuzu
    Script Date    : 9/10/2023
    Script Purpose : 
                   : 
--]]

-- Inflicts 52 - 88 melee damage on target
-- If facing target

function cast(Caster, Target, DmgType, DmgLow, DmgHigh)
    Say(Caster, "facing target not implemented.")
    Level = GetLevel(Caster)
    SpellLevel = 17
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

	
end
