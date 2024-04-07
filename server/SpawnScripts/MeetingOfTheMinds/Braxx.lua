--[[
    Script Name    : SpawnScripts/MeetingOfTheMinds/Braxx.lua
    Script Author  : Neveruary
    Script Date    : 2021.10.05 12:10:19
    Script Purpose : Governs the behavior of Braxx in A Meeting of the Minds.
                   : Spell functions de-activated pending proper spell implementation on mobs.
--]]

-- spells = {Gaze, Glare of Eradication, Gaze of Commandment, Gaze of Writhing Agony}

function spawn(NPC)
end

function aggro(NPC, Spawn)
    AddTimer(NPC, math.random(1500,2500), "spellLoop")
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end