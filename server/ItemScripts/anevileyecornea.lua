--[[
    Script Name    : ItemScripts/anevileyecornea.lua
    Script Author  : dorbin
    Script Date    : 2023.12.28 05:12:11
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
if  HasQuest(Player, LoreAndLegendEvileye) and  GetQuestStepProgress(Player, LoreAndLegendEvileye, 7)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the evil eye. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,3616,1) then
    SetStepComplete(Player, LoreAndLegendEvileye, 7)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 3616)
end
end
