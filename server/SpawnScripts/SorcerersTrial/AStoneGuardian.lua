--[[
    Script Name    : SpawnScripts/SorcerersTrial/AStoneGuardian.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.13 04:11:01
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGolem1.lua")
dofile("SpawnScripts/SorcerersTrial/dpoinvisiblecube.lua")
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)


end


function respawn(NPC)
	spawn(NPC)
end

function death(NPC,Spawn)
    AddTimer(NPC,1800,"DespawnAnim",1,Spawn)
    ApplySpellVisual(NPC,101)
    local zone = GetZone(Spawn)
    local Ring = GetSpawnByLocationID(zone,133780600)
    if Ring ~= nil then
        Trial2Done(Ring,Spawn)
    end
end

function DespawnAnim(NPC,Spawn)
Despawn(NPC)
end