--[[
    Script Name    : SpawnScripts/Antonica/agrimecoveredsavageRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.08.25 08:08:01
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/HighwaymanAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 20, -20, 2, 8, 15)

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