--[[
    Script Name    : SpawnScripts/Blackburrow/aSabertoothexcavator.lua
    Script Author  : Dorbin
    Script Date    : 2022.07.11 06:07:57
    Script Purpose : 
                   : 
--]]
    dofile("SpawnScripts/Generic/MonsterCallouts/BaseGnoll1.lua")

function spawn(NPC)
    AddTimer(NPC,math.random(2500,6000),"AttackRocks")

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function AttackRocks(NPC)
    if not IsInCombat(NPC) then
    PlayAnimation(NPC,10784)
    end
    AddTimer(NPC, math.random(3000,6000), "AttackRocks")
end 