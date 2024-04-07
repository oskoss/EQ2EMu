--[[
    Script Name    : ZoneScripts/Kugup.lua
    Script Author  : neatz09
    Script Date    : 2023.12.12 03:12:14
    Script Purpose : 
                   : 
--]]

Zone = 123
local UncoveringtheFroglokSecret = 5936

function init_zone_script(zone)
end

function player_entry(zone, player)
    	if not HasQuest(player, UncoveringtheFroglokSecret) and not HasCompletedQuest(player, UncoveringtheFroglokSecret) then
		OfferQuest(nil, player, UncoveringtheFroglokSecret)
    end
end

function enter_location(zone, spawn, grid)
end

function leave_location(zone, spawn, grid)
end

function dawn(zone)
end

function dusk(zone)
end