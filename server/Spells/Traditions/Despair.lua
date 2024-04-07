--[[
    Script Name    : Spells/Traditions/Despair.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.27 08:09:20
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 10
    Mastery = SpellLevel + 50
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    AddControlEffect(Target, 2)
   end


function tick(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 10
    Mastery = SpellLevel + 50
    StatBonus = GetInt(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    if IsPlayer(Target) and GetClientVersion(Target) <= 526 then
    SpawnSet(Target,"visual_state",2790)
    else
    SpawnSet(Target,"visual_state",2790)
    end   
    SpellDamage(Target, DmgType, MinDmg, MaxDmg)
end


function remove(Caster, Target)
    RemoveControlEffect(Target, 2)
    SpawnSet(Target,"visual_state",35558)
end
