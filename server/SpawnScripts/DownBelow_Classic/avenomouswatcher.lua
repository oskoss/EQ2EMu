--[[
    Script Name    : SpawnScripts/DownBelow_Classic/avenomouswatcher.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.09 09:01:24
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end