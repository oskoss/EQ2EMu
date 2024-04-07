--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullshaman.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 05:01:01
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    AddTimer(NPC, 1500, "movement")

end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    else
        IdlePriest(NPC)
    end
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end