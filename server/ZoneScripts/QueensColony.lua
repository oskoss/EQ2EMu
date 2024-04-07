--[[
	Script Name	: ZoneScripts/QueensColony.lua
	Script Purpose	: Location Pop-ups
	Script Author	: John Adams
	Script Date	: 2009.05.07
	Script Notes	: 
--]]

local WelcomeToNorrath = 133
local TheArtOfCombat = 132
local TheSourceOfEvil = 164

function init_zone_script(zone)
	SetLocationProximityFunction(zone, -13.41, -4.94, 220.74, 20, "OfferQuestLocation", "LeaveLocation")
	SetLocationProximityFunction(zone, 152.24, 3.69, -173.34, 15, "BladeMasterLocation", "LeaveLocation")
end

function OfferQuestLocation (zone, Player)
    if GetClass(Player)==0 and GetLevel(Player)<3 then
        ZoneRef = GetZone("IsleRefuge1")
        Zone(ZoneRef,Player)
    elseif not HasQuest(Player, WelcomeToNorrath) and not HasCompletedQuest(Player, WelcomeToNorrath)
		and not HasQuest(Player, TheArtOfCombat) and not HasCompletedQuest(Player, TheArtOfCombat) then
		OfferQuest(nil, Player, WelcomeToNorrath)
	end
end

function BladeMasterLocation(zone, Player)
	if HasQuest(Player, TheSourceOfEvil) and GetQuestStep(Player, TheSourceOfEvil) == 4 then
		local blade = SpawnMob(zone, 2530032, false, 154.12, 1.87, -175.74, 349.984)
		if blade ~= nil then
			Attack(blade, Player)
		end
	end
end

function LeaveLocation(zone, Player)
end

function enter_location(zone, Player, GridID)
	if GridID == 771354606 then
		SendPopUpMessage(Player, "Sunset Meadow", 255, 255, 0)
	end
end

function player_entry(zone, Player)
    if GetClass(Player)==0 and GetLevel(Player)<3 then
        ZoneRef = GetZone("IsleRefuge1")
        Zone(ZoneRef,Player)
    else
    AddPlayerMail(Player, "EQ2EmulatorDevTeam", "Welcome", "Welcome to EQ2Emulator, this project is currently in Pre-Alpha. The best developed content follows the Commoner towards class progression. This is experienced by talking to Captain Varlos starting on the Far Journey or using the Desert of Flames client during character creation.\n\nWe appreciate feedback and bug reports for existing content, and are always looking for additional talent! Thank you for testing and enjoy your stay!  -The EQ2EMU Team", 2)
    SendPopUpMessage(Player, "The Queen's Colony", 230, 230, 230)
    end
end


