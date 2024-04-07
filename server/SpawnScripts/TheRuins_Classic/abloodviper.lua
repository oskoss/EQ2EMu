--[[
    Script Name    : SpawnScripts/TheRuins_Classic/abloodviper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.06 04:07:51
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