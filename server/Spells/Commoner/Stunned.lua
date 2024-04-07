--[[
    Script Name    : Spells/Commoner/Stunned.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.16 12:09:36
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)


--]]

function cast(Caster, Target)
        AddControlEffect(Caster, 5)
end

function remove(Caster, Target)
        RemoveControlEffect(Caster, 5)
end


