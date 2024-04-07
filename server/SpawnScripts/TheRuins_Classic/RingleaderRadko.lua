--[[
    Script Name    : SpawnScripts/TheRuins_Classic/RingleaderRadko.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.01 10:01:20
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