--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aBlackMagiinsurgent.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.08 08:11:54
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/BlackMagi.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ratonga(NPC, Spawn)
    IdleSneaky(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end