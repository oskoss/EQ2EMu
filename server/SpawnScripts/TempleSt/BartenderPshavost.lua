--[[
    Script Name    : SpawnScripts/TempleSt/BartenderPshavost.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:07
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,3)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/bartender/ratonga_bartender_service_evil_1_hail_gm_c5b9c7c2.mp3", "You want to talk?  If you want us to be friends all you need to do is buy a drink!", "stare", 2131223265, 1605898906, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/bartender/ratonga_bartender_service_evil_1_hail_gm_4b169ed.mp3", "I do believe a gratuity is in order.", "glare", 2139635297, 3079613468, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/bartender/ratonga_bartender_service_evil_1_hail_gm_e79db99d.mp3", "So tell me, what's your poison?", "hello", 3450524843, 2155939703, Spawn, 0)
	end
end