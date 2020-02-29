--[[
    Script Name    : Spells/Mage/Sorcerer/Wizard/Cease.lua
    Script Author  : neatz09
    Script Date    : 2019.10.07 03:10:05
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, MinHate, MaxHate)
    -- Interrupts target encounter
    Interrupt(Caster, Target)

    -- Decreases Threat to target by 355 - 434
    AddHate(Caster, Target, math.random(MinHate, MaxHate), 1)

-- Stifles target
--     If Target is not Epic
-- Resistibility increases against targets higher than level 29.
    if not IsEpic(Target) then
        AddControlEffect(Target, 2)
    end
end

function remove(Caster, Target)
    RemoveControlEffect(Target, 2)
end