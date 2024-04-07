--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipehooliganHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 03:11:42
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    SpawnSet(NPC, "heroic", 1)
    AddTimer(NPC,MakeRandomInt(3500,10000),"EmoteLoop")
end

function EmoteLoop(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","scheme",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","brandish",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","swear",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","ponder",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"EmoteLoop")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end
