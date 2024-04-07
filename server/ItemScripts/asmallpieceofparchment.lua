--[[
    Script Name    : ItemScripts/asmallpieceofparchment.lua
    Script Author  : Premierio015\\Dorbin - Item text
    Script Date    : 2021.07.04 10:07:23
    Script Purpose : 
                   : 
--]]

local TheFallenAssassin = 5283
local ItemID = 2804


function examined(Item, Player)
	if CanReceiveQuest(Player,TheFallenAssassin) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the parchment.]")
    AddConversationOption(conversation, "[Destroy the parchment.]", "QuestFinish")
    StartDialogConversation(conversation, 2, Item, Player, "This piece of parchment is a copy of orders you've already read. You don't need it anymore, but someone else might.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,TheFallenAssassin) then
    AddConversationOption(conversation, "[Inspect the parchment.]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the parchment away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This parchment appears offical. You can make out the Freeport Militia emblem embossed on the edge of the material.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,TheFallenAssassin) then
    AddConversationOption(conversation, "[Write the task in your journal.]", "Offer")
    end
    AddConversationOption(conversation, "[Put the parchment away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "\"Your orders are to be carried out by the morrow's dawn.  Nothing less than the Lord's head will prove your success in this mission.  Fail and your life will be forfeit.\" The statement is signed, Captain Molacus.")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,TheFallenAssassin) then
    OfferQuest(nil,Player,TheFallenAssassin)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,ItemID,1) then
        RemoveItem(Player,ItemID)
    end
end