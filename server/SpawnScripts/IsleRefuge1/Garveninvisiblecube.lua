--[[
    Script Name    : SpawnScripts/IsleRefuge1/Garveninvisiblecube.lua
    Script Author  : Dorbin
    Script Date    : 2022.09.09 06:09:23
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
SetTempVariable(NPC,"QuestOfferCheck","false")-- Avoids spamming quest offer when when/out of range
end

function InRange(NPC,Spawn)
if GetTempVariable(NPC,"QuestOfferCheck")=="false" then
    if GetClass(Spawn)==0 and not HasQuest(Spawn,5725) and not HasCompletedQuest(Spawn, 5725) then
        if not HasItem(Spawn,20902) and GetLevel(Spawn) <2 then  -- GIVES SMALL BAG  
        SummonItem(Spawn,20902,1,1)
        end
    OfferQuest(NPC,Spawn,5725)
    SetTempVariable(NPC,"QuestOfferCheck","true")
    AddTimer(NPC,10000,"TimerReset")
    end
end
end

function respawn(NPC)
	spawn(NPC)
end

function TimerReset(NPC)
SetTempVariable(NPC,"QuestOfferCheck","false")
end