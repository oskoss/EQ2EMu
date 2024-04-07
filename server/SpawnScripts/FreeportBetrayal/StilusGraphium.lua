--[[
    Script Name    : SpawnScripts/FreeportBetrayal/StilusGraphium.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 04:09:53
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
--Didn't I tell you that nobility comes from personal sacrifice?  You sacrificed your life for the Overlord's entertainment.  What could be more noble?
end

function respawn(NPC)
	spawn(NPC)
end