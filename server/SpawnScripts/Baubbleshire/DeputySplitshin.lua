--[[
	Script Name	: SpawnScripts/Baubbleshire/DeputySplitshin.lua
	Script Purpose	: Deputy Splitshin <Guard>
	Script Author	: Scatman
	Script Date	: 2009.09.25
	Script Notes	: 
--]]
dofile("SpawnScripts/Generic/AdvancementGaze.lua")
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
    if GetFactionAmount(Spawn,11)>=5000 then
        if GetLevel(Spawn) ==8 or GetLevel(Spawn)==9 then
        ClassCheck(NPC,Spawn)
        end
    end
    if math.random(0, 100) <= 20 then
		FaceTarget(NPC, Spawn)
		GenericGuardHail(NPC, Spawn)
	else
		CheckFaction(NPC, Spawn, "Qeynos")
	end
end

function LeaveRange(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericGuardHail(NPC, Spawn)
end