--[[
    Script Name    : SpawnScripts/TheRuins_Classic/SlaynBrokentusk.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.01 03:08:17
    Script Purpose : 
                   : 
--]]




















--  VO COLLECTION  --

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
if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if not HasLanguage(Player,17 )then
    Garbled(NPC,Player)
    else
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_aggro_2d2ccd12.mp3", "Incoming! Summon the warriors.", "", 3730616476, 4212115469, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_aggro_478609c4.mp3", "This must be my lucky day.", "", 1552928496, 830976152, Player, 17)
        elseif choice == 3 then
		if GetClass(Player) <=1 and GetClass(Player) >=10 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_maofighter_42d206ef.mp3", "Kill the ugly one! He has the most armor!", "", 1385896447, 1033709680, Player, 17)
        else
		PlayFlavor(NPC, "voiceover/english/optional3/orc_brokentusk/ft/orc/orc_brokentusk_1_aggro_7afa7bb1.mp3", "Perfect! This one has some nice things.", "", 3642130783, 1736257146, Player, 17)
        end
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
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_death_f7b415bf.mp3", "Run for your life!", "", 1229175170, 4046634541, Player, 17)
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
      local choice = MakeRandomInt(1,5)
	if choice == 1 then
        if GetClass(NPC) <=11 and GetClass(NPC)>=30 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_c_9bab0561.mp3", "Wait, where is my book?", "", 3815705437, 2144969522, Player, 17)
        else
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_m_cee9556a.mp3", "Okay, try using your weapon this time!", "", 2617802671, 3658192888, Player, 17)
        end
    elseif choice == 2 then
        if GetClass(NPC) <=11 and GetClass(NPC)>=30 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_c_dc33f5e9.mp3", "Does anybody have an extra fire beetle eye? ...Never mind.", "", 88571247, 1912603138, Player, 17)
        else
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_m_cee9556a.mp3", "Okay, try using your weapon this time!", "", 2617802671, 3658192888, Player, 17)
        end
    elseif choice == 3 then
        if GetClass(NPC) <=11 and GetClass(NPC)>=30 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_c_f79b266b.mp3", "Help!  I only know one spell!", "", 2648192261, 1154758802, Player, 17)
        else
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_c234f7ec.mp3", "We don't need reinforcements. Attack!", "", 3931748607, 200204217, Player, 17)
        end
    elseif choice == 4 then
 		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_22527607.mp3", "Get em! Get em! Get em!", "", 2020932501, 2692113351, Player, 17)
    elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_battle_27011747.mp3", "Who cares if they're stronger, we're orcs!", "", 769549584, 170271605, Player, 17)
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
      local choice = MakeRandomInt(1,3)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_victory_4a834d11.mp3", "I killed one?", "", 494264984, 880425961, Player, 17)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_victory_5ec9f9e2.mp3", "Keep fighting while I get these boots!", "", 1910539619, 2233613105, Player, 17)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/orc_lonetusk/ft/orc/orc_lonetusk_2_victory_82b00e31.mp3", "I must have scared them to Death.", "", 4172718711, 2353147238, Player, 17)
        end
    end
end