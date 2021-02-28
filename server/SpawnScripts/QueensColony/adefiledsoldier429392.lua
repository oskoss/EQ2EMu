--[[
        Script Name     :       SpawnScripts/QueensColony/adefiledsoldier429392.lua
	Script Purpose	:	Waypoint Path for adefiledsoldier429392.lua
	Script Author	:	Rylec
	Script Date	:	06-26-2020 06:17:00 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 213.02, -0.74, -177.46, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 219.73, -0.77, -170.84, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 226.06, -0.79, -168.17, 2, 0)
	MovementLoopAddLocation(NPC, 233.13, -0.82, -167.49, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 239.19, -0.66, -177.45, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 239.17, -0.66, -161.62, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 237.84, -0.84, -144.72, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 247.84, -0.37, -175.64, 2, 0)
	MovementLoopAddLocation(NPC, 247.88, -0.43, -178.66, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 245.4, 0.18, -170.93, 2, math.random(12, 22))
end

function aggro(NPC, Spawn)
        math.randomseed(os.time())
        local choice = math.random (1,3)

        if choice == 1 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_aggro_18d1544d.mp3", "As I rise from the grave,  you will now take my place!", "", 485726074, 3646499350, Spawn)
        elseif choice == 2 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_aggro_daf16808.mp3", "To the grave with you!", "", 958122326, 1810359159, Spawn)
        else
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_aggro_c6c2672d.mp3", "Brains! It's what's for dinner.", "", 2091371377, 2422178491, Spawn)
        end
end

function death(NPC, Spawn)
        math.randomseed(os.time())
        local choice = math.random(1,2)

        if choice == 1 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_death_bb6b2b8e.mp3", "You cannot eliminate us!", "", 897103301, 541292352, Spawn)
        else
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_death_edc04fb8.mp3", "That pile of bones was my friend!", "", 2317728806, 1758283676, Spawn)
        end
end