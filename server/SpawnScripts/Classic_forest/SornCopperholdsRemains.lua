--[[
    Script Name    : SpawnScripts/Classic_forest/SornCopperholdsRemains.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.18 04:10:29
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton1.lua")

function spawn(NPC)
    SetSpawnAnimation(NPC, 13016)

end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end