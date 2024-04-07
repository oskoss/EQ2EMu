--[[
    Script Name    : Spells/Commoner/Apprehended.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 03:09:00
    Script Purpose : 
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)


--]]

function cast(Caster, Target)
        AddControlEffect(Caster, 1)
    SetInfoStructString(Target, "action_state", "result_enthralling_fetters_ghostly")
end

function remove(Caster, Target)
        RemoveControlEffect(Caster, 1)
    SetInfoStructString(Target, "action_state", "0")
end
