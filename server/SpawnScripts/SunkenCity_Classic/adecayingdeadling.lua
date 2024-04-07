--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/adecayingdeadling.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.21 03:10:50
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    SetSpawnAnimation(NPC, 13016)
    
    if GetClass(NPC) ==31 then
        SetSeeHide(NPC,1)
    end
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end