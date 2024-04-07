--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshieldcleric.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 03:01:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC)
    AddTimer(NPC, 1500, "movement")

end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
    else
        IdlePriest(NPC)
    end
end
function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC)
    setrace = MakeRandomInt(1,2)
    if setrace == 1 then
        human(NPC)
    elseif setrace == 2 then
        halfelf(NPC)
    end
end