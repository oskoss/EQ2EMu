--[[
    Script Name    : ZoneScripts/Peatbog_Classic.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.05 04:11:32
    Script Purpose : 
                   : 
--]]

function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,667.05, -33.56, 494.87, 12, "TwoLogsPond","LeaveLocation")
end


function player_entry(Zone, Player)
      SendPopUpMessage(Player, "The Peat Bog", 230, 230, 230)
end

function TwoLogsPond(Zone,Player)
      SendPopUpMessage(Player, "Two Logs Pond", 255, 255, 0)
    end