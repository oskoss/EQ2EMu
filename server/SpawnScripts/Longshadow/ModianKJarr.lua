--[[
	Script Name		: SpawnScripts/LongshadowAlley/ModianKJarr.lua
	Script Purpose	: Modian K`Jarr
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.23
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

local BlindTasteTest = 5693

local Talk = true

function spawn(NPC)
    Drink(NPC)
end
    
function Revive1(NPC,Spawn)
    SpawnSet(NPC,"visual_state","0")
  SpawnSet(NPC,"action_state","323")
   SetInfoStructString(NPC, "action_state", "idle")
    PlayFlavor (NPC,"","","resurrect",0,0)
end

function Revive2(NPC,Spawn)
    Talk = false
    local Lyn = GetSpawn(NPC,1380013)
    CastSpell(Lyn,52)
    ApplySpellVisual(NPC,23)
end


function respawn(NPC)
	spawn(NPC)
end

function Drink(NPC)
   SpawnSet(NPC,"action_state","11422")
   SetInfoStructString(NPC, "action_state", "drinking_idle")
    Talk = true
end

function hailed(NPC, Spawn)
if Talk == false then
elseif Talk == true then    
    Dialog1(NPC, Spawn)
end
end


function Dialog1(NPC, Spawn)
if Talk == true then
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("If you couldn't tell, I'm enjoying a drink. Now that your curiousity has been sated, perhaps you'll leave me alone?")
	Dialog.AddVoiceover("voiceover/english/modian_k_jarr/fprt_hood05/std_de_male_modian_kjarr.mp3", 531408061, 599233569)
    if HasQuest(Spawn, BlindTasteTest) and not HasCompletedQuest(Spawn, BlindTasteTest) then
    Dialog.AddOption("Bartender Icebrew wants you to try some of his new batch. On the house!","Dialog2")
    elseif HasCompletedQuest(Spawn, BlindTasteTest) then
    Dialog.AddOption("I'm glad to see you're still upright!")
    end
    Dialog.AddOption("I guess I will.")
	Dialog.Start()
end
end

function Dialog2(NPC, Spawn)
if Talk == true then
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, he does, does he? And did he also want you to gather the belongings from my corpse after I fall over dead from drinking that poisoned drink?")
    PlayFlavor (NPC,"","","glare",0,0)
	Dialog.AddVoiceover("voiceover/english/standard_dark_elf_male/fprt_hood06/quests/bartendericebrew/truepatron_icebrew_x2_initial.mp3", 3216795582, 3263193911)
    Dialog.AddOption("Hardly. You seem to be a decerning type. He claims this brew should put a fire in your belly in these drafty back alleys.","Dialog3")
	Dialog.Start()
end
end

function Dialog3(NPC, Spawn)
if Talk == true then
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Very well ... I built up a tolerance to poisons. I guess now's as good a time as ever to see if my training paid off. Give me the drink, peon.")
	Dialog.AddVoiceover("voiceover/english/standard_dark_elf_male/fprt_hood06/quests/bartendericebrew/truepatron_icebrew_x2_initial2.mp3", 2486720354, 1239931448)
    PlayFlavor (NPC,"","","sniff",0,0)
    Dialog.AddOption("[ Hand him the drink and observe ]","Dialog4")
	Dialog.Start()
end
end

function Dialog4(NPC,Spawn)
if Talk == true then
    Talk = false
    AddTimer(NPC,6000,"Dialog4a",1,Spawn)
    AddTimer(NPC,10000,"Eyes",1,Spawn)
    AddTimer(NPC,13000,"Melt",1,Spawn)
    AddTimer(NPC,19000,"Die",1,Spawn)
    AddTimer(NPC,21500,"Die2",1,Spawn)
    AddTimer(NPC,28000,"Dead",1,Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("...")
	Dialog.AddVoiceover("voiceover/english/standard_dark_elf_male/fprt_hood06/quests/bartendericebrew/truepatron_icebrew_x2_initial.mp3", 0, 0)
    PlayFlavor (NPC,"","","drinking_idle",0,0)
	Dialog.AddOption("And?")
	Dialog.Start()
else
    CloseConversation(NPC,Spawn)
end
end



function Eyes(NPC,Spawn)
    PlayFlavor (NPC,"","","scream",0,0)
end

function Melt(NPC,Spawn)
    PlayFlavor (NPC,"","","heartattack",0,0)
   SpawnSet(NPC,"action_state","228")
   SetInfoStructString(NPC, "action_state", "dead")
   SetHeading(NPC,"143.938")
end

function Die(NPC,Spawn)
    PlayFlavor (NPC,"","","dead_enter",0,0)
   SpawnSet(NPC,"action_state","228")
   SetInfoStructString(NPC, "action_state", "dead")
end

function Die2(NPC,Spawn)
    PlayFlavor (NPC,"","","dead",0,0)
   SpawnSet(NPC,"action_state","228")
   SetInfoStructString(NPC, "action_state", "dead")
   SpawnSet(NPC,"visual_state","228")
    CloseConversation(NPC,Spawn)
end

function Dead(NPC,Spawn)
   SpawnSet(NPC,"action_state","228")
   SetInfoStructString(NPC, "action_state", "dead")
    AddTimer(NPC,8999,"Revive1",1)
    AddTimer(NPC,9000,"Revive2",1)
    AddTimer(NPC,13000,"Drink",1)
end

function Dialog4a(NPC, Spawn)
        SetStepComplete(Spawn, BlindTasteTest, 1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ugh...  That has to be the most disgus... AAAAAAAAAAHHHHHHH!!! MY EYES!!!!!!! I CAN'T SEE!!!! MY EYeeeessss... uuuhhhh.... ev'ry ting... goin'... blakkkkk...")
	Dialog.AddVoiceover("voiceover/english/standard_dark_elf_male/fprt_hood06/quests/bartendericebrew/truepatron_icebrew_x2_initial3.mp3", 1185257148, 1967119934)
    PlayFlavor (NPC,"","","gutcramp",0,0)
	Dialog.AddOption("Well... alright then.","Continue")
	Dialog.Start()
end

function Continue(NPC,Spawn)
end


