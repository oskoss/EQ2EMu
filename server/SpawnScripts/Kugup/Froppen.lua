--[[
	Script Name		: SpawnScripts/TheLostVillageofKugup/Froppen.lua
	Script Purpose	: Froppen
	Script Author	: neatz09
	Script Date		: 2023.11.23
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,1)

	if choice == 1 then
		PlayFlavor(NPC, "", "You're doing great, son! I'm so proud of you!", "", 0, 0, Spawn, 0)
	end
end