--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullwarriorHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.18 02:01:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end