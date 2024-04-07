--[[
    Script Name    : ItemScripts/AntonicaCreatureCatalogComplete.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.15 04:09:53
    Script Purpose : 
                   : 
--]]

function examined(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page1")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Before the Rending, Antonica was the name of a very large continent that included the cities of Qeynos, Freeport, Halas, Rivervale, Highhold, Oggok and Gukta. Since the cataclysms that changed the lands, the name \"Antonica\" refers only to the western half of the continent of Karan. Its major city is Qeynos, which is located on Antonica's western coast.")
end



function Page1(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page2")
AddConversationOption(conversation, "Turn back to previous section.","examined")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Antonica is the western half of the continent of Karan. It is surrounded by the ColdwindCoast on its north, west and southwestern edges. To the southeast, the PhantomMountains separate Antonica from the Thundering Steppes. Travel through the PhantomMountains is difficult. One can take advantage of Blind Man's Pass which is under the protection of the Qeynos Guard, however the lands surrounding the Pass are inhospitable.")
end

function Page2(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page3")
AddConversationOption(conversation, "Turn back to previous section.","Page1")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "The climate of Antonica is temperate, with cool nights and comfortable days. The winds are generally from the west during the days, bringing sea breezes from across the ColdwindCoast. In the evenings, the wind flows from the east down the slopes of the Phantom Mountains. When the winds are reversed, the air is drier during the day but not uncomfortably so. Rains are generally mild during Growth and Harvest seasons. Overnight frosts are common during Decay, but melt away with the sunrise.")
end

function Page3(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn to the next section.","Page4")
AddConversationOption(conversation, "Turn back to previous section.","Page2")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "As the temperatures are so temperate, Antonica has a good season of Growth. The fertile lands contain scattered farms with pastures and fields. Trees are mainly deciduous oaks and maples in the valleys, while the hills are crowned by coniferous pines. Beneath the shade of the trees one can find flowers such as violets, Tunare's breath and dwarf-bearded iris. At night, one might be fortunate enough to find the rare night blooming gnoll's bane.")
end

function Page4(Item, Player)
conversation = CreateConversation()
AddConversationOption(conversation, "Turn back to previous section.","Page3")
AddConversationOption(conversation, "Put the catalogue away.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "Gnolls are the most obvious creature throughout Antonica. Various clans stake out territories for themselves and attempt to establish themselves as the major player in the region. Non-sentient creatures scattered through the green hills include timber wolves, badgers, bears, and klicnik beetles. Bats are known to wander near old ruined structures or amongst the trees. The ColdwindCoast around Antonica abounds with sea life as well, including crabs, pikes and lurkers.")
end








