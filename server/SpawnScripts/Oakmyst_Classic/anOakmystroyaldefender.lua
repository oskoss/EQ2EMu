--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/anOakmystroyaldefender.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 04:10:16
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end