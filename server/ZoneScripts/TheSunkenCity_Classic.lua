--[[
    Script Name    : ZoneScripts/TheSunkenCity_Classic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.06.06 05:06:29
    Script Purpose : 
                   : 
--]]

function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,7.78, 0.21, -61.99, 12, "ShrineofPrexus","LeaveLocation")

end

function player_entry(Zone, Player)
      SendPopUpMessage(Player, "Sunken City", 255, 255, 255)
end

function ShrineofPrexus(Zone,Player)
      SendPopUpMessage(Player, "The Shrine of Prexus", 255, 255, 0)
    end