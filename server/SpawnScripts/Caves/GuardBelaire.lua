--[[
	Script Name	: SpawnScripts/Caves/GuardBelaire.lua
	Script Purpose	: Guard Belaire <Guard>
	Script Author	: Scatman
	Script Date	: 2009.10.08
	Script Notes	: 
--]]
dofile("SpawnScripts/Generic/AdvancementGaze.lua")
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end

function InRange(NPC, Spawn)
  if GetFactionAmount(Spawn,11)>=5000 then
    if GetLevel(Spawn) ==8 or GetLevel(Spawn)==9 then
    ClassCheck(NPC,Spawn)
    end
    end
    if GetFactionID(Spawn) ==1 then 
        Attack(NPC,Spawn)
    end
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericGuardHail(NPC, Spawn)
end