--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullscoutSneak.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.16 02:01:16
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    SetSeeHide(NPC,1)
end
function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end