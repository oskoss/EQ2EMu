--[[
    Script Name    : SpawnScripts/Antonica/astonejawlizard.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.27 08:07:52
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end