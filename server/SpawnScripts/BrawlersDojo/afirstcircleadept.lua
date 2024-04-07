--[[
    Script Name    : SpawnScripts/BrawlersDojo/afirstcircleadept.lua
    Script Author  : Dorbin
    Script Date    : 2022.12.18 12:12:52
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
    AddTimer(NPC, math.random(2000,5000), "EmoteLoop")
    SetTempVariable(NPC,"Talking","false")
	SetTempVariable(NPC,"Reset",nil)
end

function hailed(NPC, Spawn)
    if HasQuest(Spawn,5790) and  GetQuestStepProgress(Spawn,5790,3)==0 then
    SpawnSet(NPC,"mood_state",0)
    SpawnSet(NPC,"visual_state",0)
    PlayAnimation(NPC,10871)
    SetTempVariable(NPC,"Talking","true")
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Glad you made it! Was the island as difficult as I remember?")
	Dialog.AddVoiceover("voiceover/english/human_eco_good_1/ft/human/human_eco_good_1_hail_gm_5ec5f221.mp3",3870261841, 3828605353)
    PlayFlavor(NPC, "", "", "",0,0 , Spawn, 0)
	Dialog.AddOption("The Isle of Refuge? I made it here, didn't I? Let's spar.","Dialog1")
	Dialog.Start()
end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn, 0)
    AddTimer(NPC,3000,"attack",1,Spawn)
end

function attack(NPC,Spawn)
    SpawnSet(NPC,"attackable",1)
    SpawnSet(NPC,"show_level",1)
    Attack(NPC,Spawn)
end

function aggro(NPC,Spawn)
    if GetTempVariable(NPC,"Reset")== nil then
    else
        ClearHate(NPC, Spawn)
        SetInCombat(Spawn, false)
        SetInCombat(NPC, false)
        ClearEncounter(NPC)
        SetTarget(Spawn,nil)
    end
end

function healthchanged(NPC, Spawn)  
    if GetHP(NPC) < GetMaxHP(NPC) * 0.26  then
    SpawnSet(NPC,"attackable",0)
    SpawnSet(NPC,"show_level",0)    
--   if IsInCombat(NPC,Spawn) then
	    SetTempVariable(NPC,"Reset",1)
        ClearHate(NPC, Spawn)
        SetInCombat(Spawn, false)
        SetInCombat(NPC, false)
        ClearEncounter(NPC)
        SetTarget(Spawn,nil)
--    end
    AddTimer(NPC,1500,"end2",1,Spawn)
    AddTimer(NPC,3000,"bow",1,Spawn)
    AddTimer(NPC,5000,"bow2",1,Spawn)
end
end

function end2(NPC,Spawn)
        ClearHate(NPC, Spawn)
        SetInCombat(Spawn, false)
        SetInCombat(NPC, false)
        ClearEncounter(NPC)
        SetTarget(Spawn,nil)
end   

function bow(NPC,Spawn)
    SetStepComplete(Spawn,5790,3)
	PlayFlavor(NPC, "", "","bow",0, 0)
end

function bow2(NPC,Spawn)
    Runback(NPC)
    SetTempVariable(NPC,"Talking","false")
    SpawnSet(NPC,"visual_state",11420)
end 

function respawn(NPC)
    spawn(NPC)
end

function EmoteLoop(NPC)
 if GetTempVariable(NPC,"Talking")== "false"then
   SpawnSet(NPC, "action_state", 0)
    local choice = MakeRandomInt(1,10)

        if choice == 1 then
            PlayFlavor(NPC,"","","bostaff_attack")
            AddTimer(NPC, 2100, "Idle")
        elseif choice == 2 then
            PlayFlavor(NPC,"","","bostaff_attack01")
            AddTimer(NPC, 1700, "Idle")
        elseif choice == 3 then
            PlayFlavor(NPC,"","","bostaff_attack02")
            AddTimer(NPC, 2400, "Idle")
        elseif choice == 4 then
            PlayFlavor(NPC,"","","bostaff_attack03")
            AddTimer(NPC, 3200, "Idle")
        elseif choice == 5 then
            PlayFlavor(NPC,"","","bostaff_kick")
            AddTimer(NPC, 3700, "Idle")
        elseif choice == 6 then
            PlayFlavor(NPC,"","","bostaff_dodge_forehand")
            AddTimer(NPC, 1500, "Idle")
        else
            PlayFlavor(NPC,"","","bostaff_taunt_combat_art")
            AddTimer(NPC, 3500, "Idle")
        end
else
    local timer = MakeRandomInt(1500,2500)
    AddTimer(NPC, timer, "EmoteLoop")    
end
end

function Idle(NPC)
if GetTempVariable(NPC,"Talking")== "false"then
    PlayAnimation(NPC, 101) 
    SpawnSet(NPC, "action_state", 101)
end
    local timer = MakeRandomInt(1500,2500)
    AddTimer(NPC, timer, "EmoteLoop")
end

function death(NPC,Spawn)
    Despawn(NPC)
end

function victory(NPC)
	SetTempVariable(NPC,"Reset",nil)
	SetTempVariable(NPC,"Talking","false")
end    
