--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothlookout.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.07 09:09:10
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin1.lua")
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