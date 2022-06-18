--[[
    Script Name    : Spells/Commoner/CalltoHome.lua
    Script Author  : neatz09
    Script Date    : 2019.04.08 12:04:04
    Script Purpose : 
                   : 
--]]

-- Teleports you to your recall point.
function precast(Caster, Target)
    if GetBoundZoneID(Caster) == 0 then
        SendMessage(Caster, "You are a failure", "red")
        return false
    end

    if(IsGateAllowed(Caster))
    then
        return true   
    else
        SendMessage(Caster, "You cannot use Call to Home from this location.", "red")
        return false
    end

 return true
end

function cast(Caster, Target)
    Gate(Caster)
end
