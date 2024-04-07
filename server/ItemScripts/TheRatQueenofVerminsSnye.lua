--[[
    Script Name    : ItemScripts/TheRatQueenofVerminsSnye.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.18 03:09:18
    Script Purpose : 
                   : 
--]]

local Quest = 5886

function examined(Item, Player)
Intro(Item,Player)
end

function Intro(Item,Player)
    conversation = CreateConversation()
    AddConversationOption(conversation, "Entry Two","Page2")
    if HasQuest(Player,Quest) then
    AddConversationOption(conversation, "Turn to last page","PageCheck")
    end
    AddConversationOption(conversation, "Close the book.","CloseItemConversation")
    StartDialogConversation(conversation, 2, Item, Player, "\"My Life,\" by Ayamia the Unfortunate, together with \"An Examination of the Rat Queen,\" by the Scholars' Institute for Change, a non-profit organization. Quotations are liberally taken from Ayamia's own volume, interspersed with logical explanations where necessary.")
end

function PageCheck(Item,Player)
    if GetQuestStep(Player,Quest) ==1 or GetQuestStep(Player,Quest) ==2 then
    Page1(Item, Player)
    elseif GetQuestStep(Player,Quest) ==3 or GetQuestStep(Player,Quest) == 4 then
    Page2(Item, Player)
    elseif GetQuestStep(Player,Quest) == 5 or GetQuestStep(Player,Quest) ==6 then       
    Page3(Item, Player)
    elseif GetQuestStep(Player,Quest) ==7 or GetQuestStep(Player,Quest) ==8 then       
    Page4(Item, Player)
    elseif GetQuestStep(Player,Quest) ==9 or GetQuestStep(Player,Quest) ==10 then
    Page5(Item, Player)
    elseif GetQuestStep(Player,Quest) ==11 or GetQuestStep(Player,Quest) ==12 then
    Page6(Item, Player)
    elseif GetQuestStep(Player,Quest) ==13 or GetQuestStep(Player,Quest) ==14 then
    Page7(Item, Player)
    elseif GetQuestStep(Player,Quest) ==15 or GetQuestStep(Player,Quest) ==16 then
    Page8(Item, Player)
    elseif GetQuestStep(Player,Quest) ==17 or GetQuestStep(Player,Quest) ==18 then
    Page9(Item, Player)
    end
end

function Page1(Item, Player)
    conversation = CreateConversation()
   if CanReceiveQuest(Player,Quest) then
    AddConversationOption(conversation, "Start looking for the missing pages","QuestStart")
    elseif GetQuestStep(Player,Quest) >=2 then 
    AddConversationOption(conversation, "Entry Two","Page2")
end
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Chapter One -- How I Came to Live in the Vermin's Snye.\" I've heard what some people say about me, and let me tell you straight away that it is not true. My husband abandoned me and I had no choice to but to find a place to live with my children. Our landlord, wretched human scum, turned us onto the streets! I am not as young as I once was, but I am resourceful. By living below, my children and I would be out of the elements. We could find a cozy place to call our own.")
end

function Page2(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==2 then
    SetStepComplete(Player,Quest,2)
end
if GetQuestStep(Player,Quest) >=4 then
AddConversationOption(conversation, "Entry Three","Page3")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page1")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Analysis of Chapter One.\" Clearly, the subject is in denial of her current status. Her husband is recorded as \"Lord Selien\" so obviously, the subject was a woman who lived in comfort. Her reference to being turned out of her home is correct, but only to the extent that her increasing madness led her to bring to her husband's home all manner of vile creatures, referring to them as her \"children.\" Upon her husband's death in battle, his family shunned the subject, which further isolated her, causing her to seek shelter elsewhere.")
end

function Page3(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==4 then
    SetStepComplete(Player,Quest,4)
end
if GetQuestStep(Player,Quest) >=6 then
AddConversationOption(conversation, "Entry Four","Page4")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page2")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Chapter Two -- My Children.\" I am blessed with seven sons, all in the peak of their strength and youth. The eldest is Varion. He looks remarkably like his dear, departed father. I wished to name all my sons in such a way that their names began with the same letter, but my husband forbade me. He relented when I became ill at the birth of our youngest, Voland. I am so blessed by Tunare! Seven sons! My only regret is that I have no daughters, but I am not complaining, for my sons will carry on the name of their father's house.")
end

function Page4(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==6 then
    SetStepComplete(Player,Quest,6)
end
if GetQuestStep(Player,Quest) >=8 then
AddConversationOption(conversation, "Entry Five","Page5")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page3")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Analysis of Chapter Two.\" Again, the subject tells some of the truth. She did indeed bear seven sons, the first and last of which are named as indicated. And, she did fall ill upon the birth of her final son, rendering her unable to have other children. The subject lay ill for nearly a year, during which time her sons were raised by her sister. When she regained her health, the subject had her sister arrested and executed for treason before she resumed her motherly duties.")
end

function Page5(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==8 then
    SetStepComplete(Player,Quest,8)
end
if GetQuestStep(Player,Quest) >=10 then
AddConversationOption(conversation, "Entry Six","Page6")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page4")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Chapter Three -- A Time of Hardship.\" Our move to the catacombs was not without its troubles, of course. My children needed me more than ever, clinging to me in the seemingly perpetual darkness beneath the city streets. We found that the crews who maintained the drains kept piles of fuel to use in the sconces set into the walls. I learned to borrow a bit of their fire to start my own. My eldest found the place I now call home by turning down a little-used side passage. The way is patrolled by roving gangs of thugs, but they left me alone. After all, I am guarded by my seven strong sons!")
end

function Page6(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==10 then
    SetStepComplete(Player,Quest,10)
end
if GetQuestStep(Player,Quest) >=12 then
AddConversationOption(conversation, "Entry Seven","Page7")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page5")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Analysis of Chapter Three.\" Again, the subject shows her inability to separate fact from fiction. Her eldest son would not have been able to find her living area as he, together with all his brothers, perished at sea. This occurred during the Shattering, when many travellers perished. In this case, the subject had sent her sons on an errand, the nature of which has never been determined. It is generally believed that the magnitude of the loss, both personally and throughout Norrath, coupled with the knowledge that she sent them on this journey, unhinged her mind.")
end

function Page7(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==12 then
    SetStepComplete(Player,Quest,12)
end
if GetQuestStep(Player,Quest) >=14 then
AddConversationOption(conversation, "Entry Eight","Page8")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page6")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Chapter Four -- The Days Grow Long.\" We are comfortable here, for the most part. I find that the days are sometimes long, but one of the boys will entertain me. Asrey, my middle boy, will recite tales of the distant past. I believe he will grow up to be a bard! His voice is clear and true. He loves to stand in the chambers where the ceilings are highest and sing, listening to his own voice echo. He is a good lad, as are all my sons, and I am grateful for their company.")
end

function Page8(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==14 then
    SetStepComplete(Player,Quest,14)
end
if GetQuestStep(Player,Quest) >=16 then
AddConversationOption(conversation, "Entry Nine","Page9")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page7")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Analysis of Chapter Four.\" The subject's thrid son, Asrey, did have a legendary voice, even in his youth. He was often called upon to sing before the Bayle family. At the conclusion of one of these events, Lady Larinna Bayle presented him with an engraved flute. The flute was lost at sea with Asrey and his brothers. It is interesting to note that the subject retains excellent memories of the details of her children's lives, but has blocked out the single largest event that befell them -- their own deaths.")
end

function Page9(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==16 then
    SetStepComplete(Player,Quest,16)
end
if GetQuestStep(Player,Quest) >=18 then
AddConversationOption(conversation, "Entry Ten","Page8")
end
AddConversationOption(conversation, "Turn back to previous entry.","Page8")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Chapter Five -- A New Beginning.\" I've given up some of the fancy work I used to do before. Now that I must scrape by, I can no longer spend time weaving lace or painting miniatures. I have painted several portraits of my sons, however, that I am quite proud of. They are endlessly fascinating to me. I know it is sometimes difficult for them to live in this place, yet they do not complain. When they wander too far, I miss them terribly. Is that so wrong for a mother? After all, nothing is stronger than a mother\'s love.")
end

function Page10(Item, Player)
conversation = CreateConversation()
if GetQuestStep(Player,Quest)==18 then
    SetStepComplete(Player,Quest,18)
end
AddConversationOption(conversation, "Turn back to previous entry.","Page9")
AddConversationOption(conversation, "Close the book.","CloseItemConversation")
StartDialogConversation(conversation, 2, Item, Player, "\"Analysis of Chapter Five.\" We were unable to determine where the subject's portraits have gone, if indeed she painted any at all. There is no record of her having been interested in miniature painting prior to her exile to the Vermin's Snye. Some of the lace she created was, however, on display at the Museum of Fine Arts until it was stolen by vandals that tied the bits to some of the rats the subject called \"her children\" before setting them afire. The subject became agitated and defended the rats, thus earning her title of \"Rat Queen.\"")
end


function QuestStart(Item,Player)
	    CloseItemConversation(Item,Player)
		OfferQuest(nil, Player, Quest)
end
