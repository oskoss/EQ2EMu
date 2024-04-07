--[[
    Script Name    : ZoneScripts/The Sprawl.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.06.06 05:06:44
    Script Purpose : 
                   : 
--]]

function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,49.83, 3.05, 108.07, 12, "MagusMill","LeaveLocation")

end

function player_entry(Zone, Player)
      SendPopUpMessage(Player, "The Sprawl", 255, 255, 255)
end

function MagusMill(Zone,Player)
      SendPopUpMessage(Player, "The Black Magus Mill", 255, 255, 0)
    end