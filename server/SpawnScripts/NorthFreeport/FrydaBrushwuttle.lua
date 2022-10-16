--[[
    Script Name    : SpawnScripts/NorthFreeport/FrydaBrushwuttle.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.19 12:06:24
    Script Purpose : 
                   : 
--]]
function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,3)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_hail_gf_d088c20d.mp3", "The stuff's over there.  Just let me know if you find anything you like.", "ponder", 1324995812, 3252792374, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_hail_gf_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 3830210026, 2739804736, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_hail_gf_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time?  This isn't a museum display you know!", "glare", 2509544157, 3594072091, Spawn, 0)
	end
end