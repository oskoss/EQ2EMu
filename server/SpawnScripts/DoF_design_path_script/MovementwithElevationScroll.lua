--[[
    Script Name    : SpawnScripts/DoF_design_path_script/MovementwithElevationScroll.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.19 05:07:37
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local Busy = false

function spawn(NPC)

end

function hailed(NPC, Spawn)
Dialog1(NPC,Spawn)
end

function Dialog1(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("This is demonstrating movement loops with a number of points. What would you like to do?")
    if Busy == false then
	Dialog.AddOption("Setup the Spawns","Setup")
	Dialog.AddOption("Nevermind")
else
    
	    Dialog.AddOption("Reset the Spawns","Reset")
	    Dialog.AddOption("Nevermind")
    end
	Dialog.Start()
end

function Setup(NPC,Spawn)
    local zone = GetZone(NPC)
    local Points2 = GetSpawnByLocationID(zone, 133785999)
    local Points4 = GetSpawnByLocationID(zone, 133786000)
    local Points6 = GetSpawnByLocationID(zone, 133785995)
    Busy = true    
    
    if Points2 ==nil then
        SpawnByLocationID(zone, 133785999)
    end
    if Points4 ==nil then
        SpawnByLocationID(zone, 133786000)
    end
    if Points6 ==nil then
        SpawnByLocationID(zone, 133785995)
    end  
end

function Reset(NPC,Spawn)
    local zone = GetZone(NPC)
    local Points2 = GetSpawnByLocationID(zone, 133785999)
    local Points4 = GetSpawnByLocationID(zone, 133786000)
    local Points6 = GetSpawnByLocationID(zone, 133785995)
    Busy = false    
    
    if Points2 ~=nil then
        KillSpawn(Points2)
    end
    if Points4 ~=nil then
        KillSpawn(Points4)
    end
    if Points6 ~=nil then
        KillSpawn(Points6)
    end  
end