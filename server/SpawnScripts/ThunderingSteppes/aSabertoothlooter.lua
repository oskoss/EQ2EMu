--[[
    Script Name    : SpawnScripts/ThunderingSteppes/aSabertoothlooter.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.22 04:03:51
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseClass(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function ChooseClass(NPC, Spawn)
    SetClass = MakeRandomInt(1,2)
    if SetClass == 1 then
        SpawnSet(NPC, "class", 3) -- Guardian
        --Set spell list here
    elseif SetClass == 2 then
        SpawnSet(NPC, "class", 4) -- Berserker
        --Set spell list here
    end
end
