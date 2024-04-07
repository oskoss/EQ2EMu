--[[
    Script Name    : ItemScripts/burnedoutlightstone.lua
    Script Author  : Premierio015
    Script Date    : 2021.05.30 09:05:28
    Script Purpose : 
                   : 
--]]

local TheReturnOfTheLight = 485
--
function examined(Item, Player)
if not HasQuest(Player,  TheReturnOfTheLight) and not HasCompletedQuest(Player,  TheReturnOfTheLight) then
     conversation = CreateConversation()
   if CanReceiveQuest(Player,TheReturnOfTheLight) then
    AddConversationOption(conversation, "I should look into this...", "Offer")
    end
    AddConversationOption(conversation, "[Put the stope away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The lightstone seems very different from the ones typically found in the Commonlands.  This one is of much higher quality and density compared to your typical lightstone.  Maybe someone would find this particular stone to be worth something.")
    end
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,TheReturnOfTheLight) then
    OfferQuest(nil, Player,  TheReturnOfTheLight)
    end
    CloseItemConversation(Item,Player)
end
