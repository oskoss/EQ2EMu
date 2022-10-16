--[[
    Script Name    : SpawnScripts/Blackburrow/aSabertoothsentry.lua
    Script Author  : Cynnar
    Script Date    : 2020.12.06 05:12:44
    Script Purpose : 
                   : 
--]]
    dofile("SpawnScripts/Generic/MonsterCallouts/BaseGnoll1.lua")

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 15
    local level2 = 16
    local difficulty1 = 9
    local hp1 = 3150
    local power1 = 1350
    local difficulty2 = 9
    local hp2 = 3485
    local power2 = 1350
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end

end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

