--[[
    Script Name    : SpawnScripts/BuccaneersRest/aSpicerunneremberhurler.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.02 05:10:48
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end