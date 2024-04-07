--[[
    Script Name    : Spells/Scout/Predator/Assassin/JugularSlice.lua
    Script Author  : Jabantiz
    Script Date    : 2014.04.17 05:04:09
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 20
    Mastery = SpellLevel + 10
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = math.floor(DmgBonus * 2.5) + MaxVal
    MinDmg = math.floor(DmgBonus * 2.5) + MaxVal
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)

    -- Stifles target
    --     If Target is not Epic
    if not IsEpic(Target) then
        AddControlEffect(Target, 2)
    end

    -- Resistibility increases against targets higher than level 29.
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 2)
end
