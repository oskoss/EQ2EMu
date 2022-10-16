--[[
    Script Name    : ItemScripts/CastleviewHamletcitizenshiptask.lua
    Script Author  : Dorbin
    Script Date    : 2022.09.01 04:09:34
    Script Purpose : 
                   : 
--]]


function examined(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "[read more]","Dialog2")
StartDialogConversation(conversation, 2, Item, Player, "By order of the Circle of Five, all residents wishing to become a full member of the city must complete a trial to prove their worth.")

end


function Dialog2(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "[read about where tokens are found]","Dialog3")
StartDialogConversation(conversation, 2, Item, Player, "Tokens are scattered throughout the surrounding area. You must find five of these tokens to earn the right to speak to a city official.")
end

function Dialog4(Item, Player)
conversation = CreateConversation()
if not HasQuest(Player,5719) and not HasCompletedQuest(Player,5719)then
AddConversationOption(conversation, "[write this in your quest journal]","StartQuest")
end
if HasQuest(Player,5719) or  HasCompletedQuest(Player,5719) then
AddConversationOption(conversation, "[continue]","StartQuest")
end
AddConversationOption(conversation, "[put the note away]","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Castleview Hamlet residents must gather five tokens from the Oakmyst Forest.")
end

function StartQuest(Item,Player)
 if not HasQuest(Player,5719) and not HasCompletedQuest(Player,5719)then
   OfferQuest(Item,Player,5719)
end
conversation = CreateConversation()
AddConversationOption(conversation, "[put the note]","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "After you complete your task, report to Marshal Glorfel using the citizenship sign.")
end