--[[
    Script Name    : Spells/Scout/Predator/Ranger/Ensnare.lua
    Script Author  : Jabantiz
    Script Date    : 2014.03.10 06:03:27
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, Mit, Snare)
    -- Decreases Mitigation of target vs elemental damage by 197
    AddSpellBonus(Target, 201, Mit)

    -- Applies Snare.  Lasts for 24.0 seconds.
    --     Slows target by 28.3%
    --     5% chance to dispel when target receives hostile action
    --     5% chance to dispel when target takes damage
    Slow = 1.0 - Snare
    SetSpellSnareValue(Slow) 
    AddControlEffect(11)
end

function remove(Caster, Target)
    RemoveControlEffect(11)
end