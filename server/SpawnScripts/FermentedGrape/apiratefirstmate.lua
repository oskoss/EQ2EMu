--[[
    Script Name    : SpawnScripts/FermentedGrape/apiratefirstmate.lua
    Script Author  : Dorbin
    Script Date    : 2022.12.04 01:12:37
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)

AddTimer(NPC,MakeRandomInt(2000,5000),"EmoteLoop")
end

function EmoteLoop(NPC)
     if not IsInCombat(NPC) then
   SpawnSet(NPC,"mood_state",11852)
    choice = MakeRandomInt(1,5)
    if choice ==1 then
    PlayFlavor(NPC,"","","threaten",0,0)
    elseif choice ==2 then
    PlayFlavor(NPC,"","","taunt",0,0)
    elseif choice ==3 then
    PlayFlavor(NPC,"","","grumble",0,0)        
    elseif choice ==4 then
    PlayFlavor(NPC,"","","chuckle",0,0)   
    elseif choice ==5 then
    PlayFlavor(NPC,"","","point",0,0) 
    end
    end
    AddTimer(NPC,6000,"EmoteLoop")
end

function respawn(NPC)
	spawn(NPC)
end

function aggro(NPC,Spawn)
	PlayFlavor(NPC, "voiceover/english/halfelf_eco_farsea_1/ft/service/guard/halfelf_guard_service_farsea_1_hail_gf_2b42c14f.mp3", "After twelve weeks at sea, bashing the head of a nosy landlubber sounds quite appealing!", "threaten", 1936614211, 2469553737, Spawn, 0)
end    


function death(NPC,Spawn)
local zone = GetZone(NPC)
local Pirate1 = GetSpawnByLocationID(zone, 133781037) --FIRSTMATE  
local Pirate2 = GetSpawnByLocationID(zone, 133781036) --CUTTER  
local Pirate3 = GetSpawnByLocationID(zone, 133781038)   
local Pirate4 = GetSpawnByLocationID(zone, 133781039)   
local Pirate5 = GetSpawnByLocationID(zone, 133781035)   
local Pirate6 = GetSpawnByLocationID(zone, 133781034)   
local Captain = GetSpawnByLocationID(zone, 133781033)

local Bartender = GetSpawnByLocationID(zone, 133781031)  
local Bard = GetSpawnByLocationID(zone, 133781032)  
local Bobick = GetSpawnByLocationID(zone, 133781027)  

if not IsAlive(Pirate1) and not IsAlive(Pirate2) and not IsAlive(Pirate3) and not IsAlive(Pirate4) and not IsAlive(Pirate5) and not IsAlive(Pirate6) and not IsAlive(Captain) then
    if HasQuest(Spawn,5784) then
    SetStepComplete(Spawn,5784,1)
    end
SpawnSet(Bartender,"name","a relieved bartender")
SpawnSet(Bartender,"mood_state",0)
SpawnSet(Bartender,"action_state",11214)
SpawnSet(Bard,"name","a thankful bard")
SpawnSet(Bard,"mood_state",11854)
SpawnSet(Bard,"action_state",0)
SpawnSet(Bobick,"action_state",11422)
SpawnSet(Bobick,"name","a satisfied patron")
end
end
