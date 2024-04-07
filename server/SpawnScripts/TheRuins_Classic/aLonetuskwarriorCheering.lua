--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aLonetuskwarriorCheering.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.04 07:07:20
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/LoneTusk2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    OrcArmorCommon(NPC)
    Lonetusk(NPC)
    AddTimer(NPC,MakeRandomInt(1000,3500),"EmoteLoop")
end

function EmoteLoop(NPC,Spawn)
    local zone = GetZone(NPC)
    local Dancer = GetSpawnByLocationID(zone,133785473)
if IsInCombat(NPC)==false then
    if Dancer ~=nil and IsAlive(Dancer)then
        choice = MakeRandomInt(1,3)
        if choice == 1 then
            PlayFlavor(NPC,"","","cheer",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","woowoo",0,0)        
        elseif choice == 3 then
            PlayFlavor(NPC,"","","happy",0,0)  
        end
    else
        choice = MakeRandomInt(1,3)
        if choice == 1 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","grumble",0,0)        
        elseif choice == 3 then
            PlayFlavor(NPC,"","","peer",0,0)
        end
    end
end
    AddTimer(NPC, MakeRandomInt(5500,8500),"EmoteLoop")
end

function respawn(NPC)
	spawn(NPC)
end

