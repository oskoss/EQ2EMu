local QUEST = 385


function examined(Item, Player)
    Dialog1(Item,Player)
end

function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,QUEST) then
    AddConversationOption(conversation, "[Try to pry the shiney object from the pincer.]", "Offer")
    end
    AddConversationOption(conversation, "[Put the twitching claw away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This crab claw twitches slightly. You notice something glint near the closed pincer...")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player, QUEST)
   then OfferQuest(NPC, Player, QUEST)
end
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "These crabs must die! I will slay them ALL!", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The claw spasms tightly on your finger! You wince at the pinch as you wrestle your hand free. You are seething with anger at this... this CRAB! Your throbbing finger will be avenged...")
    PlayFlavor(Player,"","","wince",0,0,Player)
end