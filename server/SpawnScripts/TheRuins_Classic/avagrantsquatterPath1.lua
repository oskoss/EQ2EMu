--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.06 04:07:57
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    waypoints(NPC)
    human(NPC)
end

function hailed(NPC, Spawn)
if not IsInCombat(NPC)then
    choice = MakeRandomInt(1,5)
    if choice ==1 then
    SendMessage(Spawn,"The vagrant squatter pays no attention to you.","white")
    elseif choice ==2 then
    SendMessage(Spawn,"The vagrant squatter listlessly stares in your direction.","white")
    elseif choice ==3 then
    SendMessage(Spawn,"The vagrant squatter's sun-scorched face cares little for your hail.","white")
    elseif choice ==4 then
    SendMessage(Spawn,"The vagrant squatter flails in your direction!","white")
    Attack(NPC,Spawn)
    elseif choice ==5 then
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
	MovementLoopAddLocation(NPC, -148.8, 2.26, 129.94, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -148.8, 2.26, 129.94, 2, 0)
	MovementLoopAddLocation(NPC, -137.81, 2.26, 129.73, 2, 0)
	MovementLoopAddLocation(NPC, -135.95, 2.26, 131.91, 2, 0)
	MovementLoopAddLocation(NPC, -130.3, 2.26, 132.87, 2, 0)
	MovementLoopAddLocation(NPC, -119.88, 2.26, 129.62, 2, 0)
	MovementLoopAddLocation(NPC, -113.13, 2.27, 129.61, 2,  math.random(10,15))
	MovementLoopAddLocation(NPC, -113.13, 2.27, 129.61, 2, 0)
	MovementLoopAddLocation(NPC, -118.35, 2.26, 129.32, 2, 0)
	MovementLoopAddLocation(NPC, -137.92, 2.26, 138.17, 2, 0)
	MovementLoopAddLocation(NPC, -146.45, 2.26, 140.55, 2, 0)
	MovementLoopAddLocation(NPC, -149.15, 2.26, 144.27, 2,  math.random(10,15))
	MovementLoopAddLocation(NPC, -149.15, 2.26, 144.27, 2, 0)
	MovementLoopAddLocation(NPC, -147.49, 2.26, 141.58, 2, 0)
	MovementLoopAddLocation(NPC, -131.03, 2.26, 128.79, 2, 0)
	MovementLoopAddLocation(NPC, -122.93, 2.13, 125.7, 2, 0)
	MovementLoopAddLocation(NPC, -121.39, 2.28, 118.93, 2, 0)
	MovementLoopAddLocation(NPC, -121.96, 2.21, 115.85, 2,  math.random(10,15))
	MovementLoopAddLocation(NPC, -121.96, 2.21, 115.85, 2, 0)
	MovementLoopAddLocation(NPC, -122.39, 2.26, 122.72, 2, 0)
	MovementLoopAddLocation(NPC, -126.3, 2.15, 129.14, 2, 0)
	MovementLoopAddLocation(NPC, -132.29, 2.26, 130.95, 2, 0)
	MovementLoopAddLocation(NPC, -139.95, 2.26, 129.52, 2, 0)
end
