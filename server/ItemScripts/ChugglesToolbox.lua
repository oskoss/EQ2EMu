--[[
    Script Name    : ItemScripts/ChugglesToolbox.lua
    Script Author  : Premierio015
    Script Date    : 2021.06.29 09:06:59
    Script Purpose : 
                   : 
--]]

local ChugglesToolbox = 483

--
function examined(Item, Player)
if not HasQuest(Player, ChugglesToolbox) and not HasCompletedQuest(Player, ChugglesToolbox) then
OfferQuest(nil, Player, ChugglesToolbox)
end
   end


local ChugglesToolbox = 483


function examined(Item, Player)
	if CanReceiveQuest(Player,ChugglesToolbox) then
    Dialog1(Item,Player)
    else
    conversation = CreateConversation()
    AddConversationOption(conversation, "[Put the toolbox away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This toolbox is similar to one you've found before. You can't fathom a need for it, but someone else might be able to use it.")
	end
end

function Dialog1(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,ChugglesToolbox) then
    AddConversationOption(conversation, "[Inspect the toolbox.]", "Dialog2")
    end
    AddConversationOption(conversation, "[Put the toolbox away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This box feels lighter than you expected.")
end

function Dialog2(Item,Player)
    conversation = CreateConversation()
    if CanReceiveQuest(Player,ChugglesToolbox) then
    AddConversationOption(conversation, "[Write the list in your journal.]", "Offer")
    end
    AddConversationOption(conversation, "[Put the toolbox away.]", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The words \"Chuggle of Temple Street\" are inscribed on a plate on top of the lid. The box is empty except for a handwritten note stuck to the inside of the box's top; the note lists the tools that once belonged in the box, and who among the denizens of Thieves' Way they were allocated to.")
end

function Offer(Item,Player)
    if CanReceiveQuest(Player,ChugglesToolbox) then
    OfferQuest(nil,Player,ChugglesToolbox)
    end
    CloseItemConversation(Item,Player)
end



function QuestFinish(Item,Player)
    CloseItemConversation(Item,Player)
    if HasItem(Player,5014) then
        RemoveItem(Player,5014,1)
    end
end