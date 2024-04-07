--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/acorrupteddryadRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.07 07:01:40
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Dryad_Corrupt1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 4, -4, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end