--[[
    Script Name    : SpawnScripts/SinkingSands/TharaBashirah.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 08:12:01
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end