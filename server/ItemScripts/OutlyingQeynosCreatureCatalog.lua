--[[
    Script Name    : ItemScripts/OutlyingQeynosCreatureCatalog.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.09 08:09:58
    Script Purpose : 
                   : 
--]]
local Catalogue = 519

function examined(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page1")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Just beyond the city's walls one will find areas which are considered part of Qeynos and yet remain wild. Residents of Qeynos' villages are very familiar with these areas as they usually border on one or more of the residential neighborhoods. Though close to the city, they are by no means a walk in the park.")
end



function Page1(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page2")
AddConversationOption(conversation, "Turn back to previous section.","examined")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "One reason these areas are still wild is that they exist within steep embankments that make opening them to settlement impractical. The Bog in particular is an area where seasons of growth have compacted upon dense, moist soil and the scent of decay in that section would make living there disagreeable to say the least.")
end

function Page2(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page3")
AddConversationOption(conversation, "Turn back to previous section.","Page1")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "As these areas are close to Qeynos, they are quite temperate, though perhaps a little cooler due to the thickness of the vegetation. The caves are quite cool and in the past were a welcome Harvest diversion where folks could slip off for a quick swim after their chores were done.")
end

function Page3(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page4")
AddConversationOption(conversation, "Turn back to previous section.","Page2")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Without a doubt, the loveliest area is the Oakmyst Woods. This woodland preserve is shaded by emerald green broad-leaf trees such as oak and maple. Beneath the trees, the undergrowth is scattered with trillium, bleeding hearts and red-tipped paintbrushes. On the opposite end of the spectrum is the bog, with its greenish brown earth and fallen logs.")
end

function Page4(Item, Player)
conversation = CreateConversation()
if not HasQuest(Player,Catalogue) and not HasCompletedQuest(Player,Catalogue)then
AddConversationOption(conversation, "Record the depicted creatures in your journal.","QuestStart")
end
AddConversationOption(conversation, "Turn back to previous section.","Page3")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Perhaps it is the abundance of greenery that brings an increase in the number of fey beings to these areas near Qeynos. Amongst the usual scattering of insects and birds, one finds several fairies and sprites protecting their space, attacking all who venture too near. Additionally, the Ruins are home to some unfortunate folk who have not yet earned their eternal sleep.")
end



function QuestStart(Item,Player)
	    CloseItemConversation(Item,Player)
		OfferQuest(nil, Player, Catalogue)
end




