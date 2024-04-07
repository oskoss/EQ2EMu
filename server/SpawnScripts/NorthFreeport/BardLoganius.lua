--[[
    Script Name    : SpawnScripts/NorthFreeport/BardLoganius.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.05 03:10:03
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
   SetInfoStructString(NPC, "action_state", "cast_bard_stringed_persist")
end


function respawn(NPC)
	spawn(NPC)
end