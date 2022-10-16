--[[
    Script Name    : SpawnScripts/IsleRefuge1/abattlewolfRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.09 05:09:54
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

	AddTimer(NPC, 800, "followsentry")      
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function followsentry(NPC)
	local zone = GetZone(NPC)
	local sentry_location = GetSpawnByLocationID(zone, 428759)

        local leaderX = GetX(sentry_location)
        local leaderY = GetY(sentry_location)
        local leaderZ = GetZ(sentry_location)
        local speed = 2
    
	if GetDistance(NPC, sentry_location) >= 2 then
		speed = 2
                MoveToLocation(NPC, leaderX, leaderY, leaderZ, speed)
	end 
	AddTimer(NPC, 1500, "followmorak")	
end