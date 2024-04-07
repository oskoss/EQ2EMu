--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 08:07:43
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
	MovementLoopAddLocation(NPC, -1.21, -4.3, 77.25, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -1.21, -4.3, 77.25, 2, 0)
	MovementLoopAddLocation(NPC, -9.54, -4.24, 84.49, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -9.54, -4.24, 84.49, 2, 0)
	MovementLoopAddLocation(NPC, -6.74, -4.24, 86.42, 2, 0)
	MovementLoopAddLocation(NPC, -6.65, -4.24, 92.9, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -6.65, -4.24, 92.9, 2, 0)
	MovementLoopAddLocation(NPC, -8.21, -4.24, 91.31, 2, 0)
	MovementLoopAddLocation(NPC, -12.78, -4.24, 90.76, 2, 0)
	MovementLoopAddLocation(NPC, -16.66, -4.29, 94.22, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -16.66, -4.29, 94.22, 2, 0)
	MovementLoopAddLocation(NPC, -13.29, -4.24, 95.44, 2, 0)
	MovementLoopAddLocation(NPC, -12.48, -4.24, 100.33, 2, 0)
	MovementLoopAddLocation(NPC, -16.74, -4.39, 104.85, 2, 0)
	MovementLoopAddLocation(NPC, -18.16, -4.38, 105.48, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -18.16, -4.38, 105.48, 2, 0)
	MovementLoopAddLocation(NPC, -14.89, -4.27, 106.24, 2, 0)
	MovementLoopAddLocation(NPC, -10.54, -4.24, 110.51, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -10.54, -4.24, 110.51, 2, 0)
	MovementLoopAddLocation(NPC, -12.59, -4.24, 107.47, 2, 0)
	MovementLoopAddLocation(NPC, -11.82, -4.24, 101.64, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -11.82, -4.24, 101.64, 2, 0)
	MovementLoopAddLocation(NPC, -14.62, -4.24, 98.2, 2, 0)
	MovementLoopAddLocation(NPC, -16.6, -4.19, 91.94, 2, 0)
	MovementLoopAddLocation(NPC, -13.79, -4.24, 86.37, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -13.79, -4.24, 86.37, 2, 0)
	MovementLoopAddLocation(NPC, -10.73, -4.24, 85.89, 2, 0)
	MovementLoopAddLocation(NPC, -7.48, -4.24, 81.86, 2, 0)
	MovementLoopAddLocation(NPC, -8.78, -4.24, 75.2, 2, 0)
	MovementLoopAddLocation(NPC, -12.08, -4.24, 71.23, 2, math.random(10, 15))
	MovementLoopAddLocation(NPC, -12.08, -4.24, 71.23, 2, 0)
	MovementLoopAddLocation(NPC, -7.44, -4.24, 77.73, 2, 0)
end