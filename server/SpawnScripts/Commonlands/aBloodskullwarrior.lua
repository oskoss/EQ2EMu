--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullwarrior.lua
    Script Author  : premierio015, gloat, LordPazuzu
    Script Date    : 2019.01.31 01:01:40
    Script Purpose : 
                   : 
--]]

local  FinishingtheNegotiations = 425
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    AddTimer(NPC, 1500, "movement")
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    else
        IdleAggressive(NPC)
    end
end

function death(NPC, Spawn)
if HasQuest(Spawn,  FinishingtheNegotiations) then
AddStepProgress(Spawn, FinishingtheNegotiations, 4, 1)  
end
  end


function respawn(NPC)
         spawn(NPC)
end

