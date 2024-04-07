--[[
    Script Name    : ItemScripts/TheHistoryofFrogloks.lua
    Script Author  : neatz09
    Script Date    : 2023.11.23 04:11:44
    Script Purpose : Handles the study guide for the froglok quiz with euurp
                   : 
--]]

function examined(Item, Player)
    conversation = CreateConversation()
        AddConversationOption(conversation, "Read on", "Page2")
        AddConversationOption(conversation, "Close", "CloseItemConversation")
        StartDialogConversation(conversation, 2, Item, Player, "We are the children of Mithaniel Marr, god of valor. He has given unto us a greater share of honor than was given to any other creature. We would rather die with honor than extend our lives through deception of any kind.")
    end

function Page2(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page3")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "This can be challenging for others--the concept that laws are not meant for the breaking. While we try to be understanding that not everyone shares our belief, it is still distressing to see rules bent and broken. The laws of the land are not simply suggestions, as some seem to think.")
end

function Page3(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page4")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Such is the way of the troll. After many attempts to peacefully coexist with them in the Innothule Swamp, their utter disregard for protocol finally provoked us to battle. The blessing of Mithaniel Marr was with us as we drove them from their filthy city of Grobb. In His honor, we renamed it Gukta, Outpost of Marr.")
end

function Page4(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page5")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Some may wonder why we contented ourselves with a simple home like Gukta, when our obvious intelligence indicates we might prefer plush surroundings. That is not our way, you see. It seems those whose skin is laced with hair need warmth and softness in their surroundings. We are comforted in other ways.")
end

function Page5(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page6")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Others have said that we frogloks are too proud and that we deserve the challenges that have been our lot through the Ages. We do not deny the pride we feel in our heritage. We were created by Mithaniel Marr, after all. Through his grace, we have overcome many adversities that would have brought others to the brink of despair.")
end

function Page6(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page7")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "When the ogres of Rallos Zek began their reign of terror, they tried to start with Gukta. They thought they knew all the deepest reaches of our territory, thinking that we had not changed or developed it after wresting the city from the trolls. The ogres fought without honor, to their own detriment.")
end

function Page7(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page8")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "We are not taken unawares with ease. The foul ogres thought to destroy us, but we were guided by the Hand of Marr. Our eggs were carried deep into the tunnels, followed by elite forces to guard them. Deep beneath the marshes we went. We sent emissaries to Freeport to advise the Overlord of the rise of the Rallosians.")
end

function Page8(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page9")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The Overlord brushed our concerns aside and so, with barely three days' rest, our emissaries headed to Qeynos to warn the Bayles. Though sympathetic, they chose only to increase their watches rather than advancing to attack before the Rallosians expanded their reach. How we wished they had listened! The Rallosian Army grew in strength and power until the cities of Freeport and Qeynos were besieged.")
end

function Page9(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page10")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "The blessings of Mithaniel Marr still protected the faithful. The honorless ogres broke faith with their own allies, defiling the Temple of Cazic-Thule. And so, in the darkest hours when it appeared that the Rallosians would conquer all, the Green Mist covered the battlefields, slaying our enemies. However, not all our enemies were destroyed.")
end

function Page10(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page11")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Though many of our adversaries perished in the time of the Green Mist, some escaped by continuing to pursue us. Deeper into the marshes we fled, and still they followed. It was then that we felt the rage of the gods.")
end

function Page11(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page12")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "By failing to stand our ground and hold back the tide of the enemy, we disappointed the gods who had held us high in their trust and esteem. Punishment was both swift and severe.")
end

function Page12(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page13")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Though we had escaped the Rallosians, we could not escape the torments to follow. The Rending kept those of us who had scattered apart. Separated from any other honorable race, we drifted into oblivion.")
end

function Page13(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page14")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "And yet, oblivion would have been more kind than that which we endured. For those of us who found our way to the Feerrott were taken prisoner by the Tae'Ew, who fed us to their god.")
end

function Page14(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Read on", "Page15")
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "Generation upon generation of froglok has been subjugated by the Alliz Tae'Ew. They demanded service and, weakened by the calamities that had befallen us, we were in no position to rebel. Until now.")
end

function Page15(Item, Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Close", "CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "In secret, several of our strongest broke free and are repeating the journey made so long ago when we first sent word to Freeport and Qeynos that the Rallosians were on the move. Surely we have atoned for our offenses against the gods and will be saved.")
end