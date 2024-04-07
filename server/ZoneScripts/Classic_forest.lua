--[[
    Script Name    : ZoneScripts/Classic_forest.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.10 10:10:12
    Script Purpose : 
                   : 
--]]

function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,1083.63, -3.04, -777.39, 12, "MageTower","LeaveLocation")
end

function player_entry(Zone, Player)
      SendPopUpMessage(Player, "The Forest Ruins", 255, 255, 255)
end

function MageTower(Zone,Player)
      SendPopUpMessage(Player, "The Ruined Mage Tower", 255, 255, 0)
    end