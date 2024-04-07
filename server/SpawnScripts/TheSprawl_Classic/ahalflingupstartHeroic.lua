--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/ahalflingupstartHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.23 05:11:09
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    halfling(NPC)
    SpawnSet(NPC, "heroic", 1)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end