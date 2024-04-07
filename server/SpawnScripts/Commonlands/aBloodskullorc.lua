--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullorc.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 05:01:02
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    setclass(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function setclass(NPC, Spawn)
    class = MakeRandomInt(1,2)
    if class == 1 then
        SpawnSet(NPC, "class", 32)
    elseif class == 2 then
        SpawnSet(NPC, "class", 38)
    end
end