--[[
    Script Name    : Spells/Commoner/Poison.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.11 12:10:27
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinDmg, MaxDmg)
    SpellDamage(Target, DmgType, MinDmg, MinDmg)
    SpellDamage(Target, DmgType, MaxDmg, MaxDmg)
    
end


function tick(Caster, Target, DmgType, MinDmg, MaxDmg)
    SpellDamage(Target, DmgType, MaxDmg, MaxDmg)

end


function remove(Caster, Target)

end




