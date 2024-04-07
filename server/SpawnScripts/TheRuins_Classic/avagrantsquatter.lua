--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatter.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.06 04:07:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleBeggar(NPC)
    human(NPC)
end

function respawn(NPC)
    spawn(NPC)
end
