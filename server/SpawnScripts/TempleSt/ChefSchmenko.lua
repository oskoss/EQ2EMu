--[[
    Script Name    : SpawnScripts/TempleSt/ChefSchmenko.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.24 01:10:41
    Script Purpose : 
                   : 
--]]


function spawn(NPC)
if GetSpawnLocationID(NPC)==420550 then
	SpawnSet(NPC,"model_type","65")
    SpawnSet(NPC,"show_name","1")
    SpawnSet(NPC,"targetable","1")
    waypoints(NPC)
    SetTempVariable(NPC,"CalloutTimer", "0")
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
end    
    SetInfoStructString(NPC, "action_state", "draw_weapon_trigger")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC,Spawn)
	if not IsInCombat(NPC) and GetTempVariable(NPC,"CalloutTimer")~="1" then
    RandomGreeting(NPC, Spawn)
    SetTempVariable(NPC,"CalloutTimer", "1")
    AddTimer(NPC,42000,"CalloutReset",1,Spawn)
    end
end


function CalloutReset(NPC,Spawn)
SetTempVariable(NPC,"CalloutTimer", "0")
end   


function hailed(NPC, Spawn)
     FaceTarget(NPC,Spawn)
	AddTimer(NPC,500,"RandomHail", 1,Spawn)
end

function aggro(NPC,Spawn)
    FaceTarget(NPC,Spawn)
end

function kill (NPC,Spawn)
    PlayFlavor(NPC,"","","1h_sword_attack",0,0)
    KillSpawn(Spawn)
    AddTimer(NPC,2500,"scoop")
end


function scoop(NPC,Spawn)
   PlayFlavor(NPC,"","","gathering_success",0,0)
end


function RandomHail(NPC, Spawn)
	local choice = MakeRandomInt(1,5)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_guard_gm_1f674b43.mp3", "Oh! I... I'm not causing any trouble here. Don't mind me.", "whome", 3595799697, 1640670967, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_hail_gm_c8ce2416.mp3", "Do you have any small animals you won't mind missing?", "scheme", 2477620923, 2758696689, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_hail_gm_3c9902f6.mp3", "Fresh stew made with the finest ingredients! Come and get it!", "happy", 291667261, 3539823905, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_hail_gm_6498c1fd.mp3", "Try my feline claw soup sometime. You must!", "agree", 1561843829, 2180580092, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_hail_gm_a9f4bc35.mp3", "Don't bother me. I'm collecting fresh ingredients for a special recipe.", "shakefist", 2150316524, 1924252475, Spawn, 0)
	end
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_pig_gm_fdce8620.mp3", "Here little piglet, I have piggy treats...", "", 2158157683, 2098170175, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_cat_gm_9b64702d.mp3", "Here kitty kitty kitty...", "", 550240368, 2229553634, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_chase_gm_9e0faaf4.mp3", "Stop running! It makes your muscles less tender when I cook you.", "", 1878608291, 1886271523, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_urbanchef/ft/eco/evil/ratonga_eco_evil_urbanchef_chase_gm_874126ec.mp3", "Just hold still, it won't hurt a bit...", "", 573333408, 2721588881, Spawn, 0)
	end
end

function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1360076)
    UseWidget(door)
end

function Action(NPC,Spawn)
    local Choice = MakeRandomInt(1,5)
    if Choice == 1 then 
    PlayFlavor(NPC,"","","peer",0,0)
    elseif Choice == 2 then 
    PlayFlavor(NPC,"","","sniff",0,0)
    elseif Choice == 3 then 
    PlayFlavor(NPC,"","","grumble",0,0)
    elseif Choice == 4 then 
    PlayFlavor(NPC,"","","tapfoot",0,0)
    elseif Choice == 5 then 
    PlayFlavor(NPC,"","","scheme",0,0)    
    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 29.21, 2.92, 25.71, 1, 1)
	MovementLoopAddLocation(NPC, 29.21, 2.92, 25.71, 1, 11,"Action")
	MovementLoopAddLocation(NPC, 27.33, 2.92, 33.05, 1, 0)
	MovementLoopAddLocation(NPC, 32.86, 2.98, 46.38, 1, 0)
	MovementLoopAddLocation(NPC, 35.7, 3, 51.58, 1, 0)
	MovementLoopAddLocation(NPC, 35.7, 3, 51.58, 1, 3)
	MovementLoopAddLocation(NPC, 43.65, 3, 46.57, 1, 0)
	MovementLoopAddLocation(NPC, 45.11, 3, 45.75, 1, 1)
	MovementLoopAddLocation(NPC, 45.11, 3, 45.75, 1, 11,"Action")
	MovementLoopAddLocation(NPC, 30.49, 3, 54.97, 1, 0)
	MovementLoopAddLocation(NPC, 33.68, 3, 63.8, 1, 0)
	MovementLoopAddLocation(NPC, 35.45, 3, 69.71, 1, 0)
	MovementLoopAddLocation(NPC, 37.3, 3, 73.3, 1, 1)
	MovementLoopAddLocation(NPC, 37.3, 3, 73.3, 1, 11,"Action")
	MovementLoopAddLocation(NPC, 34.01, 3, 66.86, 1, 8)
	MovementLoopAddLocation(NPC, 26.77, 3, 69.14, 1, 0)
	MovementLoopAddLocation(NPC, 19.62, 3.02, 71.79, 1, 0)
	MovementLoopAddLocation(NPC, 11.77, 3, 70.42, 1, 0)
	MovementLoopAddLocation(NPC, 2.56, 3, 67.84, 1, 0)
	MovementLoopAddLocation(NPC, -7.08, 3, 57.4, 1, 1)
	MovementLoopAddLocation(NPC, -7.08, 3, 57.4, 1, 11,"Action")
	MovementLoopAddLocation(NPC, -7.56, 3, 57.9, 1, 0)
	MovementLoopAddLocation(NPC, -6.65, 3, 58.56, 1, 0)
	MovementLoopAddLocation(NPC, -4.28, 3, 59.43, 1, 0)
	MovementLoopAddLocation(NPC, 3.73, 3, 70.57, 1, 0)
	MovementLoopAddLocation(NPC, -2.06, 3, 75.23, 1, 0)
	MovementLoopAddLocation(NPC, -10.82, 3, 78.88, 1, 0)
	MovementLoopAddLocation(NPC, -15.5, 3, 80.1, 2, 1,"Door1")
	MovementLoopAddLocation(NPC, -18.05, 3.03, 74.58, 2, 12,"Door1")
	MovementLoopAddLocation(NPC, -19.93, 3.11, 74.09, 2, 1)
	MovementLoopAddLocation(NPC, -19.93, 3.11, 74.09, 2, 34,"Action")
	MovementLoopAddLocation(NPC, -18.57, 3.03, 75.75, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -16.09, 3, 79.41, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, 4.62, 3, 69.9, 2, 0)
	MovementLoopAddLocation(NPC, 9.21, 3, 68, 1, 0)
	MovementLoopAddLocation(NPC, 21.62, 2.98, 81.64, 1, 0)
	MovementLoopAddLocation(NPC, 24.06, 3, 80.72, 1, 1)
	MovementLoopAddLocation(NPC, 24.06, 3, 80.72, 1, 11,"Action")
	MovementLoopAddLocation(NPC, 23.03, 2.99, 67.83, 1, 0)
	MovementLoopAddLocation(NPC, 29.6, 3, 58.16, 1, 0)
	MovementLoopAddLocation(NPC, 33.84, 3, 52.08, 1, 0)
	MovementLoopAddLocation(NPC, 24.6, 2.92, 37.78, 1, 0)
	MovementLoopAddLocation(NPC, 14.59, 2.92, 35.85, 1, 1)
	MovementLoopAddLocation(NPC, 14.59, 2.92, 35.85, 1, 11,"Action")
	MovementLoopAddLocation(NPC, 23.07, 2.92, 36.48, 2, 0)
	MovementLoopAddLocation(NPC, 32.33, 2.92, 21.28, 1, 1)
	MovementLoopAddLocation(NPC, 32.33, 2.92, 21.28, 1, 7)
	MovementLoopAddLocation(NPC, 27.6, 2.92, 31.8, 1, 0) --Chase
	MovementLoopAddLocation(NPC, 28.3, 2.92, 36.05, 1, 0)
	MovementLoopAddLocation(NPC, 34.46, 3, 48.5, 1, 0)
	MovementLoopAddLocation(NPC, 36.12, 3, 50.28, 1, 0)
	MovementLoopAddLocation(NPC, 41.7, 3, 49.41, 1, 0)
	MovementLoopAddLocation(NPC, 43.56, 3, 49.41, 1, 0)
	MovementLoopAddLocation(NPC, 49.16, 3, 58.47, 2, 0)
	MovementLoopAddLocation(NPC, 54.6, 3, 66.57, 2, 0,"Model")
	MovementLoopAddLocation(NPC, 54.6, 3, 66.57, 2, 0,"Spawn")
	MovementLoopAddLocation(NPC, 54.6, 3, 66.57, 1, 5,"Despawning")
end	
	

function Spawn(NPC)
	local zone = GetZone(NPC)
	local Runner = GetSpawnByLocationID(zone, 133787203)
	if Runner == nil then
	    SpawnByLocationID(zone,133787203)
	end
end

function Model(NPC)
    SpawnSet(NPC,"model_type","2306")
    SpawnSet(NPC,"show_name","0")
    SpawnSet(NPC,"targetable","0")
    SpawnSet(NPC, "show_command_icon", "0")
end

function Despawning(NPC)
        Despawn(NPC)
end




