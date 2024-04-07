--[[
    Script Name    : ItemScripts/anelementalbindingrune.lua
    Script Author  : dorbin
    Script Date    : 2023.12.27 06:12:25
    Script Purpose : 
                   : 
--]]
local LoreAndLegendElemental = 5402

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendElemental) and not HasCompletedQuest(Player, LoreAndLegendElemental) then
    OfferQuest(nil, Player, LoreAndLegendElemental)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendElemental) and  GetQuestStepProgress(Player, LoreAndLegendElemental, 6)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of elementals. Do you wish to study it?")
    end
end

function Step_Complete(Item, Player)
if HasItem(Player,3572,1) then
    SetStepComplete(Player, LoreAndLegendElemental,6)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 3572)
end
end