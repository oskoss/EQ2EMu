--[[
    Script Name    : ItemScripts/agoblinspine.lua
    Script Author  : AussieGlen
    Script Date    : 2021.12.27 05:12:56
    Script Purpose : 
                   : 
--]]

local LoreAndLegendGoblin = 5394

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendGoblin) and not HasCompletedQuest(Player, LoreAndLegendGoblin) then
    OfferQuest(nil, Player, LoreAndLegendGoblin)
else
    conversation = CreateConversation()    
    if HasQuest(Player, LoreAndLegendGoblin) and  GetQuestStepProgress(Player, LoreAndLegendGoblin, 7)==0  then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
    end
    AddConversationOption(conversation, "No, put it away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the goblin. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,1838,1) then
    SetStepComplete(Player, LoreAndLegendGoblin, 7)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1838)
end
end


function item_description(Item, Spawn)
    return "You have already examined this item."
end
