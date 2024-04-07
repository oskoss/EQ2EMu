--[[
    Script Name    : SpawnScripts/SinkingSands/amonkey.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 05:12:49
    Script Purpose : movement script for a monkey.
                   : 
--]]

function spawn(NPC)
 movement(NPC)    
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function movement(NPC)
if GetSpawnLocationID(NPC) == 306476 then
MovementLoopAddLocation(NPC, -1500.85, -214.43, -408.72, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1493.80, -215.28, -404.18, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1490.80, -215.73, -392.88, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1467.61, -223.93, -393.10, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1468.17, -223.61, -411.79, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1507.61, -214.14, -410.05, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1540.10, -220.06, -406.76, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1542.53, -221.06, -392.51, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1515.34, -214.54, -390.25, 2, math.random(11, 17))
elseif GetSpawnLocationID(NPC) == 306470 then
MovementLoopAddLocation(NPC, -1552.46, -225.09, -407.42, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1553.12, -225.35, -391.71, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1519.69, -214.91, -391.87, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1493.44, -215.33, -392.00, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1493.91, -215.26, -408.47, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1471.09, -222.13, -391.36, 2, math.random(11, 17))
MovementLoopAddLocation(NPC, -1500.46, -214.44, -389.31, 2, math.random(11, 17))
  end
end