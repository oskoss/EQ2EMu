--[[
    Script Name    : SpawnScripts/Antonica/abloodsaberseditionist.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.14 10:07:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseClass(NPC)
    ratonga(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function ChooseClass(NPC)
    SetClass = MakeRandomInt(1,2)
    if SetClass == 1 then
        SpawnSet(NPC,"class", 2)
        SetSpellList(NPC, 451)
        IdleAggressive(NPC)
        DervishChain(NPC)
    elseif SetClass == 2 then
        SpawnSet(NPC, "class", 32)
        SetSpellList(NPC, 469)
        IdleAlert(NPC)
        DervishLeather(NPC)
    end
end