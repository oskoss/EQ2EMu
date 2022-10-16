--[[
    Script Name    : SpawnScripts/QeynosHarbor/TimelessTrader.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.17 04:06:19
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_1_1034.mp3", "Be careful when purchasing items outside your timeline.  They may not appear fully because they don't exist yet!", "scold", 0, 0, Spawn, 0)
end

function respawn(NPC)
	spawn(NPC)
end