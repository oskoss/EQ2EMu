--[[
    Script Name    : SpawnScripts/Commonlands/CargomasterLibertius.lua
    Script Author  : dorbin
    Script Date    : 2024.01.13 04:01:25
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
	local choice = MakeRandomInt(1,1)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/cargomaster_libertius/commonlands/quest/qst_cargomaster_libertius_callout1_d5d85945.mp3", "I've nothing to offer you, traveler.", "no", 100112139, 1434536394, Spawn, 0)
	end
end