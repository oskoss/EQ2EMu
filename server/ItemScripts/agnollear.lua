--[[
    Script Name    : ItemScripts/agnollear.lua
    Script Author  : AussieGlen\\Dorbin
    Script Date    : 2021.12.31 07:12:46
    Script Purpose : 
                   : 
--]]

local LoreAndLegendGnoll = 5398

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendGnoll) and not HasCompletedQuest(Player, LoreAndLegendGnoll) then
    OfferQuest(nil, Player, LoreAndLegendGnoll)
else
    conversation = CreateConversation()    
    if  HasQuest(Player, LoreAndLegendGnoll) and  GetQuestStepProgress(Player, LoreAndLegendGnoll, 8)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
    end
    AddConversationOption(conversation, "No, put it away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the gnoll. Do you wish to study it?")
end
   end

function Step_Complete(Item, Player)
if HasItem(Player,1817,1) then
    SetStepComplete(Player, LoreAndLegendGnoll, 8)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1817)
end
end


function item_description(Item, Spawn)
    return "You have already examined this item."
end

