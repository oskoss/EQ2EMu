--[[
    Script Name    : SpawnScripts/SinkingSands/adervishbeachcomber.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 06:12:59
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

