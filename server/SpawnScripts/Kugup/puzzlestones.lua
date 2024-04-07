--[[
    Script Name    : SpawnScripts/Kugup/puzzlestones.lua
    Script Author  : neatz09
    Script Date    : 2023.11.23 02:11:03
    Script Purpose : handles platforms you place the troll statues on in kugup
                   : 
--]]

local ThePuzzledTactician = 5930

function spawn(NPC)
end

function casted_on(NPC, Spawn, Message)
    if GetSpawnLocationID(NPC) == 459555 and Message == "Examine" then
        SendMessage(Spawn, "This is where I am supposed to place the totem for the troll who ate the least cats...", "white")
    elseif GetSpawnLocationID(NPC) == 459554 and Message == "Examine" then
        SendMessage(Spawn, "This is where I am supposed to place the totem for the troll who ate the fourth most cats...", "white")
    elseif GetSpawnLocationID(NPC) == 459553 and Message == "Examine" then
        SendMessage(Spawn, "This is where I am supposed to place the totem for the troll who ate the third most cats...", "white")
    elseif GetSpawnLocationID(NPC) == 459552 and Message == "Examine" then
        SendMessage(Spawn, "This is where I am supposed to place the totem for the troll who ate the second most cats...", "white")
    elseif GetSpawnLocationID(NPC) == 459551 and Message == "Examine" then
        SendMessage(Spawn, "This is where I am supposed to place the totem for the troll who ate the most cats...", "white")
    end
end

function respawn(NPC)
	spawn(NPC)
end
