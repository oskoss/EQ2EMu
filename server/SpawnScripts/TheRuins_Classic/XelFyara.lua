--[[
    Script Name    : SpawnScripts/TheRuins_Classic/XelFyara.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.06 05:07:54
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

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

function respawn(NPC)
	spawn(NPC)
end

function FairyCheck(NPC)
local zone = GetZone(NPC)
if GetSpawnByLocationID(zone, 133785610)==nil  then
    SpawnByLocationID(zone,133785610)
end
 if GetSpawnByLocationID(zone, 133785611)==nil  then
    SpawnByLocationID(zone,133785611)
end
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -117.14, 4.73, 154.48, 2, 0)
	MovementLoopAddLocation(NPC, -116.49, 5.21, 143.58, 2, 8)
	MovementLoopAddLocation(NPC, -132.87, 5.21, 118.47, 2, 8)
	MovementLoopAddLocation(NPC, -113.29, 5.21, 120.03, 2, 8)
	MovementLoopAddLocation(NPC, -126.4, 5.21, 137.95, 2, 8)
	MovementLoopAddLocation(NPC, -147, 5.21, 143.27, 2, 3)
	MovementLoopAddLocation(NPC, -154.03, 5.21, 152.55, 2, 0)
	MovementLoopAddLocation(NPC, -156.28, 5.21, 164.66, 2, 8)
	MovementLoopAddLocation(NPC, -168.02, 5.21, 153.82, 2, 8)
	MovementLoopAddLocation(NPC, -152.85, 5.21, 143.18, 2, 0)
	MovementLoopAddLocation(NPC, -146.98, 5.21, 129.89, 2, 8)
	MovementLoopAddLocation(NPC, -141.51, 5.68, 144.41, 2, 8)
	MovementLoopAddLocation(NPC, -129.9, 8.25, 125.66, 2, 4)
	MovementLoopAddLocation(NPC, -124.19, 8.25, 108.35, 2, 0)
	MovementLoopAddLocation(NPC, -117.19, 0.52, 95, 2, 8)
	MovementLoopAddLocation(NPC, -124.18, 0.52, 90.06, 2, 0)
	MovementLoopAddLocation(NPC, -131.15, 8.42, 85.15, 2, 0)
	MovementLoopAddLocation(NPC, -162.17, 12.23, 83.36, 2, 4)
	MovementLoopAddLocation(NPC, -167.15, 7.23, 71.97, 2, 0)
	MovementLoopAddLocation(NPC, -165.57, 0.76, 69.65, 2, 5)
	MovementLoopAddLocation(NPC, -176.42, 0.76, 72.76, 2, 8)
	MovementLoopAddLocation(NPC, -185.12, 0.76, 69.26, 2, 5)
	MovementLoopAddLocation(NPC, -190.26, 0.76, 78.94, 2, 8)
	MovementLoopAddLocation(NPC, -194.95, 0.76, 66.54, 2, 4)
	MovementLoopAddLocation(NPC, -195.66, 5.62, 63.77, 2, 0)
	MovementLoopAddLocation(NPC, -200.06, 14.32, 44.62, 2, 2)
	MovementLoopAddLocation(NPC, -200.06, 14.32, 44.62, 2, 0,"Despawning")
end

function Despawning(NPC)
    Despawn(NPC)
end