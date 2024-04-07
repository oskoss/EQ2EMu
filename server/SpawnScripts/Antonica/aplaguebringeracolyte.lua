--[[
    Script Name    : SpawnScripts/Antonica/aplaguebringeracolyte.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 04:09:26
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    ChooseClass(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function ChooseClass(NPC)
    SetClass = MakeRandomInt(1,4)
    if SetClass == 1 then
        SpawnSet(NPC, "class", 18)
        SetSpellList(NPC, 453)
        IdlePriest(NPC)
        DervishLeather(NPC)
    elseif SetClass == 2 then
        SpawnSet(NPC, "class", 28)
        SetSpellList(NPC, 454)
        CastSpell(NPC, 280025, 5)
        IdleAlert(NPC)
        DervishRobe(NPC)
    elseif SetClass == 3 then
        SpawnSet(NPC, "class", 12)
        SetSpellList(NPC, 329)
        IdlePriest(NPC)
        DervishLeather(NPC)
    elseif SetClass == 4 then
        SpawnSet(NPC, "class", 8)
        SetSpellList(NPC, 470)
        IdleAggressive(NPC)
        DervishChain(NPC)
    end
end
