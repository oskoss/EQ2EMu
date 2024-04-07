--[[
    Script Name    : SpawnScripts/Longshadow/MenderBrelslade.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.17 01:10:57
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "metalworking_idle")
end

function hailed(NPC, Spawn)
    FaceTarget(NPC,Spawn)
    if GetFactionAmount(Spawn,12) >0 then
	RandomGreeting(NPC, Spawn)
	else
	PlayFlavor(NPC, "", "We don't serve your pathetic kind here.  Get out of my sight!", "heckno", 0, 0, Spawn, 0)
    end	    
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/mender/darkelf_mender_service_evil_1_hail_gm_3b60608.mp3", "I can emphatically say repairing weapons is much more reliable than buying new ones.  Would I lie? ", "agree", 4144081896, 3215065022, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/mender/darkelf_mender_service_evil_1_hail_gm_96a8c8ad.mp3", "Nah, no need to buy a completely new set.  I'll use some of this special solvent I have.  It'll fix it up good as new!", "no", 1542332176, 1407196466, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/mender/darkelf_mender_service_evil_1_hail_gm_a2234480.mp3", "Once we're done, you'll have the strongest armor in all of the city!  I guarantee it!", "wink", 2676926812, 2314515685, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/mender/darkelf_mender_service_evil_1_hail_gm_de6b9f05.mp3", "You need help fixing that pile of junk?  Well it's going to cost you.", "tapfoot", 1475585177, 595941913, Spawn, 0)
	end
end

function respawn(NPC)
	spawn(NPC)
end