--[[
        Script Name     :       SpawnScripts/QueensColony/afallenpirate429920.lua
	Script Purpose	:	Waypoint Path for afallenpirate429920.lua
	Script Author	:	Rylec, VO by Premierio015
	Script Date	:	07-28-2020 10:35:22 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
        SpawnSet(NPC, "difficulty", "6") 
        SpawnSet(NPC, "hp", 150)
        SpawnSet(NPC, "power", 80)

	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -128.72, 4.55, -68.9, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -132.27, 4.37, -85.18, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -120.07, 4.18, -77.14, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -126.08, 4.54, -84.99, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -131.16, 4.41, -51.63, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -119.98, 4.43, -82.69, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -134.78, 4.57, -58.76, 2, math.random(12, 22))
	MovementLoopAddLocation(NPC, -133.97, 4.49, -60.34, 2, 0)
	MovementLoopAddLocation(NPC, -129.9, 4.55, -78.77, 2, math.random(12, 22))
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
     	if IsPlayer(Spawn) then
		local chance = math.random(1, 100)
		if chance <= 35 then
			local skull = SpawnMob(GetZone(Spawn), 2530192, false, GetX(NPC), GetY(NPC), GetZ(NPC))
			if skull ~= nil then
				SpawnSet(skull, "expire", "1000")
			end
	    end
	end
    
    math.randomseed(os.time())
        local choice = math.random(1,2)

        if choice == 1 then
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_death_bb6b2b8e.mp3", "You cannot eliminate us!", "", 897103301, 541292352, Spawn)
        else
                PlayFlavor(NPC, "voiceover/english/optional3/skeleton_base_2/ft/skeleton/skeleton_base_2_1_death_edc04fb8.mp3", "That pile of bones was my friend!", "", 2317728806, 1758283676, Spawn)
        end
end