--[[
    Script Name    : SpawnScripts/Classic_forest/EarthforgottenguardianSTATIC.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.15 08:10:54
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGolem1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    AddTimer(NPC,4000,"ResetAnimation",1)
end

function respawn(NPC)
	spawn(NPC)
end