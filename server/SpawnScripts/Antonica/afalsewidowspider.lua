--[[
    Script Name    : SpawnScripts/Antonica/afalsewidowspider.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.14 11:07:33
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