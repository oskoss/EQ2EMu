--[[
        Script Name     :       SpawnScripts/QueensColony/atriggerfish426328.lua
	Script Purpose	:	Waypoint Path for atriggerfish426328.lua
	Script Author	:	Rylec
	Script Date	:	10-27-2019 06:26:50 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	waypoints(NPC)
        SpawnSet(NPC, "difficulty", "2")  
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -79.3, -15.08, 232.02, 2, 0)
	MovementLoopAddLocation(NPC, -79.3, -15.36, 236.37, 2, 0)	
        MovementLoopAddLocation(NPC, -78.45, -15.36, 236.79, 2, 2)
	MovementLoopAddLocation(NPC, -82.06, -15.39, 236.97, 2, 0)
	MovementLoopAddLocation(NPC, -82.76, -15.39, 235.97, 2, 0)
	MovementLoopAddLocation(NPC, -84.49, -15.39, 235.66, 2, 0)
	MovementLoopAddLocation(NPC, -85.68, -15.31, 236.65, 2, 0)
	MovementLoopAddLocation(NPC, -86.79, -14.35, 236.24, 4, 0)
	MovementLoopAddLocation(NPC, -89.71, -15.37, 240.17, 4, 0)
	MovementLoopAddLocation(NPC, -89.6, -15.39, 241.64, 2, 0)
	MovementLoopAddLocation(NPC, -87.74, -15.39, 242.23, 2, 0)
	MovementLoopAddLocation(NPC, -86.26, -15.39, 244.84, 2, 0)
	MovementLoopAddLocation(NPC, -84.96, -15.3, 245.93, 2, 0)
	MovementLoopAddLocation(NPC, -83.96, -15.38, 247.21, 2, 0)
	MovementLoopAddLocation(NPC, -81.57, -15.36, 247.44, 2, 0)
	MovementLoopAddLocation(NPC, -78.75, -15.33, 248.39, 2, 0)
	MovementLoopAddLocation(NPC, -75.14, -15.38, 248.2, 2, 0)
	MovementLoopAddLocation(NPC, -58.6, -15.2, 250.39, 2, 0)
	MovementLoopAddLocation(NPC, -57.18, -14.32, 250.77, 4, 0)
	MovementLoopAddLocation(NPC, -54.42, -14.54, 251.31, 4, 0)
	MovementLoopAddLocation(NPC, -52.81, -14.77, 251.42, 3, 1)
	MovementLoopAddLocation(NPC, -51.6, -14.5, 251.98, 2, 0)
	MovementLoopAddLocation(NPC, -50.67, -14.89, 253.37, 2, 0)
	MovementLoopAddLocation(NPC, -50.66, -15.02, 254.81, 2, 0)
	MovementLoopAddLocation(NPC, -48.9, -14.96, 256.85, 2, 0)
	MovementLoopAddLocation(NPC, -49.53, -15.25, 259.11, 2, 0)
	MovementLoopAddLocation(NPC, -46.8, -14.25, 259.18, 4, 0)
	MovementLoopAddLocation(NPC, -42.98, -14.12, 259.98, 2, 0)
	MovementLoopAddLocation(NPC, -37.16, -14.25, 264.15, 2, 0)
	MovementLoopAddLocation(NPC, -35.45, -14.35, 265.87, 2, 0)
	MovementLoopAddLocation(NPC, -31.64, -14.24, 268.88, 2, 0)
	MovementLoopAddLocation(NPC, -22.81, -14.7, 272.14, 2, 0)
	MovementLoopAddLocation(NPC, -33.57, -14.66, 274.17, 2, 0)
	MovementLoopAddLocation(NPC, -28.38, -14.75, 273.82, 2, 0)
	MovementLoopAddLocation(NPC, -9.3, -15.06, 275.23, 2, 0)
	MovementLoopAddLocation(NPC, 3.86, -15.05, 274.41, 2, 0)
	MovementLoopAddLocation(NPC, 7.71, -14.27, 273.96, 2, 0)
	MovementLoopAddLocation(NPC, 13.83, -14, 269.17, 2, 0)
	MovementLoopAddLocation(NPC, 16.68, -14.8, 266.57, 4, 0)
	MovementLoopAddLocation(NPC, 15.47, -14.11, 264.94, 4, 0)
	MovementLoopAddLocation(NPC, 12.43, -14.41, 260.42, 2, 0)
	MovementLoopAddLocation(NPC, 11.12, -14.41, 259.83, 2, 0)
	MovementLoopAddLocation(NPC, 10.14, -13.61, 262, 4, 0)
	MovementLoopAddLocation(NPC, 10.07, -14.17, 263.33, 2, 1.9)
	MovementLoopAddLocation(NPC, 9.82, -12.89, 261.28, 4, 0)
	MovementLoopAddLocation(NPC, 8.64, -12.34, 260.95, 2, 0)
	MovementLoopAddLocation(NPC, 6.06, -12.61, 262.75, 2, 0)
	MovementLoopAddLocation(NPC, 5.02, -12.43, 263.07, 2, 0)
	MovementLoopAddLocation(NPC, 3.61, -13.09, 266.59, 4, 0)
	MovementLoopAddLocation(NPC, -0.33, -13.55, 266.2, 2, 0)
	MovementLoopAddLocation(NPC, -0.44, -13.44, 269.66, 2, 0)
	MovementLoopAddLocation(NPC, -0.75, -13.88, 271.49, 2, 1)
	MovementLoopAddLocation(NPC, -0.72, -12.89, 274.67, 2, 0)
	MovementLoopAddLocation(NPC, -3.28, -14.45, 277.03, 2, 0)
	MovementLoopAddLocation(NPC, -5.69, -15.2, 277.96, 2, 0)
	MovementLoopAddLocation(NPC, -7.6, -15.54, 278.77, 2, 0)
	MovementLoopAddLocation(NPC, -9.56, -15.54, 276.25, 2, 0)
	MovementLoopAddLocation(NPC, -11.63, -14.12, 275.8, 2, 0)
	MovementLoopAddLocation(NPC, -11.91, -14.32, 274.72, 2, 0)
	MovementLoopAddLocation(NPC, -15.54, -14.58, 274.13, 2, 0)
	MovementLoopAddLocation(NPC, -18.24, -14.85, 271.19, 2, 0)
	MovementLoopAddLocation(NPC, -18.88, -14.14, 270.85, 2, 0)
	MovementLoopAddLocation(NPC, -21.17, -12.89, 268.82, 2, 0)
	MovementLoopAddLocation(NPC, -21.75, -12.64, 266.48, 2, 0)
	MovementLoopAddLocation(NPC, -20.74, -12.82, 264.8, 4, 0)
	MovementLoopAddLocation(NPC, -26.24, -12.43, 265.8, 4, 0)
	MovementLoopAddLocation(NPC, -27.87, -11.87, 263.72, 2, 0)
	MovementLoopAddLocation(NPC, -32.3, -12.83, 260.62, 2, 0)
	MovementLoopAddLocation(NPC, -33.97, -13.66, 262.39, 2, 0)
	MovementLoopAddLocation(NPC, -31.71, -13.42, 263.58, 2, 0)
	MovementLoopAddLocation(NPC, -31.74, -13.95, 266.03, 2, 0)
	MovementLoopAddLocation(NPC, -31.24, -13.63, 267.38, 2, 0)
	MovementLoopAddLocation(NPC, -31.84, -12.98, 267.53, 2, 0)
	MovementLoopAddLocation(NPC, -32.01, -13.57, 268.75, 2, 0)
	MovementLoopAddLocation(NPC, -32.09, -14.5, 270.66, 2, 0)
	MovementLoopAddLocation(NPC, -33.73, -14.86, 270.64, 2, 0)
	MovementLoopAddLocation(NPC, -35.14, -14.92, 270.77, 2, 0)
	MovementLoopAddLocation(NPC, -35.28, -14.26, 267.86, 2, 0)
	MovementLoopAddLocation(NPC, -39.71, -14.68, 262.81, 2, 0)
	MovementLoopAddLocation(NPC, -44.14, -15.03, 260.91, 2, 0)
	MovementLoopAddLocation(NPC, -45, -13.57, 259.47, 2, 0)
	MovementLoopAddLocation(NPC, -47.84, -13.51, 256.15, 2, 0)
	MovementLoopAddLocation(NPC, -48.07, -13.59, 253.85, 2, 0)
	MovementLoopAddLocation(NPC, -48.2, -14.14, 251.69, 2, 1)
	MovementLoopAddLocation(NPC, -50.88, -13.14, 247.45, 2, 0)
	MovementLoopAddLocation(NPC, -51.94, -13.27, 245.6, 2, 0)
	MovementLoopAddLocation(NPC, -52.03, -13.33, 244.38, 2, 0)
	MovementLoopAddLocation(NPC, -52.43, -12.78, 243.97, 2, 0)
	MovementLoopAddLocation(NPC, -53.64, -12.47, 242.89, 2, 0)
	MovementLoopAddLocation(NPC, -54.08, -11.92, 241.09, 2, 0)
	MovementLoopAddLocation(NPC, -55.32, -12.39, 236.56, 2, 0)
	MovementLoopAddLocation(NPC, -59.21, -10.85, 237.66, 2, 0)
	MovementLoopAddLocation(NPC, -63.9, -10.84, 238.59, 2, 0)
	MovementLoopAddLocation(NPC, -65.73, -10.46, 238.55, 2, 0)
	MovementLoopAddLocation(NPC, -67.31, -10.36, 237.29, 2, 0)
	MovementLoopAddLocation(NPC, -68.26, -10.3, 235.02, 2, 0)
	MovementLoopAddLocation(NPC, -69.88, -10.3, 230.98, 2, 0)
	MovementLoopAddLocation(NPC, -70.23, -10.36, 229.93, 2, 0)
	MovementLoopAddLocation(NPC, -69.87, -10.36, 228.65, 2, 0)
	MovementLoopAddLocation(NPC, -67.73, -10.37, 227.51, 2, 0)
	MovementLoopAddLocation(NPC, -69.56, -10.43, 220.36, 2, 0)
	MovementLoopAddLocation(NPC, -70.02, -10.73, 214.72, 2, 0)
	MovementLoopAddLocation(NPC, -72.55, -11.56, 209.48, 2, 0)
	MovementLoopAddLocation(NPC, -73.98, -12.03, 207.74, 2, 0)
	MovementLoopAddLocation(NPC, -75.42, -12.47, 207.03, 2, 0)
	MovementLoopAddLocation(NPC, -76.93, -12.88, 206.99, 2, 0)
	MovementLoopAddLocation(NPC, -78.05, -13.87, 207.06, 2, 0)
	MovementLoopAddLocation(NPC, -80.08, -13.9, 207.56, 2, 0)
	MovementLoopAddLocation(NPC, -79.7, -13.89, 208.31, 2, 0)
	MovementLoopAddLocation(NPC, -79.97, -13.85, 211.12, 2, 0)
	MovementLoopAddLocation(NPC, -80.44, -13.11, 213.47, 4, 0)
	MovementLoopAddLocation(NPC, -80.2, -13.11, 214.17, 4, 0)
	MovementLoopAddLocation(NPC, -78.15, -13.56, 216.16, 4, 0)
	MovementLoopAddLocation(NPC, -77.2, -13.33, 217.47, 2, 0)
	MovementLoopAddLocation(NPC, -78.05, -13.56, 218.74, 2, 0)
	MovementLoopAddLocation(NPC, -79.61, -13.81, 218.74, 2, 0)
	MovementLoopAddLocation(NPC, -77.78, -13.59, 220.81, 2, 0)
	MovementLoopAddLocation(NPC, -78.04, -14.04, 222.79, 2, 0)
	MovementLoopAddLocation(NPC, -78.77, -14.8, 225.18, 2, 0)
	MovementLoopAddLocation(NPC, -77.07, -14.8, 226.39, 2, 0)
	MovementLoopAddLocation(NPC, -76.18, -14.7, 228.77, 2, 0)
	MovementLoopAddLocation(NPC, -76.02, -14.82, 230.18, 2, 0)
	MovementLoopAddLocation(NPC, -77.79, -14.9, 231.32, 2.5, 0)
	MovementLoopAddLocation(NPC, -78.91, -14.95, 232.16, 3, 0)
end

