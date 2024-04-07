--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/anOakmystgreatbear.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 03:10:47
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