--[[
	Script Name	: SpawnScripts/Graystone/Frerin.lua
	Script Purpose	: Frerin <Guard>
	Script Author	: John Adams/Scatman
	Script Date	: 2008.09.21
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/AdvancementGaze.lua")
function spawn(NPC)
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
    GenericEcologyHail(NPC, Spawn, faction)
    end