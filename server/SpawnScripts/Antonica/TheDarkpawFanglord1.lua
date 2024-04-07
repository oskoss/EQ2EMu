--[[
    Script Name    : SpawnScripts/Antonica/TheDarkpawFanglord1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.01 06:09:24
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(65 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(105 + dmgMod))
	ChooseMovement(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
    spawn(NPC)
end

function ChooseMovement(NPC)
    path = MakeRandomInt(1,3)
    if path == 1 then
        waypoints1(NPC)
    elseif path == 2 then
        waypoints2(NPC)
    elseif path == 3 then
        waypoints3(NPC)
    end
end

function waypoints1(NPC)
	MovementLoopAddLocation(NPC, -1641.96, -5.33, 713.14, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1636.26, -0.85, 664.55, 2, 0)
	MovementLoopAddLocation(NPC, -1642.39, -0.99, 656.61, 2, 0)
	MovementLoopAddLocation(NPC, -1641.38, -1.05, 646.37, 2, 0)
	MovementLoopAddLocation(NPC, -1634.81, -0.69, 644.21, 2, 5)
	MovementLoopAddLocation(NPC, -1646.16, -1.23, 651.95, 2, 0)
	MovementLoopAddLocation(NPC, -1641.33, -0.89, 660.46, 2, 0)
	MovementLoopAddLocation(NPC, -1632.71, -0.62, 666.84, 2, 0)
	MovementLoopAddLocation(NPC, -1626.08, -0.03, 664.88, 2, 0)
	MovementLoopAddLocation(NPC, -1622.23, 0.27, 665.69, 2, 0)
	MovementLoopAddLocation(NPC, -1622.04, 0.28, 665.84, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1602.05, -1.81, 697.47, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1608.43, 1.56, 665.95, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1601.17, 0.88, 677.22, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1614.18, -3.65, 710.63, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1627.84, -7.39, 731.78, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1643.32, -7.34, 723.83, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1627.86, -8.96, 738.42, 2, MakeRandomInt(8,15))
end

function waypoints2(NPC)
	MovementLoopAddLocation(NPC, -1662.09, -13.61, 750.33, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1656.4, -11.61, 737.98, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1641.06, -2.8, 691.4, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1669.29, -5.06, 677.39, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1674.66, -9.62, 701.8, 2, 0)
	MovementLoopAddLocation(NPC, -1679.65, -10.44, 705.44, 2, 0)
	MovementLoopAddLocation(NPC, -1676.37, -9.93, 712.28, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1670.61, -8.93, 711.8, 2, 0)
	MovementLoopAddLocation(NPC, -1669.79, -9.63, 716.74, 2, 0)
	MovementLoopAddLocation(NPC, -1656.51, -12.86, 744.62, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1640.19, -10.44, 740.87, 2, 0)
	MovementLoopAddLocation(NPC, -1632.37, -8.36, 736.17, 2, 0)
	MovementLoopAddLocation(NPC, -1626.6, -9.01, 738.49, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1632.64, -8.39, 736.25, 2, 0)
	MovementLoopAddLocation(NPC, -1655.8, -14.29, 752.17, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1663.54, -11.35, 735.18, 2, 0)
	MovementLoopAddLocation(NPC, -1665.95, -11.16, 732.54, 2, 0)
	MovementLoopAddLocation(NPC, -1667.63, -10.74, 726.46, 2, 0)
	MovementLoopAddLocation(NPC, -1669.06, -10.49, 723.57, 2, MakeRandomInt(8,15))
end

function waypoints3(NPC)
	MovementLoopAddLocation(NPC, -1458.51, -11.56, 646.21, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1451.04, -15.08, 619.52, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1473.11, -7.14, 607.99, 2, 0)
	MovementLoopAddLocation(NPC, -1485.34, -3.1, 606.55, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1511.16, -0.25, 603.9, 2, 0)
	MovementLoopAddLocation(NPC, -1513.43, -0.09, 601.52, 2, 5)
	MovementLoopAddLocation(NPC, -1514.71, -0.01, 599.67, 2, 0)
	MovementLoopAddLocation(NPC, -1547.11, 2.92, 611.51, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1540.58, 1.01, 646.31, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1518.7, -0.66, 645.47, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -1461.14, -11.38, 644.81, 2, MakeRandomInt(8,15))
end
