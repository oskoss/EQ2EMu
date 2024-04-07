--[[
    Script Name    : SpawnScripts/Antonica/acoldwindpike.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 12:07:34
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    ChooseClass(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function ChooseClass(NPC)
    SetClass = MakeRandomInt(1,2) 
    if SetClass == 1 then
        SpawnSet(NPC, "class", 1)
        SetSpellList(NPC, 291)
    elseif SetClass == 2 then
        SpawnSet(NPC, "class", 31)
        SetSpellList(NPC, 295)
    end
end