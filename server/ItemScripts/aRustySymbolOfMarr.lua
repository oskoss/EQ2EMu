--[[
	Script Name	: ItemScripts/RustySymbolOfMarr.lua
	Script Purpose	: Offers quest "Rusty Symbol of Marr"
	Script Author	: premierio015\\Dorbin
	Script Date	    : 12.11.2020 \\ 11.14.2023
	Script Notes	:  
--]]


function examined(Item, Player)
    conversation = CreateConversation()
	if CanReceiveQuest(Player,RustySymbol) then
    AddConversationOption(conversation, "Someone of faith might want this.","Offer")
    end
    AddConversationOption(conversation, "[Put the symbol away]")
    StartDialogConversation(conversation, 2, Item, Player, "The metal medallion is very old and rusty but bears the symbol of Mithaniel Marr.")
end




function Offer(Item,Player)
    if CanReceiveQuest(Player,RustySymbol) then
    OfferQuest(nil,Player,RustySymbol)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,2555) then
        RemoveItem(Player,2555,1)
    end
end    
