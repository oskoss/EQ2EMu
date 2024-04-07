--[[
	Script Name		: SpawnScripts/TheHiddenVillageofKugup/Ms.Grupp.lua
	Script Purpose	: Ms. Grupp
	Script Author	: neatz09
	Script Date		: 2023.12.12
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,1)

	if choice == 1 then
		PlayFlavor(NPC, "", "You boys look so handsome in your little uniforms...", "", 0, 0, Spawn, 0)
	end
end