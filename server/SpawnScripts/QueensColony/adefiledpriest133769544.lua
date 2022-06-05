--[[
        Script Name     :       SpawnScripts/QueensColony/adefiledpriest133769544.lua
	Script Purpose	:	Waypoint Path for adefiledpriest133769544.lua
	Script Author	:	Rylec
	Script Date	:	06-26-2020 06:17:00 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
        SpawnSet(NPC, "hp", 110)
        SpawnSet(NPC, "power", 55)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 216.63, -0.76, -173.38, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 228.91, -0.8, -171.82, 2, 0)
	MovementLoopAddLocation(NPC, 250.3, -0.8, -165.68, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 220.38, -0.77, -174.66, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 218.08, -0.76, -172.24, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 228.26, -0.8, -172.12, 2, 0)
	MovementLoopAddLocation(NPC, 244.18, 0.22, -167.01, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 252.94, -1.26, -143.65, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 234.2, -0.82, -168.25, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 255.15, -1.06, -163.18, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 248.98, -0.4, -168.23, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 226.24, -0.79, -173.3, 2, 0)
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