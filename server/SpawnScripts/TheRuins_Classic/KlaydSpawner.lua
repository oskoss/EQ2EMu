--[[
    Script Name    : SpawnScripts/TheRuins_Classic/KlaydSpawner.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.11 02:07:28
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
CampSpawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end



function CampSpawn(NPC, Spawn) -- Stage 1
    local zone = GetZone(NPC)
    local CampSpawn1 = SpawnByLocationID(zone, 133785955) 
    local CampSpawn2 = SpawnByLocationID(zone, 133785956)
    local CampSpawn3 = SpawnByLocationID(zone, 133785957)
    local CampSpawn4 = SpawnByLocationID(zone, 133785958)
    local CampSpawn5 = SpawnByLocationID(zone, 133785959)
    local CampSpawn6 = SpawnByLocationID(zone, 133785960)

    AddTimer(NPC,6000,"CampSpawnCheck_Stage1")
end

function CampSpawnCheck_Stage1(NPC, Spawn)  --Stage 1 Living Check
    local zone = GetZone(NPC)
    local CampSpawn1 = GetSpawnByLocationID(zone, 133785955) 
    local CampSpawn2 = GetSpawnByLocationID(zone, 133785956)
    local CampSpawn3 = GetSpawnByLocationID(zone, 133785957)
    local CampSpawn4 = GetSpawnByLocationID(zone, 133785958)
    local CampSpawn5 = GetSpawnByLocationID(zone, 133785959)
    local CampSpawn6 = GetSpawnByLocationID(zone, 133785960)

if IsAlive(CampSpawn1) == true then
    AddTimer(NPC,6000,"CampSpawnCheck_Stage1",1, Spawn)
    elseif IsAlive(CampSpawn2) == true then
    AddTimer(NPC,6000,"CampSpawnCheck_Stage1",1, Spawn)
    elseif IsAlive(CampSpawn3) == true then
    AddTimer(NPC,6000,"CampSpawnCheck_Stage1",1, Spawn)
    elseif IsAlive(CampSpawn4) == true  then
    AddTimer(NPC,6000,"CampSpawnCheck_Stage1",1, Spawn)
    elseif IsAlive(CampSpawn4) == true  then
    AddTimer(NPC,6000,"CampSpawnCheck_Stage1",1, Spawn)
    elseif IsAlive(CampSpawn5) == true  then
    AddTimer(NPC,6000,"CampSpawnCheck_Stage1",1, Spawn)
    
   else
      AddTimer(NPC, 6000, "CampReset")
  end
end
   

function CampReset(NPC)
local zone = GetZone(NPC)
local CampObject = GetSpawnByLocationID(zone, 133785961)   
    if CampObject~= nil then
        Despawn(CampObject)
        end
end
