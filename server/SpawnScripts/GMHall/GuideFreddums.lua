--[[
    Script Name    : SpawnScripts/GMHall/GuideFreddums.lua
    Script Author  : TyroneSWG
    Script Date    : 2019.01.28 04:01:33
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
        PlayAnimation(NPC, 16583)
        PlayAnimation(NPC, 16863)
end


function hailed(NPC, Spawn)
        Say(NPC, "Greetings. If you have any questions please ask!")
end

function respawn(NPC)

end

