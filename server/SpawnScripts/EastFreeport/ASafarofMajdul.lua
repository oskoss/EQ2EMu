--[[
    Script Name    : SpawnScripts/EastFreeport/ASafarofMajdul.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 04:10:18
    Script Purpose : 
                   : 
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
		PlayFlavor(NPC, "", "It is an honor to assist you in your travels to the Isle of Ro. Please just take one of our carpets out to the boat that will take you to the Isle of Ro.", "fullcurtsey", 0, 0, Spawn, 0)
	end
end