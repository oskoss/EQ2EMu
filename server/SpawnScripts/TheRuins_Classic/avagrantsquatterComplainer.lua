--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterComplainer.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 03:07:27
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    IdleAngry(NPC)
end

function respawn(NPC)
    spawn(NPC)
end

function hailed(NPC, Spawn)
if not IsInCombat(NPC)then
    choice = MakeRandomInt(1,4)
    if choice ==1 then
    Say(NPC, "Don't touch me!")
    elseif choice ==2 then
    Say(NPC, "Help! Militia! I'm being harassed!")
    elseif choice ==3 then
    Say(NPC, "Mind your own damn business!  I have a right to be here, I'm not bothering nobody.")
    elseif choice ==4 then
    SendMessage(Spawn,"The vagrant squatter soils themself and continues arguing with the sky.","white")

    end
end
end