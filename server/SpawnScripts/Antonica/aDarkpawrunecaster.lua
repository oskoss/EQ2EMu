--[[
    Script Name    : SpawnScripts/Antonica/aDarkpawrunecaster.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.14 11:07:05
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdlePriest(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end