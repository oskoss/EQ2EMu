--[[
    Script Name    : SpawnScripts/IsleRefuge1/GuardTugar.lua
    Script Author  : Dorbin
    Script Date    : 2022.09.06 03:09:13
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
    local choice = MakeRandomInt(1,2)
	FaceTarget(NPC, Spawn)
	if choice == 1 then
	PlayFlavor(NPC, "voiceover/english/island_of_refuge/guard_tugar/ior_guardtugar_004.mp3", "Keep walking... While you still can!", "nod", 146673171, 1820291654, Spawn, 0)
	elseif choice == 2 then
	PlayFlavor(NPC, "voiceover/english/island_of_refuge/guard_tugar/ior_guardtugar_002.mp3", "Bash some skulls for me!", "shakefist", 3677270980, 1767623082, Spawn, 0)
end
end


function respawn(NPC)
	spawn(NPC)
end