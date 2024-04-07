--[[
	Script Name	: ItemScripts/a_locked_chest.lua
	Script Purpose	:
	Script Author	: Ememjr\\Dorbin
	Script Date	    : 2019-10-07
	Script Notes	:
--]]

local quest = 480



function examined(Item, Player)
	if CanReceiveQuest(Player,quest) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the chest]")
    AddConversationOption(conversation, "[Throw the chest away]", "QuestFinish")
    StartDialogConversation(conversation, 2, Item, Player, "This locked chest has the same markings as one you've found before. It appears worthless to you.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,quest) then
    AddConversationOption(conversation, "[Read the parchment]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the chest away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The chest's lock appears broken beyond opening. A parchment is plastered to the side with the word \"BOUNTY\" in large letters at the top. Perhaps someone was trying to complete this bounty before returning the chest?")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,quest) then
    AddConversationOption(conversation, "[Commit to the task]", "Offer")
    end
    AddConversationOption(conversation, "[Put the chest away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "\"A valuable chest was unlawfully taken by a band of Darkblade brigands.  A generous reward will be provided to the one who returns this stolen property to Anrean Velvinna in the Beggar's Court.\"")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,quest) then
    OfferQuest(nil,Player,quest)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,2115,1) then
        RemoveItem(Player,2115)
    end
end