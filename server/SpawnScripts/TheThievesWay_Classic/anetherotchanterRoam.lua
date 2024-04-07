--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/anetherotchanterRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.11 04:12:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC, Spawn)
    local race = MakeRandomInt(1,2)
    if race == 1 then
        ratonga(NPC)
    else
        erudite(NPC)
 	    SetEquipment(NPC, 6, 472 , 255, 255, 255, 255, 255, 255) --Gloves
	    SetEquipment(NPC, 8, 470 , 255, 255, 255, 255, 255, 255) --Boots       
    end
    
end