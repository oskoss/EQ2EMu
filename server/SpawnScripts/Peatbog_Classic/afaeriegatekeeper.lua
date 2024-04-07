--[[
    Script Name    : SpawnScripts/Peatbog_Classic/afaeriegatekeeper.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.05 04:11:18
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Fairy_PeatBog.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
	SetPlayerProximityFunction(NPC, 8, "InRange", "LeaveRange")
end

function InRange(NPC, Spawn)
    local invul = IsInvulnerable(Spawn)

    if GetLevel(Spawn)<20 and not IsInCombat(NPC) and GetFactionAmount(Spawn,365) >-40000 and invul == false  then
        if GetSpawnLocationID(NPC)== 133779861 or GetSpawnLocationID(NPC) == 133779859 then
        Attack(NPC,Spawn)
        SendPopUpMessage(Spawn,"The bog faerie gatekeepers don't take kindly to trespassers.",200,0,0)
        end
    end    
end


function respawn(NPC)
	spawn(NPC)
end