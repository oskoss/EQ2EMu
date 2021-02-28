--[[
    Script Name    : SpawnScripts/RylecsTest/KerranMannequin133771983.lua
    Script Author  : Rylec
    Script Date    : 2021.01.30 07:01:25
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetEquippedItemByID(NPC, 0, 83850)
    SpawnSet(NPC, "visual_state", "11420")
    SpawnSet(NPC, "action_state", "10710")
end

function hailed(NPC, Spawn)
    Say(NPC, "10710 1h_sword_exit")
end

function respawn(NPC)
    spawn(NPC)
end