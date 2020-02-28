--[[
	Script Name	: SpawnScripts/Baubbleshire/AlganTinmizer.lua
	Script Purpose	: Algan Tinmizer
	Script Author	: Scatman
	Script Date	: 2009.09.27
	Script Notes	: 
--]]

dofile("SpawnScripts/Generic/GenericVoiceOvers.lua")

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericHail(NPC, Spawn)
	Say(NPC, "Greetings! Looking for a bashcogglinator or perhaps a metefozic thermogauge?", Spawn)
end