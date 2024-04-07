--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/Giantslayer.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.01 05:12:33
    Script Purpose : Giantslayer VOs between barbarian, ogre, and troll. Missing MANY VOs. Replaced most with generic racial VOs/Muted Playflavors.
                   : 
--]]
local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam
local Ogre = 12
local Troll = 14
local Barbarian = 0

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

 

function Garbled(NPC,Player)
if GetRace(NPC) == Barbarian then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_steppes/ft/barbarian/barbarian_steppes_1_garbled_gm_1d4e2601.mp3", "Zergen oer steb liteit", "", 1881495348, 2631084324, Spawn,1)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_steppes/ft/barbarian/barbarian_steppes_1_garbled_gm_b0cb46d4.mp3", "Neit te geb ruiken, wat weg hout u hetten", "", 1338663568, 2860304215, Spawn,1)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_steppes/ft/barbarian/barbarian_steppes_1_garbled_gm_b80c3123.mp3", "Asfkher van baed rijs prakti kjen ", "", 1248648431, 1559755809, Spawn,1)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_steppes/ft/barbarian/barbarian_steppes_1_garbled_gm_f1b9e87a.mp3", "Uf envoudig een van uw gekozen en enkel geven om Vensters", "", 3095091783, 3153428791, Spawn,1)
        end
    else
   	local choice = MakeRandomInt(1,4)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_garbled_gf_39fa44a4.mp3", "Voor van de hebben verktozen um venester ", "", 1454634641, 3478787440, Spawn, 1)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_garbled_gf_1d4e2601.mp3", "Zergen oer steb liteit", "", 3787818080, 297930332, Spawn, 1)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_garbled_gf_b0cb46d4.mp3", "Neit te geb ruiken, wat weg hout u hetten", "", 2958929129, 2080811104, Spawn, 1)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_garbled_gf_411c42c0.mp3", "Markt om de teg enges teld ek westiae te stellen. ", "", 3699684343, 1809069007, Spawn, 1)
        end        
    end
elseif GetRace(NPC) == Ogre then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
    PlayFlavor(NPC, "voiceover/english/optional3/ogre_dervish/ft/ogre/ogre_dervish_2_garbled_gm_4e36e011.mp3", "Dorsht kro venab modat sed", "", 3845588707, 2500883879, Spawn,14)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/ogre_dervish/ft/ogre/ogre_dervish_1_garbled_gm_2e858451.mp3", "Borod groda sud med ka", "", 3026340298, 870128273, Spawn,14)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/ogre_dervish/ft/ogre/ogre_dervish_1_garbled_gm_7d0991b7.mp3", "Hurth mroth beheda graben deleth", "", 2073169291, 2543219571, Spawn,14)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/optional3/ogre_dervish/ft/ogre/ogre_dervish_2_garbled_gm_2e858451.mp3", "Borod groda sud med ka", "", 2573547747, 2195246695, Spawn,14)
        end
    else
   	local choice = MakeRandomInt(1,4)
	    if choice == 1 then -- FEMALE
        PlayFlavor(NPC, "voiceover/english/ogre_dervish/ft/ogre/ogre_dervish_1_garbled_gf_bef20a0a.mp3", "Grada ulgar boi hemar", "", 2699004920, 560903809, Spawn,14)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/ogre_dervish/ft/ogre/ogre_dervish_1_garbled_gf_7d0991b7.mp3", "Hurth mroth beheda graben deleth", "", 2981299879, 1969453091, Spawn,14)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/ogre_dervish/ft/ogre/ogre_dervish_2_garbled_gf_2e858451.mp3", "Borod groda sud med ka", "", 2001985676, 3233914404, Spawn,14)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/optional3/ogre_dervish/ft/ogre/ogre_dervish_2_garbled_gf_7d0991b7.mp3", "Hurth mroth beheda graben deleth", "", 2347032592, 631248646, Spawn,14)
         end        
    end
elseif GetRace(NPC) == Troll then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_318f674b.mp3", "Erch bosta pankan toost", "", 2846330309, 4155347396, Spawn,15)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_43bed989.mp3", "Habat zopft hach'te glarst", "", 2701453259, 3347954170, Spawn,15)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_a1a1512f.mp3", "Tastke blatsa zurtek nyt", "", 3824904925, 121650296, Spawn,15)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_c4c81df1.mp3", "Pazzkkan gracht glizt kep", "", 1821063853, 3495000701, Spawn,15)
        end
    else -- FEMALE (These are male troll VOs for now)
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_318f674b.mp3", "Erch bosta pankan toost", "", 2846330309, 4155347396, Spawn,15)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_43bed989.mp3", "Habat zopft hach'te glarst", "", 2701453259, 3347954170, Spawn,15)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_a1a1512f.mp3", "Tastke blatsa zurtek nyt", "", 3824904925, 121650296, Spawn,15)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/optional2/troll/ft/troll/troll_eco_garble_garbled_gm_c4c81df1.mp3", "Pazzkkan gracht glizt kep", "", 1821063853, 3495000701, Spawn,15)
        end        
    end
end
end

 function aggro(NPC,Player)   
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=33 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
if GetRace(NPC) == Barbarian then
    if not HasLanguage(Player,1)then
    Garbled(NPC,Player)
    else
    aggroCall(NPC,Player)
    end
elseif GetRace(NPC) == Ogre then    
    if not HasLanguage(Player,14)then
    Garbled(NPC,Player)
    else
    aggroCall(NPC,Player)
    end    
elseif GetRace(NPC) == Troll then    
    if not HasLanguage(Player,15)then
    Garbled(NPC,Player)
    else
    aggroCall(NPC,Player)
    end     
end
end
end

 function aggroCall(NPC,Player)   
if GetRace(NPC) == Barbarian then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_base_1/ft/barbarian/barbarian_base_1_1_aggro_gm_394a7fe3.mp3", "Not sneaky enough to get past me.", "", 3715495401, 2861752836, Spawn, 1)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_base_1/ft/barbarian/barbarian_base_1_1_aggro_gm_d2336620.mp3", "Your overconfidence will be your undoing.", "", 1735697087, 1551611219, Spawn, 1)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_base_2/ft/barbarian/barbarian_base_2_1_halfhealth_gm_e4144b42.mp3", "A true warrior feels no pain!", "", 3699343440, 1584591854, Spawn,1)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_aggro_gm_e5dbdc37.mp3", "There's no escaping my might!", "", 548778638, 825995484, Spawn, 1)
        end
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_aggro_gf_e5dbdc37.mp3", "There's no escaping my might!", "", 548778638, 825995484, Spawn, 1)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_aggro_gf_aaaf35f7.mp3", "This battle will be the end of you!", "", 4178539814, 2861843546, Spawn, 1)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/barbarian_base_1/ft/barbarian/barbarian_base_1_1_aggro_gf_d2336620.mp3", "Your overconfidence will be your undoing.", "", 2263836674, 942538899, Spawn,1)
        end        
    end
elseif GetRace(NPC) == Ogre then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ogre_giantslayer/ft/ogre/ogre_giantslayer_1_aggro_gm_e34983fd.mp3", "You messed with the wrong guy!", "", 2373153509, 3768633177, Spawn, 14)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_aggro_gm_583690dc.mp3", "Summon help! We have invaders!", "", 3340212225, 279643307, Spawn, 14)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_aggro_gm_a30c4f9d.mp3", "To arms!", "", 1238020980, 748146443, Spawn, 14)
        end
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/ogre_giantslayer/ft/ogre/ogre_giantslayer_1_aggro_gf_4cd8a067.mp3", "I'm gonna squosh you!", "", 3161832271, 3643573572, Spawn, 14)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_aggro_gf_d4cfd470.mp3", "Feel the might of Rallos!", "", 760635308, 455953200, Spawn,14)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_battle_gf_fa6b8296.mp3", "They cannot match our strength. Charge!", "", 3818976104, 1332551759, Spawn,14)
        end        
    end
elseif GetRace(NPC) == Troll then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_aggro_gm_b7e0b3a.mp3", "Me going to eat your kidney first.", "", 3664886715, 2450110061,15)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_giantslayer/ft/troll/troll_giantslayer_2_aggro_gm_c0dad131.mp3", "Giantslayer power!", "", 976922385, 2649690552, Spawn, 15)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_aggro_gm_f06d6bb9.mp3", "Not nice to interrupt dinner.", "", 573837171, 4255493444,15)
        end
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional3/troll_giantslayer/ft/troll/troll_giantslayer_2_aggro_gf_c0dad131.mp3", "Giantslayer power!", "", 976922385, 2649690552, Spawn, 15)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_aggro_gf_b7e0b3a.mp3", "Me going to eat your kidney first.", "", 750980753, 3740010516, Spawn,15)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/troll_base_2/ft/troll/troll_base_2_1_aggro_gf_62fd0e82.mp3", "What smells so good?", "", 3335229907, 713747453, Spawn,15)
        end        
    end
end   
end


function death(NPC,Player)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if MakeRandomInt(0,100)<=35 then
if GetRace(NPC) == Barbarian then
    if not HasLanguage(Player,1)then
    Garbled(NPC,Player)
    else
    DeathCall(NPC,Player)
    end
elseif GetRace(NPC) == Ogre then    
    if not HasLanguage(Player,14)then
    Garbled(NPC,Player)
    else
    DeathCall(NPC,Player)
    end    
elseif GetRace(NPC) == Troll then    
    if not HasLanguage(Player,15)then
    Garbled(NPC,Player)
    else
    DeathCall(NPC,Player)
    end     
end
end
end
end

 function DeathCall(NPC,Player)   
if GetRace(NPC) == Barbarian then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_death_gm_c6234231.mp3", "No!  I can't be defeated!  Not by you!", "", 0, 0, Spawn, 1)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_death_gm_438c5129.mp3", "The Giantslayers will avenge me!", "", 0, 0, Spawn, 1)
      end
    else
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_death_gf_c6234231.mp3", "No!  I can't be defeated!  Not by you!", "", 218778824, 3585845916, Spawn, 1)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/barbarian_giantslayer/ft/barbarian/barbarian_giantslayer_1_death_gf_438c5129.mp3", "The Giantslayers will avenge me!", "", 3264229264, 1027961998, Spawn, 1)
        end        
    end
elseif GetRace(NPC) == Ogre then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gm_4be2fecc.mp3", "You may win the battle, but the war is far from over!", "", 9065845, 102503565, Spawn, 14)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gm_258f0139.mp3", "Do not surrender to the invaders!", "", 703053605, 1971945197, Spawn, 14)
        end
    else
   	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gf_258f0139.mp3", "Do not surrender to the invaders!", "", 928337336, 4254092896, Spawn, 14)
        else
		PlayFlavor(NPC, "voiceover/english/optional3/ogre_base_2/ft/ogre/ogre_base_2_1_death_gf_4be2fecc.mp3", "You may win the battle, but the war is far from over!", "", 3327742171, 2045821391, Spawn, 14)
        end        
    end
elseif GetRace(NPC) == Troll then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_death_gm_e8c02d1e.mp3", "Feel kinda sleepy. Whacha do to me?", "", 3298938103, 1410551282, Spawn,15)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_death_gm_e1755f3f.mp3", "Come back you coward! I'm not dead yet.", "", 86111608, 3954832486, Spawn,15)
        end
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional3/troll_giantslayer/ft/troll/troll_giantslayer_2_death_gf_2caf3bcf.mp3", "No!  Giantslayers never die!", "", 3123046582, 684022532, Spawn, 15)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_death_gf_e8c02d1e.mp3", "Feel kinda sleepy. Whacha do to me?", "", 3447489483, 413641560, Spawn,15)
        else
 		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_death_gf_e1755f3f.mp3", "Come back you coward! I'm not dead yet.", "", 695536554, 1919499087, Spawn,15)
        end        
    end
end   
end




function victory(NPC,Player)
if GetRace(NPC) == Barbarian then
    if not HasLanguage(Player,1)then
    Garbled(NPC,Player)
    else
    VictoryCall(NPC,Player)
    end
elseif GetRace(NPC) == Ogre then    
    if not HasLanguage(Player,14)then
    Garbled(NPC,Player)
    else
    VictoryCall(NPC,Player)
    end    
elseif GetRace(NPC) == Troll then    
    if not HasLanguage(Player,15)then
    Garbled(NPC,Player)
    else
    VictoryCall(NPC,Player)
    end     
end
end

function VictoryCall(NPC,Player)   
if GetRace(NPC) == Barbarian then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_base_1/ft/barbarian/barbarian_base_1_1_victory_gm_e707fef0.mp3", "Flee cowards, before I slaughter you all!", "", 3583801206, 1799910552, Spawn,1)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional3/barbarian_base_1/ft/barbarian/barbarian_base_1_1_victory_gm_f87005b5.mp3", "Now you will have peace.", "", 3932457554, 2553847722, Spawn,1)
      end
    else
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then -- FEMALE
        PlayFlavor(NPC, "voiceover/english/barbarian_base_1/ft/barbarian/barbarian_base_1_1_victory_gf_155a84f0.mp3", "You fought well but not well enough!", "", 1144735491, 2154607760, Spawn,1)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/barbarian_base_1/ft/barbarian/barbarian_base_1_1_victory_gf_f87005b5.mp3", "Now you will have peace.", "", 2974774059, 665726799, Spawn,1)
        end        
    end
elseif GetRace(NPC) == Ogre then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_victory_gm_ec0cd85a.mp3", "I hope they're all this easy.", "", 2687289628, 2303639320, Spawn,14)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/human_base_1/ft/human/human_base_1_1_victory_gm_153f12ff.mp3", "One down!", "", 3009518664, 4140389760, Spawn,14)
        end
    else
   	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_victory_gf_1c683d69.mp3", "Leave the carcasses to rot!", "", 1941316513, 697971111, Spawn,14)
        else
        PlayFlavor(NPC, "voiceover/english/ogre_base_1/ft/ogre/ogre_base_1_1_victory_gf_90f4b426.mp3", "Forward! Leave no survivors!", "", 1746137281, 1712355529, Spawn,14)
        end        
    end
elseif GetRace(NPC) == Troll then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_victory_gm_ae6d66e3.mp3", "Teach you to mess with the best.", "", 927528340, Spawn, 2751002174,15)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_halfhealth_gm_aa145f4d.mp3", "Neat, that'll leave a pretty scar", "", 675684950, Spawn, 4088135432,15)
        end
    else
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_victory_gf_ae6d66e3.mp3", "Teach you to mess with the best.", "", 2175921460, Spawn, 357738989,15)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/troll_base_1/ft/troll/troll_base_1_1_battle_gf_ee1e1a8.mp3", "Blood bath!", "", 3988277815, Spawn, 18269010,15)
        end        
    end
end   
end

