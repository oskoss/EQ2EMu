--[[
    Script Name    : SpawnScripts/TheRuins_Classic/afairyseeker.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.06 07:07:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

local zone = GetZone(NPC)
local SpawnLocation = GetSpawnLocationID(NPC)
if SpawnLocation == 133785610 or  SpawnLocation == 133785611 then
    AddTimer(NPC,2000,"following_Xel")
elseif SpawnLocation == 133785614 or  SpawnLocation == 133785615 then
    AddTimer(NPC,2000,"following_Wele")
end
end

function following_Xel(NPC)
	local zone = GetZone(NPC)
 	local SpawnLocation = GetSpawnLocationID(NPC)
   local Xel = GetSpawnByLocationID(zone, 133785612)
    local Xel_X = GetX(Xel)
    local Xel_Y = GetY(Xel)
    local Xel_Z = GetZ(Xel)
    
    local speed = 2

    if  Xel ~=nil then   
    if SpawnLocation == 133785610 then --Xel Fairy 1
		if GetDistance(NPC, Xel) >= 8 then
			speed = 5
			MoveToLocation(NPC, Xel_X - 2, Xel_Y+1.5, Xel_Z, speed)
		else
			speed = 2
			MoveToLocation(NPC, Xel_X - 2, Xel_Y+1.5, Xel_Z, speed)
		end 
	elseif SpawnLocation == 133785611 then --Xel Fairy 2
		if GetDistance(NPC, Xel) >= 8 then
			speed = 5
			MoveToLocation(NPC, Xel_X, Xel_Y+1.5, 2+ Xel_Z, speed)
		else
			speed = 2
			MoveToLocation(NPC, Xel_X, Xel_Y+1.5, 2+ Xel_Z, speed)
		end 
    end
    else
    Despawn(NPC)
    end
        speed = 2
	AddTimer(NPC, 2000, "following_Xel")	
end


function following_Wele(NPC)
	local zone = GetZone(NPC)
	local SpawnLocation = GetSpawnLocationID(NPC)
    local Wele = GetSpawnByLocationID(zone, 133785613)

    local Wele_X = GetX(Wele)
    local Wele_Y = GetY(Wele)
    local Wele_Z = GetZ(Wele)
    
    local speed = 2


    if  Wele ~=nil then   
    if SpawnLocation == 133785614 then --Wele Fairy 1
		if GetDistance(NPC, Wele) >= 8 then
			speed = 5
			MoveToLocation(NPC, Wele_X - 2, Wele_Y+1.5, Wele_Z, speed)
		else
			speed = 2
			MoveToLocation(NPC, Wele_X - 2, Wele_Y+1.5, Wele_Z, speed)
		end 
	elseif SpawnLocation == 133785615 then --Wele Fairy 2
		if GetDistance(NPC, Wele) >= 8 then
			speed = 5
			MoveToLocation(NPC, Wele_X, Wele_Y+1.5, 2+ Wele_Z, speed)
		else
			speed = 2
			MoveToLocation(NPC, Wele_X, Wele_Y+1.5, 2+ Wele_Z, speed)
		end 
    end
    else
    Despawn(NPC)
    end
        speed = 2
	AddTimer(NPC, 2000, "following_Wele")	
end


function respawn(NPC)
	spawn(NPC)
end