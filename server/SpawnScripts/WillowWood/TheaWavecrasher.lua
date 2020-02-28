--[[
	Script Name	: SpawnScripts/WillowWood/TheaWavecrasher.lua
	Script Purpose	: Thea Wavecrasher <Tailor>
	Script Author	: Scatman
	Script Date	: 2009.09.25
	Script Notes	: 
--]]

dofile("SpawnScripts/Generic/GenericWeaponsmithVoiceOvers.lua")

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericWeaponsmithHail(NPC, Spawn, "good")
end