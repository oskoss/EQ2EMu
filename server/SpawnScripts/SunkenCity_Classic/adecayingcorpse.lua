--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/adecayingcorpse.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.04 07:11:03
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "dead")
end

function respawn(NPC)
	spawn(NPC)
end