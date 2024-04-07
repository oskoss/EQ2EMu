--[[
    Script Name    : SpawnScripts/ShatteredStillness/ArchLichUdalan.lua
    Script Author  : Neveruary
    Script Date    : 2021.10.04 01:10:53
    Script Purpose : Governs behavior of Arch Lich Udalan in Shattered Stillness: Epic.
    Script Notes   : Withering Soulscream, Suffocating Cloud, and chaotic elemental summoning spell need implementation.
    Boss Mechanics : Every minute, Udalan summons a chaotic elemental. This channeling can be interrupted by stunning him. The elemental has a few spells
                   : the most dangerous of which is stunning shards. 
--]]

spells = {240107, 240003, 240049} -- Withering Soulscream, Suffocating Cloud

function spawn(NPC)
end

function aggro(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end