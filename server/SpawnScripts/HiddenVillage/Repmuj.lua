--[[
	Script Name		: SpawnScripts/TheHiddenVillageofKugup/Repmuj.lua
	Script Purpose	: Repmuj
	Script Author	: neatz09
	Script Date		: 2023.12.13
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
    

    
function spawn(NPC)

end

function hailed(NPC, Player)
--two movement scripts
end

function respawn(NPC)
	spawn(NPC)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,2)

	if choice == 1 then
		PlayFlavor(NPC, "", "Stop fooling around and gimme it Reppoh!", "", 0, 0, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "", "REPPOH GIVE ME MY BALL!", "", 0, 0, Spawn, 0)
	end
end