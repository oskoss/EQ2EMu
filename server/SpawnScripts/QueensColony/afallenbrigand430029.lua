--[[
        Script Name     :       SpawnScripts/QueensColony/afallenbrigand430029.lua
	Script Purpose	:	Waypoint Path for afallenbrigand430029.lua
	Script Author	:	Rylec, VO by Premierio015
	Script Date	:	07-28-2020 10:35:22 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
        SpawnSet(NPC, "difficulty", "6") 
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -113.71, 4.46, -95.29, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -126.03, 4.33, -95.35, 2, 0)
	MovementLoopAddLocation(NPC, -130.03, 4.36, -94.15, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -112.16, 4.3, -102.93, 2, 0)
	MovementLoopAddLocation(NPC, -102.32, 4.26, -113.81, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -119.56, 5.28, -104.61, 2, 0)
	MovementLoopAddLocation(NPC, -124.92, 4.54, -99.86, 2, 0)
	MovementLoopAddLocation(NPC, -130.89, 4.56, -99.5, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -122.33, 4.52, -66.6, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -125.03, 4.54, -83.14, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -133.78, 4.37, -91.34, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -118.73, 5.24, -105.38, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -120.65, 5.26, -103.36, 2, 0)
	MovementLoopAddLocation(NPC, -142.3, 4.3, -91.18, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -138.68, 4.59, -91.04, 2, 0)
	MovementLoopAddLocation(NPC, -134.33, 4.37, -87.01, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -140.94, 4.4, -78.71, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -138.85, 4.49, -76.16, 2, 0)
	MovementLoopAddLocation(NPC, -132.36, 4.37, -64.72, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -118.87, 4.52, -93.08, 2, 0)
end

function aggro(NPC, Spawn)
        math.randomseed(os.time())
        local choice = math.random (1,6)

        if choice == 1 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_aggro_18d1544d.mp3", "As I rise from the grave,  you will now take my place!", "", 485726074, 3646499350, Spawn)
        elseif choice == 2 then
                PlayFlavor(NPC, "voiceover/english/skeleton_base_1/ft/skeleton/skeleton_base_1_1_aggro_c77d7bff.mp3", "Your eyes are so pretty.", "", 1412152942, 873988632, Spawn)
        elseif choice == 3 then
                PlayFlavor(NPC, "voiceover/english/skeleton_base_1/ft/skeleton/skeleton_base_1_1_aggro_2168c5.mp3", "Seek death and it finds you.", "", 2988489621, 1045543573, Spawn)
        elseif choice == 4 then
                PlayFlavor(NPC, "voiceover/english/skeleton_base_1/ft/skeleton/skeleton_base_1_1_aggro_8bc7a2cc.mp3", "Your blood calls to me.", "", 1242322025, 1154999668, Spawn) 
        elseif choice == 5 then
                PlayFavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_aggro_daf16808.mp3", "To the grave with you!", "", 958122326, 1810359159, Spawn)
        elseif choice == 6 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_aggro_c6c2672d.mp3", "Brains! It's what's for dinner.", "", 2091371377, 2422178491, Spawn)
        end
end

function death(NPC, Spawn)
        math.randomseed(os.time())
        local choice = math.random(1,4)

        if choice == 1 then
                PlayFlavor(NPC, "voiceover/english/skeleton_base_1/ft/skeleton/skeleton_base_1_1_death_ff39f327.mp3", "Final death comes at last.", "", 3768284332, 62777040, Spawn)
        elseif choice == 2 then
                PlayFlavor(NPC, "voiceover/english/skeleton_base_1/ft/skeleton/skeleton_base_1_1_death_fbcb503b.mp3", "Rest in peace.", "", 3591309093, 1423656405, Spawn)
        elseif choice == 3 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_death_bb6b2b8e.mp3", "You cannot eliminate us!", "", 897103301, 541292352, Spawn)
        elseif choice == 4 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_death_edc04fb8.mp3", "That pile of bones was my friend!", "", 2317728806, 1758283676, Spawn)
        end
end