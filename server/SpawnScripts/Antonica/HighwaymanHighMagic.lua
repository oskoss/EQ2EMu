--[[
    Script Name    : SpawnScripts/Antonica/HighwaymanHighMagic.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.07 09:07:58
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/HighwaymanAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
    human(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end


function respawn(NPC)
	spawn(NPC)
end