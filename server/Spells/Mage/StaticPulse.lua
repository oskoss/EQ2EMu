--[[
    Script Name    : Spells/Mage/StaticPulse.lua
    Script Author  : LordPazuzu
    Script Date    : 12/6/2022
    Script Purpose : 
                   : 
--]]



function cast(Caster, Target, DoTType, MinVal, MaxVal, SpellLevel)
    Level = GetLevel(Caster)
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
    
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    SpellDamage(Target, DoTType, MinDmg, MaxDmg)
end


function tick(Caster, Target, DoTType, MinVal, MaxVal, SpellLevel)
    Level = GetLevel(Caster)
    Mastery = SpellLevel + 10
    StatBonus = GetInt(Caster) / 10
    SpawnSet(Target,"visual_state",626)
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DmgBonus = LvlBonus + StatBonus
    MaxDmg = MaxVal + math.floor(DmgBonus)
    MinDmg = MinVal + math.floor(DmgBonus)
    
    SpellDamage(Target, DoTType, MinDmg, MaxDmg)
end

function remove(Caster, Target, DoTType, MinVal, MaxVal)
    SetInfoStructString(Target, "visual_state", "0")
     SpawnSet(Target,"visual_state",0)
end
