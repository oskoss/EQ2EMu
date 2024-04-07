--[[
    Script Name    : ItemScripts/amisspelledGuttersnipenote.lua
    Script Author  : Premierio015\\Dorbin
    Script Date    : 2021.06.25 06:06:02
    Script Purpose : 
                   : 
--]]


local BalancingTheGangs = 5260



function examined(Item, Player)
	if CanReceiveQuest(Player,BalancingTheGangs) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the note]")
    AddConversationOption(conversation, "[Toss away the note]", "QuestFinish")
    StartDialogConversation(conversation, 2, Item, Player, "This note is a copy of gibberish you made sense of earlier. It has no more use to you.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,BalancingTheGangs) then
    AddConversationOption(conversation, "[Attempt to read the note]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the note away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The letter seems to be just a bunch of gibberish and misspelled words upon first glance.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,BalancingTheGangs) then
    AddConversationOption(conversation, "Perhaps I can even the odds...", "Offer")
    end
    AddConversationOption(conversation, "[Put the note away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "From what you can tell, this letter was meant for a member of the Black Magi. Some sort of deal was being struck to band them with the Guttersnipes against the Giantslayers... or at least that is what it seems.")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,BalancingTheGangs) then
    OfferQuest(nil,Player,BalancingTheGangs)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,2262,1) then
        RemoveItem(Player,2262)
    end
end