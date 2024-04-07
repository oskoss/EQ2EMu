--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/Madeline.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.19 02:10:08
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/AdvancementGaze.lua")
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericGuardHail(NPC, Spawn)
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