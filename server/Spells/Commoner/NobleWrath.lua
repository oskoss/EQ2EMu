--[[
    Script Name    : Spells/Commoner/NobleWrath.lua
    Script Author  : neatz09
    Script Date    : 2022.05.21 06:05:29
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)

*AoE DD Crushing damage X - Y target.

--]]

function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 10
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