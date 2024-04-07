--[[
    Script Name    : Spells/Traditions/PoisonousPinch.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.10 06:09:50
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, Crush, Poison)
    Level = GetLevel(Caster)
    SpellLevel = 7
    Mastery = SpellLevel + 50
   
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    TotalDmg = Crush + LvlBonus
    SpellDamage(Target, 1, TotalDmg, TotalDmg)
    if IsPlayer(Target) and GetClientVersion(Target) <= 526 then
    SpawnSet(Target,"visual_state",2774)
    else
    SpawnSet(Target,"visual_state",2774)
    end   

end

function tick(Caster, Target, Crush, Poison)
        Level = GetLevel(Caster)
    SpellLevel = 7
    Mastery = SpellLevel + 50
   
    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end

    DoTDmg = Poison + LvlBonus
    SpellDamage(Target, 9, DoTDmg, DotDmg)
    if IsPlayer(Target) and GetClientVersion(Target) <= 526 then
    SpawnSet(Target,"visual_state",2774)
    else
    SpawnSet(Target,"visual_state",2774)
    end   

end

function remove(Caster, Target)
    SpawnSet(Target,"visual_state",35542)
end
