--[[
	Script Name	: SpawnScripts/ElddarGrove/SolomenStormwatch.lua
	Script Purpose	: Solomen Stormwatch 
	Script Author	: John Adams
	Script Date	: 2008.09.28
	Script Notes	: Updated dialogue 5.1.2022 Dorbin (Should be race check dialogue, but missing woodelf male)
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
	waypoints(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
GenericEcologyHail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
    GenericEcologyCallout(NPC, Spawn, faction)
    end

function respawn(NPC)
	spawn(NPC)
end

function LeaveRange(NPC, Spawn)
end


--[[function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,3)

	if choice == 1 then
		PlayFlavor(NPC, "", "I too long for my home in Faydark.  Someday I am sure Tunare will answer us.", "", 0, 0, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "", "The city is not the most beautiful place in Norrath, but it is at least familiar.", "", 0, 0, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "", "To be among the highest leaves and branches of a tree is to feel free.", "", 0, 0, Spawn, 0)
	end
end]]--

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 777.54, -21.87, -343.22, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, 772.62, -18.87, -330.06, 2, 0)
	MovementLoopAddLocation(NPC, 740.87, -16.36, -299.49, 2, 0)
	MovementLoopAddLocation(NPC, 732.93, -17.04, -292.62, 2, 0)
	MovementLoopAddLocation(NPC, 722.48, -17.15, -283.36, 2, 0)
	MovementLoopAddLocation(NPC, 652.64, -18.32, -241.32, 2, 0)
	MovementLoopAddLocation(NPC, 651.35, -21.59, -292.71, 2, 0)
	MovementLoopAddLocation(NPC, 642.38, -13.12, -368.42, 2, 0)
	MovementLoopAddLocation(NPC, 650.67, -11.5, -392.98, 2, 0)
	MovementLoopAddLocation(NPC, 639.35, -12.48, -397.18, 2, 0)	
	MovementLoopAddLocation(NPC, 618.26, -15.59, -401.83, 2, 0)
	MovementLoopAddLocation(NPC, 603.65, -17.89, -390.81, 2,1)
    MovementLoopAddLocation(NPC, 603.65, -17.89, -390.81, 2, math.random(8,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 603.65, -17.89, -390.81, 2,0)
	MovementLoopAddLocation(NPC, 618.26, -15.59, -401.83, 2, 0)
	MovementLoopAddLocation(NPC, 639.35, -12.48, -397.18, 2, 0)
	MovementLoopAddLocation(NPC, 650.67, -11.5, -392.98, 2, 0)
	MovementLoopAddLocation(NPC, 642.38, -13.12, -368.42, 2, 0)
	MovementLoopAddLocation(NPC, 651.35, -21.59, -292.71, 2, 0)
	MovementLoopAddLocation(NPC, 652.64, -18.32, -241.32, 2, 0)
	MovementLoopAddLocation(NPC, 722.48, -17.15, -283.36, 2, 0)
	MovementLoopAddLocation(NPC, 732.93, -17.04, -292.62, 2, 0)
	MovementLoopAddLocation(NPC, 740.87, -16.36, -299.49, 2, 0)
	MovementLoopAddLocation(NPC, 772.62, -18.87, -330.06, 2, 0)
	MovementLoopAddLocation(NPC, 777.54, -21.87, -343.22, 2, math.random(0,20))
end
