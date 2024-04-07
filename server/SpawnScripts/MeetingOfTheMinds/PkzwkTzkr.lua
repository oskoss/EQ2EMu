--[[
    Script Name    : SpawnScripts/MeetingOfTheMinds/PkzwkTzkr.lua
    Script Author  : Neveruary
    Script Date    : 2021.10.05 01:10:57
    Script Purpose : Governs behavior of Pkzwk Tzkr in Meeting of the Minds.
    Boss Mechanics : Spawns with 10 strange guardians linked.
--]]

spells = {40173, 40155, 40183, 40083}

function spawn(NPC)
end
 
function attacked(NPC, Spawn)
    Say(NPC, "Reinforcement forces: notified.")
end

function hailed(NPC, Spawn)
end

function death(NPC, Spawn)
end
 
function respawn(NPC)
spawn(NPC)
end