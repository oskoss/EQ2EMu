--[[
    Script Name    : ZoneScripts/SinkingSands.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 09:12:09
    Script Purpose : 
                   : 
--]]

local KallonsVengeance = 5938



function player_entry(Zone, Player)

end

function init_zone_script(zone)
   SetLocationProximityFunction(zone, -437.17, -76.6709, -982.485,  5, "CarpetKeeper", "Leave")   -- Twin Tears(from Port of Tears)
    SetLocationProximityFunction(zone, -1435.21, -227.165, -389.284, 5, "CarpetKeeper", "Leave") -- To Port of Tears(from Twin Tears)
     SetLocationProximityFunction(zone, -2015.96, -232.919, 602.109, 5, "CarpetKeeper", "Leave") -- To Onerock Isle( from Port of Tears)
      SetLocationProximityFunction(zone, -1435.4, -226.695, -374.085, 5, "CarpetKeeper", "Leave") -- To Port of Tears(from Undercity Arena)
        SetLocationProximityFunction(zone, -1457.96, -226.741, -399.553, 5, "CarpetKeeper", "Leave") -- To Port of Tears( from Onerock Isle)
end   





function LeaveLocation(zone, Player)
end

function enter_location(zone, spawn, grid)
end

function leave_location(zone, spawn, grid)
end

function dawn(zone)
end

function dusk(zone)
end


function CarpetKeeper(zone, Spawn)
	if IsPlayer(Spawn) and IsOnAutoMount(Spawn) then
		EndAutoMount(Spawn)
	end
end

function Leave(zone, Spawn)
end