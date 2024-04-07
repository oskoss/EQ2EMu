--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/BaseOgre1.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.03 03:11:13
    Script Purpose : 
                   : 
--]]
local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam


local FIGHTER = 1
local WARRIOR =2
local GUARDIAN= 3 
local BERSERKER = 4 
local BRAWLER = 5 
local MONK = 6 
local BRUISER= 7 
local CRUSADER = 8 
local SHADOWKNIGHT = 9 
local PALADIN = 10 


local MAGE = 21 
local SORCERER = 22 
local WIZARD = 23 
local WARLOCK = 24 
local ENCHANTER = 25 
local ILLUSIONIST = 26 
local COERCER = 27 
local SUMMONER = 28 
local CONJUROR = 29 
local NECROMANCER = 30   
  
  

    
function aggro(NPC,Spawn)
    CalloutTimer = true
    AddTimer(NPC,7000,"ResetTimer")
    if GetGender(NPC)==1 then       --GENDER CHECK.  1==Male
    if GetClass(Spawn)>=31 and GetClass(Spawn)<=42 then 
  	 choice = MakeRandomInt(1,4) --SCOUT CHECK
    else
     choice = MakeRandomInt(1,3)
    end
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_aggro_gm_a203c9ec.mp3", "Prepare to face your doom, meddler.", "", 1496819882, 365167432)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_aggro_gm_a30c4f9d.mp3", "To arms!", "", 1238020980, 748146443)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_aggro_gm_583690dc.mp3", "Summon help! We have invaders!", "", 3340212225, 279643307)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_maoscout_gm_d55d2935.mp3", "Use caution, they may have scouts!", "", 2353461553, 1453902220)
        end  
    else
 	 choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_aggro_gf_d4cfd470.mp3", "Feel the might of Rallos!", "", 760635308, 455953200)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional2/ogre_eco_evil_2/ft/ogre/ogre_eco_evil_2_aoi_gf_d70efe42.mp3", "Revel in the bloodshed.", "", 3553897837, 3037866776)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_battle_gf_fa6b8296.mp3", "They cannot match our strength. Charge!", "", 3818976104, 1332551759)
        end
end    
end
   



function death(NPC,Spawn)
 --[[if CalloutTimer == false then
    CalloutTimer = true
    AddTimer(NPC,7000,"ResetTimer")]]--
    if GetGender(NPC)==1 then
 	local choice = MakeRandomInt(1,2)
    
        if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gm_4be2fecc.mp3", "You may win the battle, but the war is far from over!", "", 9065845, 102503565, Spawn, 0)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gm_258f0139.mp3", "Do not surrender to the invaders!", "", 703053605, 1971945197, Spawn, 0)
        end
    else
 	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gf_258f0139.mp3", "Do not surrender to the invaders!", "", 928337336, 4254092896, Spawn, 0)
        else
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gf_4be2fecc.mp3", "You may win the battle, but the war is far from over!", "", 3327742171, 2045821391, Spawn, 0)
       end
    end
    end
--end



function healthchanged(NPC, Spawn)  
--[[  if CalloutTimer == false then
    CalloutTimer = true
    AddTimer(NPC,7000,"ResetTimer")]]--
    if HealthCallout == false then
    if GetHP(NPC) <= GetMaxHP(NPC) * 0.55 and GetHP(NPC) >= GetMaxHP(NPC) * 0.45 then
    if GetGender(NPC)==1 then
	local choice = MakeRandomInt(1,4)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_halfhealth_gm_5a6c112c.mp3", "Agggggh!  There is no pain only death and failure!", "", 2051650869, 1276361533, Spawn, 0)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_halfhealth_gm_581c2926.mp3", "You'll pay for that!", "", 2366218696, 2114997045, Spawn, 0)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_halfhealth_gm_1ad2d46f.mp3", "Your petty weapons are no match for me!", "", 2269900119, 3290320421, Spawn, 0)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_halfhealth_gm_aff2b15d.mp3", "Now I'm really angry!", "", 1599348947, 4096819162, Spawn, 0)
        end
    else
	local choice = MakeRandomInt(1,4)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_halfhealth_gf_1ad2d46f.mp3", "Your petty weapons are no match for me!", "", 2285469219, 3359769172, Spawn, 0)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_halfhealth_gf_1ad2d46f.mp3", "Your petty weapons are no match for me!", "", 2285469219, 3359769172, Spawn, 0)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_halfhealth_gf_aff2b15d.mp3", "Now I'm really angry!", "", 3362643729, 1907494922, Spawn, 0)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_halfhealth_gf_581c2926.mp3", "You'll pay for that!", "", 480032723, 3225416629, Spawn, 0)
      end
    end
    end
end
end    

--end

function victory(NPC,Spawn)
 --[[if CalloutTimer == false then
    CalloutTimer = true
    AddTimer(NPC,7000,"ResetTimer")]]--
    if GetGender(NPC)==1 then
	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_victory_gm_1de29528.mp3", "Death was your only escape from me, coward!", "", 3626940960, 2890932770, Spawn, 0)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gm_4be2fecc.mp3", "You may win the battle, but the war is far from over!", "", 9065845, 102503565, Spawn)
        end
    else
	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_victory_gf_90f4b426.mp3", "Forward! Leave no survivors!", "", 1746137281, 1712355529, Spawn, 0)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_victory_gf_1c683d69.mp3", "Leave the carcasses to rot!", "", 1941316513, 697971111, Spawn, 0)
        end
    end
end
--end

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    CalloutTimer = false
end

function HealthReset (NPC)  --SO HALF HEALTH DOESN'T SPAM
    HealthCallout = false
end