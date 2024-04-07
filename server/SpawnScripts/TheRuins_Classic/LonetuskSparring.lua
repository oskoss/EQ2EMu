--[[
    Script Name    : SpawnScripts/TheRuins_Classic/LonetuskSparring.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.04 08:07:34
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
    AddTimer(NPC, MakeRandomInt(2500,4000), "AttackAnim")
end

function hailed(NPC, Spawn)
--	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function aggro(NPC,Spawn)
    SpawnSet(NPC, "visual_state", 0)
end

function AttackAnim(NPC,Spawn)
   if IsInCombat(NPC) == false then
        choice = MakeRandomInt(1,7)
        if choice == 1 then
        PlayFlavor(NPC,"","","1h_sword_ouch_down",0,0)
        elseif choice == 2 then
        PlayFlavor(NPC,"","","1h_sword_dodge_forehand",0,0)
         elseif choice == 3 then
        PlayFlavor(NPC,"","","kick",0,0)           
        elseif choice == 4 then
        PlayFlavor(NPC,"","","1h_sword_parry_backhand",0,0)
        elseif choice == 5 then
        PlayFlavor(NPC,"","","pugilist_attack",0,0)
        elseif choice == 6 then
        PlayFlavor(NPC,"","","pugilist_attack",0,0)
        elseif choice == 7 then
        PlayFlavor(NPC,"","","pugilist_attack",0,0)       

end
    end
    AddTimer(NPC, MakeRandomInt(2500,4000), "AttackAnim")
 end