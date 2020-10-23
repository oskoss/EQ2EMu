--[[
	Script Name		:	nightstalker.lua
	Script Purpose	:	Waypoint Path for nightstalker.lua
	Script Author	:	Devn00b
	Script Date		:	04/12/2020 11:16:46 AM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
math.randomseed(os.clock()*100000000000)
for i=1,3 do
   math.random(10000, 65000)
end

r =   math.random(10, 30)
s =   math.random(5, 15)

	MovementLoopAddLocation(NPC, 441.68, -20.33, -318.13, 2, r)
	MovementLoopAddLocation(NPC, 447.68, -20.33, -324.06, 2, s)
	MovementLoopAddLocation(NPC, 451.08, -20.35, -326.46, 2, 0)
	MovementLoopAddLocation(NPC, 455.34, -20.41, -326.81, 2, 0)
	MovementLoopAddLocation(NPC, 460.61, -20.5, -325.99, 2, 0)
	MovementLoopAddLocation(NPC, 464.6, -20.47, -323.73, 2, 0)
	MovementLoopAddLocation(NPC, 467.31, -20.42, -320.02, 2, 0)
	MovementLoopAddLocation(NPC, 467.77, -20.35, -315.62, 2, 0)
	MovementLoopAddLocation(NPC, 466.03, -20.23, -311.41, 2, 0)
	MovementLoopAddLocation(NPC, 461.14, -20.18, -307.03, 2, 0)
	MovementLoopAddLocation(NPC, 455.07, -20.2, -304.7, 2, 0)
	MovementLoopAddLocation(NPC, 449.84, -20.26, -304.03, 2, 0)
	MovementLoopAddLocation(NPC, 437.04, -20.75, -281.16, 2, 0)
	MovementLoopAddLocation(NPC, 437.55, -20.92, -254.01, 2, 0)
	MovementLoopAddLocation(NPC, 434.83, -21.31, -248.24, 2, 0)
	MovementLoopAddLocation(NPC, 405.9, -23.02, -216.31, 2, 0)
	MovementLoopAddLocation(NPC, 388.39, -18.86, -235.08, 2, 0)
	MovementLoopAddLocation(NPC, 405.93, -23, -217.04, 2, 0)
	MovementLoopAddLocation(NPC, 386.32, -24.34, -194.34, 2, 0)
	MovementLoopAddLocation(NPC, 359.28, -25.34, -174.69, 2, 0)
	MovementLoopAddLocation(NPC, 341.23, -23.91, -145.54, 2, 0)
	MovementLoopAddLocation(NPC, 319.08, -23.15, -103.21, 2, 0)
	MovementLoopAddLocation(NPC, 314.18, -22.67, -91.88, 2, 0)
	MovementLoopAddLocation(NPC, 306.92, -21.35, -54.89, 2, 0)
	MovementLoopAddLocation(NPC, 294.23, -21.05, -45.16, 2, 0)
	MovementLoopAddLocation(NPC, 279.54, -21.18, -32.57, 2, 0)
	MovementLoopAddLocation(NPC, 257.93, -21.1, -11.88, 2, 0)
	MovementLoopAddLocation(NPC, 254.82, -19.97, 35.53, 2, 0)
	MovementLoopAddLocation(NPC, 286.47, -12.82, 76.85, 2, 0)
	MovementLoopAddLocation(NPC, 291.57, -13.42, 109.62, 2, 0)
	MovementLoopAddLocation(NPC, 301.61, -15.94, 140.57, 2, 0)
	MovementLoopAddLocation(NPC, 311.09, -17.91, 158.73, 2, 0)
	MovementLoopAddLocation(NPC, 315.55, -17.98, 164.22, 2, 0)
	MovementLoopAddLocation(NPC, 321.17, -18.12, 167.53, 2, 0)
	MovementLoopAddLocation(NPC, 327.38, -18.49, 168.63, 2, 0)
	MovementLoopAddLocation(NPC, 335.41, -19.11, 168.24, 2, 0)
	MovementLoopAddLocation(NPC, 343.39, -19.81, 165.99, 2, 0)
	MovementLoopAddLocation(NPC, 353.19, -20.11, 161.76, 2, 0)
	MovementLoopAddLocation(NPC, 362.33, -20.07, 156.28, 2, 0)
	MovementLoopAddLocation(NPC, 371, -20.4, 150.07, 2, 0)
	MovementLoopAddLocation(NPC, 376.95, -20.63, 141.51, 2, 0)
	MovementLoopAddLocation(NPC, 380.82, -20.84, 135.48, 2, 0)
	MovementLoopAddLocation(NPC, 376.95, -20.63, 141.51, 2, 0)
	MovementLoopAddLocation(NPC, 371, -20.4, 150.07, 2, 0)
	MovementLoopAddLocation(NPC, 362.33, -20.07, 156.28, 2, 0)
	MovementLoopAddLocation(NPC, 353.19, -20.11, 161.76, 2, 0)
	MovementLoopAddLocation(NPC, 343.39, -19.81, 165.99, 2, 0)
	MovementLoopAddLocation(NPC, 335.41, -19.11, 168.24, 2, 0)
	MovementLoopAddLocation(NPC, 327.38, -18.49, 168.63, 2, 0)
	MovementLoopAddLocation(NPC, 321.17, -18.12, 167.53, 2, 0)
	MovementLoopAddLocation(NPC, 315.55, -17.98, 164.22, 2, 0)
	MovementLoopAddLocation(NPC, 311.09, -17.91, 158.73, 2, 0)
	MovementLoopAddLocation(NPC, 301.61, -15.94, 140.57, 2, 0)
	MovementLoopAddLocation(NPC, 291.57, -13.42, 109.62, 2, 0)
	MovementLoopAddLocation(NPC, 286.47, -12.82, 76.85, 2, 0)
	MovementLoopAddLocation(NPC, 254.82, -19.97, 35.53, 2, 0)
	MovementLoopAddLocation(NPC, 257.93, -21.1, -11.88, 2, 0)
	MovementLoopAddLocation(NPC, 279.54, -21.18, -32.57, 2, 0)
	MovementLoopAddLocation(NPC, 294.23, -21.05, -45.16, 2, 0)
	MovementLoopAddLocation(NPC, 306.92, -21.35, -54.89, 2, 0)
	MovementLoopAddLocation(NPC, 314.18, -22.67, -91.88, 2, 0)
	MovementLoopAddLocation(NPC, 319.08, -23.15, -103.21, 2, 0)
	MovementLoopAddLocation(NPC, 341.23, -23.91, -145.54, 2, 0)
	MovementLoopAddLocation(NPC, 359.28, -25.34, -174.69, 2, 0)
	MovementLoopAddLocation(NPC, 386.32, -24.34, -194.34, 2, 0)
	MovementLoopAddLocation(NPC, 405.93, -23, -217.04, 2, 0)
	MovementLoopAddLocation(NPC, 388.39, -18.86, -235.08, 2, 0)
	MovementLoopAddLocation(NPC, 405.9, -23.02, -216.31, 2, 0)
	MovementLoopAddLocation(NPC, 434.83, -21.31, -248.24, 2, 0)
	MovementLoopAddLocation(NPC, 437.55, -20.92, -254.01, 2, 0)
	MovementLoopAddLocation(NPC, 437.04, -20.75, -281.16, 2, 0)
	MovementLoopAddLocation(NPC, 449.84, -20.26, -304.03, 2, 0)
	MovementLoopAddLocation(NPC, 455.07, -20.2, -304.7, 2, 0)
	MovementLoopAddLocation(NPC, 461.14, -20.18, -307.03, 2, 0)
	MovementLoopAddLocation(NPC, 466.03, -20.23, -311.41, 2, 0)
	MovementLoopAddLocation(NPC, 467.77, -20.35, -315.62, 2, 0)
	MovementLoopAddLocation(NPC, 467.31, -20.42, -320.02, 2, 0)
	MovementLoopAddLocation(NPC, 464.6, -20.47, -323.73, 2, 0)
	MovementLoopAddLocation(NPC, 460.61, -20.5, -325.99, 2, 0)
	MovementLoopAddLocation(NPC, 455.34, -20.41, -326.81, 2, 0)
	MovementLoopAddLocation(NPC, 451.08, -20.35, -326.46, 2, 0)
	MovementLoopAddLocation(NPC, 447.68, -20.33, -324.06, 2, 0)
	MovementLoopAddLocation(NPC, 441.68, -20.33, -318.13, 2, 0)
end


