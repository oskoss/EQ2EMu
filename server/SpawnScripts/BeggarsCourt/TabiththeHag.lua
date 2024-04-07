--[[
	Script Name		: SpawnScripts/BeggarsCourt/TabiththeHag.lua
	Script Purpose	: Tabith the Hag
	Script Author	: Dorbin
	Script Date		: 2023.11.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
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

local PRIEST = 11 
local CLERIC = 12 
local TEMPLAR = 13 
local INQUISITOR = 14 
local DRUID = 15 
local WARDEN = 16 
local FURY = 17 
local SHAMAN = 18 
local MYSTIC = 19 
local DEFILER = 20 

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

local SCOUT = 31 
local ROGUE = 32 
local SWASHBUCKLER = 33 
local BRIGAND = 34 
local BARD = 35 
local TROUBADOR = 36 
local DIRGE = 37 
local PREDATOR = 38 
local RANGER = 39 
local ASSASSIN = 40 
local ANIMALIST = 41 
local BEASTLORD = 42 
local SHAPER = 43 
local CHANNELER = 44 

function spawn(NPC)
SetPlayerProximityFunction(NPC, 8, "InRange", "LeaveRange")
waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    Seer(NPC,Spawn)	
end

function respawn(NPC)
	spawn(NPC)
end

local CalloutTimeCheck = false                                                -- used to delay between callout uses


function InRange(NPC, Spawn) --Quest Callout
	if CalloutTimeCheck == false then
    if math.random(1, 100) <= 20 then
        CalloutTimeCheck = true
	    FaceTarget(NPC, Spawn)        
        SeerShout(NPC, Spawn)    
		AddTimer(NPC,50000,"ResetCalloutTimer")                        
    end
end
end

function ResetCalloutTimer(NPC)                                               -- resets callout timer after use
   CalloutTimeCheck = false 
end

function Seer(NPC,Spawn)	
    choice = math.random(1,2)
    FaceTarget(NPC, Spawn) 
    if choice ==1 then
    PlayFlavor(NPC, "","", "ponder", 0, 0, Spawn)
        else
   
    if GetClass(Spawn)==SCOUT or GetClass(Spawn)==ROGUE or GetClass(Spawn)==SWASHBUCKLER or GetClass(Spawn)==BRIGAND or GetClass(Spawn)==BARD or GetClass(Spawn)==TROUBADOR or GetClass(Spawn)==DIRGE or GetClass(Spawn)==PREDATOR or GetClass(Spawn)==RANGER or GetClass(Spawn)==ASSASSIN or GetClass(Spawn)==ANIMALIST or GetClass(Spawn)==BEASTLORD then
    PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_scout_gf_a250f41f.mp3", "Stealth, guile and bravado shall follow you on your path to greatness.", "", 1797841506, 2868715164, Spawn)

    elseif GetClass(Spawn)==MAGE or GetClass(Spawn)==SORCERER or GetClass(Spawn)==WIZARD or GetClass(Spawn)==WARLOCK or GetClass(Spawn)==ENCHANTER or GetClass(Spawn)==ILLUSIONIST or GetClass(Spawn)==COERCER or GetClass(Spawn)==SUMMONER or GetClass(Spawn)==CONJUROR or GetClass(Spawn)==NECROMANCER then
	PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_mage_gf_f18445ae.mp3", "Clearly your intellect is your best asset. The world shall marvel at the wonders you control.", "", 2374480230, 2549502692, Spawn, 0)

    elseif GetClass(Spawn)==CLERIC or GetClass(Spawn)==TEMPLAR or GetClass(Spawn)==INQUISITOR or GetClass(Spawn)==DRUID or GetClass(Spawn)==WARDEN or GetClass(Spawn)==FURY or GetClass(Spawn)==SHAMAN or GetClass(Spawn)==MYSTIC or GetClass(Spawn)==DEFILER or GetClass(Spawn)==PRIEST or GetClass(Spawn)==SHAPER or GetClass(Spawn)==CHANNELER then
    PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_priest_gf_5c80506d.mp3", "Your spirit is strong, as is your faith. You shall move more than mountains, you shall move souls.", "", 894403956, 265994277, Spawn)

    elseif GetClass(Spawn)==FIGHTER or GetClass(Spawn)==WARRIOR or GetClass(Spawn)==GUARDIAN or GetClass(Spawn)==BERSERKER or GetClass(Spawn)==BRAWLER or GetClass(Spawn)==MONK or GetClass(Spawn)==BRUISER or GetClass(Spawn)==CRUSADER or GetClass(Spawn)==SHADOWKNIGHT or GetClass(Spawn)==PALADIN then
	PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_fighter_gf_544e4a58.mp3", "Epic battles await your future, but the strength of your arm shall tame them all!", "", 3412016143, 1212387502, Spawn, 0)
        end
    end
end

function SeerShout(NPC,Spawn)	
    if GetClass(Spawn)==SCOUT or GetClass(Spawn)==ROGUE or GetClass(Spawn)==SWASHBUCKLER or GetClass(Spawn)==BRIGAND or GetClass(Spawn)==BARD or GetClass(Spawn)==TROUBADOR or GetClass(Spawn)==DIRGE or GetClass(Spawn)==PREDATOR or GetClass(Spawn)==RANGER or GetClass(Spawn)==ASSASSIN or GetClass(Spawn)==ANIMALIST or GetClass(Spawn)==BEASTLORD or GetClass(Spawn)==SHAPER or GetClass(Spawn)==CHANNELER then
    PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_scout_gf_a250f41f.mp3", "Stealth, guile and bravado shall follow you on your path to greatness.", "", 1797841506, 2868715164)

    elseif GetClass(Spawn)==MAGE or GetClass(Spawn)==SORCERER or GetClass(Spawn)==WIZARD or GetClass(Spawn)==WARLOCK or GetClass(Spawn)==ENCHANTER or GetClass(Spawn)==ILLUSIONIST or GetClass(Spawn)==COERCER or GetClass(Spawn)==SUMMONER or GetClass(Spawn)==CONJUROR or GetClass(Spawn)==NECROMANCER then
	PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_mage_gf_f18445ae.mp3", "Clearly your intellect is your best asset. The world shall marvel at the wonders you control.", "", 2374480230, 2549502692)

    elseif GetClass(Spawn)==CLERIC or GetClass(Spawn)==TEMPLAR or GetClass(Spawn)==INQUISITOR or GetClass(Spawn)==DRUID or GetClass(Spawn)==WARDEN or GetClass(Spawn)==FURY or GetClass(Spawn)==SHAMAN or GetClass(Spawn)==MYSTIC or GetClass(Spawn)==DEFILER or GetClass(Spawn)==PRIEST then
    PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_priest_gf_5c80506d.mp3", "Your spirit is strong, as is your faith. You shall move more than mountains, you shall move souls.", "", 894403956, 265994277)
    
    elseif GetClass(Spawn)==FIGHTER or GetClass(Spawn)==WARRIOR or GetClass(Spawn)==GUARDIAN or GetClass(Spawn)==BERSERKER or GetClass(Spawn)==BRAWLER or GetClass(Spawn)==MONK or GetClass(Spawn)==BRUISER or GetClass(Spawn)==CRUSADER or GetClass(Spawn)==SHADOWKNIGHT or GetClass(Spawn)==PALADIN then
 	PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_fighter_gf_544e4a58.mp3", "Epic battles await your future, but the strength of your arm shall tame them all!", "", 3412016143, 1212387502)

    end
end



function respawn(NPC)
	spawn(NPC)
	end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,2)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_fighter_gf_544e4a58.mp3", "Epic battles await your future, but the strength of your arm shall tame them all!", "", 3412016143, 1212387502, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seer/ft/eco/evil/human_eco_evil_seer_mage_gf_f18445ae.mp3", "Clearly your intellect is your best asset. The world shall marvel at the wonders you control.", "", 2374480230, 2549502692, Spawn, 0)
	end
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -32.49, -6.92, 83.09, 2, 0)
	MovementLoopAddLocation(NPC, -33.52, -6.92, 82.02, 2, 22)
	MovementLoopAddLocation(NPC, -29.41, -6.92, 80.82, 2, 0)
	MovementLoopAddLocation(NPC, -29.38, -6.92, 78.86, 2, 0)
	MovementLoopAddLocation(NPC, -32.89, -6.92, 72.32, 2, 0)
	MovementLoopAddLocation(NPC, -32.09, -6.92, 68.26, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -26.72, -7, 64.44, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -22.05, -7, 59.95, 2, 0)
	MovementLoopAddLocation(NPC, -17.5, -7, 57.1, 2, 0)
	MovementLoopAddLocation(NPC, -12.35, -7, 55.77, 2, 0)
	MovementLoopAddLocation(NPC, -1.99, -7, 58.68, 2, 0)
	MovementLoopAddLocation(NPC, -0.8, -7, 58.6, 2, 11)
	MovementLoopAddLocation(NPC, 1.83, -7, 56.13, 2, 0)
	MovementLoopAddLocation(NPC, 4.96, -7, 49.3, 2, 0)
	MovementLoopAddLocation(NPC, 5.51, -7, 48.25, 2, 11)
	MovementLoopAddLocation(NPC, -0.6, -7, 47.38, 2, 11)
	MovementLoopAddLocation(NPC, 2.69, -7, 51.56, 2, 0)
	MovementLoopAddLocation(NPC, 10.37, -7, 56.87, 2, 0)
	MovementLoopAddLocation(NPC, 13.27, -7, 60.05, 2, 11)
	MovementLoopAddLocation(NPC, 27.52, -6.42, 47.47, 2, 0)
	MovementLoopAddLocation(NPC, 32.31, -6, 44.9, 2, 0)
	MovementLoopAddLocation(NPC, 36.13, -6, 43.04, 2, 11)
	MovementLoopAddLocation(NPC, 36.69, -6, 43.78, 2, 0)
	MovementLoopAddLocation(NPC, 38.44, -6, 44.28, 2, 0)
	MovementLoopAddLocation(NPC, 39.48, -5.5, 42.01, 2, 0)
	MovementLoopAddLocation(NPC, 37.49, -5.25, 40.23, 2, 0)
	MovementLoopAddLocation(NPC, 34.72, -5.25, 38.62, 2, 0)
	MovementLoopAddLocation(NPC, 30.95, -5.25, 32.06, 2, 0)
	MovementLoopAddLocation(NPC, 31.83, -5.01, 26.61, 2, 0)
	MovementLoopAddLocation(NPC, 33.46, -5.01, 23.35, 2, 0)
	MovementLoopAddLocation(NPC, 36.1, -4.09, 22.99, 2, 0)
	MovementLoopAddLocation(NPC, 41.32, -1.41, 23.92, 2, 0)
	MovementLoopAddLocation(NPC, 48.08, 1.85, 25.05, 2, 0)
	MovementLoopAddLocation(NPC, 49.53, 1.95, 24.27, 2, 0)
	MovementLoopAddLocation(NPC, 49.38, 2, 21.86, 2, 0)
	MovementLoopAddLocation(NPC, 47.87, 2, 19.41, 2, 0)
	MovementLoopAddLocation(NPC, 46.79, 2, 14.88, 2, 0)
	MovementLoopAddLocation(NPC, 43.12, 2, 13.32, 2, 0)
	MovementLoopAddLocation(NPC, 38.22, 2, 10.97, 2, 11)
	MovementLoopAddLocation(NPC, 39.86, 2, 11.69, 2, 0)
	MovementLoopAddLocation(NPC, 40.52, 2.25, 10.02, 2, 0)
	MovementLoopAddLocation(NPC, 38.52, 2.6, 7.01, 2, 0)
	MovementLoopAddLocation(NPC, 34.64, 3.3, 4.66, 2, 0)
	MovementLoopAddLocation(NPC, 33.65, 3.5, 2.76, 2, 11)
	MovementLoopAddLocation(NPC, 32.82, 3.5, 1.17, 2, 0)
	MovementLoopAddLocation(NPC, 33.2, 3.5, -0.59, 2, 22)
	MovementLoopAddLocation(NPC, 31.73, 3.5, -1.6, 2, 0)
	MovementLoopAddLocation(NPC, 30.63, 5.25, -8.53, 2, 0)
	MovementLoopAddLocation(NPC, 34.64, 5.25, -12.61, 2, 0)
	MovementLoopAddLocation(NPC, 40.17, 5.25, -15.35, 2, 0)
	MovementLoopAddLocation(NPC, 44.68, 5.25, -16.87, 2, 0)
	MovementLoopAddLocation(NPC, 51.46, 5, -17.92, 2, 11)
	MovementLoopAddLocation(NPC, 57.21, 5, -15.93, 2, 11)
	MovementLoopAddLocation(NPC, 53.62, 5, -19.84, 2, 0)
	MovementLoopAddLocation(NPC, 47.13, 5.25, -25.42, 2, 11)
	MovementLoopAddLocation(NPC, 49.58, 5, -28.78, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, 52.14, 5.01, -32.93, 2, 0,"Door2")
	MovementLoopAddLocation(NPC, 54.28, 5.05, -38.06, 2, 0)
	MovementLoopAddLocation(NPC, 57.4, 5.01, -45.59, 2, 22)
	MovementLoopAddLocation(NPC, 57.69, 5.04, -43.5, 2, 0)
	MovementLoopAddLocation(NPC, 57.67, 5.08, -37.28, 2, 22)
	MovementLoopAddLocation(NPC, 54.36, 5.01, -35.77, 2, 0)
	MovementLoopAddLocation(NPC, 52.59, 5.01, -33.19, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, 49.8, 5, -28.11, 2, 0,"Door2")
	MovementLoopAddLocation(NPC, 49.65, 5, -22.79, 2, 0)
	MovementLoopAddLocation(NPC, 45.52, 5.25, -17.05, 2, 0)
	MovementLoopAddLocation(NPC, 41.52, 5.25, -16.15, 2, 0)
	MovementLoopAddLocation(NPC, 30.57, 5.25, -10.2, 2, 0)
	MovementLoopAddLocation(NPC, 26.9, 3.5, -0.02, 2, 0)
	MovementLoopAddLocation(NPC, 23.71, 3.5, 4.19, 2, 11)
	MovementLoopAddLocation(NPC, 20.65, 3.5, 0.41, 2, 0)
	MovementLoopAddLocation(NPC, 20.65, 3.5, 0.41, 2, 11)
	MovementLoopAddLocation(NPC, 19.2, 3.5, 5.5, 2, 11)
	MovementLoopAddLocation(NPC, 12.92, 3.37, 9.65, 2, 0)
	MovementLoopAddLocation(NPC, 2.96, 2, 9.64, 2, 0)
	MovementLoopAddLocation(NPC, 1.5, 2, 11.21, 2, 0)
	MovementLoopAddLocation(NPC, -0.87, 1.92, 15.45, 2, 0)
	MovementLoopAddLocation(NPC, -0.87, 1.92, 15.45, 2, 0) --Guard Stop
	MovementLoopAddLocation(NPC, -2.06, 1.92, 15.37, 2, 0)
	MovementLoopAddLocation(NPC, -9.84, -1.81, 12.71, 2, 0)
	MovementLoopAddLocation(NPC, -14.92, -4.99, 8.1, 2, 0)
	MovementLoopAddLocation(NPC, -15.64, -5.01, 10.49, 2, 0)
	MovementLoopAddLocation(NPC, -20.23, -5, 15.88, 2, 0)
	MovementLoopAddLocation(NPC, -25.49, -5, 19.16, 2, 0)
	MovementLoopAddLocation(NPC, -27.46, -5, 18.7, 2, 0)
	MovementLoopAddLocation(NPC, -28.87, -5.25, 19.17, 2, 0)
	MovementLoopAddLocation(NPC, -28.78, -5.5, 20.96, 2, 0)
	MovementLoopAddLocation(NPC, -26.8, -5.75, 22.98, 2, 0)
	MovementLoopAddLocation(NPC, -23.66, -6.25, 24.75, 2, 0)
	MovementLoopAddLocation(NPC, -19.31, -7, 24, 2, 11)
	MovementLoopAddLocation(NPC, -18.87, -7, 28.4, 2, 0)
	MovementLoopAddLocation(NPC, -18.52, -7, 31.62, 2, 0)
	MovementLoopAddLocation(NPC, -13.1, -6.75, 34.8, 2, 0)
	MovementLoopAddLocation(NPC, -8.02, -6.73, 39.82, 2, 0)
	MovementLoopAddLocation(NPC, -7.06, -7, 45.05, 2, 0)
	MovementLoopAddLocation(NPC, -6.03, -7, 51.61, 2, 0)
	MovementLoopAddLocation(NPC, -8.03, -7, 55.57, 2, 0)
	MovementLoopAddLocation(NPC, -14.2, -7, 58.52, 2, 0)
	MovementLoopAddLocation(NPC, -15.75, -7, 59.4, 2, 0)
	MovementLoopAddLocation(NPC, -16.61, -7, 64.52, 2, 11)
	MovementLoopAddLocation(NPC, -17.79, -7, 64.27, 2, 0)
	MovementLoopAddLocation(NPC, -29.98, -7, 62.42, 2, 11)
	MovementLoopAddLocation(NPC, -27.94, -7, 63.06, 2, 0)
	MovementLoopAddLocation(NPC, -27.29, -7, 65.09, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -32.43, -6.92, 68.37, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -31.21, -6.92, 70.95, 2, 0)
	MovementLoopAddLocation(NPC, -27.82, -6.92, 76.71, 2, 0)
	MovementLoopAddLocation(NPC, -26.17, -6.92, 80.89, 2, 11)
	MovementLoopAddLocation(NPC, -28.62, -6.92, 80.46, 2, 0)
	MovementLoopAddLocation(NPC, -30.08, -6.92, 82.29, 2, 0)
end


function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1370082)
    UseWidget(door)
end

function Door2(NPC,Spawn)
    local door = GetSpawn(NPC, 1370078)
    UseWidget(door)
end
