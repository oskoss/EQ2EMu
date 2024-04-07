--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothguardAngry.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 08:09:27
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SpawnSet(NPC, "visual_state", 12030)
end

function aggro(NPC,Spawn)
    SpawnSet(NPC, "visual_state", 0)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end


