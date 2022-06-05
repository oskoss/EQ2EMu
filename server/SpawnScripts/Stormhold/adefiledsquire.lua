--[[
    Script Name    : SpawnScripts/Stormhold/adefiledsquire.lua
    Script Author  : Premierio015
    Script Date    : 2022.04.17 12:04:39
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
local MobLevel = GetLevel(NPC)    
if MobLevel == 17 then
SpawnSet(NPC, "hp", 2463)
SpawnSet(NPC, "power", 742)
end
   end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end