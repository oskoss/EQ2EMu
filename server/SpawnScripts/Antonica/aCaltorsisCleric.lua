--[[
    Script Name    : SpawnScripts/Antonica/aCaltorsisCleric.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.05 09:07:26
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGhost1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Appearance(NPC)
    IdlePriest(NPC)
end


function Appearance(NPC)
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",2851)    
    else
    SpawnSet(NPC,"model_type",2852)    
    end
end

function respawn(NPC)
	spawn(NPC)
end