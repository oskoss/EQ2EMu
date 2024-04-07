--[[
    Script Name    : SpawnScripts/Antonica/abluewidowspider.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.14 10:07:00
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