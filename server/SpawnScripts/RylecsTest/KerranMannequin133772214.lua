--[[
    Script Name    : SpawnScripts/RylecsTest/KerranMannequin133772214.lua
    Script Author  : Rylec
    Script Date    : 2021.01.30 07:01:25
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SpawnSet(NPC, "action_state", "12061")
end

function hailed(NPC, Spawn)
    Say(NPC, "12061 pugilist_ouch_backhand")
end

function respawn(NPC)
    spawn(NPC)
end