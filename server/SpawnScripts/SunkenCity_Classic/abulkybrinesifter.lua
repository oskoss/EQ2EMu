--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/abulkybrinesifter.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.12 04:10:04
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

    local SpawnID = GetSpawnLocationID(NPC)
    if SpawnID < 133787438 or SpawnID > 133787441  then 
        RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    else                                                        --TABLE SPAWNING CRABS
--    SetInfoStructString(NPC, "action_state", "combat_idle")
    AddTimer(NPC,MakeRandomInt(1000,4000),"CombatScream")       --TABLE SPAWNING CRABS ATTACK CRY
    AddTimer(NPC,5000,"CombatCheck")
   end
end

function CombatScream(NPC)
    PlaySound(NPC,"sounds/critters/crab/crab_scream01.wav",GetX(NPC),GetY(NPC),GetZ(NPC))
end

function CombatCheck(NPC)                                       --TABLE SPAWNING CRABS CHECKS FOR COMBAT
    if IsInCombat(NPC)== true then
    AddTimer(NPC,30000,"CombatCheck")
        else
    Despawn(NPC)
    end
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end