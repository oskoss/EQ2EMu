--[[
        Script Name     :       SpawnScripts/QueensColony/alostscout1587677.lua
	Script Purpose	:	Waypoint Path for alostscout1587677.lua
	Script Author	:	Jabantiz (movement by Rylec and play flavor by Premierio015)
	Script Date	:	06-01-2020 10:07:23 
	Script Notes	:	Locations collected from Live
--]]

local JoiningTheForwardRanks = 163

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	voice = math.random (1,3)
    PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_"..voice.."_1001.mp3", "", "hello", 0, 0, Spawn)
end

function respawn(NPC)
    spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 259.81, -6.83, 100.99, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 269.75, -5.84, 108.98, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 237.18, -6.03, 117.39, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 253.33, -7.03, 89.93, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 253.47, -6.83, 100.81, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 244.75, -7.05, 87.51, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 257.13, -6.38, 81.87, 2, math.random(14, 28))
	MovementLoopAddLocation(NPC, 241.25, -6.59, 76.68, 2, 0)
	MovementLoopAddLocation(NPC, 237.41, -6.41, 76.52, 2, math.random(14, 28))
end

function casted_on(NPC, Spawn, Message)
	local Cleric = GetSpawn(NPC, 2530111)
	if Message == "Divine Smite" and CompareSpawns(Spawn, Cleric) then
		local newScout = SpawnMob(GetZone(NPC), 2530196, false, GetX(NPC), GetY(NPC), GetZ(NPC), GetHeading(NPC))
		if newScout ~= nil then
			CopySpawnAppearance(newScout, NPC)
			SpawnSet(newScout, "visual_state", "0")
            SpawnSet(newScout, "attackable", "false")
			AddTimer(newScout, 5000, "Speak")
		end
		local mostHated = GetMostHated(NPC)
		if mostHated ~= nil and IsPlayer(mostHated) then
			if HasQuest(mostHated, JoiningTheForwardRanks) and GetQuestStep(mostHated, JoiningTheForwardRanks) == 2 then
				AddStepProgress(mostHated, JoiningTheForwardRanks, 2, 1)
			end
		end
		Despawn(NPC)
	end
end

function aggro(NPC, Spawn)
    if not IsPlayer(Spawn) then
        return
    end
    
	if not HasLanguage(Spawn, 1) then  -- IF PLAYER DOESN'T SPEAK HALASIAN THEN HE WILL HEAR THOSE VOICEOVERS.
		local choice = math.random(1, 2)
		if choice == 1  then
          PlayFlavor(NPC, "voiceover/english/optional3/barbarian_outland/ft/barbarian/barbarian_outland_1_garbled_gf_b80c3123.mp3", "Asfkher van baed rijs prakti kjen", "", 3736519483, 298405430, Spawn, 1)
        else
          PlayFlavor(NPC, "voiceover/english/optional3/barbarian_outland/ft/barbarian/barbarian_outland_1_garbled_gf_b0cb46d4.mp3", "Neit te geb ruiken, wat weg hout u hetten", "", 3553301683, 4073612943, Spawn, 1)
        end
    elseif HasLanguage(Spawn, 1) then
        local choice = math.random(1, 2)
        if choice == 1  then
            PlayFlavor(NPC, "voiceover/english/optional3/barbarian_outland/ft/barbarian/barbarian_outland_1_aggro_gf_5cbe779b.mp3", "Enemies approach!", "", 991095436, 863644706, Spawn,1)
        else
            PlayFlavor(NPC, "voiceover/english/optional3/barbarian_outland/ft/barbarian/barbarian_outland_1_aggro_gf_9ed7a064.mp3", "This is what we were trained for!  Do not fail in your duty!", "", 3130720919, 1154579014, Spawn,1)      
        end
    end
end