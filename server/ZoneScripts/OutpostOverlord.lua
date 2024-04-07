--[[
	Script Name		:	ZoneScripts/OutpostOverlord.lua
	Script Purpose	:	Zone Scripts and Location Pop-ups
	Script Author	:	Cynnar
	Script Date		:	9/16/2018
	Script Notes	:	
--]]

local WelcomeToNorrath = 362
local TheArtOfCombat = 132


function init_zone_script(zone)
	SetLocationProximityFunction(zone, -13.41, -4.94, 220.74, 20, "OfferQuestLocation", "LeaveLocation")
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

function LeaveLocation(zone, Player)

end

function player_entry(zone, Player)
    if GetClass(Player)==0 and GetLevel(Player)<3 then
        ZoneRef = GetZone("IsleRefuge1")
        Zone(ZoneRef,Player)
    else
    AddPlayerMail(Player, "EQ2EmulatorDevTeam", "Welcome", "Welcome to EQ2Emulator, this project is currently in Pre-Alpha. The best developed content follows the Commoner towards class progression. This is experienced by talking to Captain Varlos starting on the Far Journey or using the Desert of Flames client during character creation.\n\nWe appreciate feedback and bug reports for existing content, and are always looking for additional talent! Thank you for testing and enjoy your stay!  -The EQ2EMU Team", 2)
    SendPopUpMessage(Player, "Outpost of the Overlord", 230, 230, 230)
    end
end
