--[[
    Script Name    : SpawnScripts/DownBelow_Classic/arabidshriller.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.14 06:01:27
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

