--[[
    Script Name    : ZoneScripts/Oakmyst_Classic.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.19 02:10:59
    Script Purpose : 
                   : 
--]]

function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,924.78, 2.03, -270.69, 12, "ClearwaterPond","LeaveLocation")
end

function player_entry(Zone, Player)
      SendPopUpMessage(Player, "Oakmyst Forest", 255, 255, 255)
end

function ClearwaterPond(Zone,Player)
      SendPopUpMessage(Player, "Clearwater Pond", 255, 255, 0)
    end