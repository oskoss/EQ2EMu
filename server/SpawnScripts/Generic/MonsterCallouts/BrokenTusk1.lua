--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/BrokenTusk1.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.05 06:07:11
    Script Purpose : 
                   : 
--]]
local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

 

function Garbled(NPC,Player)
  	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_garbled_d552223c.mp3", "GEKKKKnoh!   Ezzrrt sha  kemm.", "", 1083788244, 2181690295, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_garbled_95912cdc.mp3", "Harkt brecht ogglot kressht", "", 1749294695, 2575234394, Player, 17)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_garbled_73b2c225.mp3", "Gretz kagh   lotgg    vep   nabrecht", "", 3140410719, 1155418716, Player, 17)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_garbled_cd184493.mp3", "Purzt gort NARGAAAAA!!!  Durzog carb!", "", 2698130766, 658534720, Player, 17)
     end     
end

 function aggro(NPC,Player)   
    AddTimer(NPC,MakeRandomInt(15000,30000),"FifteenCall",1,Player)
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=33 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,17 )then
    Garbled(NPC,Player)
    else
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_aggro_7be96fc0.mp3", "Help! Intruders are here to kill us all.", "", 3649123076, 3496691517, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_aggro_58aa3cd6.mp3", "Everyone, over here. Kill them and take their boots!", "", 434487644, 2328686578, Player, 17)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_aggro_7afa7bb1.mp3", "Perfect! This one has some nice things.", "", 3642130783, 1736257146, Player, 17)
        end
end   
end
end


function death(NPC,Player)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if math.random(0,100)<=35 then
    if not HasLanguage(Player,17 )then
    Garbled(NPC,Player)
    else
        local choice = MakeRandomInt(1,3)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_death_e08325ae.mp3", "Quick, get them off me!", "", 244259445, 3279788307, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_death_145827a4.mp3", "Help!  I can't feel my arm.", "", 2498804724, 1519811140, Player, 17)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_death_77dcb788.mp3", "Uh ohhhhhhhhh!", "", 422612512, 3900776578, Player, 17)
        end
    end
end
end
end


function FifteenCall(NPC,Player)
 if IsAlive(NPC) and IsInCombat(NPC)==true  and IsPlayer(Player)and  GetTempVariable(NPC, "CalloutTimer")== "false" then
    if math.random(0,100)<=33 then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,17 )then
    Garbled(NPC,Player)
    else       
      local choice = MakeRandomInt(1,3)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_battle_m_15e66010.mp3", "I think we should just run!", "", 1889420114, 3820789621, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_battle_m_bed76d51.mp3", "Fall over and they'll think we're dead.", "", 2824708625, 2715771581, Player, 17)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_battle_21272d14.mp3", "Can anyone understand what they're saying?", "", 3815828677, 3690188091, Player, 17)
    end
    end
    end
    if IsAlive(NPC)then
    AddTimer(NPC,MakeRandomInt(15000,30000),"FifteenCall",1,Player)
    end
end  
end





function victory(NPC,Player)
    if IsPlayer(Player)and  not HasLanguage(Player,17 )then
        Garbled(NPC,Player)
    elseif  IsPlayer(Player) and HasLanguage(Player,17 )then
      local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_victory_cebb45a9.mp3", "Look, I killed one!  I killed one!", "", 1939874871, 624844821, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_victory_bfb0a7a3.mp3", "All of this stuff is mine!", "", 4284515986, 2571034270, Player, 17)
        end
    end
end