--[[
    Script Name    : Spells/Commoner/ElddarianCharger.lua
    Script Author  : Skywalker646
    Script Date    : 2019.12.26 07:12:29
    Script Purpose : 
                   : 
--]]

function precast(Caster)
 if GetMount(Caster) > 0 then
        return false
    end

    return true
end

function cast(Caster, Target, Speed)
-- Summons a mount to ride
SetMount(Caster, 6850)
-- increases your speed by 130%
AddSpellBonus(Caster, 611, Speed)

end

function remove(Caster, Target)
    RemoveSpellBonus(Caster)
SetMount(Caster, 0)
end