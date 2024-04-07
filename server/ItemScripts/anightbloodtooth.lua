--[[
    Script Name    : ItemScripts/anightbloodtooth.lua
    Script Author  : AussieGlen/Dorbin
    Script Date    : 2022.01.01 12:01:22
    Script Purpose : 
                   : 
--]]

local LoreAndLegendNightblood = 5406

function examined(Item, Player)
    local LnLAccept = GetRuleFlagFloat("R_World", "LoreAndLegendAccept")
if LnLAccept > 0 and not HasQuest(Player, LoreAndLegendNightblood) and not HasCompletedQuest(Player, LoreAndLegendNightblood) then
    OfferQuest(nil, Player, LoreAndLegendNightblood)
else
    conversation = CreateConversation()    
if  HasQuest(Player, LoreAndLegendNightblood) and  GetQuestStepProgress(Player, LoreAndLegendNightblood, 6)==0 then
    AddConversationOption(conversation, "Begin to study...", "Step_Complete")
end
    AddConversationOption(conversation, "No, put away", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This item can be used to learn the secrets of the nightblood. Do you wish to study it?")
  end
end

function Step_Complete(Item, Player)
if HasItem(Player,2338,1) then
    SetStepComplete(Player, LoreAndLegendNightblood, 6)
    CloseItemConversation(Item, Player)
    RemoveItem(Player, 2338)
end
end

function item_description(Item, Spawn)
    return "You have already examined this item."
end

