--[[
    Script Name    : SpawnScripts/DownBelow_Classic/TheGroundsKeeper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.09 09:01:48
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)
    AddTimer(NPC, 6000,"waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -77.8, -0.13, -132.99, 2, 0)
	MovementLoopAddLocation(NPC, -83.2, -0.11, -137.97, 2, 0)
	MovementLoopAddLocation(NPC, -86.93, -0.08, -135.68, 2, 0)
	MovementLoopAddLocation(NPC, -90.96, 0.45, -131.41, 2, 0)
	MovementLoopAddLocation(NPC, -95.33, 0.45, -126.78, 2, 0)
	MovementLoopAddLocation(NPC, -103.06, -0.09, -119.42, 2, 0)
	MovementLoopAddLocation(NPC, -105.92, -0.12, -116.71, 2, 0)
	MovementLoopAddLocation(NPC, -112.47, -0.14, -115.38, 2, 0)
	MovementLoopAddLocation(NPC, -118.05, -0.09, -116.99, 2, 0)
	MovementLoopAddLocation(NPC, -121.33, 0.42, -119.42, 2, 0)
	MovementLoopAddLocation(NPC, -126.67, -0.13, -125.38, 2, 0)
	MovementLoopAddLocation(NPC, -127.77, -0.11, -130.09, 2, 0)
	MovementLoopAddLocation(NPC, -129.2, -0.07, -136.25, 2, 0)
	MovementLoopAddLocation(NPC, -128.07, -0.1, -143.89, 2, 0)
	MovementLoopAddLocation(NPC, -124.5, -0.12, -148.49, 2, 0)
	MovementLoopAddLocation(NPC, -121.16, 0.41, -152.01, 2, 0)
	MovementLoopAddLocation(NPC, -119.99, -0.08, -155.59, 2, 0)
	MovementLoopAddLocation(NPC, -119.67, -0.02, -173.11, 2, 0)
	MovementLoopAddLocation(NPC, -119.99, -0.12, -176.73, 2, 0)
	MovementLoopAddLocation(NPC, -121.76, 0.5, -179.62, 2, 0)
	MovementLoopAddLocation(NPC, -124.61, -0.12, -181.42, 2, 0)
	MovementLoopAddLocation(NPC, -131.85, 0.47, -181.08, 2, 0)
	MovementLoopAddLocation(NPC, -138.47, -0.3, -180.48, 2, 0)
	MovementLoopAddLocation(NPC, -148.46, -0.38, -176.22, 2, 0)
	MovementLoopAddLocation(NPC, -158.5, -0.39, -172.01, 2, 0)
	MovementLoopAddLocation(NPC, -165.88, 0.36, -171.48, 2, 0)
	MovementLoopAddLocation(NPC, -169.52, -0.08, -173.24, 2, 0)
	MovementLoopAddLocation(NPC, -171.49, -0.09, -174.38, 2, 0)
	MovementLoopAddLocation(NPC, -173.22, 0.02, -178.61, 2, 0)
	MovementLoopAddLocation(NPC, -172.94, -0.12, -182.75, 2, 0)
	MovementLoopAddLocation(NPC, -174.21, -0.13, -186.73, 2, 0)
	MovementLoopAddLocation(NPC, -175.67, -0.07, -188.49, 2, 0)
	MovementLoopAddLocation(NPC, -180.64, -0.15, -189.99, 2, 5)
	MovementLoopAddLocation(NPC, -180.64, -0.15, -189.99, 2, 0)
	MovementLoopAddLocation(NPC, -177.99, -0.09, -189.84, 2, 0)
	MovementLoopAddLocation(NPC, -175.43, -0.07, -188.34, 2, 0)
	MovementLoopAddLocation(NPC, -174.01, -0.17, -186.06, 2, 0)
	MovementLoopAddLocation(NPC, -173.68, 0.02, -180.28, 2, 0)
	MovementLoopAddLocation(NPC, -173.46, -0.01, -176.63, 2, 0)
	MovementLoopAddLocation(NPC, -172.63, -0.11, -175.37, 2, 0)
	MovementLoopAddLocation(NPC, -169.89, -0.09, -173.04, 2, 0)
	MovementLoopAddLocation(NPC, -166.1, 0.35, -171.55, 2, 0)
	MovementLoopAddLocation(NPC, -160.27, -0.32, -171.59, 2, 0)
	MovementLoopAddLocation(NPC, -149.92, -0.36, -175.93, 2, 0)
	MovementLoopAddLocation(NPC, -139.62, -0.35, -180.74, 2, 0)
	MovementLoopAddLocation(NPC, -132.42, 0.48, -181.44, 2, 0)
	MovementLoopAddLocation(NPC, -127.7, -0.08, -181.54, 2, 0)
	MovementLoopAddLocation(NPC, -122.27, 0.52, -179.73, 2, 0)
	MovementLoopAddLocation(NPC, -119.59, 0.02, -174.39, 2, 0)
	MovementLoopAddLocation(NPC, -119.29, -0.1, -160.63, 2, 0)
	MovementLoopAddLocation(NPC, -119.21, -0.08, -156.99, 2, 0)
	MovementLoopAddLocation(NPC, -121.04, 0.38, -152.91, 2, 0)
	MovementLoopAddLocation(NPC, -123.44, -0.1, -150.73, 2, 0)
	MovementLoopAddLocation(NPC, -126.65, -0.04, -147.81, 2, 0)
	MovementLoopAddLocation(NPC, -127.42, -0.06, -145.69, 2, 0)
	MovementLoopAddLocation(NPC, -128.17, -0.12, -139.2, 2, 0)
	MovementLoopAddLocation(NPC, -129.25, -0.04, -139.54, 2, 0)
	MovementLoopAddLocation(NPC, -129.36, -0.05, -137.1, 2, 0)
	MovementLoopAddLocation(NPC, -127.95, -0.14, -131.41, 2, 0)
	MovementLoopAddLocation(NPC, -127.69, 0.23, -129.34, 2, 0)
	MovementLoopAddLocation(NPC, -125.23, -0.13, -124.09, 2, 0)
	MovementLoopAddLocation(NPC, -121.89, 0.55, -120.25, 2, 0)
	MovementLoopAddLocation(NPC, -118.8, -0.08, -117.79, 2, 0)
	MovementLoopAddLocation(NPC, -113.58, -0.13, -115.24, 2, 0)
	MovementLoopAddLocation(NPC, -109.4, -0.08, -115.65, 2, 0)
	MovementLoopAddLocation(NPC, -104.39, -0.09, -118.25, 2, 0)
	MovementLoopAddLocation(NPC, -96.26, 0.46, -126.39, 2, 0)
	MovementLoopAddLocation(NPC, -91.75, 0.46, -130.87, 2, 0)
	MovementLoopAddLocation(NPC, -84.16, -0.12, -138.68, 2, 0)
	MovementLoopAddLocation(NPC, -80.36, -0.09, -135.64, 2, 0)
--
	MovementLoopAddLocation(NPC, -79.75, -0.1, -134.91, 2, 0)
	MovementLoopAddLocation(NPC, -76.48, -0.08, -137.59, 2, 0)
	MovementLoopAddLocation(NPC, -73.14, -0.1, -141.61, 2, 0)
	MovementLoopAddLocation(NPC, -71.11, -0.06, -145.17, 2, 0)
	MovementLoopAddLocation(NPC, -70.44, -0.05, -149.51, 2, 0)
	MovementLoopAddLocation(NPC, -69.09, -0.11, -152.6, 2, 0)
	MovementLoopAddLocation(NPC, -64.08, 0.09, -153.17, 2, 0)
	MovementLoopAddLocation(NPC, -58.03, -0.15, -151.86, 2, 0)
	MovementLoopAddLocation(NPC, -53.13, 0.16, -148.3, 2, 0)
	MovementLoopAddLocation(NPC, -46.16, -1.07, -141.86, 2, 0)
	MovementLoopAddLocation(NPC, -38.65, -0.22, -134.71, 2, 0)
	MovementLoopAddLocation(NPC, -35.93, -0.01, -132.03, 2, 0)
	MovementLoopAddLocation(NPC, -34.23, 0.54, -127.02, 2, 0)
	MovementLoopAddLocation(NPC, -34.19, -0.11, -122.34, 2, 0)
	MovementLoopAddLocation(NPC, -34.49, -0.08, -117.06, 2, 0)
	MovementLoopAddLocation(NPC, -34.46, -0.06, -111.55, 2, 0)
	MovementLoopAddLocation(NPC, -30.79, 0.41, -107.34, 2, 0)
	MovementLoopAddLocation(NPC, -27.12, -1, -104.03, 2, 0)
	MovementLoopAddLocation(NPC, -21.52, -1.09, -98.69, 2, 0)
	MovementLoopAddLocation(NPC, -18.51, 0.34, -95.64, 2, 0)
	MovementLoopAddLocation(NPC, -14.84, -0.06, -91.54, 2, 0)
	MovementLoopAddLocation(NPC, -12.15, -0.06, -91.39, 2, 0)
	MovementLoopAddLocation(NPC, -8.92, -0.13, -93.95, 2, 0)
	MovementLoopAddLocation(NPC, -5.31, 0.44, -97.91, 2, 0)
	MovementLoopAddLocation(NPC, 0.03, -0.1, -103.24, 2, 0)
	MovementLoopAddLocation(NPC, 2.24, -0.02, -106.59, 2, 0)
	MovementLoopAddLocation(NPC, 5.17, -0.02, -108.34, 2, 0)
	MovementLoopAddLocation(NPC, 8.19, -0.11, -107.07, 2, 0)
	MovementLoopAddLocation(NPC, 11.5, 0.19, -104.03, 2, 0)
	MovementLoopAddLocation(NPC, 20.74, 0.13, -96.11, 2, 0)
	MovementLoopAddLocation(NPC, 22.01, 0.46, -93.3, 2, 0)
	MovementLoopAddLocation(NPC, 21.55, 0.27, -88.6, 2, 0)
	MovementLoopAddLocation(NPC, 21.27, -1.01, -83.74, 2, 0)
	MovementLoopAddLocation(NPC, 21.44, -1.1, -76.56, 2, 0)
	MovementLoopAddLocation(NPC, 21.3, -0.08, -72.05, 2, 0)
	MovementLoopAddLocation(NPC, 21.27, 0.57, -68.61, 2, 0)
	MovementLoopAddLocation(NPC, 19.5, -0.1, -64.81, 2, 0)
	MovementLoopAddLocation(NPC, 16.78, -0.07, -61.82, 2, 0)
	MovementLoopAddLocation(NPC, 14.19, -0.08, -60.96, 2, 0)
	MovementLoopAddLocation(NPC, 11.09, -0.08, -60.5, 2, 0)
	MovementLoopAddLocation(NPC, 0.17, -0.09, -60.59, 2, 0)
	MovementLoopAddLocation(NPC, -1.21, -0.12, -60.39, 2, 0)
	MovementLoopAddLocation(NPC, -4.29, -0.08, -59.27, 2, 0)
	MovementLoopAddLocation(NPC, -7.1, -0.12, -56.66, 2, 0)
	MovementLoopAddLocation(NPC, -9.9, 0.53, -53.88, 2, 0)
	MovementLoopAddLocation(NPC, -13.54, -0.07, -50.08, 2, 0)
	MovementLoopAddLocation(NPC, -15.14, -0.13, -47.72, 2, 0)
	MovementLoopAddLocation(NPC, -15.58, 0.57, -45.34, 2, 0)
	MovementLoopAddLocation(NPC, -15.2, -0.12, -41.81, 2, 0)
	MovementLoopAddLocation(NPC, -13.48, -0.12, -40.35, 2, 0)
	MovementLoopAddLocation(NPC, -4.5, -0.1, -31.51, 2, 0)
	MovementLoopAddLocation(NPC, -2.07, -0.11, -29.11, 2, 0)
	MovementLoopAddLocation(NPC, -1.16, 0.51, -27.35, 2, 0)
	MovementLoopAddLocation(NPC, -0.19, -0.08, -24.39, 2, 0)
	MovementLoopAddLocation(NPC, -0.16, -0.11, -22.42, 2, 5)
	MovementLoopAddLocation(NPC, -0.16, -0.11, -22.42, 2, 0)
	MovementLoopAddLocation(NPC, 0.14, -0.09, -24.29, 2, 0)
	MovementLoopAddLocation(NPC, -0.77, 0.51, -26.76, 2, 0)
	MovementLoopAddLocation(NPC, -2.32, -0.12, -29.14, 2, 0)
	MovementLoopAddLocation(NPC, -4.26, -0.09, -31.27, 2, 0)
	MovementLoopAddLocation(NPC, -13.18, -0.1, -39.41, 2, 0)
	MovementLoopAddLocation(NPC, -14.87, -0.12, -41.79, 2, 0)
	MovementLoopAddLocation(NPC, -14.93, 0.6, -44.77, 2, 0)
	MovementLoopAddLocation(NPC, -15, -0.11, -47.9, 2, 0)
	MovementLoopAddLocation(NPC, -12.68, -0.08, -50.63, 2, 0)
	MovementLoopAddLocation(NPC, -10.18, 0.53, -53.29, 2, 0)
	MovementLoopAddLocation(NPC, -6.21, -0.12, -56.92, 2, 0)
	MovementLoopAddLocation(NPC, -2.92, -0.09, -60.02, 2, 0)
	MovementLoopAddLocation(NPC, 0.37, -0.09, -60.37, 2, 0)
	MovementLoopAddLocation(NPC, 10.28, -0.1, -60.31, 2, 0)
	MovementLoopAddLocation(NPC, 12.81, -0.03, -60.04, 2, 0)
	MovementLoopAddLocation(NPC, 15.06, -0.13, -61.26, 2, 0)
	MovementLoopAddLocation(NPC, 20.06, 0.09, -65.56, 2, 0)
	MovementLoopAddLocation(NPC, 21.22, 0.54, -68.19, 2, 0)
	MovementLoopAddLocation(NPC, 21.59, -0.16, -72.56, 2, 0)
	MovementLoopAddLocation(NPC, 21.5, -1.03, -83.6, 2, 0)
	MovementLoopAddLocation(NPC, 21.51, 0.17, -87.64, 2, 0)
	MovementLoopAddLocation(NPC, 21.52, 0.45, -93.65, 2, 0)
	MovementLoopAddLocation(NPC, 21.28, 0.12, -95.35, 2, 0)
	MovementLoopAddLocation(NPC, 13.16, 0.14, -103.65, 2, 0)
	MovementLoopAddLocation(NPC, 8.31, -0.11, -107.24, 2, 0)
	MovementLoopAddLocation(NPC, 6.78, -0.05, -108.89, 2, 0)
	MovementLoopAddLocation(NPC, 4.24, -0.03, -107.6, 2, 0)
	MovementLoopAddLocation(NPC, 1.28, -0.07, -104.52, 2, 0)
	MovementLoopAddLocation(NPC, -4.6, 0.45, -98.26, 2, 0)
	MovementLoopAddLocation(NPC, -10.66, -0.09, -92.61, 2, 0)
	MovementLoopAddLocation(NPC, -12.89, -0.06, -90.62, 2, 0)
	MovementLoopAddLocation(NPC, -15.45, -0.08, -92.14, 2, 0)
	MovementLoopAddLocation(NPC, -17.81, 0.31, -94.55, 2, 0)
	MovementLoopAddLocation(NPC, -21.93, -1.08, -98.57, 2, 0)
	MovementLoopAddLocation(NPC, -26.6, -1.16, -103.42, 2, 0)
	MovementLoopAddLocation(NPC, -29.65, 0.51, -106.44, 2, 0)
	MovementLoopAddLocation(NPC, -32.62, 0.02, -109.38, 2, 0)
	MovementLoopAddLocation(NPC, -33.77, -0.08, -112.13, 2, 0)
	MovementLoopAddLocation(NPC, -33.84, -0.09, -116.08, 2, 0)
	MovementLoopAddLocation(NPC, -33.96, -0.14, -122.8, 2, 0)
	MovementLoopAddLocation(NPC, -34.01, 0.54, -125.6, 2, 0)
	MovementLoopAddLocation(NPC, -34.07, -0.09, -129.21, 2, 0)
	MovementLoopAddLocation(NPC, -36.29, -0.01, -131.75, 2, 0)
	MovementLoopAddLocation(NPC, -38, 0, -133.5, 2, 0)
	MovementLoopAddLocation(NPC, -43.94, -1.08, -139.95, 2, 0)
	MovementLoopAddLocation(NPC, -46.33, -1.08, -142.05, 2, 0)
	MovementLoopAddLocation(NPC, -52.51, 0.2, -148.05, 2, 0)
	MovementLoopAddLocation(NPC, -56.19, -0.03, -150.91, 2, 0)
	MovementLoopAddLocation(NPC, -58.44, -0.15, -151.72, 2, 0)
	MovementLoopAddLocation(NPC, -62.93, -0.09, -152.65, 2, 0)
	MovementLoopAddLocation(NPC, -69.98, -0.11, -152.51, 2, 0)
	MovementLoopAddLocation(NPC, -69.61, 0.23, -148.64, 2, 0)
	MovementLoopAddLocation(NPC, -70.54, -0.06, -144.72, 2, 0)
	MovementLoopAddLocation(NPC, -71.84, -0.09, -142.65, 2, 0)
	MovementLoopAddLocation(NPC, -74.82, -0.11, -139.57, 2, 0)
	MovementLoopAddLocation(NPC, -79.26, -0.1, -134.88, 2, 0)
	MovementLoopAddLocation(NPC, -81.37, -0.09, -136.55, 2, 0)
	MovementLoopAddLocation(NPC, -88.03, -0.11, -143.44, 2, 0)
	MovementLoopAddLocation(NPC, -88.03, -0.11, -143.44, 2, 0, "Action")
end

function Action(NPC,Spawn)
    Despawn(NPC)
end