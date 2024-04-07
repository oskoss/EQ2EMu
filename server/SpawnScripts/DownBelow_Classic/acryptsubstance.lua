--[[
    Script Name    : SpawnScripts/DownBelow_Classic/acryptsubstance.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.10 06:11:27
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end