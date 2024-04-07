--[[
    Script Name    : Spells/Commoner/FierceBite.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.11 08:09:55
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 1
    Mastery = SpellLevel + 50
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    MaxDmg = MaxVal + LvlBonus
    MinDmg = MinVal + LvlBonus
    
    SpellDamage(Target, 0, MinDmg, MaxDmg)

end
