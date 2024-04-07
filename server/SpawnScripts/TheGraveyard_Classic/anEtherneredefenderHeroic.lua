--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEtherneredefenderHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.17 07:08:41
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	SendMessage(Spawn,"The defender looks at you with a tired, but determined, stare. Unwavered from its duties.","white")
end

function respawn(NPC)
	spawn(NPC)
end