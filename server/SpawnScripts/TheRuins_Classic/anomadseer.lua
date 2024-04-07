--[[
    Script Name    : SpawnScripts/TheRuins_Classic/anomadseer.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.09 07:07:16
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    IdlePriest(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end
