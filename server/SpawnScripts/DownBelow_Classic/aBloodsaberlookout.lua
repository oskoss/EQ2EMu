--[[
    Script Name    : SpawnScripts/DownBelow_Classic/aBloodsaberlookout.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.09 09:01:34
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BloodSabers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ratonga(NPC)
   -- if not HasLanguage(Spawn,26) then
        --Garbled(NPC,Spawn)
    --end
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end