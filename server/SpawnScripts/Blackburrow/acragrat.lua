--[[
    Script Name    : SpawnScripts/Blackburrow/acragrat.lua
    Script Author  : Dorbin
    Script Date    : 2022.07.09 11:07:56
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 12
    local level2 = 13
    local difficulty1 = 5
    local hp1 = 350
    local power1 = 125
    local difficulty2 = 5
    local hp2 = 440
    local power2 = 145
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
	waypoints(NPC)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
    if GetSpawnLocationID(NPC)== 414132 then
	MovementLoopAddLocation(NPC, 68.65, -3.47, -56.12, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 71.25, -3.39, -56.14, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 72.81, -3.64, -58.97, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 68.84, -4.06, -61.49, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 70.73, -3.85, -60.3, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 72.16, -4.17, -61.77, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 73.04, -3.67, -59.12, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 71.76, -3.42, -56.73, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 68.81, -3.52, -56.38, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 67.12, -3.42, -56.78, 2, math.random(9,15))
    elseif GetSpawnLocationID(NPC)== 414131 then
    MovementLoopAddLocation(NPC, 56.6, -5.2, -79.45, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 56.6, -5.2, -79.45, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 58.7, -5.25, -79.31, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 55.17, -5.2, -78.14, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 54.63, -5.2, -76.33, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 56.91, -5.3, -74.87, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 55.02, -5.2, -76.51, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 56.42, -5.2, -78.89, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 58.9, -5.22, -78.96, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 62.86, -5.2, -79.08, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 59.23, -5.18, -79.44, 2, math.random(9,15))
    elseif GetSpawnLocationID(NPC)== 414124 then
	MovementLoopAddLocation(NPC, 27.17, -3.85, -62.74, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 27.2, -3.75, -59.53, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 24.08, -4.12, -59.53, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 22.24, -4.28, -59.86, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 20.99, -4.52, -63.97, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 25.44, -5.15, -67.84, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 25.81, -4.21, -64.24, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 26.49, -5.22, -67.89, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 24.03, -6.54, -72.46, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 21.07, -6.85, -73.53, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 23.04, -6.36, -70.8, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 27.01, -5.6, -68.91, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 23.66, -4.66, -66.14, 2, math.random(9,20))
    elseif GetSpawnLocationID(NPC)== 414105 then
	MovementLoopAddLocation(NPC, 1.51, -8.72, -66.77, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -1.91, -9.76, -69.3, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -4.48, -9.75, -70.18, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -1.72, -9.79, -68.55, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 1.2, -9.14, -67.35, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 4.44, -9.1, -67.46, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 6.55, -8.76, -67.91, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 8.49, -8.54, -66.81, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 10.11, -8.39, -67.67, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 7.42, -8.72, -67.4, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 2.73, -9.17, -68.26, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 0.62, -9.38, -67.54, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -0.36, -9.48, -68.52, 2, math.random(9,20))
    elseif GetSpawnLocationID(NPC)== 133771550 then
	MovementLoopAddLocation(NPC, 14.78, -6.54, -66.42, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 13.87, -6.71, -67.47, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 16.85, -5.7, -65.41, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 16.93, -4.81, -63.42, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 12.56, -5.27, -61.36, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 9.05, -5.8, -61.26, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 3.8, -6.76, -64.4, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -2.04, -7.31, -62.01, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 1.68, -6.98, -61.47, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 5.42, -6.51, -64.07, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 7.89, -5.95, -61.25, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 10.73, -5.54, -60.92, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 13.66, -5.02, -63.2, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 18.82, -4.66, -64.03, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 19.31, -5.65, -67.41, 2, math.random(9,20))
    elseif GetSpawnLocationID(NPC)== 133771591 then
	MovementLoopAddLocation(NPC, -4.31, -12.16, -14.74, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -6.62, -12.14, -17.65, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -0.88, -12.05, -13.14, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -8.1, -12.2, -7.31, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -9.73, -12.2, -8.39, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -0.36, -12, -11.22, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 1.12, -12, -10.45, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -2.2, -12.12, -13.21, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -7.11, -12.12, -18.6, 2, math.random(9,20))
    elseif GetSpawnLocationID(NPC)== 414061 then
	MovementLoopAddLocation(NPC, -18.79, -12.38, -13.7, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -14.59, -12.19, -17.31, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -11.97, -12.01, -22.72, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -18.27, -12.24, -18.97, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -21.39, -11.98, -27.02, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -20.09, -11.9, -28.82, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -12.56, -11.53, -25.19, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -13.64, -11.92, -21.61, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -19.79, -12.39, -16.28, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -24.28, -12.19, -11.33, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -22.25, -12.15, -10.11, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -22.29, -12.16, -14.73, 2, math.random(9,20))
    elseif GetSpawnLocationID(NPC)== 414083 then
	MovementLoopAddLocation(NPC, -9.93, 0.45, -23.94, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -11.73, 0.88, -21.78, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -10.8, 0.89, -20.35, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -10.73, 0.22, -25.01, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -6.27, -1.78, -27.98, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -2.14, -2.85, -28.99, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -4.82, -1.89, -27.11, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -4.63, -2.46, -30.15, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -9.84, -0.5, -26.99, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -10.05, 0.9, -19.56, 2, math.random(9,15))
    elseif GetSpawnLocationID(NPC)== 133771524 then
	MovementLoopAddLocation(NPC, -2.91, -2.81, -29.59, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 1.26, -3.81, -31.25, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 2.42, -4.5, -35.31, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 0.35, -4.55, -35.29, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 2.36, -4.38, -33.94, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -3.47, -2.83, -30.78, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -3.7, -2.25, -27.71, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 2.42, -4.3, -33.21, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -0.42, -5.14, -37.25, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -3.64, -6.5, -41.79, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -7.65, -7.58, -41.24, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -0.66, -5.71, -40.74, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, 2.18, -4.42, -34.61, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, 0.06, -3.57, -30.62, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -5.15, -2.3, -29.92, 2, math.random(9,15))
    elseif GetSpawnLocationID(NPC)== 133771567 then
	MovementLoopAddLocation(NPC, -80.14, -0.89, -12.58, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -76.9, -0.98, -11.3, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -81.97, -0.75, -13.39, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -82.13, -0.95, -8.96, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -81.39, -0.78, -13.34, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -84.66, -0.88, -7.91, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -82.55, -0.81, -11.76, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -81.65, -0.93, -9.72, 2, math.random(9,15))
    elseif GetSpawnLocationID(NPC)== 414041 then
	MovementLoopAddLocation(NPC, -89.09, -0.74, -12.97, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -89.02, -0.9, -10.58, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -86.3, -0.72, -12.3, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -87.48, -0.56, -14.52, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -88.81, -0.95, -9.95, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -89.59, -0.84, -11.58, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -87.02, -0.8, -11.4, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -86.51, -0.65, -13.13, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -89.85, -0.77, -14.62, 2, math.random(9,20))
    elseif GetSpawnLocationID(NPC)== 414037 then
	MovementLoopAddLocation(NPC, -98.29, -0.75, -87.21, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -95.32, -0.69, -87.21, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -99.34, -0.76, -91.86, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -93.13, -0.67, -88, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -97.86, -0.73, -83.45, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -101.55, -0.86, -83.99, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -93.12, -0.68, -89.41, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -96.46, -0.71, -92.89, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -95.97, -0.69, -86.82, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -96.29, -0.7, -99.97, 2, math.random(9,20))
	MovementLoopAddLocation(NPC, -99.43, -0.71, -101.83, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -98.25, -0.72, -94.01, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -90.58, -0.69, -90.05, 2, math.random(9,15))
	MovementLoopAddLocation(NPC, -96.12, -0.68, -83.13, 2, math.random(9,15))
end
end