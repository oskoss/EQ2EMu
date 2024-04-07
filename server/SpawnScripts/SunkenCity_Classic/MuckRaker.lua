--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/MuckRaker.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.30 09:10:47
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(18 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(32 + dmgMod))
    AddTimer(NPC, 6000, "waypoints")
    PlayFlavor(NPC,"","","result_spawn",0,0)
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)
end

function aggro(NPC,Spawn)
    ApplySpellVisual(NPC,61)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
    if GetSpawnLocationID(NPC) ==133787343 then
	MovementLoopAddLocation(NPC, -41.3, -0.54, -28.79, 2, 0)
	MovementLoopAddLocation(NPC, -41.3, -0.54, -28.79, 2, 0)
	MovementLoopAddLocation(NPC, -42.46, -0.53, -37.13, 2, 0)
	MovementLoopAddLocation(NPC, -37.79, -0.52, -44.83, 2, 0)
	MovementLoopAddLocation(NPC, -37.24, -0.59, -60.07, 2, 0)
	MovementLoopAddLocation(NPC, -45.28, -0.56, -68.13, 2, 0)
	MovementLoopAddLocation(NPC, -55.05, -0.62, -62.63, 2, 0)
	MovementLoopAddLocation(NPC, -67.9, -0.57, -66.92, 2, 0)
	MovementLoopAddLocation(NPC, -73.81, -0.58, -64.76, 2, 0)
	MovementLoopAddLocation(NPC, -76.29, -0.58, -56.04, 2, 0)
	MovementLoopAddLocation(NPC, -72.96, -0.58, -38.19, 2, 0)
	MovementLoopAddLocation(NPC, -76.97, -0.57, -25.34, 2, 0)
	MovementLoopAddLocation(NPC, -76.05, -0.78, -12.52, 2, 0)
	MovementLoopAddLocation(NPC, -78.24, -0.11, -3.35, 2, 0)
	MovementLoopAddLocation(NPC, -83.78, -0.22, 10.92, 2, 0)
	MovementLoopAddLocation(NPC, -81.58, -0.17, 16.21, 2, 0)
	MovementLoopAddLocation(NPC, -72.85, -0.59, 19.14, 2, 0)
	MovementLoopAddLocation(NPC, -59.82, -0.57, 20.1, 2, 0)
	MovementLoopAddLocation(NPC, -44.39, -0.53, 27.56, 2, 0)
	MovementLoopAddLocation(NPC, -36.89, -0.5, 26.62, 2, 0)
	MovementLoopAddLocation(NPC, -36.8, -0.55, 18.53, 2, 0)
	MovementLoopAddLocation(NPC, -35.3, -0.58, 6.15, 2, 0)
	MovementLoopAddLocation(NPC, -27.81, -0.58, 4.92, 2, 0)
	MovementLoopAddLocation(NPC, -8.8, -0.35, 4.91, 2, 0)
	MovementLoopAddLocation(NPC, -3.89, -0.09, -1.06, 2, 0)
	MovementLoopAddLocation(NPC, 2.27, -0.51, -14.01, 2, 0)
	MovementLoopAddLocation(NPC, 1.65, -0.49, -25.03, 2, 0)
	MovementLoopAddLocation(NPC, -3.62, -0.46, -32.54, 2, 0)
	MovementLoopAddLocation(NPC, -10.97, -0.5, -38.83, 2, 0)
	MovementLoopAddLocation(NPC, -9.46, -0.51, -51.78, 2, 0)
	MovementLoopAddLocation(NPC, -13.23, -0.67, -64.17, 2, 0)
	MovementLoopAddLocation(NPC, -8.06, -0.65, -68.73, 2, 0)
	MovementLoopAddLocation(NPC, 11.05, 0.26, -72.84, 2, 0)
	MovementLoopAddLocation(NPC, 11.33, 0.27, -70.23, 2, 0)
	MovementLoopAddLocation(NPC, 7.8, 0.24, -65.63, 2, 0)
	MovementLoopAddLocation(NPC, 10.62, 0.07, -53.58, 2, 0)
	MovementLoopAddLocation(NPC, 7.47, -0.23, -43.76, 2, 0)
	MovementLoopAddLocation(NPC, 8.64, -0.6, -22.18, 2, 0)
	MovementLoopAddLocation(NPC, 13.15, -0.09, -5.79, 2, 0)
	MovementLoopAddLocation(NPC, 16.83, 0.4, 2.7, 2, 0)
	MovementLoopAddLocation(NPC, 15.17, 1.11, 11.3, 2, 0)
	MovementLoopAddLocation(NPC, 5.18, 0.25, 24.18, 2, 0)
	MovementLoopAddLocation(NPC, 2.24, 1.02, 34.61, 2, 0)
	MovementLoopAddLocation(NPC, 6.88, 1.35, 46.05, 2, 0)
	MovementLoopAddLocation(NPC, 8.94, 1.09, 55.6, 2, 0)
	MovementLoopAddLocation(NPC, 13.36, 0.85, 58.85, 2, 0)
	MovementLoopAddLocation(NPC, 24, 0.98, 59.47, 2, 0)
	MovementLoopAddLocation(NPC, 36.31, 1.02, 59.44, 2, 0)
	MovementLoopAddLocation(NPC, 43.26, 0.62, 63.92, 2, 0)
	MovementLoopAddLocation(NPC, 52.52, 0.2, 63.29, 2, 0)
	MovementLoopAddLocation(NPC, 61.24, 0.82, 56.45, 2, 0)
	MovementLoopAddLocation(NPC, 62.23, 1.02, 36.33, 2, 0)
	MovementLoopAddLocation(NPC, 59.6, 1.07, 30.75, 2, 0)
	MovementLoopAddLocation(NPC, 45.37, 1.11, 22.03, 2, 0)
	MovementLoopAddLocation(NPC, 42.46, 1.02, 12.74, 2, 0)
	MovementLoopAddLocation(NPC, 48.74, 0.91, 4.62, 2, 0)
	MovementLoopAddLocation(NPC, 57.69, 1.22, -6.58, 2, 0)
	MovementLoopAddLocation(NPC, 46.72, 1.53, -14.74, 2, 0)
	MovementLoopAddLocation(NPC, 56.27, 1.02, -20.89, 2, 0)
	MovementLoopAddLocation(NPC, 60.42, 1.58, -35.28, 2, 0)
	MovementLoopAddLocation(NPC, 64.95, 1.74, -42.12, 2, 0)
	MovementLoopAddLocation(NPC, 75.13, 1.41, -43.51, 2, 0)
	MovementLoopAddLocation(NPC, 79.11, 1.66, -38.59, 2, 0)
	MovementLoopAddLocation(NPC, 81.61, 1.36, -26.72, 2, 0)
	MovementLoopAddLocation(NPC, 82.5, 1.85, -15.14, 2, 0)
	MovementLoopAddLocation(NPC, 84.52, 1.88, -11.16, 2, 0)
	MovementLoopAddLocation(NPC, 91.51, 2.16, -8.05, 2, 0)
	MovementLoopAddLocation(NPC, 100.52, 2.22, -1.16, 2, 0)
	MovementLoopAddLocation(NPC, 103.51, 1.88, 9.31, 2, 0)
	MovementLoopAddLocation(NPC, 97.68, 1.44, 17.91, 2, 0)
	MovementLoopAddLocation(NPC, 86.49, 1.83, 24.42, 2, 0)
	MovementLoopAddLocation(NPC, 78.24, 1.88, 25.93, 2, 0)
	MovementLoopAddLocation(NPC, 66.81, 1.02, 26.61, 2, 0)
	MovementLoopAddLocation(NPC, 61.25, 1.09, 24.56, 2, 0)
	MovementLoopAddLocation(NPC, 59.45, 1.18, 11.93, 2, 0)
	MovementLoopAddLocation(NPC, 57.06, 1.16, 1.2, 2, 0)
	MovementLoopAddLocation(NPC, 55.83, 1.36, -11.35, 2, 0)
	MovementLoopAddLocation(NPC, 46.26, 1.7, -11.12, 2, 0)
	MovementLoopAddLocation(NPC, 44.76, 1.89, -4.66, 2, 0)
	MovementLoopAddLocation(NPC, 49.52, 0.83, 6.31, 2, 0)
	MovementLoopAddLocation(NPC, 46.56, 0.8, 15.24, 2, 0)
	MovementLoopAddLocation(NPC, 40.45, 1.02, 17.39, 2, 0)
	MovementLoopAddLocation(NPC, 23.43, 0.28, 16.98, 2, 0)
	MovementLoopAddLocation(NPC, 11.17, 0.47, 20.35, 2, 0)
	MovementLoopAddLocation(NPC, 2.01, 0.39, 19.06, 2, 0)
	MovementLoopAddLocation(NPC, -5.62, -0.24, 10.28, 2, 0)
	MovementLoopAddLocation(NPC, -6.72, -0.27, 6.28, 2, 0)
	MovementLoopAddLocation(NPC, -10.42, -0.41, 5.21, 2, 0)
	MovementLoopAddLocation(NPC, -25.57, -0.58, 4.42, 2, 0)
	MovementLoopAddLocation(NPC, -29.19, -0.58, 2.43, 2, 0)
	MovementLoopAddLocation(NPC, -29.72, -0.63, -11.12, 2, 0)
	MovementLoopAddLocation(NPC, -32.45, -0.59, -21.73, 2, 0)
	MovementLoopAddLocation(NPC, -39.4, -0.57, -26.36, 2, 0)
	MovementLoopAddLocation(NPC, -39.4, -0.57, -26.36, 2, 3, "Action")
	
	elseif GetSpawnLocationID(NPC) ==133787394 then
	MovementLoopAddLocation(NPC, -39.4, -0.57, -26.36, 2, 0)
	MovementLoopAddLocation(NPC, -39.4, -0.57, -26.36, 2, 0)
	MovementLoopAddLocation(NPC, -32.45, -0.59, -21.73, 2, 0)
	MovementLoopAddLocation(NPC, -29.72, -0.63, -11.12, 2, 0)
	MovementLoopAddLocation(NPC, -29.19, -0.58, 2.43, 2, 0)
	MovementLoopAddLocation(NPC, -25.57, -0.58, 4.42, 2, 0)
	MovementLoopAddLocation(NPC, -10.42, -0.41, 5.21, 2, 0)
	MovementLoopAddLocation(NPC, -6.72, -0.27, 6.28, 2, 0)
	MovementLoopAddLocation(NPC, -5.62, -0.24, 10.28, 2, 0)
	MovementLoopAddLocation(NPC, 2.01, 0.39, 19.06, 2, 0)
	MovementLoopAddLocation(NPC, 11.17, 0.47, 20.35, 2, 0)
	MovementLoopAddLocation(NPC, 23.43, 0.28, 16.98, 2, 0)
	MovementLoopAddLocation(NPC, 40.45, 1.02, 17.39, 2, 0)
	MovementLoopAddLocation(NPC, 46.56, 0.8, 15.24, 2, 0)
	MovementLoopAddLocation(NPC, 49.52, 0.83, 6.31, 2, 0)
	MovementLoopAddLocation(NPC, 44.76, 1.89, -4.66, 2, 0)
	MovementLoopAddLocation(NPC, 46.26, 1.7, -11.12, 2, 0)
	MovementLoopAddLocation(NPC, 55.83, 1.36, -11.35, 2, 0)
	MovementLoopAddLocation(NPC, 57.06, 1.16, 1.2, 2, 0)
	MovementLoopAddLocation(NPC, 59.45, 1.18, 11.93, 2, 0)
	MovementLoopAddLocation(NPC, 61.25, 1.09, 24.56, 2, 0)
	MovementLoopAddLocation(NPC, 66.81, 1.02, 26.61, 2, 0)
	MovementLoopAddLocation(NPC, 78.24, 1.88, 25.93, 2, 0)
	MovementLoopAddLocation(NPC, 86.49, 1.83, 24.42, 2, 0)
	MovementLoopAddLocation(NPC, 97.68, 1.44, 17.91, 2, 0)
	MovementLoopAddLocation(NPC, 103.51, 1.88, 9.31, 2, 0)
	MovementLoopAddLocation(NPC, 100.52, 2.22, -1.16, 2, 0)
	MovementLoopAddLocation(NPC, 91.51, 2.16, -8.05, 2, 0)
	MovementLoopAddLocation(NPC, 84.52, 1.88, -11.16, 2, 0)
	MovementLoopAddLocation(NPC, 82.5, 1.85, -15.14, 2, 0)
	MovementLoopAddLocation(NPC, 81.61, 1.36, -26.72, 2, 0)
	MovementLoopAddLocation(NPC, 79.11, 1.66, -38.59, 2, 0)
	MovementLoopAddLocation(NPC, 75.13, 1.41, -43.51, 2, 0)
	MovementLoopAddLocation(NPC, 64.95, 1.74, -42.12, 2, 0)
	MovementLoopAddLocation(NPC, 60.42, 1.58, -35.28, 2, 0)
	MovementLoopAddLocation(NPC, 56.27, 1.02, -20.89, 2, 0)
	MovementLoopAddLocation(NPC, 46.72, 1.53, -14.74, 2, 0)
	MovementLoopAddLocation(NPC, 57.69, 1.22, -6.58, 2, 0)
	MovementLoopAddLocation(NPC, 48.74, 0.91, 4.62, 2, 0)
	MovementLoopAddLocation(NPC, 42.46, 1.02, 12.74, 2, 0)
	MovementLoopAddLocation(NPC, 45.37, 1.11, 22.03, 2, 0)
	MovementLoopAddLocation(NPC, 59.6, 1.07, 30.75, 2, 0)
	MovementLoopAddLocation(NPC, 62.23, 1.02, 36.33, 2, 0)
	MovementLoopAddLocation(NPC, 61.24, 0.82, 56.45, 2, 0)
	MovementLoopAddLocation(NPC, 52.52, 0.2, 63.29, 2, 0)
	MovementLoopAddLocation(NPC, 43.26, 0.62, 63.92, 2, 0)
	MovementLoopAddLocation(NPC, 36.31, 1.02, 59.44, 2, 0)
	MovementLoopAddLocation(NPC, 24, 0.98, 59.47, 2, 0)
	MovementLoopAddLocation(NPC, 13.36, 0.85, 58.85, 2, 0)
	MovementLoopAddLocation(NPC, 8.94, 1.09, 55.6, 2, 0)
	MovementLoopAddLocation(NPC, 6.88, 1.35, 46.05, 2, 0)
	MovementLoopAddLocation(NPC, 2.24, 1.02, 34.61, 2, 0)
	MovementLoopAddLocation(NPC, 5.18, 0.25, 24.18, 2, 0)
	MovementLoopAddLocation(NPC, 15.17, 1.11, 11.3, 2, 0)
	MovementLoopAddLocation(NPC, 16.83, 0.4, 2.7, 2, 0)
	MovementLoopAddLocation(NPC, 13.15, -0.09, -5.79, 2, 0)
	MovementLoopAddLocation(NPC, 8.64, -0.6, -22.18, 2, 0)
	MovementLoopAddLocation(NPC, 7.47, -0.23, -43.76, 2, 0)
	MovementLoopAddLocation(NPC, 10.62, 0.07, -53.58, 2, 0)
	MovementLoopAddLocation(NPC, 7.8, 0.24, -65.63, 2, 0)
	MovementLoopAddLocation(NPC, 11.33, 0.27, -70.23, 2, 0)
	MovementLoopAddLocation(NPC, 11.05, 0.26, -72.84, 2, 0)
	MovementLoopAddLocation(NPC, -8.06, -0.65, -68.73, 2, 0)
	MovementLoopAddLocation(NPC, -13.23, -0.67, -64.17, 2, 0)
	MovementLoopAddLocation(NPC, -9.46, -0.51, -51.78, 2, 0)
	MovementLoopAddLocation(NPC, -10.97, -0.5, -38.83, 2, 0)
	MovementLoopAddLocation(NPC, -3.62, -0.46, -32.54, 2, 0)
	MovementLoopAddLocation(NPC, 1.65, -0.49, -25.03, 2, 0)
	MovementLoopAddLocation(NPC, 2.27, -0.51, -14.01, 2, 0)
	MovementLoopAddLocation(NPC, -3.89, -0.09, -1.06, 2, 0)
	MovementLoopAddLocation(NPC, -8.8, -0.35, 4.91, 2, 0)
	MovementLoopAddLocation(NPC, -27.81, -0.58, 4.92, 2, 0)
	MovementLoopAddLocation(NPC, -35.3, -0.58, 6.15, 2, 0)
	MovementLoopAddLocation(NPC, -36.8, -0.55, 18.53, 2, 0)
	MovementLoopAddLocation(NPC, -36.89, -0.5, 26.62, 2, 0)
	MovementLoopAddLocation(NPC, -44.39, -0.53, 27.56, 2, 0)
	MovementLoopAddLocation(NPC, -59.82, -0.57, 20.1, 2, 0)
	MovementLoopAddLocation(NPC, -72.85, -0.59, 19.14, 2, 0)
	MovementLoopAddLocation(NPC, -81.58, -0.17, 16.21, 2, 0)
	MovementLoopAddLocation(NPC, -83.78, -0.22, 10.92, 2, 0)
	MovementLoopAddLocation(NPC, -78.24, -0.11, -3.35, 2, 0)
	MovementLoopAddLocation(NPC, -76.05, -0.78, -12.52, 2, 0)
	MovementLoopAddLocation(NPC, -76.97, -0.57, -25.34, 2, 0)
	MovementLoopAddLocation(NPC, -72.96, -0.58, -38.19, 2, 0)
	MovementLoopAddLocation(NPC, -76.29, -0.58, -56.04, 2, 0)
	MovementLoopAddLocation(NPC, -73.81, -0.58, -64.76, 2, 0)
	MovementLoopAddLocation(NPC, -67.9, -0.57, -66.92, 2, 0)
	MovementLoopAddLocation(NPC, -55.05, -0.62, -62.63, 2, 0)
	MovementLoopAddLocation(NPC, -45.28, -0.56, -68.13, 2, 0)
	MovementLoopAddLocation(NPC, -37.24, -0.59, -60.07, 2, 0)
	MovementLoopAddLocation(NPC, -37.79, -0.52, -44.83, 2, 0)
	MovementLoopAddLocation(NPC, -42.46, -0.53, -37.13, 2, 0)
	MovementLoopAddLocation(NPC, -41.3, -0.54, -28.79, 2, 0)
	MovementLoopAddLocation(NPC, -41.3, -0.54, -28.79, 2, 3, "Action")
end
end

function Action(NPC,Spawn)
    Despawn(NPC)
end

