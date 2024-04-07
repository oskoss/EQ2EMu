--[[
    Script Name    : Spells/Traditions/ViciousBite.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.29 07:08:06
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, MainDmg, DoTDmg)
    Level = GetLevel(Caster)
    SpellLevel = 1
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
        
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
    SpellLevel = 1
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    TotalDoT = DoTDmg + math.floor(DmgBonus)
    
    
    SpellDamage(Target, DmgType, TotalDoT, TotalDoT)
end


function remove(Caster, Target)

end

