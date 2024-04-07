--[[
    Script Name    : SpawnScripts/Antonica/adefiledsquire.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 10:07:23
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 7, -7, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end
