--[[
    Script Name    : SpawnScripts/BuccaneersHideout/abattlehardenedbuccaneer.lua
    Script Author  : Dorbin
    Script Date    : 2022.12.17 04:12:15
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)

end

function aggro(NPC,Spawn)
    if GetGender(NPC)==2 then
    choice = MakeRandomInt(1,4)
    if choice ==1 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_base_1/ft/human/human_base_1_1_aggro_gf_583690dc.mp3", "Summon help!  We have invaders!", "", 1598905349, 2204481929, Spawn, 0)
    elseif choice ==2 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_base_1/ft/human/human_base_1_1_halfhealth_gf_8529e507.mp3", "I can't hold them forever!", "", 3371581229, 792393228, Spawn, 0)
    elseif choice ==3 then
		PlayFlavor(NPC, "voiceover/english/optional3/human_base_1/ft/human/human_base_1_1_aggro_gf_a203c9ec.mp3", "Prepare to face your doom, meddler.", "", 3593389433, 3838830228, Spawn, 0)
    elseif choice ==4 then
		PlayFlavor(NPC, "voiceover/english/optional3/barbarian_base_1/ft/barbarian/barbarian_base_1_2_aggro_gf_394a7fe3.mp3", "Not sneaky enough to get past me.", "", 1014195867, 4030043484, Spawn, 0)
    end
else
    local choice = MakeRandomInt(1,3)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/human_dervish/ft/human/human_dervish_1_aggro_gm_5431aa20.mp3", "There they are! Get them!", "", 2165643563, 2117457907, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_dervish/ft/human/human_dervish_1_aggro_gm_5a34aed6.mp3", "Make sure they die quietly!", "", 3777681635, 634895945, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_dervish/ft/human/human_dervish_1_halfhealth_gm_b1dc44d0.mp3", "It's been awhile since anyone fought back!", "", 1623736591, 2832676927, Spawn, 0)
	end

end
end

function death(NPC,Spawn)
    if GetGender(NPC)==1 then    
    local choice = MakeRandomInt(1,2)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/human_dervish/ft/human/human_dervish_1_halfhealth_gm_b1dc44d0.mp3", "It's been awhile since anyone fought back!", "", 1623736591, 2832676927, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_dervish/ft/human/human_dervish_1_death_gm_94279fc3.mp3", "Someone get some help, fast!", "", 2213603766, 3071153854, Spawn, 0)
	end
end
end

function respawn(NPC)
	spawn(NPC)
end