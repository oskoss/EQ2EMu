--[[
    Script Name    : ItemScripts/abrokenmusicbox.lua
    Script Author  : Premierio015
    Script Date    : 2021.06.25 06:06:14
    Script Purpose : 
                   : 
--]]

local RewardForAMissingMusicBox = 5261


function examined(Item, Player)
	if CanReceiveQuest(Player,RewardForAMissingMusicBox) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the musicbox]")
    AddConversationOption(conversation, "[Destroy the musicbox]", "QuestFinish")
    StartDialogConversation(conversation, 2, Item, Player, "This floral designed music box is broken like one you found before. Perhaps it is the same one? Oh well.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,RewardForAMissingMusicBox) then
    AddConversationOption(conversation, "[Open the musicbox]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the box away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The music box is decorated with gold trim and a floral design is carved into the lid.  The lid is unlocked.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,RewardForAMissingMusicBox) then
    AddConversationOption(conversation, "[Write the name in your journal]", "Offer")
    end
    AddConversationOption(conversation, "[Put the music box away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Inside the music box is a small engraving of the name \"Lucilla Quietus\" on a little gold plate.  You also discover that the music box no longer plays music.")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,RewardForAMissingMusicBox) then
    OfferQuest(nil,Player,RewardForAMissingMusicBox)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,1286,1) then
        RemoveItem(Player,1286)
    end
end