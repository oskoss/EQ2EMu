--[[
    Script Name    : SpawnScripts/SinkingSands/anoasisbandit.lua
    Script Author  : premierio015
    Script Date    : 2023.12.17 02:12:29
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
if GetSpawnLocationID(NPC) == 133788947 then
MoveToLocation(NPC, -1120.10, -208.95, -244.28, 3, "", true)
MoveToLocation(NPC, -1137.88, -211.05, -249.93, 3, "", true)
MoveToLocation(NPC, -1153.25, -212.78, -236.50, -236.22, 3, "", false)
elseif GetSpawnLocationID(NPC) == 133788951 then
MoveToLocation(NPC, -1126.91, -209.99, -244.68, 3, "", true)
MoveToLocation(NPC, -1136.22, -211.04, -241.41, 3, "", true)
  MoveToLocation(NPC, -1143.47, -211.98, -238.79, 3, "", true)
elseif GetSpawnID(NPC) == 730487 then
MoveToLocation(NPC, -1137.88, -211.05, -249.93, 3, "", true)
 MoveToLocation(NPC, -1153.25, -212.78, -236.50, 3, "", true)
MoveToLocation(NPC, -1125.46, -209.60, -237.31, 3,"",true)
MoveToLocation(NPC, -1132.50, -210.54, -248.73, 3,"",true)
MoveToLocation(NPC, -1145.80, -212.29, -236.74, 3,"", false)
elseif GetSpawnID(NPC) == 730488 then
 MoveToLocation(NPC,    -1116.94, -208.28, -240.72,  3, "", true)
 MoveToLocation(NPC,   -1143.81, -211.74, -247.55, 3, "", true)
  MoveToLocation(NPC,  -1151.48, -212.58, -239.19, 3, "", false)
end
   end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function prespawn(NPC)
local gender_choice = MakeRandomInt(1, 2)
if gender_choice == 1 then -- MALE
SpawnSet(NPC, "model_type", 78)
SpawnSet(NPC, "soga_model_type", 78)
SpawnSet(NPC, "gender", 1)
else -- FEMALE
end
   end