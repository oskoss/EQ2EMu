--[[
    Script Name    : SpawnScripts/BeggarsCourt/BarmaidMelia.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.28 05:11:26
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
waypoints(NPC)
    SetTempVariable(NPC,"BartenderCallout","false")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    local choice = MakeRandomInt(1, 3)
    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_barmaid/ft/eco/evil/human_eco_evil_barmaid_hail_gf_1be602a.mp3", "What will it be? A short beer or ale to get you started?", "tapfoot", 1335469253, 604669752)
    elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_barmaid/ft/eco/evil/human_eco_evil_barmaid_hail_gf_2d4c7e27.mp3", "It's hard to keep folks like you happy around here. If someone's not yelling for more, they're yelling to get a mess cleaned.", "shrug", 1592395791, 2626505941)
    elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_barmaid/ft/eco/evil/human_eco_evil_barmaid_hail_gf_3c0b7748.mp3", "Too many of those refugees pouring in lately, and they almost never tip. I'm ready to complain to the Far Seas that they need to train their castaways better.", "scold", 3617439192, 3468220606)
    end
end

function respawn(NPC)
	spawn(NPC)
end


function BartenderCall(NPC,Spawn)
    if GetTempVariable(NPC,"BartenderCallout")== "false" and MakeRandomInt(0,100) <=66 then
    local zone = GetZone(NPC)
    local Bartender = GetSpawnByLocationID(zone, 402926)
    SetTempVariable(NPC,"BartenderCallout","true")
        local choice = MakeRandomInt(1,3)
        if choice== 1 then
        SetTarget(Bartender,NPC)    
        FaceTarget(Bartender,NPC)    
        PlayFlavor(Bartender, "voiceover/english/human_eco_evil_bartender/ft/eco/evil/human_eco_evil_bartender_barmaid_gm_fce6ec9a.mp3", "I can't tell this pub from a pigsty.  Get to work and clean this mess!", "scold", 1129202055, 4037261409)
        AddTimer(NPC,1500,"Turn")
        AddTimer(NPC,4500,"Reset")
        AddTimer(NPC,6500,"Reset2")
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/human_eco_good_bartender/ft/eco/good/human_eco_good_bartender_drunk_gf_a8ee7698.mp3", "I don't have much patience for you today. Watch yourself.", "glare", 3292238371, 2757124824)
        SetTarget(NPC,Bartender)    
        FaceTarget(NPC,Bartender)  
        AddTimer(NPC,1500,"Turn_2")
        AddTimer(NPC,4500,"Reset")
        AddTimer(NPC,6500,"Reset2")
        elseif choice == 3 then
        Action(NPC)
        end
    else
    Action(NPC)
    SetTempVariable(NPC,"BartenderCallout","false")
end
end

function Turn(NPC,Spawn)
    local zone = GetZone(NPC)
    local Bartender = GetSpawnByLocationID(zone, 402926)
    SetTarget(NPC,Bartender)    
    FaceTarget(NPC,Bartender)
    local choice = MakeRandomInt(1, 2)
    if choice == 1 then
    PlayFlavor(NPC, "", "", "grumble", 0, 0)
    elseif choice == 2 then
    PlayFlavor(NPC, "", "", "shakefist", 0, 0)
    end
end    
 
 function Turn_2(NPC,Spawn)
    local zone = GetZone(NPC)
    local Bartender = GetSpawnByLocationID(zone, 402926)
    SetTarget(Bartender,NPC)    
    FaceTarget(Bartender,NPC)
    local choice = MakeRandomInt(1, 2)
    if choice == 1 then
    PlayFlavor(Bartender, "", "", "grumble", 0, 0)
    elseif choice == 2 then
    PlayFlavor(Bartender, "", "", "whome", 0, 0)
    end
end   
    
function Reset(NPC,Spawn)
    local zone = GetZone(NPC)
    local Bartender = GetSpawnByLocationID(zone, 402926)
    SetTarget(NPC,nil)    
    SetTarget(Bartender,nil)    
end  

function Reset2(NPC,Spawn)
    local zone = GetZone(NPC)
    local Bartender = GetSpawnByLocationID(zone, 402926)
    SetHeading(Bartender,106)    
end  

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 3.9, 4.75, -48.17, 2, 0)
	MovementLoopAddLocation(NPC, 3.99, 4.75, -50.82, 2, 1)
	MovementLoopAddLocation(NPC, 3.99, 4.75, -50.82, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 3.51, 4.75, -50.43, 2, 0)
	MovementLoopAddLocation(NPC, 4.13, 4.75, -49.54, 2, 1)
	MovementLoopAddLocation(NPC, 4.13, 4.75, -49.54, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 4.13, 4.75, -49.54, 2, 0)
	MovementLoopAddLocation(NPC, 3.81, 4.75, -48.49, 2, 0)
	MovementLoopAddLocation(NPC, 2.91, 4.75, -46.28, 2, 1)
	MovementLoopAddLocation(NPC, 2.91, 4.75, -46.28, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 1.85, 4.75, -45.73, 2, 0)
	MovementLoopAddLocation(NPC, 2.38, 5, -43.5, 2, 0)
	MovementLoopAddLocation(NPC, 4.62, 5, -41.65, 2, 1)
	MovementLoopAddLocation(NPC, 4.62, 5, -41.65, 2, 15,"BartenderCall")
	MovementLoopAddLocation(NPC, 4.62, 5, -41.65, 2, 0)
	MovementLoopAddLocation(NPC, 3.4, 5, -43.81, 2, 0)
	MovementLoopAddLocation(NPC, 3.05, 4.75, -45.58, 2, 1)
	MovementLoopAddLocation(NPC, 3.05, 4.75, -45.58, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 3.62, 4.75, -49.13, 2, 0)
	MovementLoopAddLocation(NPC, 4.45, 4.75, -51.45, 2, 1)
	MovementLoopAddLocation(NPC, 4.45, 4.75, -51.45, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 3.53, 4.75, -48.48, 2, 0)
	MovementLoopAddLocation(NPC, 4, 4.75, -46.28, 2, 1)
	MovementLoopAddLocation(NPC, 4, 4.75, -46.28, 2, 15,"Action")
end

function Action(NPC)
    local choice = MakeRandomInt(1, 4)
    if choice == 1 then
        PlayFlavor(NPC, "", "", "confused", 0, 0)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "", "ponder", 0, 0)
    elseif choice == 3 then
        PlayFlavor(NPC, "", "", "sniff", 0, 0)
    elseif choice == 4 then
        PlayFlavor(NPC, "", "", "tapfoot", 0, 0)
    end
end 

