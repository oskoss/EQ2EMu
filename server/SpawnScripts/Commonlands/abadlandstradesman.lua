--[[
    Script Name    : SpawnScripts/Commonlands/abadlandstradesman.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.14 10:02:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    TradesmanLow(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end