--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/Pipefitters.lua
    Script Author  : dorbin
    Script Date    : 2024.01.06 01:01:11
    Script Purpose : Gnome Pipefitters in Thieves' Way. Tone is set in the spawn's scripts.
                   : 
--]]

local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam


function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

 

function Garbled(NPC,Player)
    if Tone == 3 then
  	    local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_garbled_gm_cbfe503a.mp3", "Krizz barawvitt zizzer zazz", "", 1311390031, 3718535895, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_garbled_gm_5accc312.mp3", "Kkbttk  dwwyn  zazu   vitth", "", 3563887583, 849189009, Spawn, 6)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_garbled_gm_d0507054.mp3", "Qwizt viitt als zazra", "", 125702831, 2368179887, Spawn,6)
       end
    elseif Tone == 2 then
  	    local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/gnome_pipefitters/ft/gnome/gnome_pipefitters_2_garbled_gm_cbfe503a.mp3", "Krizz barawvitt zizzer zazz", "", 4099688689, 1852050375, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_garbled_gm_5accc312.mp3", "Kkbttk  dwwyn  zazu   vitth", "", 3563887583, 849189009, Spawn, 6)
       end 
    else
   	    local choice = MakeRandomInt(1,4)
	    if choice == 1 then 
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_garbled_gm_cbfe503a.mp3", "Krizz barawvitt zizzer zazz", "", 2689241953, 2133974294, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_garbled_gm_9833761f.mp3", "Zibbik niflik rul brun Dars atatien delvazra", "", 3533046903, 1779396904, Spawn, 6)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_garbled_gm_5accc312.mp3", "Kkbttk  dwwyn  zazu   vitth", "", 1894926357, 2259928649, Spawn, 6)
        elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_garbled_gm_d0507054.mp3", "Qwizt viitt als zazra", "", 4004332255, 385334874, Spawn,6)
        end 
    end
end

 function aggro(NPC,Player)   
    Tone = MakeRandomInt(1,3)
   SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=76 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,6 )then
    Garbled(NPC,Player)
    else
    if  Tone == 3 then
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_aggro_gm_577aa112.mp3", "Get the guards, quickly!", "", 2073183915, 4258412657, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_aggro_gm_89c9f643.mp3", "Hey! You're not in the union.", "", 499383697, 2098729593, Spawn, 6)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_aggro_gm_fca839e0.mp3", "Summon all the members. I'll deal with the intruders.", "", 2317475307, 1370622772, Spawn, 6)

        end
    elseif Tone == 2 then
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/gnome_pipefitters/ft/gnome/gnome_pipefitters_2_aggro_gm_fca839e0.mp3", "Summon all the members. I'll deal with the intruders.", "", 1342527378, 3527012719, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/gnome_pipefitters/ft/gnome/gnome_pipefitters_2_aggro_gm_89c9f643.mp3", "Hey! You're not in the union.", "", 4277677999, 1273643951, Spawn, 6)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_aggro_gm_577aa112.mp3", "Get the guards, quickly!", "", 2073183915, 4258412657, Spawn, 6)
        end 
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_aggro_gm_89c9f643.mp3", "Hey! You're not in the union.", "", 174808905, 4153490078, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_aggro_gm_577aa112.mp3", "Get the guards, quickly!", "", 1534621506, 2574895839, Spawn, 6)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_aggro_gm_fca839e0.mp3", "Summon all the members. I'll deal with the intruders.", "", 2175044611, 705364449, Spawn, 6)
        end 
    end
end   
end
end


function death(NPC,Player)
    Tone = MakeRandomInt(1,3)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if math.random(0,100)<=55 then
    if not HasLanguage(Player,6)then
    Garbled(NPC,Player)
    else
    if  Tone == 3 then
  	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_death_gm_107df143.mp3", "No fair!  They have better weapons.", "", 913939495, 772449547, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/gnome_pipefitters/ft/gnome/gnome_pipefitters_2_death_gm_6837d1aa.mp3", "Run away before we all die!", "", 2002248430, 1289200629, Spawn, 6)
        end
    elseif Tone == 2 then
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/gnome_pipefitters/ft/gnome/gnome_pipefitters_2_death_gm_107df143.mp3", "No fair!  They have better weapons.", "", 86520834, 1572132731, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/gnome_pipefitters/ft/gnome/gnome_pipefitters_2_death_gm_6837d1aa.mp3", "Run away before we all die!", "", 2002248430, 1289200629, Spawn, 6)
        end 
    else
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_death_gm_107df143.mp3", "No fair!  They have better weapons.", "", 1159166676, 1657447898, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/gnome_pipefitters/ft/gnome/gnome_pipefitters_1_death_gm_6837d1aa.mp3", "Run away before we all die!", "", 1128285167, 1552149555, Spawn, 6)
        end 
    end      
    end
    end
end
end





function victory(NPC,Player)
    if IsPlayer(Player)and  not HasLanguage(Player,6 )then
        Garbled(NPC,Player)
    elseif  IsPlayer(Player) and HasLanguage(Player,6 )then
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_Victory_gm_cbfe503a.mp3", "Strike that as another win for the Union!", "", 0, 0, Spawn, 6)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_Victory_gm_cbfe503a.mp3", "Haha! That will teach you to mess with my work!", "", 0, 0, Spawn, 6)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional5/gnome_pipefitters/ft/gnome/gnome_pipefitters_3_Victory_gm_cbfe503a.mp3", "Good... One step closer to my lunch break.", "", 0, 0, Spawn, 6)
       end
    end
end

