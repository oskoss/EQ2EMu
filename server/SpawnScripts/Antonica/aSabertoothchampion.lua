--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothchampion.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 04:09:09
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseClass(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function ChooseClass(NPC)
    SetClass = MakeRandomInt(1,2)
    if SetClass == 1 then
        SpawnSet(NPC, "class", 2)
        SetSpellList(NPC, 451)
    elseif SetClass == 2 then
        SpawnSet(NPC, "class", 32)
        SetSpellList(NPC, 469)
    end
end