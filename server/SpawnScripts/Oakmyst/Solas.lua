--[[
	Script Name	: SpawnScripts/Oakmyst/Solas.lua
	Script Purpose	: Solas <Guard>
	Script Author	: Scatman
	Script Date	: 2009.10.08
	Script Notes	: 
--]]

dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericGuardHail(NPC, Spawn)
end