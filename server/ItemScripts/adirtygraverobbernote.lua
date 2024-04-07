--[[
    Script Name    : ItemScripts/adirtygraverobbernote.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.14 01:11:25
    Script Purpose : 
                   : 
--]]

local NatashaNote = 5927


function examined(Item, Player)
	if CanReceiveQuest(Player,NatashaNote) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the note]")
    AddConversationOption(conversation, "[Toss the note to the away]", "QuestFinish")
    StartDialogConversation(conversation, 2, Item, Player, "You've seen this note before. It reads... \n\n\"We may have found a new burial site!  Rumor is this may be the richest crypt yet!  Gather at our usual spot tomorrow night.  Do not let that rat Tarakh know about this or so help me I'll have your mangy tail dangling from my wall... Love, Natasha\"")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,NatashaNote) then
    AddConversationOption(conversation, "[Read the note]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the note away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This filthy bit of crumpled paper has the stench of death on it. The words are still legible.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,NatashaNote) then
    AddConversationOption(conversation, "[Write \"Tarakh\" in your journal]", "Offer")
    end
    AddConversationOption(conversation, "[Put the note away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "\"We may have found a new burial site!  Rumor is this may be the richest crypt yet!  Gather at our usual spot tomorrow night.  Do not let that rat Tarakh know about this or so help me I'll have your mangy tail dangling from my wall... Love, Natasha\"")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,NatashaNote) then
    OfferQuest(nil,Player,NatashaNote)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,1568,1) then
        RemoveItem(Player,1568)
    end
end