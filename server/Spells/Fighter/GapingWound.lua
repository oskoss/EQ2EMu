--[[
    Script Name    : Spells/Fighter/GapingWound.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.30 02:08:49
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DoTType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 5
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    SpellDamage(Target, DoTType, MinDmg, MaxDmg)
end


function tick(Caster, Target, DoTType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 5
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
    
      if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    
    SpellDamage(Target, DoTType, MinDmg, MaxDmg)
end


