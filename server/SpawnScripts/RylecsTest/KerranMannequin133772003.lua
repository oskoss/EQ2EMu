--[[
    Script Name    : SpawnScripts/RylecsTest/KerranMannequin133772003.lua
    Script Author  : Rylec
    Script Date    : 2021.01.30 07:01:25
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetEquippedItemByID(NPC, 0, 83850)
    SpawnSet(NPC, "visual_state", "11420")
    SpawnSet(NPC, "action_state", "10706")
end

function hailed(NPC, Spawn)
    Say(NPC, "10706 1h_sword_attack_recoil02")
end

function respawn(NPC)
    spawn(NPC)
end