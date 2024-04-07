--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/anetherotchanter.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.02 04:12:04
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC, Spawn)
    IdleAlert(NPC)
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