--[[
	Script Name		: SpawnScripts/TheLostVillageofKugup/Ms.Grupp.lua
	Script Purpose	: Ms. Grupp
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
	local choice = MakeRandomInt(1,2)

	if choice == 1 then
		PlayFlavor(NPC, "", "Keep it up boys! You'll show those Rallosians who's boss!", "", 0, 0, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "", "Nicely done boys!", "", 0, 0, Spawn, 0)
	end
end