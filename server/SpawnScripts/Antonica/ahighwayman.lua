--[[
    Script Name    : SpawnScripts/Antonica/ahighwayman.lua
    Script Author  : LordPazuzu
    Script Date    : 3/21/2024
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/HighwaymanAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetRaceClass(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function SetRaceClass(NPC, Spawn)
    SetRace = MakeRandomInt(1,4)
    if SetRace == 1 then
        SpawnSet(NPC, "class", 2)
        SetSpellList(NPC, 451)
        DervishChain(NPC)
        human(NPC)
        IdleAggressive(NPC)
    elseif SetRace == 2 then
        SpawnSet(NPC, "class", 28)
        SetSpellList(NPC, 454)
        CastSpell(NPC, 280025, 5)
        DervishRobe(NPC)
        human(NPC)
        IdleAlert(NPC)
    elseif SetRace == 3 then
        SpawnSet(NPC, "class", 32)
        SetSpellList(NPC, 469)
        DervishLeather(NPC)
        halfelf(NPC)
        IdleAlert(NPC)
    elseif SetRace == 4 then
        SpawnSet(NPC, "class", 2)
        SetSpellList(NPC, 451)
        DervishThug(NPC)
        barbarian(NPC)
        IdleAggressive(NPC)
    end
end

