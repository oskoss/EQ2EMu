--[[
    Script Name    : SpawnScripts/Freeport/Slinko.lua
    Script Author  : Premierio015
    Script Date    : 2020.07.19 11:07:42
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "", "Are you lost?", "ponder", 1689589577, 4560189, Spawn)
end

function respawn(NPC)

end

