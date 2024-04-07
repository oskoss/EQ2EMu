--[[
    Script Name    : SpawnScripts/Commonlands/DrammerQuickblade.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.09 09:03:05
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    darkelf(NPC)
    DervishLeather(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end