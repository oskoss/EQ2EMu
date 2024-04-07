--[[
    Script Name    : SpawnScripts/SinkingSands/Fasul.lua
    Script Author  : premierio015
    Script Date    : 2023.12.17 01:12:36
    Script Purpose :  
                   : 
--]]

function spawn(NPC)
MoveToLocation(NPC, -1123.05 -209.57, -247.38, 3, "", true)
MoveToLocation(NPC, -1131.05, -210.41, -243.83, 3, "", true)
MoveToLocation(NPC, -1147.28, -212.40, -236.22, 3, "", false)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function aggro(NPC, Spawn)
PlayFlavor(NPC, "voiceover/english/exp01/human_sand_sea_pirates_1/ft/_exp01/human/human_sand_sea_pirates_1_aggro_gm_d96d04b.mp3", "'Tis not often a mark comes to me.", "", 967500505, 3452525704)
end

function killed(NPC, Spawn)
PlayFlavor(NPC, "voiceover/english/exp01/human_sand_sea_pirates_1/ft/_exp01/human/human_sand_sea_pirates_1_victory_gm_8f919e22.mp3", "Take anything of worth, then throw them to sea.", "", 2264125921, 3311027459)
end

function healthchanged(NPC, Spawn)
local chance = MakeRandomInt(1, 100)
if chance <= 15 then
local choice = MakeRandomInt(1, 3)
if choice == 1 then
PlayFlavor(NPC, "voiceover/english/exp01/human_sand_sea_pirates_1/ft/_exp01/human/human_sand_sea_pirates_1_battle_gm_129582bc.mp3", "Too scared to fight on the water?", "", 3449011253,  2221154827)
elseif choice == 2 then
PlayFlavor(NPC, "voiceover/english/exp01/human_sand_sea_pirates_1/ft/_exp01/human/human_sand_sea_pirates_1_battle_gm_f2ef67d0.mp3", "I thought scorpions crawled, not walked.", "", 3903435859, 1056182778)
end
end
end







function death(NPC, Spawn)
PlayFlavor(NPC, "voiceover/english/exp01/human_sand_sea_pirates_1/ft/_exp01/human/human_sand_sea_pirates_1_death_gm_562e1d8a.mp3", "The sea, she calls to me.", "", 1233488773, 3203009163)
end



function respawn(NPC)
	spawn(NPC)
end