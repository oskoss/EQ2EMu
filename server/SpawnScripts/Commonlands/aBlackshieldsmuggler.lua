--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshieldsmuggler.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 03:01:09
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    AddTimer(NPC, 1500, "movement")

end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
    else
        IdleSneaky(NPC)
    end
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end