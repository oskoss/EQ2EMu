--[[
    Script Name    : SpawnScripts/BeggarsCourt/GuardValerian.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.27 04:11:41
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
        else
    FaceTarget(NPC, Spawn)
    GenericGuardHail(NPC,Spawn)
end
end

function spawn(NPC)
	waypoints(NPC)
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -15.55, 3.75, -30.53, 2, 0)
	MovementLoopAddLocation(NPC, -10.51, 3.25, -27.13, 2, 0)
	MovementLoopAddLocation(NPC, -8.21, 3, -24.92, 2, 0)
	MovementLoopAddLocation(NPC, -6.21, 3.25, -17.11, 2, 0)
	MovementLoopAddLocation(NPC, -5.41, 3.25, -11.43, 2, 0)
	MovementLoopAddLocation(NPC, -3.85, 3.25, -6.35, 2, 0)
	MovementLoopAddLocation(NPC, 0.96, 3.5, -3.49, 2, 0)
	MovementLoopAddLocation(NPC, 5.49, 3.5, -0.06, 2, 0)
	MovementLoopAddLocation(NPC, 11.41, 3.5, 5.29, 2, 0)
	MovementLoopAddLocation(NPC, 16.72, 3.5, 5.57, 2, 0)
	MovementLoopAddLocation(NPC, 23.78, 3.5, 7.13, 2, 0)
	MovementLoopAddLocation(NPC, 31.21, 3.15, 7.42, 2, 0)
	MovementLoopAddLocation(NPC, 34.6, 3, 6.34, 2, 0)
	MovementLoopAddLocation(NPC, 40.73, 3, 4.05, 2, 0)
	MovementLoopAddLocation(NPC, 44.32, 3, 3.95, 2, 0)
	MovementLoopAddLocation(NPC, 48.23, 3, 2.97, 2, 0)
	MovementLoopAddLocation(NPC, 48.23, 3, 2.97, 2, 6)
	MovementLoopAddLocation(NPC, 47.92, 3.5, -2.36, 2, 0)
	MovementLoopAddLocation(NPC, 48.01, 3.75, -5.81, 2, 0)
	MovementLoopAddLocation(NPC, 43.98, 3.75, -9.07, 2, 0)
	MovementLoopAddLocation(NPC, 40.13, 4.51, -9.92, 2, 0)
	MovementLoopAddLocation(NPC, 36.93, 5.25, -11.12, 2, 0)
	MovementLoopAddLocation(NPC, 28.96, 5.25, -9.06, 2, 0)
	MovementLoopAddLocation(NPC, 24.02, 5.25, -11.09, 2, 0)
	MovementLoopAddLocation(NPC, 20.92, 5.25, -14.09, 2, 0)
	MovementLoopAddLocation(NPC, 17.4, 4.75, -17.79, 2, 0)
	MovementLoopAddLocation(NPC, 15.17, 4.75, -20.15, 2, 0)
	MovementLoopAddLocation(NPC, 9.03, 4.75, -22.65, 2, 0)
	MovementLoopAddLocation(NPC, -0.63, 3.5, -22.11, 2, 0)
	MovementLoopAddLocation(NPC, -7.31, 3, -27.28, 2, 0)
	MovementLoopAddLocation(NPC, -16.66, 3.75, -31.7, 2, 6)
	MovementLoopAddLocation(NPC, -16.08, 3, -24.4, 2, 0)
	MovementLoopAddLocation(NPC, -16.67, 3, -16.29, 2, 0)
	MovementLoopAddLocation(NPC, -16.69, 2.5, -11.6, 2, 0)
	MovementLoopAddLocation(NPC, -10.35, 2.25, -6.55, 2, 0)
	MovementLoopAddLocation(NPC, -5.69, 2.75, -3.01, 2, 0)
	MovementLoopAddLocation(NPC, -1.24, 3.25, -2.38, 2, 0)
	MovementLoopAddLocation(NPC, 1.98, 3.5, -2.19, 2, 0)
	MovementLoopAddLocation(NPC, 8.33, 3.5, 2.61, 2, 0)
	MovementLoopAddLocation(NPC, 13.24, 3.5, 6.62, 2, 0)
	MovementLoopAddLocation(NPC, 18.3, 3.5, 8.14, 2, 0)
	MovementLoopAddLocation(NPC, 25.4, 3.5, 6.72, 2, 0)
	MovementLoopAddLocation(NPC, 32.86, 3.25, 5.7, 2, 0)
	MovementLoopAddLocation(NPC, 36.19, 3, 5.74, 2, 0)
	MovementLoopAddLocation(NPC, 40.36, 3, 4.25, 2, 0)
	MovementLoopAddLocation(NPC, 43.93, 3, 3.91, 2, 0)
	MovementLoopAddLocation(NPC, 47.06, 3, 3.13, 2, 0)
	MovementLoopAddLocation(NPC, 49.16, 3, 2.85, 2, 6)
	MovementLoopAddLocation(NPC, 53.36, 3.25, 3.12, 2, 10)
	MovementLoopAddLocation(NPC, 50.14, 3, 1.46, 2, 0)
	MovementLoopAddLocation(NPC, 48.2, 3.75, -4.36, 2, 0)
	MovementLoopAddLocation(NPC, 46.64, 3.75, -8.54, 2, 0)
	MovementLoopAddLocation(NPC, 41.13, 4.22, -9.05, 2, 0)
	MovementLoopAddLocation(NPC, 34.75, 5.25, -11.08, 2, 0)
	MovementLoopAddLocation(NPC, 27.35, 5.25, -9.25, 2, 0)
	MovementLoopAddLocation(NPC, 21.6, 5.25, -10.64, 2, 0)
	MovementLoopAddLocation(NPC, 21.46, 5.25, -15.43, 2, 0)
	MovementLoopAddLocation(NPC, 18.05, 4.75, -17.59, 2, 0)
	MovementLoopAddLocation(NPC, 13.15, 4.75, -21.2, 2, 0)
	MovementLoopAddLocation(NPC, 9.15, 4.75, -22.85, 2, 0)
	MovementLoopAddLocation(NPC, 0.32, 3.75, -22.11, 2, 0)
	MovementLoopAddLocation(NPC, -6.5, 3, -26.32, 2, 0)
	MovementLoopAddLocation(NPC, -12.92, 3.75, -30.29, 2, 0)
	MovementLoopAddLocation(NPC, -17.41, 3.75, -32.54, 2, 6)
end


