--[[
    Script Name    : SpawnScripts/Commonlands/AndersBlackhammer.lua
    Script Author  : Premierio015
    Script Date    : 2021.05.24 10:05:00
    Script Purpose : 
                   : 
--]]

local  CollectingOnWhatIsEarned = 423
require "SpawnScripts/Generic/GenericVoiceOvers"

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(45 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(85 + dmgMod))

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	GenericHail(NPC, Spawn)
	if HasQuest(Spawn, CollectingOnWhatIsEarned) then
	SetStepComplete(Spawn, CollectingOnWhatIsEarned, 1)
	PlayFlavor(NPC, "",  "Brandus said to be expecting you.  I'm supposed to pay you what you're due!  Haha!!", "", 1689589577, 4560189, Spawn)
	Attack(NPC, Spawn)
end
   end

function respawn(NPC)
	spawn(NPC)
end
   