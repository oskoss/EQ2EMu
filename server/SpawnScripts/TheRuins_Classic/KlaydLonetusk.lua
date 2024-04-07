--[[
    Script Name    : SpawnScripts/TheRuins_Classic/KlaydLonetusk.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.11 04:07:20
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/LoneTusk2.lua")

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end