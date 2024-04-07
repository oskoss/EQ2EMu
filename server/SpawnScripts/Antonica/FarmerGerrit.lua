--[[
    Script Name    : SpawnScripts/Antonica/FarmerGerrit.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.17 02:09:44
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_1_1052.mp3", "These farms help Qeynos get the food it needs to help function.  It's a hard life sometimes, but well worth it.", "agree", 0, 0, Spawn, 0)
end
