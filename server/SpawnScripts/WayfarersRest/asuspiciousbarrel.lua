--[[
    Script Name    : SpawnScripts/WayfarersRest/asuspiciousbarrel.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.23 02:09:10
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
SetPlayerProximityFunction(NPC, 4, "InRange", "LeaveRange")
    SetTempVariable(NPC,"Proxy",nil)
end

function InRange(NPC, Spawn)
if GetTempVariable(NPC,"Proxy") == nil then
Shimmer(NPC,Spawn)
end
end


function Shimmer(NPC,Spawn)
    SendMessage(Spawn,"The stacked barrels and crate blur as you approach.","white")
    SendPopUpMessage(Spawn,"The stacked barrels and crate blur as you approach.",100,100,175)
    SetTempVariable(NPC,"Proxy",1)
    local zone = GetZone(NPC)
    local Crate = (GetSpawnByLocationID(zone,133786871))
    local Barrel = (GetSpawnByLocationID(zone,133786873))
    PlayFlavor(NPC,"","","result_distort_hit",0,0)
    PlayFlavor(Crate,"","","result_distort_hit",0,0)
    PlayFlavor(Barrel,"","","result_distort_hit",0,0)
    SpawnSet(NPC,"show_command_icon",1)
    SpawnSet(NPC,"display_hand_icon",1)
    SpawnSet(Crate,"show_command_icon",1)
    SpawnSet(Crate,"display_hand_icon",1)
    SpawnSet(Barrel,"show_command_icon",1)
    SpawnSet(Barrel,"display_hand_icon",1)
    AddPrimaryEntityCommand(Spawn,NPC,"Inspect",10000,"Inspect")
    AddPrimaryEntityCommand(Spawn,Crate,"Inspect",10000,"Inspect")
    AddPrimaryEntityCommand(Spawn,Barrel,"Inspect",10000,"Inspect")
    SendUpdateDefaultCommand(NPC,10000,"Inspect")
    SendUpdateDefaultCommand(Crate,10000,"Inspect")
    SendUpdateDefaultCommand(Barrel,10000,"Inspect")
end

function casted_on(NPC, Spawn, Message)
    local zone = GetZone(NPC)
    local Crate = (GetSpawnByLocationID(zone,133786871))
    local Barrel = (GetSpawnByLocationID(zone,133786873))
    if Message == "Inspect" then
		if Crate ~= nil then
            PlayFlavor(Crate,"","","result_dispell1_out",0,0)
            AddTimer(Crate,1500,"Despawning")
        end
		if Barrel ~= nil then
            PlayFlavor(Barrel,"","","result_dispell1_out",0,0)
            AddTimer(Barrel,1500,"Despawning")
        end
		if NPC ~= nil then
            PlayFlavor(NPC,"","","result_dispell1_out",0,0)
            AddTimer(NPC,1500,"Despawning")
        end            
end
end


function Despawning(NPC,Spawn)
    local zone = GetZone(NPC)
    local Crate = (GetSpawnByLocationID(zone,133786871))
    local Barrel = (GetSpawnByLocationID(zone,133786873))
    local Wall = (GetSpawnByLocationID(zone,133786875))
        if Crate ~= nil then
            Despawn(Crate)
        end
		if Barrel ~= nil then
            Despawn(Barrel)
        end
		if NPC ~= nil then
            Despawn(NPC)
		if Wall ~= nil then
            Despawn(Wall)
        end
        end           
end


function respawn(NPC)
	spawn(NPC)
end