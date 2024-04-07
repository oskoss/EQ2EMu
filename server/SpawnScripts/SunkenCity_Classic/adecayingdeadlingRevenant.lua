--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/adecayingdeadlingRevenant.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.24 02:10:49
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC, 1)
    SetSpawnAnimation(NPC, 13016)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end