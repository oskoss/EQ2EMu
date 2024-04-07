--[[
    Script Name    : ZoneScripts/DownBelow_Classic.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.09 03:11:52
    Script Purpose : 
                   : 
--]]

function init_zone_script(Zone)
    SetLocationProximityFunction(Zone,7.19, 0.30, -140.27, 17, "ShrineofEstle","LeaveLocation")
end

function ShrineofEstle(Zone,Player)
      SendPopUpMessage(Player, "The Shrine of Estle", 255, 255, 0)
    end

function player_entry(Zone, Player)
SendPopUpMessage(Player, "The Down Below", 230, 230, 230)
SendMessage(Player, "You have entered The Down Below.")
local choice = MakeRandomInt(1,3)
if choice == 1 then
SendMessage(Player, "A foul breeze brushes your cheek as the stench of death envelops you.")
elseif choice == 2 then
SendMessage(Player, "The scraping of bone can be heard in the distance.")
elseif choice == 3 then
SendMessage(Player, "Noises echo from creatures in distant chambers, natural and unnatural.")
end
end

