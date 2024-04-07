--[[
    Script Name    : SpawnScripts/FreeportBetrayal/Chains.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 05:09:35
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 1, "InRange", "LeaveRange")
end


function LeaveRange(NPC,Spawn)
    SetPosition(Spawn,-1.05, -1.21, -30.84,355)
    CastSpell(Spawn,2550422,1,1,Tayil)
end




function respawn(NPC)
	spawn(NPC)
end