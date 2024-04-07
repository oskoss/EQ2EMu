--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/TheKeeperofEthernere.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 05:08:51
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(18 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(32 + dmgMod))

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1034.mp3", "We watch over those you have not yet passed on to the Ethernere.", "orate", 0, 0, Spawn, 0)
end

function respawn(NPC)
	spawn(NPC)
end