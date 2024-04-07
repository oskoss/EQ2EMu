--[[
    Script Name    : SpawnScripts/Antonica/ahazekodiakcub.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.14 03:05:59
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    if GetSpawnLocationID(NPC)~=194535 then
        RandomMovement(NPC, Spawn, 6, -6, 2, 8, 15)
    end
end

function respawn(NPC)
	spawn(NPC)
end