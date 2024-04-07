--[[
    Script Name    : SpawnScripts/MeetingOfTheMinds/Brixx.lua
    Script Author  : Neveruary
    Script Date    : 2021.10.05 12:10:27
    Script Purpose : Governs the behavior of Braxx in A Meeting of the Minds.
                   : Spell functions de-activated pending proper spell implementation on mobs.
--]]

-- spells = {Gaze, Glare of Eradication, Gaze of Commandment, Gaze of Writhing Agony}

function spawn(NPC)
end

function aggro(NPC, Spawn)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end