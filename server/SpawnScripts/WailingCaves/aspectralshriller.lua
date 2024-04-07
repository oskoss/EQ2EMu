--[[
    Script Name    : SpawnScripts/WailingCaves/aspectralshriller.lua
    Script Author  : Premierio015
    Script Date    : 2023.12.10 05:12:06
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC)
 NPCModule(NPC, Spawn)
 movement(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function movement(NPC, Spawn)
 if GetSpawnLocationID(NPC) == 403450 then
 MovementLoopAddLocation(NPC, -47.55, -3.12, -19.57, 3)
 MovementLoopAddLocation(NPC, -35.70, -3.73, -17.20, 3)
 MovementLoopAddLocation(NPC, -27.70, -4.99, -16.75, 3)
 MovementLoopAddLocation(NPC, -32.95, -4.90, -39.65, 3)
 MovementLoopAddLocation(NPC, -51.64, -3.87, -34.11, 3)
 elseif GetSpawnLocationID(NPC) == 11971 then
 MovementLoopAddLocation(NPC, -47.55, -3.12, -19.57, 2.9)
  MovementLoopAddLocation(NPC, -35.70, -3.73, -17.20, 2.9)
 MovementLoopAddLocation(NPC, -27.70, -4.99, -16.75, 2.9)
 MovementLoopAddLocation(NPC, -32.95, -4.90, -39.65, 2.9)
 MovementLoopAddLocation(NPC, -51.64, -3.87, -34.11, 2.9)
elseif GetSpawnLocationID(NPC) == 403448 then
  MovementLoopAddLocation(NPC, -47.55, -3.12, -19.57, 2.8)
  MovementLoopAddLocation(NPC, -35.70, -3.73, -17.20, 2.8)
 MovementLoopAddLocation(NPC, -27.70, -4.99, -16.75, 2.8)
 MovementLoopAddLocation(NPC, -32.95, -4.90, -39.65, 2.8)
 MovementLoopAddLocation(NPC, -51.64, -3.87, -34.11, 2.8)  
end
   end 