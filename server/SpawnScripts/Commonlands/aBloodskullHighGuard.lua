--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullHighGuard.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.22 12:01:44
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcChainCommon(NPC)
    IdleAlert(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end