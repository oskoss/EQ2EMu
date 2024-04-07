--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/anOakmystpoacher.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.20 04:10:21
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC, Spawn)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end