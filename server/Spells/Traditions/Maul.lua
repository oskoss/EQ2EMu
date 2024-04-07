--[[
    Script Name    : Spells/Traditions/Maul.lua
    Script Author  : LordPazuzu
    Script Date    : 3/8/2023
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 1
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
end


function tick(Caster, Target, DmgType, MinVal, MaxVal)
    Level = GetLevel(Caster)
    SpellLevel = 1
    Mastery = SpellLevel + 50
    StatBonus = GetStr(Caster) / 10
        
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    SetInfoStructString(Caster, "visual_state", "persist_damage")
    
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

function remove(Caster, Target, DoTType, MinVal, MaxVal)
     SpawnSet(Target,"visual_state",35558)
end
