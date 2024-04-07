--[[
    Script Name    : Spells/Scout/Escape.lua
    Script Author  : neatz09
    Script Date    : 2019.10.12 09:10:56
    Script Purpose : 
                   : 
--]]


-- Teleports caster and caster's group within the zone
function precast(Caster, Target)
    if(GetCanEvac(Caster) == 1)
    then
        return true
    else
        SendMessage(Caster, "You cannot use evacuate spells in this zone.", "red")
        return false
    end
    return true
end

function cast(Caster, Target)
    Evac()
end