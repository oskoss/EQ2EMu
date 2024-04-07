--[[
    Script Name    : Spells/Scout/Bard/WaltsSingingBlade.lua
    Script Author  : LordPazuzu
    Script Date    : 4/1/2024
    Script Purpose : 
                   : 
--]]

-- Inflicts 27 - 46 mental damage on target
-- Decreases power of target by 10 - 17

function cast(Caster, Target, DmgType, MinVal, MaxVal, MinPwr, MaxPwr)
    damage(Caster, Target, DmgType, MinVal, MaxVal, MinPwr, MaxPwr)
end

function tick(Caster, Target, DmgType, MinVal, MaxVal, MinPwr, MaxPwr)
    damage(Caster, Target, DmgType, MinVal, MaxVal, MinPwr, MaxPwr)    
end

function remove(Caster, Target)
    
end

function damage(Caster, Target, DmgType, MinVal, MaxVal, MinPwr, MaxPwr)
    Level = GetLevel(Caster)
    SpellLevel = 15
    Mastery = SpellLevel + 10
    StrBonus = GetStr(Caster) / 10
    IntBonus = GetInt(Caster) / 10 
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StrBonus
    DrainBonus = LvlBonus + IntBonus
    MinDmg = math.floor(DmgBonus) * 2 + MinVal
    MaxDmg = math.floor(DmgBonus) * 2 + MaxVal
    MinDrain = MinPwr + DrainBonus
    MaxDrain = MaxPwr + DrainBonus
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    SpellDamageExt(Target, 5, MinDrain, MaxDrain, 0, 0, 0, 1) 
end

