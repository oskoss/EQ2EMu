--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshielddockhand.lua
    Script Author  : Premierio015
    Script Date    : 2021.01.07 03:01:18
    Script Purpose : 
                   : 
--]]

local BlackshieldRecruitID = 299540
local SmugglersSecrets = 452

function spawn(NPC)

end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

-- TIMERS USED FOR CALLING DIALOGUE FUNCTIONS FROM  "a Blackshield Recruit" Script

function dlgtimer2(NPC, Spawn)
local zone = GetZone(NPC)
local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID)
if BlackshieldRecruit ~= nil then
AddTimer(BlackshieldRecruit, 1000, "BlackshieldRecruitLine2", 1, Spawn)
end
   end


function dlgtimer3(NPC, Spawn)
local zone = GetZone(NPC)
local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID)
if BlackshieldRecruit ~= nil then
AddTimer(BlackshieldRecruit, 1000, "BlackshieldRecruitLine3", 1, Spawn)
end
   end

function dlgtimer5(NPC, Spawn)
local zone = GetZone(NPC)
local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID)
if BlackshieldRecruit ~= nil then
AddTimer(BlackshieldRecruit, 1000, "BlackshieldRecruitLine4", 1, Spawn)
end
   end

-- Dialog Part for "a Blackshield Dockhand"

function BlackshieldDockhandLine1(NPC, Spawn)
    local zone = GetZone(NPC)
    local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID) 
    FaceTarget(NPC, BlackshieldRecruit)
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Continue eavesdropping.]", "dlgtimer2")
    StartConversation(conversation, NPC, Spawn, "This a calm seas kind'a deal.  You don't ask questions about it.")
end


 
function  BlackshieldDockhandLine2(NPC, Spawn)
    local zone = GetZone(NPC)
    local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID) 
    FaceTarget(NPC, BlackshieldRecruit)
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Continue eavesdropping.]", "dlgtimer3")
    StartConversation(conversation, NPC, Spawn, "I can.  I got gold for ale and beddin'.  That's all I care for.")
end
 

 
function BlackshieldDockhandLine3(NPC, Spawn) 
    local zone = GetZone(NPC)
    local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID) 
    FaceTarget(NPC, BlackshieldRecruit)
    PlayAnimation(NPC, 10843)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Who, me?", "dlgtimer5")
    StartConversation(conversation, NPC, Spawn, "Finally.  Come 'ere courier, and take this message to the rendezvous.")
end



function  BlackshieldDockhandLine4(NPC, Spawn)
    local zone = GetZone(NPC)
    local BlackshieldRecruit = GetSpawnByLocationID(zone, BlackshieldRecruitID) 
    FaceTarget(NPC, BlackshieldRecruit)
    PlayAnimation(NPC, 12216)
    SetStepComplete(Spawn, SmugglersSecrets, 2)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Riiiight.")
    StartConversation(conversation, NPC, Spawn, "Should be.  Now see to it this message gets to the rendezvous at Pride Lake, and be quick about it!")
end
