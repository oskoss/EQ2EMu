--[[
    Script Name    : Spells/Traditions/InfectiousTouch.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 06:09:02
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, MainDmg, DoTDmg)
    Level = GetLevel(Caster)
    SpellLevel = 11
    Mastery = SpellLevel + 50
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    TotalDmg = MainDmg + math.floor(DmgBonus)
    
    
    SpellDamage(Target, DmgType, MainDmg, MainDmg)
end


function tick(Caster, Target, DmgType, MainDmg, DoTDmg)
    Level = GetLevel(Caster)
    SpellLevel = 11
    Mastery = SpellLevel + 50
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    TotalDoT = DoTDmg + math.floor(DmgBonus)
    
    
    SpellDamage(Target, DmgType, TotalDoT, TotalDoT)
end
