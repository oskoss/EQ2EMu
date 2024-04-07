--[[
    Script Name    : SpawnScripts/TempleSt/acrudeweapon.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.31 12:10:38
    Script Purpose : 
                   : 
--]]

local VlepoPlan = 5917

function spawn(NPC)
	SetRequiredQuest(NPC, VlepoPlan, 1, 1)
SetTempVariable(NPC,"Callout","false")
end
--
function casted_on(NPC, Spawn, SpellName)
  if SpellName == 'Attempt to steal' then
    local zone = GetZone(NPC)
    local Shinska = GetSpawnByLocationID(zone, 420479)
    local Guard = GetSpawnByLocationID(zone, 133787206)
    local GuardDistance = GetDistance(Spawn,Guard)
    
    if GetTempVariable(NPC,"Callout") ~= "true" then 
        SetTempVariable(NPC,"Callout","true")
        PlayFlavor(Shinska,"","You! What yous think yous doing?! Speak to me if you want to buy weapons.","shakefist",0,0,Spawn)
        FaceTarget(Shinska,Spawn)
        AddTimer(NPC,7000,"ResetCallout",1,Spawn)
    
   if GuardDistance <=4 then
        GuardAttack(NPC,Spawn)
        AddTimer(NPC,3500,"Kick",1,Spawn)
    end
    
    else
        AddTimer(NPC,10000,"Kick",1,Spawn)
        PlayFlavor(Shinska,"","THIEF! Guards! Guards!!","point",0,0,Spawn)
        FaceTarget(Shinska,Spawn)
        GuardAttack(NPC,Spawn)
    end
end
end

function GuardAttack(NPC,Spawn)
        local zone = GetZone(NPC)
        local Guard = GetSpawnByLocationID(zone, 133787206)
        Attack(Guard,Spawn)
        PlayFlavor(Guard,"","Stop thief!!","",0,0,Spawn)
        SendPopUpMessage(Spawn,"A guard has spotted you!",250,0,0)
        SendMessage(Spawn,"A guard has spotted you!","red")
        PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
end

function Kick(NPC,Spawn)
        ZoneRef = GetZone("TempleSt")
        Zone(ZoneRef,Spawn)
end

function ResetCallout(NPC,Spawn)
SetTempVariable(NPC,"Callout","false")
end

function respawn(NPC)
	spawn(NPC)
end