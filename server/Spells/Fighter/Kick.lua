--[[
    Script Name    : Spells/Fighter/Kick.lua
    Script Author  : LordPazuzu
    Script Date    : 12/9/2022
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, MinVal, MaxVal, SpellLevel)
    Level = GetLevel(Caster)
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
 DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus) + MaxVal
    MinDmg = math.floor(DmgBonus) + MinVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
 
end
