--[[
    Script Name    : ItemScripts/ashadowmanaspectofshadow.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2022.01.01 02:01:07
    Script Purpose : 
                   : 
--]]

local LoreAndLegendShadowman = 5409

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendShadowman) and not HasCompletedQuest(Player, LoreAndLegendShadowman) then
    OfferQuest(nil, Player, LoreAndLegendShadowman)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendShadowman) and  GetQuestStepProgress(Player, LoreAndLegendShadowman, 4)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the shadowman. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,2632,1) then
    SetStepComplete(Player, LoreAndLegendShadowman, 4)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 2632)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

