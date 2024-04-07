--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/acrumblingskeletonHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.10 04:08:22
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)

    SpawnSet(NPC, "heroic", 1)
    SetSpawnAnimation(NPC, 13016)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end