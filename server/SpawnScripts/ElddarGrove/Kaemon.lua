--[[
	Script Name	: SpawnScripts/ElddarGrove/Kaemon.lua
	Script Purpose	: Kaemon 
	Script Author	: John Adams
	Script Date	: 2008.09.28
	Script Notes	: Updated Dialogue 05.01.2022 Dorbin
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
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 796.48, -22.29, -532.16, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 784.51, -22.31, -509.94, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 774.51, -21.8, -496.87, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 753.33, -22.02, -475.7, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 720.13, -21.34, -459.29, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 709.1, -19.77, -445.47, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 704.38, -15.94, -433.44, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 699.07, -15.15, -419.15, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 705.79, -15.79, -379.66, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 755.38, -19.33, -378.63, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 755.38, -19.33, -378.63, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 698.79, -14.76, -379.16, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.9, -13.1, -359.49, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 638.81, -13.23, -369.1, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 576.91, -21.66, -364.32, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 568.64, -19.87, -373.3, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 550.27, -21.34, -323.28, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 560.2, -21.9, -314.32, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 596.45, -21.15, -314.94, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.73, -21.28, -308, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 649.68, -21.67, -304.18, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 650.22, -21.66, -293.1, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 650.98, -18.01, -207.74, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.83, -19.38, -271.75, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 681.02, -19.61, -276.77, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 704.77, -17.08, -331.67, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 723.53, -17.55, -330.58, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 747.75, -20.22, -332.03, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 772.13, -19.09, -331.47, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 747.75, -20.22, -332.03, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 723.53, -17.55, -330.58, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 704.77, -17.08, -331.67, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 681.02, -19.61, -276.77, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.83, -19.38, -271.75, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 650.98, -18.01, -207.74, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 650.22, -21.66, -293.1, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 649.68, -21.67, -304.18, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.73, -21.28, -308, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 596.45, -21.15, -314.94, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 560.2, -21.9, -314.32, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 550.27, -21.34, -323.28, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 568.64, -19.87, -373.3, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 576.91, -21.66, -364.32, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 638.81, -13.23, -369.1, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.9, -13.1, -359.49, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 698.79, -14.76, -379.16, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 755.38, -19.33, -378.63, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 755.38, -19.33, -378.63, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 705.79, -15.79, -379.66, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 699.07, -15.15, -419.15, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 704.38, -15.94, -433.44, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 709.1, -19.77, -445.47, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 720.13, -21.34, -459.29, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 753.33, -22.02, -475.7, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 774.51, -21.8, -496.87, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 784.51, -22.31, -509.94, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 796.48, -22.29, -532.16, 2, math.random(0,5))
end
