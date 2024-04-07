--[[
    Script Name    : Spells/Commoner/StingingBarrage.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.16 01:10:50
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, MinVal, MaxVal, MinDoT, MaxDoT)
    Level = GetLevel(Caster)
    SpellLevel = 8
    Mastery = SpellLevel + 50

    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    MinDmg = MinVal + LvlBonus
    MaxDmg = MaxVal + LvlBonus * 2
    
    SpellDamage(Target, 2, MinDmg, MaxDmg)
    		if LastSpellAttackHit() then
			SpellDamage(Target, DmgType, MinDmg, MaxDmg)
			SpellDamage(Target, DmgType, MinDmg, MaxDmg)
			end

end


function tick (Caster, Target, MinVal, MaxVal, MinDoT, MaxDoT)
    Level = GetLevel(Caster)
    SpellLevel = 8
    Mastery = SpellLevel + 50

    if Level < Mastery then
        LvlBonus = Level - SpellLevel
        else LvlBonus = Mastery - SpellLevel
    end
    
    DoTMin = MinDoT + LvlBonus
    DoTMax = MaxDot + LvlBonus * 2
    
    SpellDamage(Target, 9, DoTMin, DoTMax)
     if IsPlayer(Target) and GetClientVersion(Target) <= 526 then
    SpawnSet(Target,"visual_state",2774)
    else
    SpawnSet(Target,"visual_state",2774)
    end   
end


function remove(Caster, Target)
     SpawnSet(Target,"visual_state",35542)
end

