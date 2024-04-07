--[[
    Script Name    : SpawnScripts/Commonlands/aDervishcutthroat.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 07:01:34
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseRace(NPC)
    AddTimer(NPC, 1500, "movement")
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    end
end

function respawn(NPC)
	spawn(NPC)
end

function ChooseRace(NPC)
    local SetRace = MakeRandomInt(1,6)
    
    if SetRace == 1 or SetRace == 2 or SetRace ==  3 then
        SpawnSet(NPC, "class",  38)
        SetSpellList(NPC,  458)
        human(NPC)
        DervishLeather(NPC)
        IdleSneaky(NPC)
        
    elseif SetRace == 4 then
        SpawnSet(NPC, "class",  2)
        SetSpellList(NPC,  451)
        SpawnSet(NPC,"size", 36)
        barbarian(NPC)
        DervishChain(NPC)
        IdleAggressive(NPC)
        
    elseif SetRace == 5 then
        SpawnSet(NPC, "gender", 2)
        SpawnSet(NPC, "class",  18)
        SpawnSet(NPC, "size", 37)
        SetSpellList(NPC,  325)
        ogre(NPC)
        DervishLeather(NPC)
        IdlePriest(NPC)
        
    elseif SetRace == 6 then
        SpawnSet(NPC, "class",  22)
        SetSpellList(NPC,  324)
        erudite(NPC)
        DervishRobe(NPC)
        IdleAlert(NPC)
    end
end




