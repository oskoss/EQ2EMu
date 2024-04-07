--[[
    Script Name    : ItemScripts/anevileyeenchantment.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2022.01.01 01:01:01
    Script Purpose : 
                   : 
--]]

local LoreAndLegendEvileye = 5408

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendEvileye) and not HasCompletedQuest(Player, LoreAndLegendEvileye) then
    OfferQuest(nil, Player, LoreAndLegendEvileye)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendEvileye) and  GetQuestStepProgress(Player, LoreAndLegendEvileye, 5)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the evil eye. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,3617,1) then
    SetStepComplete(Player, LoreAndLegendEvileye, 5)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 3617)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

