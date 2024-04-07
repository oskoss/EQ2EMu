--[[
    Script Name    : SpawnScripts/Antonica/aCaltorsisprotector.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 03:09:47
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