--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothguard.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 07:09:23
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin2.lua")
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