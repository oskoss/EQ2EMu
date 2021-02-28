--[[
        Script Name     :       SpawnScripts/QueensColony/adefiledpriest133769580.lua
	Script Purpose	:	Waypoint Path for adefiledpriest133769580.lua
	Script Author	:	Rylec, PlayFlavor by premierio015
	Script Date	:	06-26-2020 06:15:07 
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
	MovementLoopAddLocation(NPC, 134.26, -0.57, -214.35, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 165.96, -0.56, -211.42, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 141.54, -0.81, -218.34, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 171.81, -0.58, -217.23, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 160.25, -0.74, -207.7, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 145.78, -0.91, -217.36, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 160.45, -0.74, -207.32, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 134.2, -0.82, -217.55, 2, 0)
	MovementLoopAddLocation(NPC, 129.3, -0.81, -218.04, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 170.42, -0.58, -210.28, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, 145.92, -0.5, -210.29, 2, math.random(12, 22))
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