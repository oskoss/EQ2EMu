--[[
    Script Name    : Spells/Commoner/ExplosiveWarts.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.11 01:09:21
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, MinDmg, MaxDmg)
    Level = GetLevel(Caster)
    SpellLevel = 6
    Mastery = SpellLevel + 50

    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    TotalMin = MinDmg + LvlBonus
    TotalMax = MaxDmg + LvlBonus
    
    SpellDamage(Target, 8, TotalMin, TotalMax)
    
    
end

