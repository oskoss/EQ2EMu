--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/widgetquestcrab0.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.03 05:11:04
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
SetTempVariable(NPC,"Crabs","false")
end

function casted_on(NPC, Spawn, SpellName)
	if SpellName == 'Examine' then
	    if GetTempVariable(NPC,"Crabs")== "false" then

    SetTempVariable(NPC,"Crabs","true")
    SetAccessToEntityCommand(Spawn,NPC,"Examine", 0)
    SpawnSet(NPC, "show_command_icon", 0)
    SpawnSet(NPC, "display_hand_icon", 0)
    PlaySound(NPC,"sounds/critters/crab/crab_scream01.wav",GetX(NPC),GetY(NPC),GetZ(NPC))
    SendMessage(Spawn,"The table errupts as brine sifters scuttle out from underneath. They appear quite agitated!")
    AddTimer(NPC,1550,"CrabSpawn",1,Spawn)
    AddTimer(NPC,3050,"CrabAttack",1,Spawn)
    end
    AddTimer(NPC,MakeRandomInt(840000,960000),"TableReset")
end
end

function CrabSpawn(NPC,Spawn)
    local zone = GetZone(NPC)
    local Crab1 = GetSpawnByLocationID(zone, 133787438)
    local Crab2 = GetSpawnByLocationID(zone, 133787439)
    local Crab3 = GetSpawnByLocationID(zone, 133787440)
    local Crab4 = GetSpawnByLocationID(zone, 133787441)
    if Crab1 == nil then
        SpawnByLocationID(zone,133787438)
        ApplySpellVisual(Crab2,61)
    end
    if Crab2 == nil then
        SpawnByLocationID(zone,133787439)
        ApplySpellVisual(Crab2,61)
    end
    if Crab3 == nil then
        SpawnByLocationID(zone,133787440)
        ApplySpellVisual(Crab3,61)
    end
    if Crab4 == nil then
        SpawnByLocationID(zone,133787441)
        ApplySpellVisual(Crab4,61)
    end
end

function TableReset(NPC)
    SetTempVariable(NPC,"Crabs","false")
    SetAccessToEntityCommand(Spawn,NPC,"Examine", 1)
    SpawnSet(NPC, "show_command_icon", 1)
    SpawnSet(NPC, "display_hand_icon", 1)
end

function respawn(NPC)
	spawn(NPC)
end

function CrabAttack(NPC,Spawn)
    local zone = GetZone(NPC)
    local Crab1 = GetSpawnByLocationID(zone, 133787438)
    local Crab2 = GetSpawnByLocationID(zone, 133787439)
    local Crab3 = GetSpawnByLocationID(zone, 133787440)
    local Crab4 = GetSpawnByLocationID(zone, 133787441)
    if Crab1 ~= nil and not IsInCombat(NPC) then
        ApplySpellVisual(Crab1,61)
        Attack(Crab1,Spawn)
    end
    if Crab2 ~= nil and not IsInCombat(NPC) then
        ApplySpellVisual(Crab2,61)
        Attack(Crab2,Spawn)
    end
    if Crab3 ~= nil and not IsInCombat(NPC) then
         ApplySpellVisual(Crab3,61)
       Attack(Crab3,Spawn)
    end
    if Crab4 ~= nil and not IsInCombat(NPC) then
         ApplySpellVisual(Crab4,61)
       Attack(Crab4,Spawn)
    end
end