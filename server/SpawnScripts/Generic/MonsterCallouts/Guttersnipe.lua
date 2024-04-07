--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/Guttersnipe.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.05 05:12:41
    Script Purpose : Fabricated Guttersnipe callouts. VO file names posted, but keys are missing.
                   : 
--]]
local HealthCallout = false --REDUCES Half-Health Spam
local CalloutTimer = false --REDUCES Callout Spam

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end



 function aggro(NPC,Player)   
    AddTimer(NPC,math.random(15000,30000),"FifteenCall",1,Player)
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and math.random(0,100) <=33 and IsPlayer(Player) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if GetGender(NPC)==1 then --Male
 	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_aggro_gm_263c2013.mp3", "The Guttersnipes have no use for you! Die!","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_aggro_gm_2ef17f7.mp3", "Time for you to get out of Guttersnipe territory!", "", 0, 0, Player)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_aggro_gm_5d327d21.mp3", "Is that coins I hear? Time to pay up!", 0, 0, Player)
        elseif choice == 4 then
        AgroRaceCheck(NPC,Player)
        end
    else--Female
 	local choice = MakeRandomInt(1,4)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_aggro_gf_263c2013.mp3", "The Guttersnipes have no use for you! Die!","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_aggro_gf_2ef17f7.mp3", "Time for you to get out of Guttersnipe territory!", "", 0, 0, Player)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_aggro_gf_5d327d21.mp3", "Our turf, our rules! Get'm!", 0, 0, Player)
        elseif choice == 4 then
        AgroRaceCheck(NPC,Player)
        end
    end
end
end


function AgroRaceCheck(NPC,Player)
    if GetGender(NPC)==1 then --Male
 	    if GetClass(Player) <=0 and GetClass(Player) >=10 then
		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_maofighter_gm_21745cca.mp3", "This one looks like they can take a hit. I've got this!","", 0, 0)
        elseif GetClass(Player) <=11 and GetClass(Player) >=20  then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_maopriest_gm_6f5de.mp3", "We don't have time for your priestly nonsense!", "", 0, 0)
        elseif GetClass(Player) <=21 and GetClass(Player) >=30 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_maomage_gm_8c02387d.mp3", "Get'm! Don't let them cast anything!", 0, 0)
        elseif GetClass(Player) <=31 and GetClass(Player) then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_maoscout_gm_620be740", "Hit them quick! Before this sneaky one gets away!", 0, 0)
        end
    else--Female
 	    if GetClass(Player) <=0 and GetClass(Player) >=10 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_maofighter_gf_21745cca.mp3", "You lookin' for a fight, fighter? Come get some!","", 0, 0)
        elseif GetClass(Player) <=11 and GetClass(Player) >=20  then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_maopriest_gf_6f5de.mp3", "I'll cut you down before you can heal anyone, preist!", "", 0, 0)
        elseif GetClass(Player) <=21 and GetClass(Player) >=30 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_maomage_gf_8c02387d.mp3", "I'll shank you before you cast amy more spells, mage!", 0, 0)
        elseif GetClass(Player) <=31 and GetClass(Player) then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_maoscout_gf_620be740", "What's this? Scoutting our turf? Time to die!", 0, 0)
        end
    end
end

function death(NPC,Player)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if GetGender(NPC)==1 then --Male
 	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_death_gm_41191517", "What a waste, that was one good Guttersnipe...","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_death_gm_fc5cfc9f.mp3", "I joined... for protection...from this...", "", 0, 0, Player)
        end
    else--Female
 	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_death_gf_41191517.mp3", "What a waste, that was one good Guttersnipe...","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_death_gf_fc5cfc9f.mp3", "I thought... there would be backup...", "", 0, 0, Player)

        end
    end
end
end


function FifteenCall(NPC,Player)
 if IsAlive(NPC) and IsInCombat(NPC)==true  and IsPlayer(Player)and  GetTempVariable(NPC, "CalloutTimer")== "false" then
    if math.random(0,100)<=33 then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if GetGender(NPC)==1 then --Male
 	local choice = MakeRandomInt(1,11)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_cm_13cb812d.mp3", "You could never measure up to a Guttersnipe!","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_cm_9b9cbaba.mp3", "Stab'm! Stab! Stab! Stab!!", "", 0, 0, Player)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_cm_f0570dba.mp3", "Rough them up! I think I hear a coin purse!", 0, 0, Player)
        elseif choice == 4 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gm_1a61cf6b.mp3", "Oh, you think you're so tough?!", 0, 0, Player)
        elseif choice == 5 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gm_52579c2b", "Drop dead already! I've got a wager on your head!", 0, 0, Player)
        elseif choice == 6 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gm_9e75bb4f.mp3", "You ever wonder what it feels like to die? Well, get ready for it!", 0, 0, Player)
        elseif choice == 7 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gm_b9dbfd6c.mp3", "Our gang will cut you down!", 0, 0, Player)
        elseif choice == 8 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gm_fdde8d5a.mp3", "Guttersnipes forever!!", 0, 0, Player)
        elseif choice == 9 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_mm_1efc08d3.mp3", "Was that really a good idea?", 0, 0, Player)
        elseif choice == 10 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_mm_e5317b7b.mp3", "Wow, you're a lot uglier up close!", 0, 0, Player)
        elseif choice == 11 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_battle_mm_e9302d38.mp3", "Now, why did you do that? I guess you have a death wish!", 0, 0, Player)
 		end
    else--Female
 	local choice = MakeRandomInt(1,11)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_cf_13cb812d.mp3", "You could never measure up to a Guttersnipe!","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_cf_9b9cbaba.mp3", "The Sprawl belongs to us!", "", 0, 0, Player)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_cf_f0570dba.mp3", "Rough them up! I think I hear a coin purse!", 0, 0, Player)
        elseif choice == 4 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gf_1a61cf6b.mp3", "Oh, you think you're so tough?!", 0, 0, Player)
        elseif choice == 5 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gf_52579c2b", "Drop dead already! I've got a wager on your head!", 0, 0, Player)
        elseif choice == 6 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gf_9e75bb4f.mp3", "Our gang has no place for the likes of you!", 0, 0, Player)
        elseif choice == 7 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gf_b9dbfd6c.mp3", "Your ear would look great on a necklace. Give it here!", 0, 0, Player)
        elseif choice == 8 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_gf_fdde8d5a.mp3", "Guttersnipes forever!!", 0, 0, Player)
        elseif choice == 9 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_mf_1efc08d3.mp3", "Was that really a good idea?", 0, 0, Player)
        elseif choice == 10 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_mf_e5317b7b.mp3", "Wow, you're a lot uglier up close!", 0, 0, Player)
        elseif choice == 11 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_battle_mf_e9302d38.mp3", "Now, why did you do that? I guess you have a death wish!", 0, 0, Player)
 		end
    end
    end
    
    if IsAlive(NPC)then
    AddTimer(NPC,math.random(15000,30000),"FifteenCall",1,Player)
    end
end  
end





function victory(NPC,Player)
if  IsPlayer(Player) then
    if GetGender(NPC)==1 then --Male
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_victory_gm_348b23fd", "I call dibs on their stuff!","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_victory_gm_85bbc93f.mp3", "Shouldn't have messed with us! Now you're dead!", "", 0, 0, Player)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/optional5/human_guttersnipe/ft/human/human_guttersnipe_1_victory_gm_97725909", "Chalk up another win for the Guttersnipes!", "", 0, 0, Player)
        end
    else--Female
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_victory_gf_348b23fd", "I call dibs on their stuff!","", 0, 0, Player)
        elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_victory_gf_85bbc93f.mp3", "Shouldn't have messed with us! Now you're dead!", "", 0, 0, Player)
        elseif choice == 3 then
 		PlayFlavor(NPC, "voiceover/english/optional3/human_guttersnipe/ft/human/human_guttersnipe_1_victory_gf_97725909", "Chalk up another win for the Guttersnipes!", "", 0, 0, Player)
 		end
    end
end
end
