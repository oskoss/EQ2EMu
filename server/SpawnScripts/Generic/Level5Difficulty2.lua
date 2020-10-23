--[[
        Script Name     :       SpawnScripts/Generic/Level5Difficulty2.lua
	Script Purpose	:	Level set to 5 and and difficulty to 2
	Script Author	:	Rylec
	Script Date	:	04-19-2020 02:18:22 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
        SpawnSet(NPC, "level", "5") 
        SpawnSet(NPC, "difficulty", "2")  
end

function hailed(NPC, Spawn)
        FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

