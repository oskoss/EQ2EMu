--[[
    Script Name    : SpawnScripts/FermentedGrape/aperplexedbartender.lua
    Script Author  : Dorbin
    Script Date    : 2022.12.04 05:12:55
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)

end





   local greetingsTable = { "voiceover/english/voice_emotes/greetings/greetings_1_1012.mp3",
    						 "voiceover/english/voice_emotes/greetings/greetings_2_1012.mp3",
    						 "voiceover/english/voice_emotes/greetings/greetings_3_1012.mp3"};

function hailed(NPC, Spawn)
local zone = GetZone(NPC)
local Pirate1 = GetSpawnByLocationID(zone, 133781037) --FIRSTMATE  
local Pirate2 = GetSpawnByLocationID(zone, 133781036) --CUTTER  
local Pirate3 = GetSpawnByLocationID(zone, 133781038)   
local Pirate4 = GetSpawnByLocationID(zone, 133781039)   
local Pirate5 = GetSpawnByLocationID(zone, 133781035)   
local Pirate6 = GetSpawnByLocationID(zone, 133781034)   
local Captain = GetSpawnByLocationID(zone, 133781033)

local Bartender = GetSpawnByLocationID(zone, 133781031)  
local Bard = GetSpawnByLocationID(zone, 133781032)  
local Bobick = GetSpawnByLocationID(zone, 133781027)  

if not IsAlive(Pirate1) and not IsAlive(Pirate2) and not IsAlive(Pirate3) and not IsAlive(Pirate4) and not IsAlive(Pirate5) and not IsAlive(Pirate6) and not IsAlive(Captain) then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_hail_gm_57b9ce4e.mp3", "I am sorry.  I am burdened with my own thoughts, and haven't a moment to converse.", "no", 1692526278, 2332878998, Spawn)
else
	PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_hail_gm_eb4f8f5d.mp3", "I hope you have been sent by someone of importance. I'm quite busy.", "grumble", 111891212, 1507953677, Spawn)
end
end


function respawn(NPC)
	spawn(NPC)
end