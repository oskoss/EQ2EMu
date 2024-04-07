--[[
    Script Name    : SpawnScripts/Antonica/Lanice.lua
    Script Author  : Premierio015
    Script Date    : 2021.08.27 07:08:32
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    choice = MakeRandomInt(1,2)
    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/halfelf_eco_good_1/ft/service/bartender/halfelf_bartender_service_good_1_hail_gf_ce1f039f.mp3", "Might I interest you in some meat and cheese to go with that tall glass of ale?", "shrug", 3345899068, 3251734592, Spawn)
    elseif choice == 2 then
    PlayFlavor(NPC, "voiceover/english/human_eco_good_barmaid/ft/eco/good/human_eco_good_barmaid_hail_gf_619dfe80.mp3", "Its always hard to keep everyone happy around here.  There's always someone whose thirsty or needs a mess cleaned.", "shrug", 3234664124, 1293275447, Spawn)
    end        
end

function respawn(NPC)
	spawn(NPC)
end