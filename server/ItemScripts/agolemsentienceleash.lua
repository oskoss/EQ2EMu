--[[
    Script Name    : ItemScripts/agolemsentienceleash.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2021.12.31 11:12:32
    Script Purpose : 
                   : 
--]]

local LoreAndLegendGolem = 5405

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendGolem) and not HasCompletedQuest(Player, LoreAndLegendGolem) then
    OfferQuest(nil, Player, LoreAndLegendGolem)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendGolem) and  GetQuestStepProgress(Player, LoreAndLegendGolem, 6)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the golem. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,1862,1) then
    SetStepComplete(Player, LoreAndLegendGhost, 6)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1862)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

