--[[
    Script Name    : SpawnScripts/RylecsTest/KerranMannequin133772042.lua
    Script Author  : Rylec
    Script Date    : 2021.02.10 03:02:07
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetEquippedItemByID(NPC, 0, 83328)
    SpawnSet(NPC, "visual_state", "11420")
    SpawnSet(NPC, "action_state", "1462")
end

function hailed(NPC, Spawn)
    Say(NPC, "1462 2h_sword_ouch_forehand")
end

function respawn(NPC)
    spawn(NPC)
end