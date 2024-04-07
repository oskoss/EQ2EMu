--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterFarmer.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 03:07:19
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    SetInfoStructString(NPC, "action_state", "mining_digging")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end
