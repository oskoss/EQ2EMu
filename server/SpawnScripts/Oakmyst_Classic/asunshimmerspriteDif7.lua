--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/asunshimmerspriteDif7.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 05:10:13
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 5, -5, 2, -2, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function casted_on(NPC, Spawn, Message)
    if Message == "Catalogue Creature" then
		if HasQuest(Spawn, Catalogue) and GetQuestStepProgress(Spawn,Catalogue,2) == 0 then
			SetStepComplete(Spawn, Catalogue, 2)
			        local con = CreateConversation()
        AddConversationOption(con, "Close the entry.")
        StartDialogConversation(con, 1, NPC, Spawn, "Sunshimmer Sprite\n\n \"Sprites are a newer addition to the Oakmyst since The Cataclysm. Supposedly hailing from more enchanted waters, they were swept in from the torrential winds. It is hard to say what terms they have made with the resident fairies. Unlike the fairies here in Oakmyst, sprites are known to be true to their word.\"\n\n-Tracker Kelnis")        end
end
end