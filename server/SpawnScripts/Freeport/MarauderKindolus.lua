--[[
    Script Name    : SpawnScripts/Freeport/MarauderKindolus.lua
    Script Author  : Premierio015
    Script Date    : 2020.07.12 04:07:30
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "", "What filth is this before me?  I've a schedule to keep and no time to associate with common trash.", "", 1689589577, 4560189, Spawn)
end

function respawn(NPC)

end

