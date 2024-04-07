--[[
    Script Name    : SpawnScripts/IsleRefuge1/CaptainRockbelly.lua
    Script Author  : Dorbin
    Script Date    : 2022.09.04 12:09:35
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 5 + dmgMod) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 11 + dmgMod)
    SetInfoStructUInt(NPC, "hp_regen_override", 1) 
    SetInfoStructSInt(NPC, "hp_regen", 0) 
    SetInfoStructUInt(NPC, "pw_regen_override", 1) 
    SetInfoStructSInt(NPC, "pw_regen", 0) 
    AddTimer(NPC,5000,"Callout")
    AddTimer(NPC,6000,"AliveCheck")
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function aggro(NPC)
    	PlayFlavor(NPC, "voiceover/english/captain_rockbelly/tutorial_island02_fvo_ghostshout.mp3", "Get youz away from meez treasures!  Dis meez loots!", "", 3040387050, 4243014787)
end

function Callout(NPC)
    PlayFlavor(NPC, "voiceover/english/captain_rockbelly/tutorial_island02_fvo_ghostshout.mp3", "Get youz away from meez treasures!  Dis meez loots!", "", 3040387050, 4243014787)
end

function AliveCheck(NPC)
    if not IsInCombat(NPC) then
        Despawn(NPC)
    else
    AddTimer(NPC,9000,"AliveCheck")
    end
end
