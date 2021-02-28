--[[
    Script Name    : Spells/Fighter/Warrior/Guardian/TauntingAssault.lua
    Script Author  : Dello
    Script Date    : 10/06/2014
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target, DmgType, MinVal, MaxVal)
    if MaxVal ~= nil and MinVal < MaxVal then
        SpellDamage(Target, DmgType, math.random(MinVal, MaxVal))
    else
        SpellDamage(Target, DmgType, MinVal)
    end
end

function cast(Caster, Target)
    AddHate(Caster, Target)
end
