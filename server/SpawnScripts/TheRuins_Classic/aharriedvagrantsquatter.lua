--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aharriedvagrantsquatter.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.04 08:07:14
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetInfoStructString(NPC, "action_state", "dance")
end

function aggro(NPC,Spawn)
    SpawnSet(NPC, "visual_state", 0)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end


