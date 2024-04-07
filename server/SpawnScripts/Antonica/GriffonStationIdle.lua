--[[
    Script Name    : SpawnScripts/Antonica/GriffonStationIdle.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.28 12:08:06
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "combat_idle")
end

function respawn(NPC)
	spawn(NPC)
end