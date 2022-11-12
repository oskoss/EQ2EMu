--[[
	Script Name		:	lystan.lua
	Script Purpose	:	Waypoint Path for lystan.lua
	Script Author	:	Devn00b
	Script Date		:	08/04/2020 01:42:54 PM
	Script Notes	:	Dialogue updated 5.1.2022 Dorbin
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")
dofile("SpawnScripts/Generic/ExpelNonCitizen.lua")

function spawn(NPC)
	AddTimer(NPC, 1900, "follow_Oakheart")
SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
end

function hailed(NPC, Spawn)
FaceTarget(NPC, Spawn)
Attention(NPC,Spawn)
GenericEcologyHail(NPC, Spawn, faction)
end

function InRange(NPC, Spawn)
    NonCitizen(NPC,Spawn)    
end

function respawn(NPC)
	spawn(NPC)
end

function Attention(NPC,Spawn)
    local Oak = GetSpawn(NPC,2070056)    
	if Oak ~=nil then
    FaceTarget(Oak,Spawn)
	PlayFlavor(Oak, "", "", "", 0, 0, Spawn)
    end	
local Edwar = GetSpawn(NPC,2070025)    
	if Edwar ~=nil then
    FaceTarget(Edwar,Spawn)
 	PlayFlavor(Edwar, "", "", "", 0, 0, Spawn)
    end	    
end



function follow_Oakheart(NPC)
	local zone = GetZone(NPC)
	local Oakheart_location = GetSpawnByLocationID(zone, 413212)
	local sli = GetSpawnLocationID(NPC)
    local leaderX = GetX(Oakheart_location)
    local leaderY = GetY(Oakheart_location)
    local leaderZ = GetZ(Oakheart_location)
    local speed = 2
       -- Say(NPC, "Leader location is: " .. GetX(guard_A_placement) .. ", " .. GetY(guard_A_placement) .. ", " .. GetZ(guard_A_placement))
    if  Oakheart_location ~=nil then   
    if sli == 413162 then --Ly`stan
		if GetDistance(NPC, Oakheart_location) >= 8 then
			speed = 5
			MoveToLocation(NPC, 1+ leaderX , leaderY, leaderZ, speed)
		else
			speed = 2
			MoveToLocation(NPC, 1+ leaderX , leaderY, leaderZ, speed)
		end 
	elseif sli == 413011 then --Edward
		if GetDistance(NPC, Oakheart_location) >= 8 then
			-- Say(NPC, "Leader location is: " .. GetX(guard_A_placement) .. "")
			-- Say(NPC, "My location is: " .. GetX(NPC) .. "")
			speed = 5
			MoveToLocation(NPC, leaderX, leaderY, 2+ leaderZ, speed)
		else
			speed = 2
			MoveToLocation(NPC, leaderX, leaderY, 2+ leaderZ, speed)
		end 
        end
    end
        speed = 2
	AddTimer(NPC, 2000, "follow_Oakheart")	
end

--[[OAKHEART PATROL
function waypoints(NPC)
	MovementLoopAddLocation(NPC, 651.62, -18.52, -216.74, 2, 0)
	MovementLoopAddLocation(NPC, 651.2, -19.11, -228.47, 2, 0)
	MovementLoopAddLocation(NPC, 650.96, -18.56, -239.21, 2, 0)
	MovementLoopAddLocation(NPC, 649.3, -18.55, -257.68, 2, 0)
	MovementLoopAddLocation(NPC, 648.3, -18.78, -260.81, 2, 0)
	MovementLoopAddLocation(NPC, 650.31, -19.39, -271.97, 2, 0)
	MovementLoopAddLocation(NPC, 655.37, -19.5, -274.13, 2, 0)
	MovementLoopAddLocation(NPC, 661.86, -19.5, -274.01, 2, 0)
	MovementLoopAddLocation(NPC, 672.65, -19.87, -275.45, 2, 0)
	MovementLoopAddLocation(NPC, 683.61, -19.62, -278.04, 2, 0)
	MovementLoopAddLocation(NPC, 687.33, -19.6, -283.48, 2, 0)
	MovementLoopAddLocation(NPC, 690.65, -19.51, -291.91, 2, 0)
	MovementLoopAddLocation(NPC, 694.67, -18.99, -300.76, 2, 0)
	MovementLoopAddLocation(NPC, 702.75, -17.8, -298.95, 2, 0)
	MovementLoopAddLocation(NPC, 701.84, -17.91, -293.68, 2, 0)
	MovementLoopAddLocation(NPC, 699.73, -18.27, -292.11, 2, 0)
	MovementLoopAddLocation(NPC, 691.79, -19.21, -281.48, 2, 0)
	MovementLoopAddLocation(NPC, 687.51, -19.05, -276.04, 2, 0)
	MovementLoopAddLocation(NPC, 663.58, -19.38, -272.65, 2, 0)
	MovementLoopAddLocation(NPC, 653.35, -19.58, -274.32, 2, 0)
	MovementLoopAddLocation(NPC, 650.97, -20.63, -283.98, 2, 0)
	MovementLoopAddLocation(NPC, 650.24, -21.45, -307.54, 2, 0)
	MovementLoopAddLocation(NPC, 647.76, -21, -310.35, 2, 0)
	MovementLoopAddLocation(NPC, 642.38, -20.44, -311.78, 2, 0)
	MovementLoopAddLocation(NPC, 607.11, -20.67, -315.08, 2, 0)
	MovementLoopAddLocation(NPC, 589.36, -21.32, -313.55, 2, 0)
	MovementLoopAddLocation(NPC, 564.69, -21.93, -312.43, 2, 0)
	MovementLoopAddLocation(NPC, 554.11, -21.57, -310.27, 2, 0)
	MovementLoopAddLocation(NPC, 545.42, -21.12, -304.81, 2, 0)
	MovementLoopAddLocation(NPC, 530.72, -20.81, -299.34, 2, 0)
	MovementLoopAddLocation(NPC, 526.76, -20.9, -303.83, 2, 0)
	MovementLoopAddLocation(NPC, 528.67, -21, -313.45, 2, 0)
	MovementLoopAddLocation(NPC, 531.91, -21.04, -324.61, 2, 0)
	MovementLoopAddLocation(NPC, 544.36, -21.2, -324.18, 2, 0)
	MovementLoopAddLocation(NPC, 553.28, -21.6, -312.78, 2, 0)
	MovementLoopAddLocation(NPC, 610.56, -20.58, -315.37, 2, 0)
	MovementLoopAddLocation(NPC, 634.13, -20.18, -311.07, 2, 0)
	MovementLoopAddLocation(NPC, 644.15, -20.61, -310.84, 2, 0)
	MovementLoopAddLocation(NPC, 649.75, -21.7, -303.78, 2, 0)
	MovementLoopAddLocation(NPC, 650.54, -22.04, -300.86, 2, 0)
	MovementLoopAddLocation(NPC, 650.59, -20.8, -285.56, 2, 0)
	MovementLoopAddLocation(NPC, 649.71, -19.99, -277.58, 2, 0)
	MovementLoopAddLocation(NPC, 641.19, -19.1, -266.37, 2, 0)
	MovementLoopAddLocation(NPC, 642.42, -18.92, -260.07, 2, 0)
	MovementLoopAddLocation(NPC, 645.8, -18.58, -251.33, 2, 0)
	MovementLoopAddLocation(NPC, 647.23, -18.75, -236.16, 2, 0)
	MovementLoopAddLocation(NPC, 649.26, -18.76, -217.19, 2, 0)
	MovementLoopAddLocation(NPC, 648.11, -18.31, -214.19, 2, 0)
	MovementLoopAddLocation(NPC, 650.17, -18.2, -211.09, 2, 0)
	MovementLoopAddLocation(NPC, 652.65, -18.09, -211.48, 2, 0)
end
]]--


--[[OLD DEVNOOB PATROL
function waypoints(NPC)
	MovementLoopAddLocation(NPC, 643.88, -19.24, -320.76, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 644.69, -13.13, -364.87, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 622.02, -15.73, -366.03, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 598.25, -20.37, -364.02, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 561.69, -21.01, -356.09, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 565.23, -20.83, -345.95, 2, math.random(0,40))
	MovementLoopAddLocation(NPC, 559.95, -20.62, -346.75, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 550.69, -21.5, -317.76, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 560.18, -21.9, -314.31, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 581.97, -21.37, -313.43, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 601.72, -21.05, -312.89, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 638.17, -20.31, -308.01, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 648.88, -21.27, -308.26, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 649.85, -21.94, -301.33, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 650.86, -17.98, -206.84, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 649.85, -21.94, -301.33, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 648.88, -21.27, -308.26, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 638.17, -20.31, -308.01, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 601.72, -21.05, -312.89, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 581.97, -21.37, -313.43, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 560.18, -21.9, -314.31, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 550.69, -21.5, -317.76, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 559.95, -20.62, -346.75, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 565.23, -20.83, -345.95, 2, math.random(0,40))
	MovementLoopAddLocation(NPC, 561.69, -21.01, -356.09, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 598.25, -20.37, -364.02, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 622.02, -15.73, -366.03, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 644.69, -13.13, -364.87, 2, math.random(0,8))
	MovementLoopAddLocation(NPC, 643.88, -19.24, -320.76, 2, math.random(0,8))
end

]]--

