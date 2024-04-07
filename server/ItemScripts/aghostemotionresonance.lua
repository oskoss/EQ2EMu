--[[
    Script Name    : ItemScripts/aghostemotionresonance.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2021.12.31 11:12:55
    Script Purpose : 
                   : 
--]]

local LoreAndLegendGhost = 5404

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendGhost) and not HasCompletedQuest(Player, LoreAndLegendGhost) then
    OfferQuest(nil, Player, LoreAndLegendGhost)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendGhost) and  GetQuestStepProgress(Player, LoreAndLegendGhost, 8)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the ghost. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,1763,1) then
    SetStepComplete(Player, LoreAndLegendGhost, 8)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1763)
end
end


function item_description(Item, Spawn)
    return "You have already examined this item."
end

