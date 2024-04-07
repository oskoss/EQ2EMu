--[[
    Script Name    : SpawnScripts/FreeportBetrayal/ExecutionerSelindi.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 11:09:34
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end


function Attention(NPC,Spawn)
local Lucan = GetSpawn(NPC,8450000)
    PlayFlavor(NPC,"","","salute_freeport",0,0)
    FaceTarget(NPC, Lucan)
	AddTimer(NPC,2500,"Moving",1,Spawn)
	AddTimer(NPC,7000,"Face",1,Spawn)
    AddTimer(NPC,10000,"Attacking",1,Spawn)
	AddTimer(NPC,12500,"Attacking2",1,Spawn)
	AddTimer(NPC,16500,"Salute2",1,Spawn)
	AddTimer(NPC,20000,"Face2",1,Spawn)
end

function Moving(NPC,Spawn)
    MovementLoopAddLocation(NPC,1.45, -1.21, -32.58,2,1)
    MovementLoopAddLocation(NPC,1.45, -1.21, -32.58,2,12,"Attacking")
    MovementLoopAddLocation(NPC,1.45, -1.21, -32.58,2,1)
    MovementLoopAddLocation(NPC,3.67, -1.21, -37.71,2,1)
    MovementLoopAddLocation(NPC,3.67, -1.21, -37.71,2,99999,"Face2")
    SetTarget(NPC, Spawn)
end

function Face(NPC,Spawn)
    FaceTarget(NPC, Spawn)
end


function Attacking(NPC,Spawn)
if IsAlive(Spawn)== true then
CastSpell(Spawn,2550426,1,NPC)
Attack(NPC,Spawn)
SetStepComplete(Spawn,5890,2)
AddTimer(NPC,2700,"Attacking2",1,Spawn)
else
local Lucan = GetSpawn(NPC,8450000)
    SetTarget(NPC, Lucan)
    FaceTarget(NPC, Lucan)
end
end

function Attacking2(NPC,Spawn)
local Lucan = GetSpawn(NPC,8450000)
    SetTarget(NPC, Lucan)
    FaceTarget(NPC, Lucan)
local zone = GetZone(NPC)
local Tayil = GetSpawnByLocationID(zone,133786877)
    ApplySpellVisual(Spawn,174)
    SetInfoStructString(Tayil, "action_state", "0")
end


function Salute2(NPC,Spawn)
    PlayFlavor(NPC,"","","salute_freeport",0,0)
end

function Moving2(NPC,Spawn)
    MoveToLocation(NPC,3.67, -1.21, -37.71,2,false)
end

function victory(NPC,Spawn)
local Lucan = GetSpawn(NPC,8450000)
    SetTarget(NPC, Lucan)
    FaceTarget(NPC, Lucan)
end

function Face2(NPC,Spawn)
    SetHeading(NPC,88)
    SetTarget(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end