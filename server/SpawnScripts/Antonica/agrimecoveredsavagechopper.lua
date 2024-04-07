--[[
    Script Name    : SpawnScripts/Antonica/agrimecoveredsavagechopper.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.16 05:05:59
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/HighwaymanAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

    local RaceCheck = MakeRandomInt(1,2)
    if RaceCheck ==1 then
        human(NPC)
    else
        barbarian(NPC)
    end
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    if IsInCombat(NPC)== false then
	FaceTarget(NPC, Spawn)
	Attack(NPC,Spawn)
	end
end