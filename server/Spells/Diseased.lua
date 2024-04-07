

--[[
    Script Name    : Spells/Diseased.lua
    Script Author  : Dorbin
    Script Date    : 2022.09.15 02:09:43
    Script Purpose : Used on 'a grove deer' in Isle of Refuge
                   : 
--]]

--[[ Info from spell_display_effects (remove from script when done)


--]]

function cast(Caster, Target)
    SetInfoStructString(Caster, "action_state", "disease")
--    SpawnSet(Caster,"visual_state",11395)
end

function remove(Caster, Target, DoTType, MinVal, MaxVal)
    SetInfoStructString(Caster, "action_state", "0")
     SpawnSet(Caster,"action_state",0)
end