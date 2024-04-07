--[[
    Script Name    : SpawnScripts/WayfarersRest/aninsidiousinstigator.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.14 05:11:01
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
    AddTimer(NPC,MakeRandomInt(2000,5000),"EmoteLoop")
    SpawnSet(NPC,"model_type",78)
    SpawnSet(NPC,"soga_model_type",4979)
    SetTempVariable(NPC,"HailTimer",nil)
    SetTempVariable(NPC,"Hail",nil)
    SpawnSet(NPC,"name","a suspicious patron")
end

function hailed(NPC, Spawn)
if GetTempVariable(NPC,"HailTimer")==nil then
Dialog1(NPC, Spawn)
end
end


function Dialog1(NPC, Spawn)
    SetTempVariable(NPC,"Hail",1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("...")
	Dialog.AddOption("Oh, sorry to bother you.")
	Dialog.AddOption("What are you doing back here?", "Dialog2")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What!  What do you want?")
	Dialog.AddVoiceover("voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_hail_gm_c58b0e.mp3", 1358705787, 1083758044)
    PlayFlavor(NPC,"","","glare",0,0,Spawn)
	Dialog.AddOption("Alright.")
	Dialog.AddOption("These patrons are out of their minds! Explain yourself!", "Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("...")
	Dialog.AddOption("Fine! I'm going.")
    if GetTempVariable(NPC,"Aura")==nil then	
	Dialog.AddOption("[Attempt to sense magic in the area]", "Dialog3_1")
    elseif GetTempVariable(NPC,"Aura")=="1"then
	Dialog.AddOption("[Attempt to pierce the enchantment]", "Dialog4")
	end
	Dialog.Start()
end

function Dialog3_1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    PlayFlavor(Spawn,"","","stare",0,0,NPC)
    PlayFlavor(NPC,"","","whome",0,0,Spawn)
    AddTimer(NPC,2200,"Accuse",1,Spawn)
    SetTempVariable(NPC,"Aura",1)
    Dialog3(NPC, Spawn)
 end

function Accuse(NPC,Spawn)
     SendMessage(Spawn,"Magic clings to the elf cloaking his appearance.","white")
    SendPopUpMessage(Spawn,"Magic clings to the elf cloaking his appearance.",0,100,175)
    PlayFlavor(NPC,"","","aura_mage",0,0)
	PerformCameraShake(Spawn, 0.30000001192092896)
end

function Dialog4(NPC, Spawn)
    PlayFlavor(Spawn,"","","point",0,0,NPC)
    SpawnSet(NPC,"name","an insidious instigator")
    SetTempVariable(NPC,"HailTimer",1)
    PlayFlavor(NPC,"","","cackle",0,0,Spawn)
    SpawnSet(NPC,"mood_state",11852)
    AddTimer(NPC,1500,"Shimmer",1,Spawn)
    AddTimer(NPC,4000,"Poof",1,Spawn)
    AddTimer(NPC,6700,"AttackTimer",1,Spawn)
    AddTimer(NPC,7500,"Poof2",1,Spawn)
end

function Shimmer(NPC,Spawn)
    PlayFlavor(NPC,"","","result_teleport_sparkle",0,0)

end

function Poof(NPC,Spawn)
    PlayFlavor(NPC,"","","result_teleport_appear",0,0)
end

function Poof2(NPC,Spawn)
    PlayFlavor(NPC,"","","result_dispell1_out",0,0)
end

function AttackTimer(NPC,Spawn)
    CloseConversation(NPC,Spawn)
    SpawnSet(NPC,"model_type",115)
    SpawnSet(NPC,"soga_model_type",4966)
    SpawnSet(NPC,"attackable",1)
    SpawnSet(NPC,"show_level",1)
    AddPrimaryEntityCommand(Spawn,NPC,"",0,"")
    AddPrimaryEntityCommand(Spawn,NPC,"attack",10000,"attack")
    SendUpdateDefaultCommand(NPC,10000,"attack")
    AddTimer(NPC,1200,"Attacking",1,Spawn)
end

function Attacking(NPC,Spawn)
    Attack(NPC,Spawn)
end

function EmoteLoop(NPC)
local zone = GetZone(NPC)
local Darkelf = GetSpawnByLocationID(zone, 133780688)   
if not IsInCombat(NPC) and IsAlive(NPC) and GetTempVariable(NPC,"Hail")==nil then
if IsAlive(Darkelf) then
    SpawnSet(NPC,"mood_state",11852)
    choice = MakeRandomInt(1,5)
    if choice ==1 then
    PlayFlavor(NPC,"","","scheme",0,0)
    elseif choice ==2 then
    PlayFlavor(NPC,"","","smirk",0,0)
    elseif choice ==3 then
    PlayFlavor(NPC,"","","cackle",0,0)        
    elseif choice ==4 then
    PlayFlavor(NPC,"","","chuckle",0,0)   
    elseif choice ==5 then
    PlayFlavor(NPC,"","","scheme",0,0) 
    end
    AddTimer(NPC,7000,"EmoteLoop")
end
end
end

function respawn(NPC)
	spawn(NPC)
end



local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

 

function Garbled(NPC,Player)
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_garbled_gm_8dd636c1.mp3", "Pashtita Nu orlek va tualic zefdat", "", 983323899, 3112871522, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_garbled_gm_810a3ce3.mp3", "Ardlelah kovactic ozermav klebitaz", "", 1130393437, 2011449714, Spawn, 2)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_garbled_gm_fab027b8.mp3", "Hach bahr neh jadh osh agh", "", 1055587810, 93253246, Spawn, 2)
     end     
end

 function aggro(NPC,Player)   
    AddTimer(NPC,math.random(15000,30000),"FifteenCall",1,Player)
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=100 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,20 )then
    Garbled(NPC,Player)
    else
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_aggro_gm_beacbb30.mp3", "I hope you put your affairs in order.", "", 799093996, 16617637, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_aggro_gm_fe18133.mp3", "Look what strolled into the spider's web!", "", 4178015902, 2202039151, Spawn, 2)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_aggro_gm_10fd87eb.mp3", "There is no escape for you now!", "", 2989643101, 2260454555, Spawn, 2)
        end
end   
end
end


function death(NPC,Player)
     if GetQuestStep(Player,5771)==2 then
        SetStepComplete(Player,5771,2)
    end
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if not HasLanguage(Player,20 )then
    Garbled(NPC,Player)
    else
        local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_death_gm_8d7bb2b9.mp3", "Hold them and I'll return with help!", "", 2338278515, 1160150777, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_death_gm_25576197.mp3", "I will have vengeance!", "", 360053692, 4149753869, Spawn, 2)
        end
    end
end
end



function FifteenCall(NPC,Player)
 if IsAlive(NPC) and IsInCombat(NPC)==true  and IsPlayer(Player)and  GetTempVariable(NPC, "CalloutTimer")== "false" then
    if math.random(0,100)<=33 then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,20 )then
    Garbled(NPC,Player)
    else       
      local choice = MakeRandomInt(1,6)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_battle_gm_a38dc90c.mp3", "Close in until they can't breathe!", "", 1646052354, 1989688436, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_battle_cm_4e66222a.mp3", "You cannot deny the power of hate!", "", 2308305258, 1715309735, Spawn, 2)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_battle_gm_316a6c63.mp3", "I crave your suffering!", "", 3367682978, 4121942691, Spawn, 2)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_battle_mm_4832fde6.mp3", "Now, prepare to be eviscerated!", "", 1640233154, 431623172, Spawn, 2)
        elseif choice == 5 then
        if GetClass(Spawn)<=21 and GetClass(Spawn)>=30 then        
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_maomage_gm_7c1c0586.mp3", "Your pathetic parlor tricks won't save you now, magician!", "", 2940784449, 2243650132, Spawn, 2)
        elseif GetClass(Spawn)<=1 and GetClass(Spawn)>=10 then  
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_maofighter_gm_c01f2ef8.mp3", "Let's see how good of a fighter you really are!", "", 976101228, 853372931, Spawn, 2)
        else
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_battle_cm_4e66222a.mp3", "You cannot deny the power of hate!", "", 2308305258, 1715309735, Spawn, 2)
        end        
        elseif choice == 6 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_battle_gm_700b6151.mp3", "A feeble attempt from a worthless opponent.", "", 943969253, 2337029939, Spawn, 2)
    end
    end
    end
    if IsAlive(NPC)then
    AddTimer(NPC,math.random(15000,30000),"FifteenCall",1,Player)
    end
end  
end


function healthchanged(NPC, Player)  
 if GetTempVariable(NPC, "CalloutTimer") == "false" and IsPlayer(Player) and IsAlive(NPC)==true then
    if GetTempVariable(NPC, "HealthCallout") == "false" then
    if GetHP(NPC) < GetMaxHP(NPC) * 0.55 and GetHP(NPC) > GetMaxHP(NPC) * 0.45 then
    SetTempVariable(NPC, "HealthCallout", "true")
    SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,10000,"ResetTimer")
        AddTimer(NPC,12500,"HealthReset")
    if not HasLanguage(Spawn,2 )then
        Garbled(NPC,Player)
    else        
  local choice = MakeRandomInt(1,3)
	    if choice == 1 then
	    PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_halfhealth_gm_9e244d19.mp3", "How dare you!", "", 3305445355, 1846155898, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_halfhealth_gm_577ab333.mp3", "You'll pay for that one, peon!", "", 1420508530, 39058961, Spawn, 2)
        end
    end
    end
end
end
end


function victory(NPC,Player)
    if IsPlayer(Player)and  not HasLanguage(Player,20 )then
        Garbled(NPC,Player)
    elseif  IsPlayer(Player) and HasLanguage(Player,20 )then
  local choice = MakeRandomInt(1,3)
	    if choice == 1 then
	    PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_victory_gm_f4fc7cf8.mp3", "Did you really think you had a chance?", "", 607143583, 3133144305, Spawn, 2)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_victory_gm_f5088778.mp3", "Get up! Death isn't good enough for you!", "", 3381713633, 2145918189, Spawn, 2)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_base_1/ft/darkelf/darkelf_base_1_1_victory_gm_dff26fa.mp3", "It is a shame we must end it this way ... I could have used you.", "", 1363661737, 942201815, Spawn, 2)
        end
    end
end


