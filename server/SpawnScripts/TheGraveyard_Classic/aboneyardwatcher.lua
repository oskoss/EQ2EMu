--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/aboneyardwatcher.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 08:08:03
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGolem1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
    SendMessage(NPC,"The watcher's cold and unwavering stare leaves you uneasy.","white")
end

function respawn(NPC)
	spawn(NPC)
end