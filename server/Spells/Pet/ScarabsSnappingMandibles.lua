--[[
    Script Name    : Spells/Pet/ScarabsSnappingMandibles.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.18 09:11:59
    Script Purpose : 
                   : 
 --]]
                   

function cast(Caster, Target, DmgType, MinVal, MaxVal)
     DmgBonus = GetInt(Caster)/10
     MinDmg = math.floor(MinVal + DmgBonus)
     MaxDmg = math.floor(MaxVal + DmgBonus)
     SpellDamage(Target, DmgType, MinDmg, MaxDmg)
    
end