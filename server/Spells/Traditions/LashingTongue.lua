--[[
    Script Name    : Spells/Traditions/LashingTongue.lua
    Script Author  : neatz09
    Script Date    : 2022.05.21 05:05:40
    Script Purpose : 
                   : 
--]]


--[[ *Inflicts 7 - 9 crushing damage on target
*Stuns target
*Epic targets gain an immunity to Stun effects of 3.7 seconds and duration is reduced to 0.4 seconds.
*Resistibility increases against targets higher than level 29.

--]]

function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 7
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    AddControlEffect(Target, 4)
   end
   
  function remove(Caster, Target)
    RemoveControlEffect(Target, 4)

end

