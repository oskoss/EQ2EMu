--[[
    Script Name    : SpawnScripts/Antonica/ahazekodiakSTATIC.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.08.27 10:08:30
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