--[[
    Script Name    : ZoneScripts/TempleSt.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 07:10:20
    Script Purpose : 
                   : 
--]]
function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,38.46, 3.04, 95.59, 15, "DefiledTemple","LeaveLocation")

end

function player_entry(Zone, Player)
      SendPopUpMessage(Player, "Temple Street", 255, 255, 255)
end

function DefiledTemple(Zone,Player)
      SendPopUpMessage(Player, "The Defiled Temple", 255, 255, 0)
    end