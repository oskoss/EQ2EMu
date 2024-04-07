--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 08:07:20
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
	MovementLoopAddLocation(NPC, -16.05, -4.26, 123.16, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -16.05, -4.26, 123.16, 2, 0)
	MovementLoopAddLocation(NPC, -14.44, -4.3, 119.3, 2, 0)
	MovementLoopAddLocation(NPC, -16.42, -4.24, 110.14, 2, 0)
	MovementLoopAddLocation(NPC, -10.43, -4.24, 99.85, 2, 0)
	MovementLoopAddLocation(NPC, -8.17, -4.24, 90.56, 2, 0)
	MovementLoopAddLocation(NPC, -14.02, -4.24, 85.31, 2, 0)
	MovementLoopAddLocation(NPC, -26.05, -3.37, 82.66, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -26.05, -3.37, 82.66, 2, 0)
	MovementLoopAddLocation(NPC, -22.25, -3.97, 80.81, 2, 0)
	MovementLoopAddLocation(NPC, -15.85, -4.24, 85.74, 2, 0)
	MovementLoopAddLocation(NPC, -9.71, -4.24, 87.83, 2, 0)
	MovementLoopAddLocation(NPC, -5.69, -4.24, 83.57, 2, 0)
	MovementLoopAddLocation(NPC, -5.61, -4.24, 76.26, 2, 0)
	MovementLoopAddLocation(NPC, -13.39, -4.24, 66.85, 2, 0)
	MovementLoopAddLocation(NPC, -8.3, -4.24, 58.66, 2, 0)
	MovementLoopAddLocation(NPC, -10.42, -4.25, 50.82, 2, 0)
	MovementLoopAddLocation(NPC, -9.73, -4.54, 43.37, 2, 0)
	MovementLoopAddLocation(NPC, -12.7, -5.12, 38.06, 2, 0)
	MovementLoopAddLocation(NPC, -18.66, -5.14, 29.54, 2, 0)
	MovementLoopAddLocation(NPC, -19.28, -5.05, 20.59, 2, 0)
	MovementLoopAddLocation(NPC, -16.91, -4.93, 15.49, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -16.91, -4.93, 15.49, 2, 0)
	MovementLoopAddLocation(NPC, -19.15, -5.03, 20.43, 2, 0)
	MovementLoopAddLocation(NPC, -17.48, -5.14, 30.31, 2, 0)
	MovementLoopAddLocation(NPC, -10.89, -5.1, 38.67, 2, 0)
	MovementLoopAddLocation(NPC, -10.44, -4.3, 49.42, 2, 0)
	MovementLoopAddLocation(NPC, -8.36, -4.24, 56.19, 2, 0)
	MovementLoopAddLocation(NPC, -12.12, -4.24, 63.54, 2, 0)
	MovementLoopAddLocation(NPC, -9.31, -4.24, 72.51, 2, 0)
	MovementLoopAddLocation(NPC, -15.84, -4.24, 80.73, 2, 0)
	MovementLoopAddLocation(NPC, -16.51, -4.24, 83.9, 2, 0)
	MovementLoopAddLocation(NPC, -9.57, -4.24, 92.49, 2, 0)
	MovementLoopAddLocation(NPC, -7.55, -4.24, 98.14, 2, 0)
	MovementLoopAddLocation(NPC, -14.31, -4.24, 106.03, 2, 0)
	MovementLoopAddLocation(NPC, -12.87, -4.24, 112.33, 2, 0)
end
