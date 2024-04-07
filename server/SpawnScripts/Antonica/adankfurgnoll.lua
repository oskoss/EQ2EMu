--[[
    Script Name    : SpawnScripts/Antonica/adankfurgnoll.lua
    Script Author  : Dorbin
    Script Date    : 2022.07.13 05:07:20
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/DarkpawGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseClass(NPC)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function ChooseClass(NPC)
    SetClass =  MakeRandomInt(1,2)
    if  SetClass == 1 then
        SpawnSet(NPC, "class", 1)
        SetSpellList(NPC, 291)
    elseif SetClass ==2 then
        SpawnSet(NPC, "class", 12)
        SetSpellList(NPC, 329)
    end
end

function waypoints(NPC)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
    end
end