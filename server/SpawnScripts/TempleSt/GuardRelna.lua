--[[
    Script Name    : SpawnScripts/TempleSt/GuardRelna.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.27 08:10:56
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
	waypoints(NPC)
end

dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")


function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
        else
    FaceTarget(NPC, Spawn)
    GenericGuardHail(NPC,Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -12.04, 3, 77.7, 2, 1)
	MovementLoopAddLocation(NPC, -12.04, 3, 77.7, 2, 7,"Action")
	MovementLoopAddLocation(NPC, -5.18, 3, 74.66, 2, 0)
	MovementLoopAddLocation(NPC, 2.23, 3, 70.81, 2, 0)
	MovementLoopAddLocation(NPC, 4.03, 3, 69.19, 2, 0)
	MovementLoopAddLocation(NPC, 9.99, 3, 68.09, 2, 0)
	MovementLoopAddLocation(NPC, 14.93, 3.01, 68.56, 2, 0)
	MovementLoopAddLocation(NPC, 14.93, 3.01, 68.56, 2, 1)
	MovementLoopAddLocation(NPC, 14.93, 3.01, 68.56, 2, 7,"Action")
	MovementLoopAddLocation(NPC, 16.26, 3.01, 69.41, 2, 0)
	MovementLoopAddLocation(NPC, 23.3, 3, 81.22, 2, 0)
	MovementLoopAddLocation(NPC, 40.43, 3, 74.03, 2, 0)
	MovementLoopAddLocation(NPC, 46.8, 3, 71.09, 2, 0)
	MovementLoopAddLocation(NPC, 52.22, 3, 67.76, 2, 0)
	MovementLoopAddLocation(NPC, 58.69, 3, 62.62, 2, 1)
	MovementLoopAddLocation(NPC, 58.69, 3, 62.62, 2, 18,"Action")
	MovementLoopAddLocation(NPC, 57.47, 3, 64.38, 2, 0)
	MovementLoopAddLocation(NPC, 53.81, 3, 69.06, 2, 0)
	MovementLoopAddLocation(NPC, 44.36, 3, 74.27, 2, 0)
	MovementLoopAddLocation(NPC, 39.34, 3, 77.04, 2, 0)
	MovementLoopAddLocation(NPC, 32.7, 3, 79.24, 2, 0)
	MovementLoopAddLocation(NPC, 20.99, 2.98, 79.78, 2, 0)
	MovementLoopAddLocation(NPC, 14.56, 3, 74.18, 2, 0)
	MovementLoopAddLocation(NPC, 12.16, 3, 71.04, 2, 0)
	MovementLoopAddLocation(NPC, 3.74, 3, 68.64, 2, 0)
	MovementLoopAddLocation(NPC, -0.43, 3, 63.76, 2, 0)
	MovementLoopAddLocation(NPC, -2.84, 3, 58.03, 2, 1)
	MovementLoopAddLocation(NPC, -2.84, 3, 58.03, 2, 18,"Action")
	MovementLoopAddLocation(NPC, 1.58, 3, 66.5, 2, 0)
	MovementLoopAddLocation(NPC, 2.98, 3, 69.18, 2, 0)
	MovementLoopAddLocation(NPC, 1.24, 3, 73.83, 2, 0)
	MovementLoopAddLocation(NPC, -5.65, 3, 77.46, 2, 0)
	MovementLoopAddLocation(NPC, -10.98, 3, 79.2, 2, 1)
	MovementLoopAddLocation(NPC, -10.98, 3, 79.2, 2, 7,"Action")
	MovementLoopAddLocation(NPC, -10.98, 3, 79.2, 2, 0)
	MovementLoopAddLocation(NPC, -5.88, 3, 89.66, 2, 1)
	MovementLoopAddLocation(NPC, -5.88, 3, 89.66, 2, 7,"Action")
end

function Action(NPC)
    local choice = MakeRandomInt(1, 4)
    if choice == 1 then
        PlayFlavor(NPC, "", "", "peer", 0, 0, Spawn)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "", "listen", 0, 0, Spawn)
    elseif choice == 3 then
        PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
    elseif choice == 4 then
        PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    end
end 
