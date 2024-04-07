--[[
    Script Name    : SpawnScripts/TheRuins_Classic/WeleLyoli.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.06 04:07:19
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetTempVariable(NPC, "CalloutTimer", "false")
    SetTempVariable(NPC, "Timer1", "false")
    SetTempVariable(NPC, "Timer2", "false")
     AddTimer(NPC,500,"FairyCheck")
     AddTimer(NPC,2000,"waypoints")
     AddTimer(NPC,900000,"Depsawning")
end

function hailed(NPC, Spawn)
   if  GetTempVariable(NPC, "CalloutTimer")== "false"then
       SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,3000,"ResetTimer",1,Spawn)
        if  GetTempVariable(NPC, "Timer1")== "false"then
 		    PlayFlavor(NPC, "", "We were tricked! It must be found.", "", 0, 0, Spawn, 0)
            SetTempVariable(NPC, "Timer1", "true")

        elseif GetTempVariable(NPC, "Timer2")== "false"then
		    PlayFlavor(NPC, "", "Where is he? Where is Gurb?", "", 0, 0, Spawn, 0)
            SetTempVariable(NPC, "Timer2", "true")

        else
            SetTempVariable(NPC, "Timer1", "false")
            SetTempVariable(NPC, "Timer2", "false")
		    PlayFlavor(NPC, "", "It was stolen from us! It must be returned home.", "", 0, 0, Spawn, 0)
        end
    end
    end

function FairyCheck(NPC)
local zone = GetZone(NPC)
if GetSpawnByLocationID(zone, 133785614)==nil then
    SpawnByLocationID(zone,133785614)
end
 if GetSpawnByLocationID(zone, 133785615)==nil  then
    SpawnByLocationID(zone,133785615)
end
end


function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end
function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -203.24, 2.59, 63.08, 2, 0)
	MovementLoopAddLocation(NPC, -200.15, 2.59, 76, 2, 0)
	MovementLoopAddLocation(NPC, -198.86, 2.59, 86.53, 2, 6)
	MovementLoopAddLocation(NPC, -185.98, 2.59, 90.34, 2, 0)
	MovementLoopAddLocation(NPC, -171.48, 2.59, 88.34, 2, 6)
	MovementLoopAddLocation(NPC, -168.28, 2.59, 89.38, 2, 0)
	MovementLoopAddLocation(NPC, -175.75, 2.59, 91.57, 2, 0)
	MovementLoopAddLocation(NPC, -189.95, 2.59, 84.36, 2, 0)
	MovementLoopAddLocation(NPC, -196.7, 2.59, 75.38, 2, 6)
	MovementLoopAddLocation(NPC, -195.57, 2.59, 67.68, 2, 0)
	MovementLoopAddLocation(NPC, -191.87, 2.59, 81.86, 2, 0)
	MovementLoopAddLocation(NPC, -184.04, 2.59, 90.04, 2, 0)
	MovementLoopAddLocation(NPC, -179.26, 2.59, 89.89, 2, 6)
	MovementLoopAddLocation(NPC, -158.33, 15.17, 83.6, 2, 0)
	MovementLoopAddLocation(NPC, -141.24, 15.17, 80.33, 2, 0)
	MovementLoopAddLocation(NPC, -129, 5.53, 76.78, 2, 0)
	MovementLoopAddLocation(NPC, -121.93, 5.53, 73.06, 2, 0)
	MovementLoopAddLocation(NPC, -106.21, 1.83, 74.89, 2, 6)
	MovementLoopAddLocation(NPC, -92.12, 12.85, 72.3, 2, 0)
	MovementLoopAddLocation(NPC, -68.79, 6.91, 64.16, 2, 0)
	MovementLoopAddLocation(NPC, -59.8, 4.07, 60.3, 2, 0)
	MovementLoopAddLocation(NPC, -57.28, 3.07, 58.01, 2, 6)
	MovementLoopAddLocation(NPC, -59.54, 3.07, 73.13, 2, 6)
	MovementLoopAddLocation(NPC, -69.72, 3.07, 75.28, 2, 6)
	MovementLoopAddLocation(NPC, -76.06, 3.07, 68.34, 2, 0)
	MovementLoopAddLocation(NPC, -74.85, 4.07, 63.2, 2, 0)
	MovementLoopAddLocation(NPC, -70.43, 3.75, 60.1, 2, 6)
	MovementLoopAddLocation(NPC, -74.95, 13.34, 63.96, 2, 0)
	MovementLoopAddLocation(NPC, -97.21, 4.67, 74.03, 2, 0)
	MovementLoopAddLocation(NPC, -113.88, 4.25, 75.31, 2, 0)
	MovementLoopAddLocation(NPC, -117.32, 1.65, 71.43, 2, 6)
	MovementLoopAddLocation(NPC, -125.82, 4.25, 75.49, 2, 0)
	MovementLoopAddLocation(NPC, -137.05, 9.46, 79.24, 2, 0)
	MovementLoopAddLocation(NPC, -158.24, 14.83, 76.67, 2, 0)
	MovementLoopAddLocation(NPC, -164.35, 5.73, 87.24, 2, 0)
	MovementLoopAddLocation(NPC, -169.29, 0.11, 86.26, 2, 6)
	MovementLoopAddLocation(NPC, -185.62, 0.11, 88.17, 2, 0)
	MovementLoopAddLocation(NPC, -195.9, 0.11, 88.74, 2, 0)
	MovementLoopAddLocation(NPC, -198.53, 0.11, 81.75, 2, 0)
	MovementLoopAddLocation(NPC, -201.85, 8.92, 64.78, 2, 0)
	MovementLoopAddLocation(NPC, -201.79, 16.45, 44.64, 2, 2)
	MovementLoopAddLocation(NPC, -201.79, 16.45, 44.64, 2, 0,"Despawning")
end

function Despawning(NPC)
    Despawn(NPC)
end
