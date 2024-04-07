--[[
    Script Name    : SpawnScripts/WailingCaves/aShinReepawn.lua
    Script Author  : Premierio015
    Script Date    : 2023.12.10 12:12:34
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
   if GetSpawnLocationID(NPC) == 403734  then
  MovementLoopAddLocation(NPC, -43.08, -3.75, -37.87, 2, math.random(16, 24))
      MovementLoopAddLocation(NPC, -35.10, -4.56, -35.38, 2, math.random(16, 24))
         MovementLoopAddLocation(NPC, -41.61, -3.65, -22.29, 2, math.random(16, 24))   
              MovementLoopAddLocation(NPC, -54.29, -3.74, -28.69, 2, math.random(16, 24))
            MovementLoopAddLocation(NPC, -54.26, -3.84, -37.78, 2, math.random(16, 24))        
                  MovementLoopAddLocation(NPC, -47.56, -3.76, -38.09, 2, math.random(16, 24))
end    
   end