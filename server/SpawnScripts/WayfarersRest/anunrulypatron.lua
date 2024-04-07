--[[
    Script Name    : SpawnScripts/WayfarersRest/anunrulypatron.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.14 05:11:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)

AddTimer(NPC,MakeRandomInt(2000,5000),"EmoteLoop")
end

function EmoteLoop(NPC)
local zone = GetZone(NPC)
local Darkelf = GetSpawnByLocationID(zone, 133780688)   
if not IsInCombat(NPC) and IsAlive(NPC)then
if IsAlive(Darkelf) then
    SpawnSet(NPC, "attackable", 1)
    SpawnSet(NPC, "show_level", 1)
    SpawnSet(NPC,"mood_state",11852)
    SpawnSet(NPC,"name","an unrly patron")
    choice = MakeRandomInt(1,5)
    if choice ==1 then
    PlayFlavor(NPC,"","","kick",0,0)
    elseif choice ==2 then
    PlayFlavor(NPC,"","","attack",0,0)
    elseif choice ==3 then
    PlayFlavor(NPC,"","","howl",0,0)        
    elseif choice ==4 then
    PlayFlavor(NPC,"","","shakefist",0,0)   
    elseif choice ==5 then
    PlayFlavor(NPC,"","","cackle",0,0) 
    end
    AddTimer(NPC,4000,"EmoteLoop")
elseif not IsAlive(Darkelf) then 
    SpawnSet(NPC, "attackable", 0)
    SpawnSet(NPC, "show_level", 0)
    AddTimer(NPC,7000,"EmoteLoop")
    SpawnSet(NPC,"name","a recovered patron")
    SpawnSet(NPC,"mood_state",0)
    choice = MakeRandomInt(1,5)
    if choice ==1 then
    PlayFlavor(NPC,"","","confused",0,0)
    elseif choice ==2 then
    PlayFlavor(NPC,"","","doh",0,0)
    elseif choice ==3 then
    PlayFlavor(NPC,"","","sigh",0,0)        
    elseif choice ==4 then
    PlayFlavor(NPC,"","","wince",0,0)  
    elseif choice ==5 then
    PlayFlavor(NPC,"","","whome",0,0) 
    end
end
end
end

function respawn(NPC)
	spawn(NPC)
end

function aggro(NPC,Spawn)
local zone = GetZone(NPC)
local Darkelf = GetSpawnByLocationID(zone, 133780688)  
if IsAlive(Darkelf) and not HasLanguage(Spawn,1) then
	PlayFlavor(NPC, "voiceover/english/barbarian_eco_good_1/ft/barbarian/barbarian_eco_good_1_garbled_gf_f8c9923f.mp3", "Try not to screw up my fist with your face.", "", 653161975, 3035939203, Spawn,1)
    else
	PlayFlavor(NPC, "voiceover/english/barbarian_base_1/ft/barbarian/barbarian_base_1_1_aggro_gf_d2336620.mp3", "Your overconfidence will be your undoing!", "",2263836674, 942538899, Spawn, 1)
end
end

function victory(NPC,Spawn)
    PlayFlavor(NPC, "voiceover/english/barbarian_base_1/ft/barbarian/barbarian_base_1_1_victory_gf_f87005b5.mp3", "Now you will have peace!", "",  2974774059, 665726799, Spawn)
end