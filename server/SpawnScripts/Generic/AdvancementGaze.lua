--[[
    Script Name    : SpawnScripts/Generic/AdvancementGaze.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.26 12:08:46
    Script Purpose : 
                   : 
--]]

local Q_MageCheck = 5877
local Q_FighterCheck = 5878
local Q_PriestCheck = 5879
local Q_ScoutCheck = 5880

local Q_Mage1 = 5767
local Q_Mage2 = 5768
local Q_Ench = 5771
local Q_Sorc = 5769
local Q_Summ = 5770

local Q_Fighter1 = 5787
local Q_Fighter2 = 5788
local Q_Brawl = 5790
local Q_Crusade = 5789
local Q_Warrior = 5791

local Q_Priest1 = 5772
local Q_Priest2 = 5773
local Q_Cleric = 5771
local Q_Druid = 5769
local Q_Shaman = 5770

local Q_Scout1 = 5782
local Q_Scout2 = 5783
local Q_Bard = 5784
local Q_Pred = 5785
local Q_Rog = 5786

--[[function spawn(NPC)
SetPlayerProximityFunction(NPC, 12, "ClassCheck", "LeaveRange")
end]]--

function ClassCheck(NPC,Spawn) --Quest Callout
 if GetFactionAmount(Spawn,11)>=5000 then
    if GetLevel(Spawn) ==8 or GetLevel(Spawn)==9 then

        if GetClass(Spawn)==1 then -- FIGHTER
            if not HasQuest(Spawn,Q_FighterCheck) then
                if not HasQuest(Spawn,Q_Fighter1) and not HasCompletedQuest(Spawn,Q_Fighter1) and GetLevel(Spawn)>=8 then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Fighter1) and GetLevel(Spawn)>=8 and not HasQuest(Spawn,Q_Fighter2) and not HasCompletedQuest(Spawn,Q_Fighter2) then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Fighter2) and not HasQuest(Spawn,Q_Brawl) and not HasQuest(Spawn,Q_Crusade) and not HasQuest(Spawn,Q_Warrior) then                          
                Offer(NPC,Spawn)
                end
            end
 
        elseif GetClass(Spawn)==11 then -- PRIEST
            if not HasQuest(Spawn,Q_PriestCheck) then
                if not HasQuest(Spawn,Q_Priest1) and not HasCompletedQuest(Spawn,Q_Priest1) and GetLevel(Spawn)>=8 then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Priest1) and GetLevel(Spawn)>=8 and not HasQuest(Spawn,Q_Priest2) and not HasCompletedQuest(Spawn,Q_Priest2) then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Priest2) and not HasQuest(Spawn,Q_Cleric) and not HasQuest(Spawn,Q_Druid) and not HasQuest(Spawn,Q_Shaman) then                          
                Offer(NPC,Spawn)
                end
            end            
 
        elseif GetClass(Spawn)==21 then -- MAGE
            if CanReceiveQuest(Spawn,Q_MageCheck) then
                if not HasQuest(Spawn,Q_Mage1) and not HasCompletedQuest(Spawn,Q_Mage1) and GetLevel(Spawn)>=8 then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Mage1) and GetLevel(Spawn)>=8 and not HasQuest(Spawn,Q_Mage2) and not HasCompletedQuest(Spawn,Q_Mage2) then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Mage2) and not HasQuest(Spawn,Q_Ench) and not HasQuest(Spawn,Q_Sorc) and not HasQuest(Spawn,Q_Summ) then                          
                Offer(NPC,Spawn)
                end
            end   
 
          elseif GetClass(Spawn)==31 then -- SCOUT
            if not HasQuest(Spawn,Q_ScoutCheck) then
                if not HasQuest(Spawn,Q_Scout1) and not HasCompletedQuest(Spawn,Q_Scout1) and GetLevel(Spawn)>=8 then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Scout1) and GetLevel(Spawn)>=8 and not HasQuest(Spawn,Q_Scout2) and not HasCompletedQuest(Spawn,Q_Scout2) then
                Offer(NPC,Spawn)
                elseif HasCompletedQuest(Spawn,Q_Scout2) and not HasQuest(Spawn,Q_Bard) and not HasQuest(Spawn,Q_Pred) and not HasQuest(Spawn,Q_Rog) then                          
                Offer(NPC,Spawn)
                end
            end              
        end
    end
end
end

function Offer(NPC,Spawn)
if GetFactionAmount(Spawn,11) >= 5000 then
    if GetClass(Spawn) == 1 then
    OfferQuest(NPC,Spawn,Q_FighterCheck)
    elseif GetClass(Spawn) == 11 then
    OfferQuest(NPC,Spawn,Q_PriestCheck)
    elseif GetClass(Spawn) == 21 then
    OfferQuest(NPC,Spawn,Q_MageCheck)
    elseif GetClass(Spawn) == 31 then
    OfferQuest(NPC,Spawn,Q_ScoutCheck)
    end
end
end
