--[[
	Script Name	: SpawnScripts/Caves/analabastergolem.lua
	Script Purpose	: an alabaster golem 
	Script Author	: LordPazuzu
	Script Date	: 10/2/2022
	Script Notes	: 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGolem1.lua")
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    AddTimer(NPC,math.random(2500,6000),"AttackRocks")

end

function respawn(NPC)
	spawn(NPC)
end


function AttackRocks(NPC)
    if not IsInCombat(NPC) then
    PlayAnimation(NPC,10783)
    end
    AddTimer(NPC, math.random(7000,8500), "AttackRocks")
end     
     --[[
    local rockattack = math.random (1, 4)

            if rockattack == 1 then
                    AddTimer(NPC, 100, "stop_attack")  
            else
                    AddTimer(NPC, 100, "Rocks") 	
            end ]]--


--[[function Rocks(NPC)
    if not IsInCombat(NPC) then
    SpawnSet(NPC, "visual_state", "10783")	-- Start attacking
    end
    AddTimer(NPC, 3500, "stop_attack")	        -- for 2 seconds, then stop
end


function stop_attack(NPC)
    SpawnSet(NPC, "visual_state", "0") 	        -- Stop attacking
    AddTimer(NPC, 8000, "AttackRocks")
end]]--


