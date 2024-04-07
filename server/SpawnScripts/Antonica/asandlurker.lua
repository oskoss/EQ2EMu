--[[
    Script Name    : SpawnScripts/Antonica/asandlurker.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.11 11:07:54
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
end


function respawn(NPC)
	spawn(NPC)
end