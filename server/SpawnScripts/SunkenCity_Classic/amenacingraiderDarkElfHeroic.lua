--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/amenacingraiderDarkElfHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.27 08:10:53
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
    Appearance(NPC)
    SpawnSet(NPC, "heroic", 1)
     SetSeeHide(NPC,1)
    local Level = GetLevel(NPC)
    local level1 = 7
    local level2 = 8
    local difficulty1 = 6
    local hp1 = 200
    local power1 = 90
    local difficulty2 = 6
    local hp2 = 240
    local power2 = 100
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
AddTimer(NPC,MakeRandomInt(3500,10000),"EmoteLoop")
end

function EmoteLoop(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,6)
        if choice == 1 then
            PlayFlavor(NPC,"","","sniff",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","stare",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","ponder",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","chuckle",0,0)
        elseif choice == 6 then
            PlayFlavor(NPC,"","","brandish",0,0)
            end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"EmoteLoop")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Appearance(NPC)
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",116)    
    else
    SpawnSet(NPC,"model_type",115)    
    end
end