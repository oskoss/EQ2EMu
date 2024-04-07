--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/BaseRatonga1.lua
    Script Author  : dorbin
    Script Date    : 2024.01.05 01:01:43
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
    SetTempVariable(NPC, "CalloutTimer", "false")
if  GetTempVariable(NPC, "CalloutTimer")== "false" and MakeRandomInt(0,100) <=33 and IsPlayer(Spawn) then
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
    if GetGender(NPC)==1 then       --GENDER CHECK.  1==Male
     choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_aggro_gm_4af7a99.mp3", "You're not as sneaky as you thought.", "", 1683997219, 1178080164)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_aggro_gm_7c145a1f.mp3", "Sees us, did we? Must not let you talk then.", "", 1928944506, 4197211546)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_aggro_gm_ce5970ec.mp3", "Startle us, you did! We'll remedy that.", "", 3710022769, 1084825101)
        end  
    else
 	 choice = MakeRandomInt(1,4)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_aggro_gf_ce5970ec.mp3", "Startle us, you did! We'll remedy that.", "", 3905874632, 4086824059)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_aggro_gf_7c145a1f.mp3", "Sees us, did we? Must not let you talk then.", "", 2661963919, 697614069)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_aggro_gf_4af7a99.mp3", "You're not as sneaky as you thought.", "", 1898398655, 853136085)
        elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_2/ft/ratonga/ratonga_base_2_1_aggro_gf_a3d8a506.mp3", "Not very nice of you to be all sneaky.", "", 2210593426, 1217099089, Spawn, 0)
        end
end    
end
end   



function death(NPC,Spawn)
 if  GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Player) then
    if GetGender(NPC)==1 then
 	local choice = MakeRandomInt(1,2)
    
        if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_death_gm_e9ba5c44.mp3", "Flee and take care of them later.", "", 2862575499, 3074650652)
        elseif choice == 2 then
        end
    else
 	local choice = MakeRandomInt(1,2)
 	    if choice == 1 then
		PlayFlavor(NPC, "", "Ow...OWww!", "", 0, 0)
        else
		PlayFlavor(NPC, "", "This is the end... for meess...", "", 0, 0)
       end
    end
    end
end



function healthchanged(NPC, Spawn)  
 if GetTempVariable(NPC, "CalloutTimer") == "false" and IsPlayer(Player) and IsAlive(NPC)==true then
    if GetTempVariable(NPC, "HealthCallout") == "false" then
    if GetHP(NPC) < GetMaxHP(NPC) * 0.55 and GetHP(NPC) > GetMaxHP(NPC) * 0.45 then
    SetTempVariable(NPC, "HealthCallout", "true")
    SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,10000,"ResetTimer")
        AddTimer(NPC,12500,"HealthReset")
    if GetGender(NPC)==1 then
	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_halfhealth_gm_a2ace12c.mp3", "Don't hurt us! We're no threat to your mightiness.", "", 3593075606, 2907318102)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_halfhealth_gm_9c7df7ea.mp3", "That patch of fur will never grow back, you know.", "", 2241929269, 2874755723)
        end
    else
	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_halfhealth_gf_a2ace12c.mp3", "Don't hurt us! We're no threat to your mightiness.", "", 1631608737, 385456101)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_halfhealth_gf_9c7df7ea.mp3", "That patch of fur will never grow back, you know.", "", 4146309857, 1135607887)
        end
    end
    end
end
end    
end

function victory(NPC,Spawn)
    if GetGender(NPC)==1 then
	local choice = MakeRandomInt(1,3)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gm_935883a.mp3", "Shhh ... shhh ... it's ok ... shhh ...shhh. Stop fighting it...", "", 1459182295, 1340643629)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gm_732f23e7.mp3", "The dead tell no tales", "", 636430623, 2715556056)
        elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gm_15e8fc93.mp3","One less worry in my life!",4116602987,3804155045)
       end
    else
	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gf_935883a.mp3", "Shhh ... shhh ... it's ok ... shhh ...shhh. Stop fighting it...", "", 1459182295, 1340643629)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional3/ratonga_base_1/ft/ratonga/ratonga_base_1_1_victory_gf_732f23e7.mp3", "The dead tell no tales", "", 636430623, 2715556056)
        end
    end
end
--end

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

function HealthReset (NPC)  --SO HALF HEALTH DOESN'T SPAM
    SetTempVariable(NPC, "HealthCallout", "false")
end