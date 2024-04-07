--[[
    Script Name    : SpawnScripts/Commonlands/afallencrusader.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 02:01:05
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
local BrokenEquipment = 415
function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

function death(NPC, Spawn)
if GetQuestStep(Spawn, BrokenEquipment) > 1 then
 AddLootItem(NPC, 15095, 1)
else
RemoveLootItem(NPC, 15095)    
end  
end
