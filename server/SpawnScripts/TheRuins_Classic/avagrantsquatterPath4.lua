--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterPath4.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 09:07:21
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
if not IsInCombat(NPC)then
    choice = MakeRandomInt(1,4)
    if choice ==1 then
    SendMessage(Spawn,"The vagrant squatter pays no attention to you.","white")
    elseif choice ==2 then
    SendMessage(Spawn,"The vagrant squatter listlessly stares in your direction.","white")
    elseif choice ==3 then
    SendMessage(Spawn,"The vagrant squatter's sun-scorched face cares little for your hail.","white")
    elseif choice ==4 then
    SendMessage(Spawn,"The vagrant squatter eyes you and holds out its hands for an offering.","white")
    FaceTarget(NPC,Spawn)
    PlayFlavor(NPC,"","","beg",0,0)
    end
end
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -12.97, -5.12, 39.36, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -12.97, -5.12, 39.36, 2, 0)
	MovementLoopAddLocation(NPC, -10.64, -4.77, 42.53, 2, 0)
	MovementLoopAddLocation(NPC, -5.47, -4.52, 45.03, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -5.47, -4.52, 45.03, 2, 0)
	MovementLoopAddLocation(NPC, -9.51, -4.37, 46.82, 2, 0)
	MovementLoopAddLocation(NPC, -11.32, -4.25, 52.52, 2, 0)
	MovementLoopAddLocation(NPC, -10.34, -4.24, 58.84, 2, 0)
	MovementLoopAddLocation(NPC, -14.1, -4.24, 62.39, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -14.1, -4.24, 62.39, 2, 0)
	MovementLoopAddLocation(NPC, -10.57, -4.24, 60.72, 2, 0)
	MovementLoopAddLocation(NPC, -7.05, -4.27, 62.85, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -7.05, -4.27, 62.85, 2, 0)
	MovementLoopAddLocation(NPC, -9.18, -4.24, 60.09, 2, 0)
	MovementLoopAddLocation(NPC, -7.21, -4.24, 54.81, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -7.21, -4.24, 54.81, 2, 0)
	MovementLoopAddLocation(NPC, -10.6, -4.24, 58.45, 2, 0)
	MovementLoopAddLocation(NPC, -10.29, -4.24, 65.06, 2, 0)
	MovementLoopAddLocation(NPC, -7.15, -4.24, 71.92, 2, 0)
	MovementLoopAddLocation(NPC, -10.82, -4.24, 77.58, 2, 0)
	MovementLoopAddLocation(NPC, -11.02, -4.24, 78.68, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -11.02, -4.24, 78.68, 2, 0)
	MovementLoopAddLocation(NPC, -7.39, -4.24, 76.17, 2, 0)
	MovementLoopAddLocation(NPC, -2.43, -4.3, 74.96, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -2.43, -4.3, 74.96, 2, 0)
	MovementLoopAddLocation(NPC, -5.22, -4.27, 71.72, 2, 0)
	MovementLoopAddLocation(NPC, -5.9, -4.3, 64.96, 2, 0)
	MovementLoopAddLocation(NPC, -11.86, -4.31, 56.87, 2, 0)
	MovementLoopAddLocation(NPC, -11.64, -4.24, 58.54, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -11.64, -4.24, 58.54, 2, 0)
	MovementLoopAddLocation(NPC, -10.98, -4.24, 55.85, 2, 0)
	MovementLoopAddLocation(NPC, -9, -4.26, 50.5, 2, 0)
	MovementLoopAddLocation(NPC, -9.14, -4.43, 44.64, 2, 0)
end