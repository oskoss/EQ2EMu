--[[
	Script Name		:	antonica.lua
	Script Purpose	:	Handles events in Antonica
	Script Author	:	Jabantiz/neatz09/Dorbin
	Script Date		:	6/16/2016/ 2/23/19 12/6/23
	Script Notes	:	
--]]

function init_zone_script(Zone)
	SetLocationProximityFunction(Zone, -2128.93, -28.4328, 614.081, 10, "GriffonTower", "Leave")  -- Steppes from Qeynos
	SetLocationProximityFunction(Zone, -904.472, -7.23051, -610.321, 10, "GriffonTower", "Leave")  -- Oracle from Qeynos
	SetLocationProximityFunction(Zone, 337.246, -17.3142, 537.882, 10, "GriffonTower", "Leave")  -- Qeynos from Steppes
    SetLocationProximityFunction(Zone, -912.659, -7.21881, -599.911, 10, "GriffonTower", "Leave")  -- Oracle from Steppes
	SetLocationProximityFunction(Zone, 327.727, -17.3058, 529.95, 10, "GriffonTower", "Leave")  -- Qeynos from Oracle
	SetLocationProximityFunction(Zone, -2136.6, -28.5276, 608.087, 10, "GriffonTower", "Leave")  -- Steppese from oracle
	
    SetLocationProximityFunction(Zone,127.20, -24.88, 468.20, 60, "CraterLake","LeaveLocation")
    SetLocationProximityFunction(Zone,-102.51, -18.43, 100.64, 95, "CentralFarmlands","LeaveLocation")
    SetLocationProximityFunction(Zone,-123.97, -16.37, 585.85, 35, "QeynosHills","LeaveLocation")
    SetLocationProximityFunction(Zone,-442.50, 2.15, 551.88, 25, "Claymore","LeaveLocation")
    SetLocationProximityFunction(Zone,-503.16, -18.23, 396.36, 95, "QeynosPlains","LeaveLocation")
    SetLocationProximityFunction(Zone,-753.87, -3.03, 592.89, 160, "ArcherWoods","LeaveLocation")
    SetLocationProximityFunction(Zone,-1191.42, -20.26, 261.38, 70, "QeynosHighway","LeaveLocation")
    SetLocationProximityFunction(Zone,-1299.50, 38.29, 44.79, 20, "BellsofVhalen","LeaveLocation")
    SetLocationProximityFunction(Zone,-1506.60, -14.37, -11.08, 55, "GladeoftheCoven","LeaveLocation")
    SetLocationProximityFunction(Zone,-1567.28, 2.28, 609.58, 90, "BrambleWoods","LeaveLocation")
    SetLocationProximityFunction(Zone,424.28, -43.66, 733.90, 50, "ClodwindPoint","LeaveLocation")
    SetLocationProximityFunction(Zone,348.00, -9.39, 809.95, 35, "MarinersIsland","LeaveLocation")
    SetLocationProximityFunction(Zone,188.45, -19.38, 863.55, 35, "CastawayIsland","LeaveLocation")
    SetLocationProximityFunction(Zone,5.57, -9.66, 1028.04, 35, "QeynosSheperdsIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,-796.74, -28.08, 1029.75, 30, "WoodedIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,-917.46, -17.69, 1052.23, 30, "MemorialIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,-327,-14,-501 , 55, "WatchtowerPlains","LeaveLocation")
    SetLocationProximityFunction(Zone,326.08,-35.05,-517.55, 30, "MistyIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,241.24, -29.62, -682.48, 25, "BridgewayIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,334.98, -21.37, -621.86, 30, "AbandonedIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,361.84, -19.69, -664.18, 18, "TombofVarsoon","LeaveLocation")
    SetLocationProximityFunction(Zone,382.58, -31.81, -798.15, 25, "LonelyIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,382.58, -31.81, -798.15, 20, "TravelersIsle","LeaveLocation")
    SetLocationProximityFunction(Zone,-376.53, -0.70, -369.36, 85, "ArdentHills","LeaveLocation")
    SetLocationProximityFunction(Zone,-555.33, -12.85, -319.13, 18, "KeepoftheArdentNeedle","LeaveLocation")
    SetLocationProximityFunction(Zone,-804.55, -32.01, -422.03, 50, "TowerLands","LeaveLocation")
    SetLocationProximityFunction(Zone,-1033.81, 14.12, -630.33, 20, "ToweroftheOracles","LeaveLocation")
    SetLocationProximityFunction(Zone,-1410.68, -13.88, -742.63, 100, "RuinsofCaltorsis","LeaveLocation")
    SetLocationProximityFunction(Zone,-1865, -38, -550, 70, "WindstalkerVillage","LeaveLocation")
    SetLocationProximityFunction(Zone,-2182.37, -11.79, -818.23, 100, "WindstalkerHighlands","LeaveLocation")
    SetLocationProximityFunction(Zone,-2262.04, -24.72, -570.99, 90, "CoastalGrove","LeaveLocation")
    SetLocationProximityFunction(Zone,-2048.99, 15.74, -483.06, 20, "FangbreakerKeep","LeaveLocation")
    SetLocationProximityFunction(Zone,-1851.41, -22.03, -194.27, 90, "NorthernFarmlands","LeaveLocation")
    SetLocationProximityFunction(Zone,-2104, -43, 438, 20, "KeepoftheGnollSlayer","LeaveLocation")
    SetLocationProximityFunction(Zone,-1755, -14, 521, 80, "GnollslayerHighlands","LeaveLocation")
    SetLocationProximityFunction(Zone,-1973.00, -20.08, 640.00, 80, "ScarecrowFields","LeaveLocation")
    SetLocationProximityFunction(Zone,-2082.70, 47.26, 1029.12, 100, "HiddenVale","LeaveLocation")
	
end

function HiddenVale(Zone,Player)
      SendPopUpMessage(Player, "Hidden Vale", 255, 255, 0)
end

function ScarecrowFields(Zone,Player)
      SendPopUpMessage(Player, "Scarecrow Fields", 255, 255, 0)
end

function GnollslayerHighlands(Zone,Player)
      SendPopUpMessage(Player, "Gnollslayer Highlands", 255, 255, 0)
end

function KeepoftheGnollSlayer(Zone,Player)
      SendPopUpMessage(Player, "Keep of The Gnollslayer", 255, 255, 0)
end

function NorthernFarmlands(Zone,Player)
      SendPopUpMessage(Player, "Northern Farmlands", 255, 255, 0)
end

function FangbreakerKeep(Zone,Player)
      SendPopUpMessage(Player, "Fangbreaker Keep", 255, 255, 0)
end

function CoastalGrove(Zone,Player)
      SendPopUpMessage(Player, "Coastal Grove", 255, 255, 0)
end

function WindstalkerHighlands(Zone,Player)
      SendPopUpMessage(Player, "Windstalker Highlands", 255, 255, 0)
end

function WindstalkerVillage(Zone,Player)
      SendPopUpMessage(Player, "Windstalker Village", 255, 255, 0)
end

function RuinsofCaltorsis(Zone,Player)
      SendPopUpMessage(Player, "Ruins of Caltorsis", 255, 255, 0)
end

function ToweroftheOracles(Zone,Player)
      SendPopUpMessage(Player, "Tower of the Oracles", 255, 255, 0)
end


function TowerLands(Zone,Player)
      SendPopUpMessage(Player, "Tower Lands", 255, 255, 0)
end

function KeepoftheArdentNeedle(Zone,Player)
      SendPopUpMessage(Player, "Keep of The Ardent Needle", 255, 255, 0)
end

function ArdentHills(Zone,Player)
      SendPopUpMessage(Player, "Ardent Hills", 255, 255, 0)
end

function TravelersIsle(Zone,Player)
      SendPopUpMessage(Player, "Traveler's Isle", 255, 255, 0)
end

function LonelyIsle(Zone,Player)
      SendPopUpMessage(Player, "Lonely Isle", 255, 255, 0)
end

function TombofVarsoon(Zone,Player)
      SendPopUpMessage(Player, "Tomb of Varsoon", 255, 255, 0)
end

function AbandonedIsle(Zone,Player)
      SendPopUpMessage(Player, "Abandoned Isle", 255, 255, 0)
end

function BridgewayIsle(Zone,Player)
      SendPopUpMessage(Player, "Bridgeway Isle", 255, 255, 0)
end

function MistyIsle(Zone,Player)
      SendPopUpMessage(Player, "Misty Isle", 255, 255, 0)
end

function WatchtowerPlains(Zone,Player)
      SendPopUpMessage(Player, "Watchtower Plains", 255, 255, 0)
end

function MemorialIsle(Zone,Player)
      SendPopUpMessage(Player, "Memorial Isle", 255, 255, 0)
end

function WoodedIsle(Zone,Player)
      SendPopUpMessage(Player, "Wooded Isle", 255, 255, 0)
end

function QeynosSheperdsIsle(Zone,Player)
      SendPopUpMessage(Player, "Qeynos Shepard's Isle", 255, 255, 0)
end

function CastawayIsland(Zone,Player)
      SendPopUpMessage(Player, "Castaway Island", 255, 255, 0)
end

function MarinersIsland(Zone,Player)
      SendPopUpMessage(Player, "Mariner's Island", 255, 255, 0)
end

function CraterLake(Zone,Player)
      SendPopUpMessage(Player, "Crater Lake", 255, 255, 0)
end

function CentralFarmlands(Zone,Player)
      SendPopUpMessage(Player, "Central Farmlands", 255, 255, 0)
end

function QeynosHills(Zone,Player)
      SendPopUpMessage(Player, "Qeynos Hills", 255, 255, 0)
end

function Claymore(Zone,Player)
      SendPopUpMessage(Player, "Claymore Monument", 255, 255, 0)
end

function QeynosPlains(Zone,Player)
      SendPopUpMessage(Player, "Qeynos Plains", 255, 255, 0)
end

function ArcherWoods(Zone,Player)
      SendPopUpMessage(Player, "Archer Woods", 255, 255, 0)
end

function QeynosHighway(Zone,Player)
      SendPopUpMessage(Player, "Qeynos Highway", 255, 255, 0)
end

function BellsofVhalen(Zone,Player)
      SendPopUpMessage(Player, "The Bells of Vhalen", 255, 255, 0)
end

function GladeoftheCoven(Zone,Player)
      SendPopUpMessage(Player, "Glade of the Coven", 255, 255, 0)
end

function BrambleWoods(Zone,Player)
      SendPopUpMessage(Player, "Bramble Woods", 255, 255, 0)
end

function ClodwindPoint(Zone,Player)
      SendPopUpMessage(Player, "Coldwind Point", 255, 255, 0)
end


function player_entry(zone, player)
 SendPopUpMessage(player, "Antonica", 230, 230, 230)   
end

function enter_location(zone, spawn, grid)
end

function leave_location(zone, spawn, grid)
end

function dawn(zone)
end

function dusk(zone)
end

function GriffonTower(Zone, Spawn)
	if IsPlayer(Spawn) and IsOnAutoMount(Spawn) then
		EndAutoMount(Spawn)
	end
end

function Leave(zone, Spawn)
end

