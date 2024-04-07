--[[
    Script Name    : SpawnScripts/DownBelow_Classic/aBloodsabermeddler.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.13 03:09:11
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BloodSabers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ratonga(NPC)
    --if not HasLanguage(Spawn,26) then
        --Garbled(NPC,Spawn)
    --end
end

function respawn(NPC)
	spawn(NPC)
end