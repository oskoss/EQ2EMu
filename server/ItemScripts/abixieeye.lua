--[[
    Script Name    : ItemScripts/abixieeye.lua
    Script Author  : AussieGlen
    Script Date    : 2022.01.01 04:01:36
    Script Purpose : 
                   : 
--]]

local LoreAndLegendBixie = 5410

function examined(Item, Player)
if not HasQuest(Player, LoreAndLegendBixie) and not HasCompletedQuest(Player, LoreAndLegendBixie) then
OfferQuest(nil, Player, LoreAndLegendBixie)
elseif not QuestStepIsComplete(Player, LoreAndLegendBixie, 4) then
conversation = CreateConversation()    
AddConversationOption(conversation, "Begin to study...", "Step_Complete")
AddConversationOption(conversation, "No, put away", "CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the bixie. Do you wish to study it?")
end
   end

function Step_Complete(Item, Player)
SetStepComplete(Player, LoreAndLegendBixie, 4)
RemoveItem(Player, 1219)
end


function item_description(Item, Spawn)
    return "You have already examined this item."
end

