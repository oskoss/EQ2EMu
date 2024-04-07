--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anundeadbattlepriestValeron.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.17 03:08:16
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SpawnSet(NPC, "heroic", 1)
    SetSpawnAnimation(NPC, 13016)
    SpawnSet(NPC,"model_type",140) 

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end