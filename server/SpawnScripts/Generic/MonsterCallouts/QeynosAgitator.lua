--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/QeynosAgitator.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.02 11:12:56
    Script Purpose : Missing most VOs from this collection. Still need base halfling and woodelf for both genders.
                   : 
--]]
local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam
local Dwarf = 2
local Halfling = 7
local Woodelf = 15

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

 

function Garbled(NPC,Player)
if GetRace(NPC) == Dwarf then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/dwarf_qeynos_agitators/ft/dwarf/dwarf_qeynos_agitators_1_garbled_gm_b129f218.mp3", "Let me clear my throat so you can understand.", "", 1491391518, 212658016, Spawn,3)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/barbarian_eco_good_1/ft/barbarian/barbarian_eco_good_1_garbled_gm_1cfda4cd.mp3", "I wonder, do I owe you any coin?  I sure hope not!", "", 2853459229, 77062894, Spawn,3)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/barbarian_eco_good_1/ft/barbarian/barbarian_eco_good_1_garbled_gm_51f68cb4.mp3", "The look of your face annoys me! Shove off!", "", 2398080559, 940422767, Spawn,3)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/barbarian_eco_good_1/ft/barbarian/barbarian_eco_good_1_garbled_gm_6360be2b.mp3", "Giving you the cold shoulder this way is great.", "", 263596632, 1162455231, Spawn,3)
        end
    else
   	local choice = MakeRandomInt(1,4)-- FEMALE
	    if choice == 1 then				
		PlayFlavor(NPC, "voiceover/english/dwarf/ft/dwarf/dwarf_eco_garble_garbled_gf_80515f2f.mp3", "I wonder, do I owe you any coin?  I sure hope not!", "", 956006367, 3976653265, Spawn,3)
		elseif choice ==2 then
		PlayFlavor(NPC, "voiceover/english/dwarf/ft/dwarf/dwarf_eco_garble_garbled_gf_89b5cec2.mp3", "I dont like the look of your face! Off with you!", "", 1376862084, 1663916600, Spawn,3)
    	elseif choice ==3 then
		PlayFlavor(NPC, "voiceover/english/dwarf/ft/dwarf/dwarf_eco_garble_garbled_gf_9729edda.mp3", "Giving you the cold shoulder this way is great.", "", 1602667253, 1907098372, Spawn,3)
	    elseif choice ==4 then
		PlayFlavor(NPC, "voiceover/english/dwarf/ft/dwarf/dwarf_eco_garble_garbled_gf_cb1a6fa8.mp3", "Could really go for a tall pint... and you dont have one.", "", 4293920139, 1771029099, Spawn,3)
        end        
    end
elseif GetRace(NPC) == Halfling then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/optional3/halfling_corrupted/ft/halfling/halfling_corrupted_1_garbled_gm_43769f72.mp3", "Hilee salee lalow madow", "", 1546052685, 4072580842, Spawn,8)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/halfling_crazed/ft/halfling/halfling_crazed_1_garbled_gm_54e55451.mp3", "Lilleee mabee tarrah roo sakdooo", "", 2087702128, 2642872371, Spawn,8)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/halfling_crazed/ft/halfling/halfling_crazed_1_garbled_gm_7b0d27d5.mp3", "Rumtum tugger sah bim lugger", "", 3679068852, 490576745, Spawn,8)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/halfling_crazed/ft/halfling/halfling_crazed_1_garbled_gm_823f1021.mp3", "Jum tum ribbyflum! Slipper chipper tip tip bipper!", "", 374813993, 4058118752, Spawn,8)
        end
    else
   	local choice = MakeRandomInt(1,4)
	    if choice == 1 then -- FEMALE
        PlayFlavor(NPC, "voiceover/english/halfling_corrupted/ft/halfling/halfling_corrupted_1_garbled_gf_54e55451.mp3", "Lilleee mabee tarrah roo sakdooo", "", 3766403918, 1171422621, Spawn,8)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/halfling_base_1/ft/halfling/halfling_base_1_1_garbled_gf_823f1021.mp3", "garbled text not to be translated", "", 3051197299, 2401133915, Spawn,8)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/halfling_corrupted/ft/halfling/halfling_corrupted_1_garbled_gf_7b0d27d5.mp3", "Rumtum tugger sah bim lugger", "", 34036833, 3802622885, Spawn,8)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/halfling_corrupted/ft/halfling/halfling_corrupted_1_garbled_gf_823f1021.mp3", "Jum tum ribbyflum! Slipper chipper tip tip bipper!", "", 1303270959, 3751358873, Spawn,8)
         end        
    end
elseif GetRace(NPC) == Woodelf then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/woodelf_forrest_wardens/ft/woodelf/woodelf_forrest_wardens_1_garbled_gm_f197012c.mp3", "Molokeeenakah  watroo    olozamm", "", 2097905045, 1612835219, Spawn, 16)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/woodelf_forrest_wardens/ft/woodelf/woodelf_forrest_wardens_1_garbled_gm_8a0bc5f8.mp3", "Kaamahaneah    queeeola      chi   sa", "", 1811305493, 2624435147, Spawn, 16)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/woodelf_forrest_wardens/ft/woodelf/woodelf_forrest_wardens_1_garbled_gm_1b979d55.mp3", "Aleeda merende wovesta", "", 2513619643, 1543099294, Spawn, 16)
        end
    else -- FEMALE
  	local choice = MakeRandomInt(1,3)
        if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/highelf_base_1/ft/highelf/highelf_base_1_1_garbled_gf_fde7b8f7.mp3", "Kaamahaneah    queeeola      chi   sa", "", 595061935, 2035542297, Spawn, 16)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/highelf_base_1/ft/highelf/highelf_base_1_1_garbled_gf_755db2c3.mp3", "Aleeda merende wovesta", "", 1930935604, 3692814157, Spawn, 16)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/highelf_base_1/ft/highelf/highelf_base_1_1_garbled_gf_d396c4fc.mp3", "Molokeeenakah  watroo    olozamm", "", 1717100103, 894236173, Spawn, 16)
        end        
    end
end
end

 function aggro(NPC,Player)   
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=33 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
if GetRace(NPC) == Dwarf then
    if not HasLanguage(Player,3)then
    Garbled(NPC,Player)
    else
    aggroCall(NPC,Player)
    end
elseif GetRace(NPC) == Halfling then    
    if not HasLanguage(Player,8)then
    Garbled(NPC,Player)
    else
    aggroCall(NPC,Player)
    end    
elseif GetRace(NPC) == Woodelf then    
    if not HasLanguage(Player,16)then
    Garbled(NPC,Player)
    else
    aggroCall(NPC,Player)
    end     
end
end
end

 function aggroCall(NPC,Player)   
if GetRace(NPC) == Dwarf then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_aggro_gm_23b35126.mp3", "Where do ya think you're going?", "", 706272128, 909565004, Spawn, 3)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_aggro_gm_9de55a3e.mp3", "There they are! Let's get em!", "", 3246206943, 366784514, Spawn, 3)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_aggro_gm_ab9057d3.mp3", "Looking for me? ", "", 438949611, 3910736957, Spawn, 3)
        end
    else
        if GetClass(Spawn)>=1 and GetClass(Spawn)<=10 then 
      	choice = MakeRandomInt(1,4) --Fighter CHECK
        else
        choice = MakeRandomInt(1,3)
        end
        if choice == 1 then -- FEMALE
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_aggro_gf_ab9057d3.mp3", "Looking for me? ", "", 407706048, 337475746, Spawn, 3)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_aggro_gf_be4f625e.mp3", "Where do ya think you're going?", "", 152508601, 1517122703, Spawn, 3)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_aggro_gf_d29563c7.mp3", "There they are! Let's get em!", "", 995196475, 1619899594, Spawn, 3)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/dwarf_base_1/ft/dwarf/dwarf_base_1_1_maofighter_gf_428f2c06.mp3", "You, back up there!  I'm taking the warrior!", "", 1284306998, 1476787670, Spawn, 3)
        end        
    end
elseif GetRace(NPC) == Halfling then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/halfling_base_1/ft/halfling/halfling_base_1_1_aggro_gm_7b251faa.mp3", "Try to sneak into my home, will ya!", "", 100218096, 392363658, Spawn,8)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/optional5/halfling_corrupted/ft/halfling/halfling_corrupted_2_aggro_gm_3c9b103f.mp3", "Destroy the invaders!", "", 1579115349, 1024832768, Spawn,8)
        end
    else --No Female
      
    end
elseif GetRace(NPC) == Woodelf then
    if GetGender(NPC) ==1 then -- MALE

    else
     
    end
end   
end


function death(NPC,Player)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if MakeRandomInt(0,100)<=35 then
if GetRace(NPC) == Dwarf then
    if not HasLanguage(Player,3)then
    Garbled(NPC,Player)
    else
    end
elseif GetRace(NPC) == Halfling then    
    if not HasLanguage(Player,8)then
    Garbled(NPC,Player)
    else
    end    
elseif GetRace(NPC) == Woodelf then    
    if not HasLanguage(Player,16)then
    Garbled(NPC,Player)
    else
    end     
end
end
end
end

function victory(NPC,Player)
if GetRace(NPC) == Dwarf then
    if not HasLanguage(Player,3)then
    Garbled(NPC,Player)
    else
    end
elseif GetRace(NPC) == Halfling then    
    if not HasLanguage(Player,8)then
    Garbled(NPC,Player)
    else
    end    
elseif GetRace(NPC) == Woodelf then    
    if not HasLanguage(Player,16)then
    Garbled(NPC,Player)
    else
    end     
end
end

