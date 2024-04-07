--[[
    Script Name    : SpawnScripts/classic_caves/apaleadder.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.02 04:09:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 6000, "ChooseMovement")
end

function ChooseMovement(NPC)
    if GetSpawnLocationID(NPC)== 133776947 or GetSpawnLocationID(NPC)== 133776948 or  GetSpawnLocationID(NPC)== 133776949 then
        RandomMovement(NPC, Spawn, 7, -7, 2, 20, 45)
    end
end

