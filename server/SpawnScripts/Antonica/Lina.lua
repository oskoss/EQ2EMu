--[[
    Script Name    : SpawnScripts/Antonica/Lina.lua
    Script Author  : Premierio015
    Script Date    : 2021.08.22 08:08:42
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	--PlayFlavor(NPC, "", "If you see something you need just let me know.", "", 1689589577, 4560189, Spawn)
    local choice = MakeRandomInt(1,2)
    if choice == 1 then
PlayFlavor(NPC, "voiceover/english/optional2/human_eco_good_2/ft/service/merchant/human_merchant_service_good_2_hail_gf_45d92a75.mp3", "Welcome! What can I help you with?", "hello", 218555884, 644636009, Spawn)
    elseif choice == 2 then
PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/baker/human_baker_service_good_1_hail_gf_cca9cdef.mp3", "Welcome friend, welcome. I hope you brought your appetite with you!", "wink", 488782681, 166399094, Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end