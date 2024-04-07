--[[
    Script Name    : SpawnScripts/Antonica/aColdwindoctopus.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 12:07:23
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 20, -20, 2, 8, 15)
    ChooseClass(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function ChooseClass(NPC)
    SetClass = MakeRandomInt(1,3)
    if SetClass == 1 then
        SpawnSet(NPC, "class", 28)
        SetSpellList(NPC, 454)
        CastSpell(NPC, 280025, 5)
    elseif SetClass == 2 then
        SpawnSet(NPC, "class", 18)
        SetSpellList(NPC, 325)
    elseif SetClass == 3 then
        SpawnSet(NPC, "class", 2)
        SetSpellList(NPC, 451)
    end
end