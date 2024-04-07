--[[
    Script Name    : ItemScripts/afairyear.lua
    Script Author  : AussieGlen
    Script Date    : 2021.12.31 09:12:32
    Script Purpose : 
                   : 
--]]

local LoreAndLegendFairy = 5403

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendFairy) and not HasCompletedQuest(Player, LoreAndLegendFairy) then
    OfferQuest(nil, Player, LoreAndLegendFairy)
else
conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendFairy) and  GetQuestStepProgress(Player, LoreAndLegendFairy, 4)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the fairy. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,1638,1) then
    SetStepComplete(Player, LoreAndLegendFairy, 4)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1637)
end
end


function item_description(Item, Spawn)
    return "You have already examined this item."
end

