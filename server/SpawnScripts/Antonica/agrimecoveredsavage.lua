--[[
    Script Name    : SpawnScripts/Antonica/agrimecoveredsavage.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 10:07:53
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

function hailed(NPC, Spawn)
    if IsInCombat(NPC)== false then
	FaceTarget(NPC, Spawn)
	Attack(NPC,Spawn)
	end
end

function respawn(NPC)
	spawn(NPC)
end