--[[
    Script Name    : ItemScripts/anefreetibrokenshackle.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2022.01.01 09:01:42
    Script Purpose : 
                   : 
--]]

local LoreAndLegendEfreeti = 5416

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendEfreeti) and not HasCompletedQuest(Player, LoreAndLegendEfreeti) then
    OfferQuest(nil, Player, LoreAndLegendEvileye)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendEfreeti) and  GetQuestStepProgress(Player, LoreAndLegendEfreeti, 6)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the efreeti. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,3564,1) then
    SetStepComplete(Player, LoreAndLegendEfreeti, 6)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 3564)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end
