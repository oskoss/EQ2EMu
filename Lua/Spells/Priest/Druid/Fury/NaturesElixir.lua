--[[
    Script Name    : Spells/Priest/Druid/Fury/NaturesElixir.lua
    Script Author  : Jabantiz
    Script Date    : 2014.01.14 02:01:50
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MinVal, MaxVal)
    -- Heals target for 31 - 38
    if MaxVal ~= nil and MinVal < MaxVal then
        SpellHeal("Heal", MinVal, MaxVal)
    else
        SpellHeal("Heal", MinVal)
    end
end
