--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipehooligan.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.08 08:11:01
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile ("SpawnScripts/Generic/MonsterCallouts/Guttersnipe.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    IdleAggressive(NPC)
end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end
