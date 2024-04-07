--[[
    Script Name    : SpawnScripts/Peatbog_Classic/amudhopper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.27 05:12:52
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 4, -4, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end