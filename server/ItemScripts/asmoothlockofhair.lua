--[[
    Script Name    : ItemScripts/asmoothlockofhair.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.13 07:12:58
    Script Purpose : 
                   : 
--]]

local Quest = 5937


function examined(Item, Player)
	if CanReceiveQuest(Player,Quest) then
    Dialog1(Item,Player)
	end
end


function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,RewardForAMissingMusicBox) then
    AddConversationOption(conversation, "[Inspect the hair]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the lock of hair away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The hair feels silky smooth in your fingers. An odd sight considering the Giantslayers were holding on to it.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,Quest) then
    AddConversationOption(conversation, "Oh, this is going to be fun!", "Offer")
    end
    AddConversationOption(conversation, "[Put the hair away]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The smooth and silky hair has the faint smell of... fruit? No one around the Sprawl would have hair smelling THIS good. This must be from ... Qeynosians. They are up to something, and perhaps I can put them in their place!")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,Quest) then
    OfferQuest(nil,Player,Quest)
    end
    CloseItemConversation(Item,Player)
end
