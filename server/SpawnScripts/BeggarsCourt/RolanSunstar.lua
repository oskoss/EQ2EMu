--[[
	Script Name		: SpawnScripts/BeggarsCourt/RolanSunstar.lua
	Script Purpose	: Rolan Sunstar
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
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
	spawn(NPC)
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -50.8, -5.77, 35.19, 2, 1)
	MovementLoopAddLocation(NPC, -50.8, -5.77, 35.19, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -48.18, -5.77, 30.47, 2, 0)
	MovementLoopAddLocation(NPC, -41.56, -5.77, 25.08, 2, 0)
	MovementLoopAddLocation(NPC, -38.58, -5.77, 25, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -33.29, -5.75, 24.85, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -30.27, -5.5, 21.44, 2, 0)
	MovementLoopAddLocation(NPC, -29.55, -5.25, 18.55, 2, 0)
	MovementLoopAddLocation(NPC, -25.23, -5, 16.87, 2, 0)
	MovementLoopAddLocation(NPC, -21.57, -5, 15.55, 2, 0)
	MovementLoopAddLocation(NPC, -17.67, -5, 14.01, 2, 0)
	MovementLoopAddLocation(NPC, -16.83, -5.01, 8.3, 2, 0)
	MovementLoopAddLocation(NPC, -14.74, -5, 6.15, 2, 0)
	MovementLoopAddLocation(NPC, -12.29, -3.87, 8.31, 2, 0)
	MovementLoopAddLocation(NPC, -10.28, -2.35, 10.96, 2, 0)
	MovementLoopAddLocation(NPC, -1.82, 1.91, 14.36, 2, 0)
	MovementLoopAddLocation(NPC, -0.9, 1.94, 14.5, 2, 0)
	MovementLoopAddLocation(NPC, 0.34, 2.02, 10.96, 2, 0)
	MovementLoopAddLocation(NPC, -0.36, 2.01, 7.68, 2, 0)
	MovementLoopAddLocation(NPC, -1.9, 2.25, 4.79, 2, 0)
	MovementLoopAddLocation(NPC, -6.28, 2.25, 1.69, 2, 0)
	MovementLoopAddLocation(NPC, -9.28, 2.01, 3.07, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -7.19, 2.49, -0.98, 2, 0)
	MovementLoopAddLocation(NPC, -4.81, 3.1, -5.39, 2, 0)
	MovementLoopAddLocation(NPC, -2.94, 3.5, -8.86, 2, 0)
	MovementLoopAddLocation(NPC, -4.76, 3.5, -16.2, 2, 0)
	MovementLoopAddLocation(NPC, -3.96, 3.5, -20.4, 2, 0)
	MovementLoopAddLocation(NPC, -6.07, 3, -28.68, 2, 0)
	MovementLoopAddLocation(NPC, -5.77, 3.25, -31.53, 2, 0)
	MovementLoopAddLocation(NPC, -5.29, 3.61, -33.96, 2, 0)
	MovementLoopAddLocation(NPC, -5.69, 3.5, -35.87, 2, 0)
	MovementLoopAddLocation(NPC, -5.65, 3.79, -37.68, 2, 0)
	MovementLoopAddLocation(NPC, -4.42, 4.49, -40.81, 2, 0)
	MovementLoopAddLocation(NPC, -3.22, 4.75, -42.59, 2, 0)
	MovementLoopAddLocation(NPC, -1.1, 5, -42.38, 2, 0)
	MovementLoopAddLocation(NPC, 1.62, 5, -42.27, 2, 1)
	MovementLoopAddLocation(NPC, 1.62, 5, -42.27, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 1.62, 5, -42.27, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 1.26, 5, -41.69, 2, 0)
	MovementLoopAddLocation(NPC, -0.14, 5, -40.52, 2, 0)
	MovementLoopAddLocation(NPC, -1.64, 5, -38.57, 2, 0)
	MovementLoopAddLocation(NPC, -1.45, 5, -34.32, 2, 0)
	MovementLoopAddLocation(NPC, 2.1, 5, -33, 2, 0)
	MovementLoopAddLocation(NPC, 3.96, 5, -31.63, 2, 0)
	MovementLoopAddLocation(NPC, 6.16, 4.75, -28.59, 2, 0)
	MovementLoopAddLocation(NPC, 11.87, 4.75, -27.47, 2, 0)
	MovementLoopAddLocation(NPC, 14.74, 4.75, -25.93, 2, 0)
	MovementLoopAddLocation(NPC, 20.74, 5.25, -22.17, 2, 0)
	MovementLoopAddLocation(NPC, 24.86, 5.25, -16.76, 2, 0)
	MovementLoopAddLocation(NPC, 25.46, 5.25, -16.42, 2, 1)
	MovementLoopAddLocation(NPC, 25.46, 5.25, -16.42, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 25.69, 5.25, -17.06, 2, 0)
	MovementLoopAddLocation(NPC, 25.26, 5.25, -18.47, 2, 0)
	MovementLoopAddLocation(NPC, 24.21, 5.25, -19.05, 2, 0)
	MovementLoopAddLocation(NPC, 23.03, 5.25, -18.13, 2, 0)
	MovementLoopAddLocation(NPC, 16.93, 4.75, -17.02, 2, 0)
	MovementLoopAddLocation(NPC, 11.88, 3.5, -10.79, 2, 0)
	MovementLoopAddLocation(NPC, 8.7, 3.5, -6.3, 2, 0)
	MovementLoopAddLocation(NPC, 5.7, 3.5, -3.05, 2, 0)
	MovementLoopAddLocation(NPC, 4.23, 3.5, -0.26, 2, 0)
	MovementLoopAddLocation(NPC, 2.81, 2.5, 5.66, 2, 0)
	MovementLoopAddLocation(NPC, 0.87, 2.02, 12.53, 2, 0)
	MovementLoopAddLocation(NPC, -0.83, 1.91, 15.44, 2, 0)
	MovementLoopAddLocation(NPC, -2.13, 1.96, 15.89, 2, 0)
	MovementLoopAddLocation(NPC, -6.38, 0.15, 14.08, 2, 0)
	MovementLoopAddLocation(NPC, -11.05, -2.48, 11.89, 2, 0)
	MovementLoopAddLocation(NPC, -14.72, -4.99, 8.45, 2, 0)
	MovementLoopAddLocation(NPC, -15.71, -5.01, 11.76, 2, 0)
	MovementLoopAddLocation(NPC, -20.45, -5, 20.25, 2, 1)
	MovementLoopAddLocation(NPC, -20.45, -5, 20.25, 2, 30)
	MovementLoopAddLocation(NPC, -20.45, -5, 20.25, 2, 0)
	MovementLoopAddLocation(NPC, -22.57, -5, 20.34, 2, 0)
	MovementLoopAddLocation(NPC, -25.03, -5, 19.98, 2, 0)
	MovementLoopAddLocation(NPC, -29.16, -5.75, 22.88, 2, 0)
	MovementLoopAddLocation(NPC, -33.63, -5.75, 24.86, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -40.25, -5.77, 25.08, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -52.29, -5.77, 27.85, 2, 1)
	MovementLoopAddLocation(NPC, -52.29, -5.77, 27.85, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -48.97, -5.77, 29.06, 2, 0)
end

function Drink(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
    AddTimer(NPC,8000, "Drink2")
end

function Drink2(NPC)
  choice = math.random(1,4)   
        if choice == 1 then    
        PlayFlavor(NPC,"","","yawn",0,0)
        elseif choice == 2 then    
        PlayFlavor(NPC,"","","drinking_idle",0,0)
        elseif choice == 3 then    
        PlayFlavor(NPC,"","","sniff",0,0)
        else
        PlayFlavor(NPC,"","","happy",0,0)
        end            
    AddTimer(NPC,6000, "Drink3")
end

function Drink3(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
end

function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1370080)
    UseWidget(door)
end


function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,5)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gm_ef8afd3c.mp3", "I gotta get into the Militia.  Then I could legally beat up people.", "ponder", 2140199906, 2198679856, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gm_7344f21b.mp3", "I'm in the mood to kick someone in the teeth.", "kick", 620861878, 995351111, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gm_1edba7a5.mp3", "Quit breathing my air!", "glare", 2440457715, 1164344641, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gm_6bd51371.mp3", "I'm a dual-breed, not a half-elf.  If you call me half-elf again, I'll cut YOU in half!", "cutthroat", 2884965634, 996787293, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gm_852b8675.mp3", "Shove off, mate!", "shakefist", 4223989531, 84768942, Spawn, 0)
	end
end