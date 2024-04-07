--[[
	Script Name		: SpawnScripts/LongshadowAlley/PThek.lua
	Script Purpose	: P`Thek
	Script Author	: torsten
	Script Date		: 2022.07.20
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]


require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "ponder")
end



function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if GetFactionAmount(Spawn,12) >0 then
    Dialog1(NPC, Spawn)
	else
    PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_notcitizen_gf_6da83eeb.mp3", "I'll defend myself if it comes to that, savage.", "", 3357669916, 1930978996, Spawn)
    end	    
end

function Dialog1(NPC, Spawn)
	local choice = MakeRandomInt(1,2)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/scribe/darkelf_scribe_service_evil_1_hail_gf_8de85b9c.mp3", "Perhaps I could interest you in our necromantic line of spells?  ", "agree", 3172095768, 4205908579, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/scribe/darkelf_scribe_service_evil_1_hail_gf_250b4da0.mp3", "So are you planning to master your art at the academy?  We keep all of the required supplies right here!", "ponder", 3527012076, 2949477702, Spawn, 0)
	end
end