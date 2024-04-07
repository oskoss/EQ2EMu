--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/Srit.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.30 07:10:36
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
    SetSeeHide(NPC,1)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end