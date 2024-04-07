--[[
    Script Name    : ItemScripts/acentaureye.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2021.12.31 07:12:53
    Script Purpose : 
                   : 
--]]

local LoreAndLegendCentaur = 5399

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendCentaur) and not HasCompletedQuest(Player, LoreAndLegendCentaur) then
    OfferQuest(nil, Player, LoreAndLegendCentaur)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendCentaur) and  GetQuestStepProgress(Player, LoreAndLegendCentaur, 5)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the centaur. Do you wish to study it?")
   end
end

function Step_Complete(Item, Player)
if HasItem(Player,1339,1) then
    SetStepComplete(Player, LoreAndLegendCentaur, 5)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1339)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

