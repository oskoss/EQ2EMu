--[[
    Script Name    : SpawnScripts/DoF_design_path_script/BridgeCrosser.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.18 10:07:47
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
AddTimer(NPC,3000,"Waypoint")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Waypoint(NPC,Spawn)
    MovementLoopAddLocation(NPC,-70,2.76,-25,4)
    MovementLoopAddLocation(NPC,-80,2.76,-25,4)
    MovementLoopAddLocation(NPC,-100,0,-25, 4,3)
    MovementLoopAddLocation(NPC,-80,2.76,-25,4)
    MovementLoopAddLocation(NPC,-70,2.76,-25,4)
    MovementLoopAddLocation(NPC,-47.5,0,-25, 4,3)
    end
    
    function death(NPC,Spawn)
        Despawn(NPC)
    end