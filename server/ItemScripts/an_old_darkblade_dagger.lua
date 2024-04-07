--[[
	Script Name	: ItemScripts/an_old_darkblade_dagger.lua
	Script Purpose	:Quest Stater for The Darkblade Dagger
	Script Author	: Ememjr\\Dorbin - Quest text
	Script Date	    : 2019-10-07
	Script Notes	:
--]]

local DarkbladeDagger = 482


function examined(Item, Player)
	if CanReceiveQuest(Player,DarkbladeDagger) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Put the dagger away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This strange dagger is like one you've used before. It does not seem to offer anything more to you upon inspection.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,DarkbladeDagger) then
    AddConversationOption(conversation, "[Pull on the hilt.]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the dagger away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This strange dagger does not appear to be very functional.  The hilt seems to be hollow.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,DarkbladeDagger) then
    AddConversationOption(conversation, "[Read the note.]", "Dialog3")
    end
    AddConversationOption(conversation, "[Put the dagger away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Without much effort you remove the blade. Examining the hilt reveals a small note tucked inside.")
end

function Dialog3(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,DarkbladeDagger) then
    AddConversationOption(conversation, "I should kill these ratonga!", "Offer")
    end
    AddConversationOption(conversation, "[Put the dagger away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "\"Each Darkblade is to exterminate no less than ten diseased ratonga. The daggers provided by the netherot chanters will bestow reward upon those sincere in their oath, or death to those who ignore this call to duty.\"")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,DarkbladeDagger) then
    OfferQuest(nil,Player,DarkbladeDagger)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,3767,1) then
        RemoveItem(Player,3767)
    end
end

--