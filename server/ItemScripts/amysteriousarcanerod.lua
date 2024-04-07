--[[
    Script Name    : ItemScripts/amysteriousarcanerod.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.15 03:11:11
    Script Purpose : 
                   : 
--]]

local ShivosRod = 5928
local ItemID = 2292


function examined(Item, Player)
	if CanReceiveQuest(Player,ShivosRod) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the arcane rod]")
    AddConversationOption(conversation, "[Put the arcane rod away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "It appears to be a non descript rod of light metal. There are a few strange markings etched into it. You've seen this before, so you don't need it anymore.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,ShivosRod) then
    AddConversationOption(conversation, "[Touch the markings with your fingertips]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the arcane rod away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "It appears to be a non descript rod of light metal. There are a few strange markings etched into it.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,ShivosRod) then
    AddConversationOption(conversation, "[Consider where to ask about this.]", "Offer")
    end
    AddConversationOption(conversation, "[Put the arcane rod away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The rod seems to hum with magical energy, however, you can't seem to figure out its purpose or use at this time.  It is very unlikely that the ratonga was the original owner of the rod.")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,ShivosRod) then
    OfferQuest(nil,Player,ShivosRod)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,ItemID,1) then
        RemoveItem(Player,ItemID)
    end
end