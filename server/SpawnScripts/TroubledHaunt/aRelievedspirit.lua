--[[
    Script Name    : SpawnScripts/TroubledHaunt/aRelievedspirit.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.23 06:09:46
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)


end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end