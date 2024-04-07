--[[
    Script Name    : ItemScripts/adecomposingzombieorgan.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2021.12.31 06:12:28
    Script Purpose : 
                   : 
--]]

local LoreAndLegendZombie = 5397

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendZombie) and not HasCompletedQuest(Player, LoreAndLegendZombie) then
    OfferQuest(nil, Player, LoreAndLegendZombie)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendZombie) and  GetQuestStepProgress(Player, LoreAndLegendZombie, 7)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
   AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the zombie. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,1553,1) then
    SetStepComplete(Player, LoreAndLegendZombie, 7)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 1553)
end
end


function item_description(Item, Spawn)
    return "You have already examined this item."
end

