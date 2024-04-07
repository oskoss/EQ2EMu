--[[
    Script Name    : SpawnScripts/Commonlands/anelephant.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 01:01:04
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 1500, "movement")

end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    end
end
function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

