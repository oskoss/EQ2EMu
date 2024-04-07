--[[
    Script Name    : SpawnScripts/TheRuins_Classic/asunviper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.23 07:09:22
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