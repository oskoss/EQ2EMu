--[[
    Script Name    : SpawnScripts/Generic/MonsterCallouts/BaseZombie1.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 12:08:47
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
    SetTempVariable(NPC, "CalloutTimer", "true")
    AddTimer(NPC,10000,"ResetTimer")
 	local choice = MakeRandomInt(1,3)
 	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_aggro_gm_ed97b327.mp3", "I will slowly strip the fleshy tissue from your body!", "", 3093455157, 448746789, Spawn, 0)
        elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_aggro_gm_7562a2d8.mp3", "Now you've made me hungry!", "", 2457939212, 807289510, Spawn, 0)
        elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_aggro_gm_f9016be9.mp3", "Why do you pester me?", "", 2204405446, 1306718710, Spawn, 0)
    end
end   



function death(NPC,Spawn)
  if     GetTempVariable(NPC, "CalloutTimer")== "false" and IsPlayer(Spawn) then
        local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_death_gm_295360a5.mp3", "Feed on the fallen after we are victorious.", "", 3693073203, 1294287468, Spawn, 0)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_death_gm_f086e41b.mp3", "You cannot stop us all!", "", 1972347388, 3291104853, Spawn)
    end
    end
end



function healthchanged(NPC, Spawn)  
 if GetTempVariable(NPC, "CalloutTimer") == "false" and IsPlayer(Spawn) then
    if GetTempVariable(NPC, "HealthCallout") == "false" then
    if GetHP(NPC) < GetMaxHP(NPC) * 0.55 then
    if GetHP(NPC) > GetMaxHP(NPC) * 0.45 then
    SetTempVariable(NPC, "HealthCallout", "true")
    SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,10000,"ResetTimer")
        AddTimer(NPC,12500,"HealthReset")
    local choice = MakeRandomInt(1,2)
	if choice == 1 then
    PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_halfhealth_gm_4d9fe331.mp3", "What you do to me, I will double on to you!", "", 3966548503, 4041708379, Spawn)
	elseif choice == 2 then
    PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_halfhealth_gm_e51a0853.mp3", "I feel no pain!", "", 4045005655, 88734265, Spawn)
    end    
    end
    end
    end
end
end


function victory(NPC,Spawn)
  local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/zombie_base_1/ft/zombie/zombie_base_1_1_victory_gm_c6b1a91.mp3", "Wonderful bounty of flesh!", "", 1214200232, 3299404629, Spawn, 0)
        elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/zombie_hands_of_tseralith/ft/zombie/zombie_hands_of_tseralith_1_victory_gm_4a268630.mp3", "Your death brings me strength.", "", 2621974641, 301635725, Spawn)
end
end



function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end

function HealthReset (NPC)  --SO HALF HEALTH DOESN'T SPAM
    SetTempVariable(NPC, "HealthCallout", "false")
end