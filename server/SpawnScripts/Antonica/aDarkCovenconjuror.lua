--[[
    Script Name    : SpawnScripts/Antonica/aDarkCovenconjuror.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.30 07:01:41
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Dark_Coven.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAlert(NPC)
    human(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end