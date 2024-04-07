--[[
	Script Name		: SpawnScripts/BeggarsCourt/CaptainPaullus.lua
	Script Purpose	: Captain Paullus
	Script Author	: Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC)
    SetTempVariable(NPC,"DrunkCallout","false")
    AddTimer(NPC,2000,"waypoints")
    --waypoints(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
        else
    FaceTarget(NPC, Spawn)
    GenericGuardHail(NPC,Spawn)
end
end



function DrunkCall(NPC,Spawn)
    local zone = GetZone(NPC)
    local Drunk = GetSpawnByLocationID(zone, 403002)
    SetTarget(Drunk,NPC)    
    FaceTarget(Drunk,NPC)    
    FaceTarget(NPC,Drunk)
    local choice = MakeRandomInt(1,3)
    if choice==1 then
	PlayFlavor(Drunk, "voiceover/english/human_eco_evil_drunk/ft/eco/evil/human_eco_evil_drunk_guard_gm_153d5a3.mp3", "Let's have a drink together and forget that we ever met.", "hello", 2964980286, 4014491635)
	elseif choice == 2 then
	PlayFlavor(Drunk, "voiceover/english/human_eco_evil_drunk/ft/eco/evil/human_eco_evil_drunk_bartender_gm_e4fde966.mp3", "I haven't that much to drink yet, I got here when... bah I forgot.", "no", 612325975, 4257910058)
	else
    PlayFlavor(Drunk,"voiceover/english/human_eco_evil_drunk/ft/eco/evil/human_eco_evil_drunk_guard_gm_b5bfa487.mp3","Look sir.  I just had'one ale n' hour ago withh dinner.","no",1705294225,1483651602)
    end

end

function Turn(NPC,Spawn)
    if GetTempVariable(NPC,"DrunkCallout")== "false" then
    SetTempVariable(NPC,"DrunkCallout","true")
    local zone = GetZone(NPC)
    local Drunk = GetSpawnByLocationID(zone, 403002)
    SetTarget(NPC,Drunk)    
    FaceTarget(NPC,Drunk)
    SetTarget(Drunk,NPC)    
    FaceTarget(Drunk,NPC)  
    local choice = MakeRandomInt(1, 2)
    if choice == 1 then
    PlayFlavor(NPC, "", "", "glare", 0, 0)
    elseif choice == 2 then
    PlayFlavor(NPC, "", "", "shakefist", 0, 0)
    end
    AddTimer(NPC,1500,"DrunkCall")
    AddTimer(NPC,5000,"Reset")
    else
            SetTempVariable(NPC,"DrunkCallout","false")
            SetHeading(NPC,20)
end    
end

function Reset(NPC,Spawn)
    local zone = GetZone(NPC)
    local Drunk = GetSpawnByLocationID(zone, 403002)
    SetTarget(NPC,nil)    
    SetTarget(Drunk,nil)    
end  




function waypoints(NPC)
	MovementLoopAddLocation(NPC, 70.47, -7.08, 94.74, 2, 0)
	MovementLoopAddLocation(NPC, 73.88, -7.08, 99.74, 2, 0)
	MovementLoopAddLocation(NPC, 75.64, -7.08, 103.04, 2, 1)
	MovementLoopAddLocation(NPC, 75.64, -7.08, 103.04, 2, 10,"Turn")
	MovementLoopAddLocation(NPC, 75.64, -7.08, 103.04, 2, 0)
	MovementLoopAddLocation(NPC, 72.18, -7.08, 98.09, 2, 0)
	MovementLoopAddLocation(NPC, 67.44, -7.08, 94.13, 2, 0)
	MovementLoopAddLocation(NPC, 61.6, -7.08, 94.84, 2, 0)
	MovementLoopAddLocation(NPC, 57.64, -7.08, 97.9, 2, 0)
	MovementLoopAddLocation(NPC, 55.38, -7.08, 102.21, 2, 0)
	MovementLoopAddLocation(NPC, 53.98, -7.08, 108.71, 2, 8)
	MovementLoopAddLocation(NPC, 55.71, -7.08, 101.37, 2, 0)
	MovementLoopAddLocation(NPC, 58.92, -7.08, 96.99, 2, 0)
	MovementLoopAddLocation(NPC, 61.75, -7.08, 94.79, 2, 0)
	MovementLoopAddLocation(NPC, 63.69, -7.08, 92.53, 2, 0)
	MovementLoopAddLocation(NPC, 62.13, -7.02, 84.47, 2, 22)
	MovementLoopAddLocation(NPC, 62.36, -7.07, 86.6, 2, 0)
	MovementLoopAddLocation(NPC, 62.64, -7.08, 91.06, 2, 0)
end
