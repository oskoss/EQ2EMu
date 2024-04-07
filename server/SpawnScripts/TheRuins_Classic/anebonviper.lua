--[[
    Script Name    : SpawnScripts/TheRuins_Classic/anebonviper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.06.27 02:06:22
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end