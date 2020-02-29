--[[
    Script Name    : SpawnScripts/QueensColony/NebbleUnderroot.lua
    Script Author  : Zcoretri
    Script Date    : 2015.07.27
    Script Purpose : Nebble Unfderroot dialog
                   : 
--]]

function spawn(NPC)
end

function respawn(NPC)

end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)

    choice = math.random(1,2)
    if choice == 1 then
        PlayFlavor(NPC, "", "Mmm, triggerfish pie!  I can smell it now.", "", 1689589577, 4560189, Spawn)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "Shark fin soup!  Maybe I'll get lucky.", "", 1689589577, 4560189, Spawn)
    end
end