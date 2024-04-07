--[[
    Script Name    : ItemScripts/acarvedorcaxe.lua
    Script Author  : Premierio015
    Script Date    : 2021.06.25 07:06:22
    Script Purpose : 
                   : 
--]]

local AnAxesRevenge = 5262


function examined(Item, Player)
	if CanReceiveQuest(Player,AnAxesRevenge) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Keep the axe]")
    AddConversationOption(conversation, "[Toss the axe to the ground]", "QuestFinish")
    StartDialogConversation(conversation, 2, Item, Player, "This axe is familiar to you, but the orcish runes do not respond to your touch.")
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,AnAxesRevenge) then
    AddConversationOption(conversation, "[Run your fingers over the markings]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the axe away]", "CloseItemConversation")
if HasLanguage(Player, 17) then
    StartDialogConversation(conversation, 2, Item, Player, "This axe has orcish written across its surface. The markings look recent. You read \n\"Betrayed!\nThier blood will be mine.\n Revenge. Cleave. Restore Honor.\"")
else
    StartDialogConversation(conversation, 2, Item, Player, "This orcish looking axe has scratch marks along its face. The markings look recent.")
end
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,AnAxesRevenge) then
    AddConversationOption(conversation, "My rage calls for orc blood!", "Offer")
    end
    AddConversationOption(conversation, "[Put the axe away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Images flood your mind of an orc cast out of its clan, betrayed by those trusted for the sake of power. A sense of rage and injustice envelopes your thoughts.\n\nOne word drapes over all other thoughts,\"Revenge\".")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,AnAxesRevenge) then
    OfferQuest(nil,Player,AnAxesRevenge)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,1335) then
        RemoveItem(Player,1335,1)
    end
end