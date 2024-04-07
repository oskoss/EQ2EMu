--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/HangmanSantoth.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 12:08:11
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(24 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(42 + dmgMod))

end

function hailed(NPC, Spawn)
	PlayFlavor(NPC,"","","tapfoot",0,0,Spawn)
	SendMessage(NPC,"The Hangman appears disinterested in your presence. He appears to be waiting for someone or something...","white")
end

function respawn(NPC)
	spawn(NPC)
end