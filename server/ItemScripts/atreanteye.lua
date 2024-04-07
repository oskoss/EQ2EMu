--[[
    Script Name    : ItemScripts/atreanteye.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2021.12.31 09:12:03
    Script Purpose : 
                   : 
--]]

local LoreAndLegendTreant = 5401

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendTreant) and not HasCompletedQuest(Player, LoreAndLegendTreant) then
    OfferQuest(nil, Player, LoreAndLegendTreant)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendTreant) and  GetQuestStepProgress(Player, LoreAndLegendTreant, 5)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the goblin. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,3016,1) then
    SetStepComplete(Player, LoreAndLegendTreant, 5)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 3016)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

