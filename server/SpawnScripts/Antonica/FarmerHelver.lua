--[[
	Script Name		:	FarmerHelver-Say.lua
	Script Purpose	:	Farmer Helver
	Script Author	:	Jabantiz
	Script Date		:	08/29/2019
	Script Notes	:	
--]]



function spawn(NPC)

end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1052.mp3", "These farms provide a lot of necessary food to Qeynos.  It's a lot of work, but it is rewarding.", "agree", 0, 0,  Spawn)
end