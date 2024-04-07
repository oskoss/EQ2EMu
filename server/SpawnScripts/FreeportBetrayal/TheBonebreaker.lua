--[[
    Script Name    : SpawnScripts/FreeportBetrayal/TheBonebreaker.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 06:09:30
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
end

function victory(NPC,Spawn)
    if IsPlayer(Spawn) == true then
    AddTimer(NPC,1500,"FailureExit",1,Spawn)
    end
end   

function FailureExit(NPC,Spawn)
          FailExit = GetZone("SerpentSewer")
       Zone(FailExit,Spawn,-133.56, -0.21, 28.15, 41.26)
 end     
 
function respawn(NPC)
	spawn(NPC)
end