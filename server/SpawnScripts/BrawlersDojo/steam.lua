--[[
    Script Name    : SpawnScripts/BrawlersDojo/steam.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.18 12:09:41
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SpawnSet(NPC, "visual_state",6867)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end