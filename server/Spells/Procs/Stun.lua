--[[
    Script Name    : Spells/Procs/Stun.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.10 04:09:24
    Script Purpose : 
                   : 
--]]


function cast(Caster, Target)
    AddControlEffect(Target,2)
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 2)
end
