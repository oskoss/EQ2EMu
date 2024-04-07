--[[
    Script Name    : SpawnScripts/TempleSt/ChefSchmenkoRunner.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.26 04:10:40
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    waypointsRun(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
SetTempVariable(NPC,"CalloutTimer", "1")
end

function InRange(NPC,Spawn)
	if not IsInCombat(NPC) and GetTempVariable(NPC,"CalloutTimer")~="1" then
	local zone = GetZone(NPC)
 	local Cog = GetSpawnByLocationID(zone, 133787201)
	local Sprocket = GetSpawnByLocationID(zone, 133787202)
	if IsAlive(Cog) or IsAlive(Sprocket) then
    RandomGreeting(NPC, Spawn)
    SetTempVariable(NPC,"CalloutTimer", "1")
    AddTimer(NPC,18000,"CalloutReset",1,Spawn)end
    end
end

function CalloutReset(NPC,Spawn)
SetTempVariable(NPC,"CalloutTimer", "0")
end   


function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_chase_gm_874126ec.mp3", "Just hold still, it won't hurt a bit...", "", 573333408, 2721588881, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_chase_gm_b68dd0f.mp3", "Help! I'm being chased by dinner, help!", "", 722181787, 4005303070, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_chase_gm_9e0faaf4.mp3", "Stop running! It makes your muscles less tender when I cook you.", "", 1878608291, 1886271523, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_chase_gm_b68dd0f.mp3", "Help! I'm being chased by dinner, help!", "", 722181787, 4005303070, Spawn, 0)
	end
end

function respawn(NPC)
	spawn(NPC)
end

function waypointsRun(NPC)
	MovementLoopAddLocation(NPC, 54.6, 3, 66.57, 1, 0)
	MovementLoopAddLocation(NPC, 49.83, 3, 70.25, 1, 0,"CritterCheck")
	MovementLoopAddLocation(NPC, 42.63, 3, 74.64, 1, 0)
	MovementLoopAddLocation(NPC, 40.77, 3, 76.3, 2, 1,"CritterTarget")
	MovementLoopAddLocation(NPC, 40.77, 3, 76.3, 2, 1)
	MovementLoopAddLocation(NPC, 40.77, 3, 76.3, 2, 1,"Squeal")
	MovementLoopAddLocation(NPC, 40.77, 3, 76.3, 4, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 35.62, 3, 75.35, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 28.61, 3, 77.83, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 23.54, 3, 79.13, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 19.35, 3.01, 75.87, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 18.61, 3.02, 71.04, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 23.05, 2.99, 66.51, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 26.91, 3, 63.92, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 30.48, 3, 68.72, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 33.03, 3, 72.96, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 31.55, 3, 77.35, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 24.44, 3, 77.8, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 21.36, 2.94, 73.64, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 25.64, 3, 67.15, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 28.86, 3, 68, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 31.45, 3, 70.57, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 31.91, 3, 73.86, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 27.09, 3, 76.77, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 24.8, 3, 71.86, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 29.09, 3, 59.54, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 30.46, 3, 56.16, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 32.28, 3, 54.58, 6, 0,"CritterRun")
	MovementLoopAddLocation(NPC, 32.32, 3, 50.85, 6, 0,"RunningBack")
	MovementLoopAddLocation(NPC, 28.53, 2.92, 41.62, 3, 0,"DespawnCritter")
	MovementLoopAddLocation(NPC, 26.82, 2.92, 33.54, 2, 0)
	MovementLoopAddLocation(NPC, 30.88, 2.92, 25.87, 2, 1,"DespawningSelf")
	MovementLoopAddLocation(NPC, 30.88, 2.92, 25.87, 2, 4,"DespawningSelf2")
end

function DespawningSelf(NPC)
	local zone = GetZone(NPC)
	local Original = GetSpawnByLocationID(zone, 420550)
	if Original == nil then
    SpawnSet(NPC,"model_type","2306")
    SpawnSet(NPC,"show_name","0")
    SpawnSet(NPC,"targetable","0")
    SpawnSet(NPC, "show_command_icon", "0")
	end
end

function DespawningSelf2(NPC)
	local zone = GetZone(NPC)
	local Original = GetSpawnByLocationID(zone, 420550)
	if Original == nil then
    SpawnByLocationID(zone,420550)
    Despawn(NPC)
	end
end

function CritterRun(NPC,Spawn)
    local X = GetX(NPC)
    local Y = GetY(NPC)
    local Z = GetZ(NPC)
 	local sli = GetSpawnLocationID(NPC)
    local speed = 2
	local zone = GetZone(NPC)
	local Cog = GetSpawnByLocationID(zone, 133787201)
	local Sprocket = GetSpawnByLocationID(zone, 133787202)
	local RealCog = GetSpawnByLocationID(zone, 420519)
	local RealSprocket = GetSpawnByLocationID(zone, 420583)
	if  Cog ~=nil and not IsInCombat(Cog) then   
	    local Cog = GetSpawnByLocationID(zone, 133787201)
        if MakeRandomInt(0,100) <= 40 then
        PlayFlavor(Cog,"","","attack",0,0)
        end
 	    if RealCog ~=nil then
	        Despawn(RealCog)
	    end
        local Cog = GetSpawnByLocationID(zone, 133787201)
		if GetDistance(Cog, NPC) >= 2 then
			speed = 6
			MoveToLocation(Cog, X - 1, Y, Z, speed)
		else
			speed = 5
			MoveToLocation(Cog, X - 1, Y, Z, speed)
		end 
	end
	if  Sprocket ~=nil  and not IsInCombat(Sprocket) then   
	    local Sprocket = GetSpawnByLocationID(zone, 133787202)
        if MakeRandomInt(0,100) <= 40 then
        PlayFlavor(Sprocket,"","","attack",0,0)
        end
	    if RealSprocket ~=nil then
	        Despawn(RealSprocket)
	    end
	    if GetDistance(Sprocket, NPC) >= 2 then
			speed = 6
			MoveToLocation(Sprocket, X - 1, Y, Z, speed)
		else
			speed = 5
			MoveToLocation(Sprocket, X - 1, Y, Z, speed)
		end 
    end
end


function CritterCheck(NPC,Spawn)
    local Critter = MakeRandomInt(1,2)
	local zone = GetZone(NPC)
	local RealCog = GetSpawnByLocationID(zone, 420519)
	local RealSprocket = GetSpawnByLocationID(zone, 420583)
	local Cog = GetSpawnByLocationID(zone, 133787201)
	local Sprocket = GetSpawnByLocationID(zone, 133787202)
	if Critter == 1 then
	    if RealCog ~=nil then
	        Despawn(RealCog)
	    end
	    if Cog ==nil then
	        SpawnByLocationID(zone,133787201)
	    end
	else
	    if RealSprocket ~=nil then
	        Despawn(RealSprocket)
	    end
	    if Sprocket ==nil then
	        SpawnByLocationID(zone,133787202)
	    end
end
end
	  
function Attacking(NPC,Spawn)	 
    PlayFlavor(NPC,"","","attack",0,0)
end
	  
function Squeal(NPC,Spawn)
    SetTempVariable(NPC,"CalloutTimer", "0")
    PlayFlavor(NPC,"","","squeal",0,0)
end
	  
function CritterTarget(NPC,Spawn)
	local zone = GetZone(NPC)
	local RealCog = GetSpawnByLocationID(zone, 420519)
	local RealSprocket = GetSpawnByLocationID(zone, 420583)
	local Cog = GetSpawnByLocationID(zone, 133787201)
	local Sprocket = GetSpawnByLocationID(zone, 133787202)
	    if Cog ~=nil then
            SetTarget(Cog,NPC)
            SetTarget(NPC,Cog)
            FaceTarget(NPC,Cog)
            PlayFlavor(Cog,"","","attack",0,0)
	    elseif Sprocket ~=nil then
            SetTarget(Sprocket,NPC)
            SetTarget(NPC,Sprocket)
            FaceTarget(NPC,Sprocket)
            PlayFlavor(Sprocket,"","","attack",0,0)
        end
end

function DespawnCritter(NPC,Spawn)
	local zone = GetZone(NPC)
	local RealCog = GetSpawnByLocationID(zone, 420519)
	local RealSprocket = GetSpawnByLocationID(zone, 420583)
	local Cog = GetSpawnByLocationID(zone, 133787201)
	local Sprocket = GetSpawnByLocationID(zone, 133787202)
	    if Cog ~=nil then
	        Despawn(Cog)
	    end
	    if RealCog ==nil then
--	        SpawnByLocationID(zone,420519)
	    end
	    if Sprocket ~=nil then
	        Despawn(Sprocket)
	    end
	    if RealSprocket ==nil then
--	        SpawnByLocationID(zone,420583)
	    end

end

function RunningBack(NPC,Spawn)
	local zone = GetZone(NPC)
	local RealCog = GetSpawnByLocationID(zone, 420519)
	local RealSprocket = GetSpawnByLocationID(zone, 420583)
	local Cog = GetSpawnByLocationID(zone, 133787201)
	local Sprocket = GetSpawnByLocationID(zone, 133787202)
	    if Cog ~=nil then
	        MovementLoopAddLocation(Cog, 52.48, 3.00, 45.73, 6, 6,"DespawnCritter")
            SetTarget(Cog,nil)
            SetTarget(NPC,nil)
	    elseif Sprocket ~=nil then
	        MovementLoopAddLocation(Sprocket, 52.48, 3.00, 45.73, 6, 6,"DespawnCritter")
            SetTarget(Sprocket,nil)
            SetTarget(NPC,nil)
            FaceTarget(NPC,Sprocket)
            PlayFlavor(Sprocket,"","","attack",0,0)
        end
end
