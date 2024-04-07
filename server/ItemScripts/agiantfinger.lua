--[[
    Script Name    : ItemScripts/agiantfinger.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2021.12.31 08:12:47
    Script Purpose : 
                   : 
--]]

local LoreAndLegendGiant = 5400

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendGiant) and not HasCompletedQuest(Player, LoreAndLegendGiant) then
    OfferQuest(nil, Player, LoreAndLegendGiant)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendGiant) and  GetQuestStepProgress(Player, LoreAndLegendGiant, 5)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the giant. Do you wish to study it?")
    end
end


function Step_Complete(Item, Player)
if HasItem(Player,1771,1) then
    SetStepComplete(Player, LoreAndLegendGiant, 5)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1771)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

