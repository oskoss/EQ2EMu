--[[
    Script Name    : SpawnScripts/Antonica/atimberclawgnoll.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.09 01:07:44
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseClass(NPC)
end


function respawn(NPC)
	spawn(NPC)
end

function ChooseClass(NPC)
    SetClass =  MakeRandomInt(1,3)
    if SetClass== 1 or SetClass == 2 then
        SpawnSet(NPC, "class", 2)
        SetSpellList(NPC,451)
    elseif SetClass == 3  then
        SpawnSet(NPC, "class", 12)
        SetSpellList(NPC, 329)
    end
end