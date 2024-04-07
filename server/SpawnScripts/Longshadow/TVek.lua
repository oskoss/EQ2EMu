--[[
	Script Name	: SpawnScripts/Longshadow/TVek.lua
	Script Purpose	: T`Vek <Guard>
	Script Author	: John Adams
	Script Date	: 2008.09.29
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC)
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

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	choice = math.random(1, 4)

	if choice == 1 then
    		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/guard/darkelf_guard_service_evil_1_hail_gm_582205e1.mp3", "Do you have business with the Freeport Militia?", "glare", 3330899926, 205777100, Spawn)
	elseif choice == 2 then
    		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/guard/darkelf_guard_service_evil_1_hail_gm_7fa14d4.mp3", "Do not challenge my authority citizen. In Freeport, the Overlord's word is law!", "scold", 3071777755, 1811086423, Spawn)
	elseif choice == 3 then
    		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/guard/darkelf_guard_service_evil_1_hail_gm_870ae3cb.mp3", "The Overlord commands me to patrol this area, and so I must.", "tapfoot", 3455786340, 1963116786, Spawn)
	elseif choice == 4 then
    		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/guard/darkelf_guard_service_evil_1_hail_gm_edb196f8.mp3", "All praises to the Overlord. The Militia protects loyal citizens of Freeport.", "salute_freeport", 3432620709, 3039361332, Spawn)
	end
end

--[[function waypoints(NPC)
	MovementLoopAddLocation(NPC, 25.19, 3, 64.33, 2, 0)
	MovementLoopAddLocation(NPC, 4.37, 3, 70.65, 2, 0)
	MovementLoopAddLocation(NPC, 0.1, 3, 58.01, 2, 0)
	MovementLoopAddLocation(NPC, 18.83, 3, 51.84, 2, 0)
end]]--


function waypoints(NPC)
	MovementLoopAddLocation(NPC, 1.29, 3, 66.65, 2, 0)
	MovementLoopAddLocation(NPC, -0.38, 3, 59.16, 2, 0)
	MovementLoopAddLocation(NPC, 0.92, 3, 57.72, 2, 0)
	MovementLoopAddLocation(NPC, 16.06, 3, 52.88, 2, 0)
	MovementLoopAddLocation(NPC, 18.96, 3, 52.06, 2, 0)
	MovementLoopAddLocation(NPC, 22.45, 3, 63.83, 2, 0)
	MovementLoopAddLocation(NPC, 22.77, 3, 64.92, 2, 0)
	MovementLoopAddLocation(NPC, 14.45, 3, 67.2, 2, 1)
	MovementLoopAddLocation(NPC, 14.45, 3, 67.2, 2, 8,"Action")
	MovementLoopAddLocation(NPC, 14.13, 3, 66.82, 2, 0)
	MovementLoopAddLocation(NPC, 5.44, 3, 70.42, 2, 0)
	MovementLoopAddLocation(NPC, 1.23, 3, 57.31, 2, 0)
	MovementLoopAddLocation(NPC, 8.91, 3, 54.63, 2, 0)
	MovementLoopAddLocation(NPC, 8.23, 3, 49.72, 2, 0)
	MovementLoopAddLocation(NPC, 3.85, 2.9, 31.53, 2, 1)
	MovementLoopAddLocation(NPC, 3.85, 2.9, 31.53, 2, 12,"Action")
	MovementLoopAddLocation(NPC, -8.65, 3, 32.61, 2, 0)
	MovementLoopAddLocation(NPC, -23.09, 4.23, 27.94, 2, 0)
	MovementLoopAddLocation(NPC, -31.58, 4.21, 24.89, 2, 0)
	MovementLoopAddLocation(NPC, -50.67, 4.03, 14.59, 2, 0)
	MovementLoopAddLocation(NPC, -53.8, 3.54, 12.12, 2, 0)
	MovementLoopAddLocation(NPC, -54.69, 2.43, 4.83, 2, 0)
	MovementLoopAddLocation(NPC, -48.07, -0.82, -17.21, 2, 1)
	MovementLoopAddLocation(NPC, -48.07, -0.82, -17.21, 2, 12,"Action")
	MovementLoopAddLocation(NPC, -55.14, 2.4, 3.92, 2, 0)
	MovementLoopAddLocation(NPC, -53.15, 3.6, 12.96, 2, 0)
	MovementLoopAddLocation(NPC, -50.15, 3.98, 15.59, 2, 0)
	MovementLoopAddLocation(NPC, -33.13, 4.29, 23.86, 2, 0)
	MovementLoopAddLocation(NPC, -24.18, 4.24, 28.21, 2, 0)
	MovementLoopAddLocation(NPC, -13.78, 3.35, 31.61, 2, 0)
	MovementLoopAddLocation(NPC, -4.83, 2.99, 32.58, 2, 0)
	MovementLoopAddLocation(NPC, 2.5, 2.87, 30.41, 2, 1)
	MovementLoopAddLocation(NPC, 2.5, 2.87, 30.41, 2, 12,"Action")
	MovementLoopAddLocation(NPC, 13.95, 2.15, 26.28, 2, 0)
	MovementLoopAddLocation(NPC, 17.89, 1.86, 24.5, 2, 0)
	MovementLoopAddLocation(NPC, 32.81, 0.12, 8.92, 2, 0)
	MovementLoopAddLocation(NPC, 37.12, -0.91, 1.94, 2, 0)
	MovementLoopAddLocation(NPC, 38.32, -1.48, -4.46, 2, 1)
	MovementLoopAddLocation(NPC, 38.32, -1.48, -4.46, 2, 12,"Action")
	MovementLoopAddLocation(NPC, 38.32, -1.48, -4.46, 2, 0)
	MovementLoopAddLocation(NPC, 36.33, -0.73, 3.53, 2, 0)
	MovementLoopAddLocation(NPC, 33.25, 0.07, 8.65, 2, 0)
	MovementLoopAddLocation(NPC, 25.22, 1.1, 16.3, 2, 0)
	MovementLoopAddLocation(NPC, 18.53, 1.85, 24.14, 2, 0)
	MovementLoopAddLocation(NPC, 11.12, 2.33, 27.51, 2, 0)
	MovementLoopAddLocation(NPC, 3.96, 2.85, 30.59, 2, 0)
	MovementLoopAddLocation(NPC, 7.53, 3, 43.5, 2, 0)
	MovementLoopAddLocation(NPC, 8.56, 3, 51.12, 2, 0)
	MovementLoopAddLocation(NPC, 8.65, 3, 54.77, 2, 0)
	MovementLoopAddLocation(NPC, 1.77, 3, 57.11, 2, 0)
	MovementLoopAddLocation(NPC, 1.67, 3, 73.75, 2, 1)
	MovementLoopAddLocation(NPC, 1.67, 3, 73.75, 2, 10,"Action")
end


function Action(NPC)
    local choice = MakeRandomInt(1, 4)
    if choice == 1 then
        PlayFlavor(NPC, "", "", "peer", 0, 0, Spawn)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "", "listen", 0, 0, Spawn)
    elseif choice == 3 then
        PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
    elseif choice == 4 then
        PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    end
end 
