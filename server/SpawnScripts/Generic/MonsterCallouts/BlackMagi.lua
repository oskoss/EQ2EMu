--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/BlackMagi.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.01 01:12:00
    Script Purpose : 
                   : 
--]]
local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

 

function Garbled(NPC,Player)
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_garbled_gm_21432a6a.mp3", "TravaHAS merallund kBORrten illanya", "", 1178396737, 3396757213, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_garbled_gm_5a81ec49.mp3", "Hekveten plava SU klina", "", 3849408454, 1757211832, Player, 26)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_garbled_gm_bc265d9b.mp3", "EeeSIP   qweek  MEEerallow  neep", "", 1253151944, 2827076804, Player, 26)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_garbled_gm_5c77ba46.mp3", "Chee   ava   kirAH   tay!", "", 1953495633, 901796916, Player, 26)
        end
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_garbled_gf_21432a6a.mp3", "TravaHAS merallund kBORrten illanya", "", 3484386885, 1475086391, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_garbled_gf_5a81ec49.mp3", "Hekveten plava SU klina", "", 3639926873, 1002267878, Player, 26)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_darkblades/ft/ratonga/ratonga_darkblades_1_garbled_gf_5a81ec49.mp3", "Hekveten plava SU klina", "", 4282746773, 1025120966, Player, 26)
        end        
end
end

 function aggro(NPC,Player)   
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=33 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,26 )then
    Garbled(NPC,Player)
    else
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_aggro_gm_ad7530c0.mp3", "Kill the intruder!", "", 2219487268, 4134058791, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_aggro_gm_b7a71d5b.mp3", "Blind its eyes!", "", 1105207049, 1634151428, Player, 26)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_aggro_gm_a33765b3.mp3", "The Black Magus rule the Sprawl!", "", 1461049897, 1751771993, Player, 26)

        end
    else
   	local choice = MakeRandomInt(1,3)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_aggro_gf_ad7530c0.mp3", "Kill the intruder!", "", 671062994, 1658163041, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_aggro_gf_a33765b3.mp3", "The Black Magus rule the Sprawl!", "", 1848525428, 1274115535, Player, 26)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_aggro_gf_b7a71d5b.mp3", "Blind its eyes!", "", 2430948603, 4141201947, Player, 26)
        end        
end
end   
end
end


function death(NPC,Player)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if math.random(0,100)<=35 then
    if not HasLanguage(Player,26 )then
    Garbled(NPC,Player)
    else
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_death_gm_46ba8472.mp3", "That was just a runt!", "", 2089979278, 2314600701, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_darkblades/ft/ratonga/ratonga_darkblades_1_death_gm_e7600f72.mp3", "Now who will pick the locks?!", "", 2755004589, 1076685336, Player, 26)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_black_magi/ft/ratonga/ratonga_black_magi_1_death_gm_5a5e2dda.mp3", "This doesn't look so good.", "", 1114919917, 808862085, Player, 26)
       end
    else
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then -- FEMALE
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_darkblades/ft/ratonga/ratonga_darkblades_2_death_gf_e7600f72.mp3", "Now who will pick the locks?!", "", 253904273, 1976320729, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_darkblades/ft/ratonga/ratonga_darkblades_2_death_gf_497acee7.mp3", "That just improves my cut of the loot!", "", 1920882673, 458148245, Player, 26)

        end        
    end
    end
end
end
end





function victory(NPC,Player)
    if IsPlayer(Player)and  not HasLanguage(Player,26 )then
        Garbled(NPC,Player)
    elseif  IsPlayer(Player) and HasLanguage(Player,26 )then
    if GetGender(NPC) ==1 then -- MALE
  	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gm_935883a.mp3", "Shhh ... shhh ... it's ok ... shhh ...shhh. Stop fighting it...", "", 1459182295, 1340643629, Player, 26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gm_732f23e7.mp3", "The dead tell no tales", "", 636430623, 2715556056, Player, 26)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gm_15e8fc93.mp3", "One less worry in my life!", "", 4116602987, 3804155045, Player,26)
       end
    else
   	local choice = MakeRandomInt(1,2)
	    if choice == 1 then -- FEMALE
        PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gf_732f23e7.mp3", "The dead tell no tales", "", 1062202875, 1393213249, Player,26)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gf_935883a.mp3", "Shhh ... shhh ... it's ok ... shhh ...shhh. Stop fighting it...", "", 1459182295, 1340643629, Player, 26)

        end        
    end
    end
end

