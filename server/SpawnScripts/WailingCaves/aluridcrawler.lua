--[[
    Script Name    : SpawnScripts/WailingCaves/aluridcrawler.lua
    Script Author  : Premierio015
    Script Date    : 2023.12.10 11:12:27
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
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
    if GetSpawnLocationID(NPC) == 403397  then
      MovementLoopAddLocation(NPC, -23.46, -5.12, -28.84, 2, math.random(16, 24))
      MovementLoopAddLocation(NPC, -25.06, -3.08, -29.98, 2, math.random(16, 24))
      MovementLoopAddLocation(NPC, -30.18, -4.96, -29.89, 2, math.random(16, 24))
      MovementLoopAddLocation(NPC, -37.15, -4.15, -36.34, 2, math.random(16, 24))
       MovementLoopAddLocation(NPC, -50.97, -3.78, -44.65, 2, math.random(16, 24))
       MovementLoopAddLocation(NPC, -37.15, -4.15, -36.34, 2, math.random(16, 24))
       MovementLoopAddLocation(NPC, -48.42, -3.79, -19.38, 2, math.random(16, 24))
       MovementLoopAddLocation(NPC, -29.88, -4.97, -15.27, 2, math.random(16, 24))
     elseif GetSpawnLocationID(NPC) == 403352  then  
        MovementLoopAddLocation(NPC, -50.27, -3.80, -44.49, 2, math.random(16, 24))  
         MovementLoopAddLocation(NPC, -52.07, -3.73, -27.92,  2, math.random(16, 24))  
         MovementLoopAddLocation(NPC, -44.53, -3.58, -26.17, 2, math.random(16, 24))  
        MovementLoopAddLocation(NPC, -46.60, -3.55, -24.19, 2, math.random(16, 24))  
        elseif GetSpawnLocationID(NPC) == 403424 then  
        MovementLoopAddLocation(NPC, -16.85, -6.07, -48.57, 2, math.random(16, 24))  
        MovementLoopAddLocation(NPC, -4.73, -7.47, -62.86, 2, math.random(16, 24))  
        MovementLoopAddLocation(NPC, -13.22, -7.11, -51.78, 2, math.random(16, 24)) 
        MovementLoopAddLocation(NPC, -34.24, -5.00, -56.96, 2, math.random(16, 24)) 
         MovementLoopAddLocation(NPC, -29.02, -5.00, -46.55, 2, math.random(16, 24)) 
      elseif GetSpawnLocationID(NPC) == 403432 then  
        MovementLoopAddLocation(NPC, -24.61, -5.15, -59.63,   2, math.random(16, 24))
        MovementLoopAddLocation(NPC, -25.19, -5.22, -64.05, 2, math.random(16, 24))
         MovementLoopAddLocation(NPC, -7.82, -7.33, -57.32, 2, math.random(16, 24))
          MovementLoopAddLocation(NPC, -21.45, -5.12, -61.96, 2, math.random(16, 24))
          MovementLoopAddLocation(NPC, -28.87, -5.24, -68.30, 2, math.random(16, 24))
end   
   end