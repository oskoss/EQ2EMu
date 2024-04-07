--[[
    Script Name    : ItemScripts/alizardmanscale.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2022.01.01 04:01:23
    Script Purpose : 
                   : 
--]]

local LoreAndLegendLizardman = 5412

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendLizardman) and not HasCompletedQuest(Player, LoreAndLegendLizardman) then
    OfferQuest(nil, Player, LoreAndLegendLizardman)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendLizardman) and  GetQuestStepProgress(Player, LoreAndLegendLizardman, 5)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the lizardman. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,2028,1) then
    SetStepComplete(Player, LoreAndLegendLizardman, 5)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 2028)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

