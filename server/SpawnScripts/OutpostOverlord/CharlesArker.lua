--[[
    Script Name    : SpawnScripts/OutpostOverlord/CharlesArker.lua
    Script Author  : Cynnar
    Script Date    : 2018.10.14 07:10:58
    Script Purpose : 
                   : 
--]]
function spawn (NPC)
         
end

function respawn (NPC)
         spawn(NPC)
end
function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
    if HasQuest (Spawn, InTheNameOfPrestige) == 4  then
     -- handing the quest
    SetStepComplete(Spawn, InTheNameOfPrestige, 4)
	else 
        PlayFlavor(NPC, "voiceover/english/tutorial_revamp/charles_arker/tutorial_island02_evil_revamp/quests/quest_charles_arker/charles_arker001.mp3", "", "nod", 2051119928, 4163051805, Spawn)
	AddConversationOption(conversation, "I don't talk to strangers.")
	AddConversationOption(conversation, "I'm not a recruit. I volunteered.", "Option1")
	StartConversation(conversation, NPC, Spawn, "You're that new recruit I keep hearing about. " .. GetName(Spawn) .. " , isn't it?")

	AddConversationOption(conversation, "Not all of them.")
	AddConversationOption(conversation, "Yes. This is the message I've managed to put together.", "dlg_1_2")
	StartConversation(conversation, NPC, Spawn, "Have you found more of the missing pieces?")
end

function dlg_1_2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
        
        PlayFlavor(NPC, "voiceover/english/tutorial_revamp/charles_arker/tutorial_island02_evil_revamp/quests/quest_charles_arker/charles_arker002.mp3", "", "", 1779982844, 2478664547, Spawn)
	AddConversationOption(conversation, "Not really.")
	AddConversationOption(conversation, "What kind of help do you need?", "dlg_1_3")
	StartConversation(conversation, NPC, Spawn, "Your reputation precedes you -- as will mine, someday soon.  When I return to Freeport, my prestige will bring honor to my family.  I came here to make a name for myself, but it's been difficult to stand out in the crowd.  I have a new assignment and it's puzzling me.  Would you help me unravel it?")
end

function dlg_1_3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()

        PlayFlavor(NPC, "voiceover/english/tutorial_revamp/charles_arker/tutorial_island02_evil_revamp/quests/quest_charles_arker/charles_arker003.mp3", "", "", 435953835, 2242560449, Spawn)
	AddConversationOption(conversation, "Certainly.", "questoffer")
	StartConversation(conversation, NPC, Spawn, "There's a lot of undercover work here, which means even if you do well, the higher-ups may not know it's you doing the work.  Some of my best work was claimed by someone else and I mean to fix that.  Not long ago, I intercepted part of a note one of the Tunarian spies was delivering.  They've hidden the remaining pieces.  We need to get them all back to learn more of what they're doing.")
end

function dlg_1_4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
        
        PlayFlavor(NPC, "voiceover/english/tutorial_revamp/charles_arker/tutorial_island02_evil_revamp/quests/quest_charles_arker/charles_arker004.mp3", "", "", 1870656524, 1643000002, Spawn)
	AddConversationOption(conversation, "I'll see what I can find out.", "dlg_1_5")
	StartConversation(conversation, NPC, Spawn, "I appreciate it, " .. GetName(Spawn) .. "  Whatever glory comes of this, we'll share in the credit.  I'm sure this will more than make up for the work I've done that others have taken credit for.")
end

function dlg_1_5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
        
        PlayFlavor(NPC, "voiceover/english/tutorial_revamp/charles_arker/tutorial_island02_evil_revamp/quests/quest_charles_arker/charles_arker021.mp3", "", "", 1916109124, 3504506765, Spawn)
	AddConversationOption(conversation, "I'll keep that in mind.")
	StartConversation(conversation, NPC, Spawn, "A word of warning: be wary of those wood elves.  They're more cunning than others may realize.")
end

function Option2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()

        PlayFlavor(NPC, "voiceover/english/tutorial_revamp/charles_arker/tutorial_island02_evil_revamp/quests/quest_charles_arker/charles_arker006.mp3", "", "", 2475145114, 3569833047, Spawn)
	AddConversationOption(conversation, "Not at the moment.")
	StartConversation(conversation, NPC, Spawn, "The Tunarian note is still incomplete, but this may be enough to advance our prestige, " .. GetName(Spawn) .. ". You know, you're very good at this kind of thing. Tell me, would you be interested in helping me on a more personal level?")
end

function questoffer(NPC, Spawn)
-- Gives a quest after some chat (dlg_1_1>dlg_1_2>dlg_1_3) 
FaceTarget(NPC, Spawn)
OfferQuest(NPC, Spawn, 489)
end

