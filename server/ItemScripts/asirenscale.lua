--[[
    Script Name    : ItemScripts/asirenscale.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2022.01.01 12:01:33
    Script Purpose : 
                   : 
--]]

local LoreAndLegendSiren = 5407

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendSiren) and not HasCompletedQuest(Player, LoreAndLegendSiren) then
    OfferQuest(nil, Player, LoreAndLegendSiren)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendSiren) and  GetQuestStepProgress(Player, LoreAndLegendSiren, 6)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the siren. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,2717,1) then
    SetStepComplete(Player, LoreAndLegendSiren, 6)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 2717)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

