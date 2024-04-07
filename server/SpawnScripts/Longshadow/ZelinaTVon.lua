--[[
	Script Name		: SpawnScripts/LongshadowAlley/ZelinaTVon.lua
	Script Purpose	: Zelina T`Von
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"

local ASpecialPerfume = 5672
local ForThatSpecialSomeone = 5673

function spawn(NPC)
    ProvidesQuest(NPC, ASpecialPerfume)
    ProvidesQuest(NPC, ForThatSpecialSomeone)
	SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")
    SetInfoStructString(NPC, "action_state", "tapfoot")
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else
if CanReceiveQuest(Spawn, ASpecialPerfume) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, ASpecialPerfume) and GetQuestStep(Spawn,ASpecialPerfume)==1 then  
    Dialog2(NPC,Spawn)
elseif HasQuest(Spawn, ASpecialPerfume) and GetQuestStep(Spawn,ASpecialPerfume)==2 then  
    Dialog2a(NPC,Spawn)
elseif CanReceiveQuest(Spawn, ForThatSpecialSomeone) then  
    Dialog3 (NPC,Spawn)
elseif HasQuest(Spawn, ForThatSpecialSomeone)  then  
    Dialog4 (NPC,Spawn)
else     
    Dialog1(NPC,Spawn)
   end
end
end

function InRange(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","threaten",0,0, Spawn)
else    
    if not HasCompletedQuest(Spawn, ASpecialPerfume) and not HasQuest(Spawn, ASpecialPerfume) then
        if MakeRandomInt(0, 100) <= 80 then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "", "That no-good, two-timing, imp ... I'll teach him to stare at that trollop! ...What? What do you want, you babbling fool?", "grumble", 0, 0, Spawn, 0)
        end
    elseif HasCompletedQuest(Spawn, ASpecialPerfume) and not CanReceiveQuest(Spawn, ForThatSpecialSomeone) then
        if MakeRandomInt(0, 100) <= 85 then
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "", "He is impossible! Why wouldn't he just... well, if he won't I'll make sure his eyes never shy away again!... You! Come here and speak with me again. I'll make it worth your while.", "pout", 0, 0, Spawn, 0)
        end
    end
end
end


function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("You ... you have nothing to offer me! Be gone!")
	Dialog.AddVoiceover("voiceover/english/jezrina/fprt_hood02/20_streetfortuneteller_multhail1_569fa693.mp3", 424612651, 2476002427)
    if CanReceiveQuest(Spawn, ASpecialPerfume) then 
    Dialog.AddOption("You seem preoccupied. Perhaps I can do something for you for a few coins?","Dialog1a")
    end
    Dialog.AddOption("I didn't want to be here anyway!")
	Dialog.Start()
end


function Dialog1a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Do you always pry into people's business?! Can't you see I'm busy planning my next move against my love?!... UGH! He is obviously seeing someone else... Inexcusable!")
 	PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
    Dialog.AddOption("Look, I want work and you are OBVIOUSLY needing something. Tell me what he did.","Dialog1b")
    Dialog.AddOption("With that, I'm done. Good luck with... whatever.")
	Dialog.Start()
end

function Dialog1b(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
	Dialog.AddDialog("He promised he was going to make me dinner that night and I sent him a fine bottle of wine, to which I got a message back saying he was \"battling a horde.\"  You and I both know that he was with someone else.  You know what I want?")
    Dialog.AddOption("Sounds like a lie!... But what does that have to do with me?","Dialog1c")
    Dialog.AddOption("Perhaps you're reading too much into it.")
	Dialog.Start()
end

function Dialog1c(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm trying to make myself more attractive to my mate. Lately, he has his eye on a certain huss ... er ... courtesan. He likes a wine with a sharp head, so I thought I could make a perfume that smells exactly like this wine. Would you be a dear and gather scent glands from some squalid vermin for my perfume?")
    if CanReceiveQuest(Spawn, ASpecialPerfume) then 
    Dialog.AddOption("I won't ask why a scent gland, but I can get one if the price is right.","Offer1")
    end
    Dialog.AddOption("No ammount of perfume will help you. Sorry.")
	Dialog.Start()
end

function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, ASpecialPerfume)
end




function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, ForThatSpecialSomeone)
end

function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("I see you don't have the scent glands for my \"perfume.\" What's the problem?")
    Dialog.AddOption("I'm still working on it!")
	Dialog.Start()
end

function Dialog2a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stinky", 0, 0, Spawn)
	Dialog.AddDialog("That scent... You have it! Give the gland now before it loses anymore potency!")
    Dialog.AddOption("Please do. They are plenty potent.","Dialog2b")
	Dialog.Start()
end

function Dialog2b(NPC,Spawn)
    SetStepComplete(Spawn, ASpecialPerfume, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn)
	Dialog.AddDialog("Let me have them. Yes, indeed ... he'll never know the difference. These are perfect! Now, I need to distill the slow-acting toxins from the rest of the juices -- so it's not harmful, of course. Thank you so much, my dear friend. Here are the coins I promised you earlier. Now leave me as I concoct this ... perfume.")
    Dialog.AddOption("We'll see about that, Zelina.")
	Dialog.Start()
end


function Dialog3(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
	Dialog.AddDialog("I'll never understand why a lover's eyes can wander. Imagine how effective removing them would be?")
    if CanReceiveQuest(Spawn,ForThatSpecialSomeone) then
    Dialog.AddOption("Did the perfume work like you expected?","Dialog3a")
    end
    Dialog.AddOption("I prefer eyes staying attached, thank you...")
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
	Dialog.AddDialog("I - uh - used it, but he hasn't - uh - noticed it yet. I want to give him a bottle of wine, so he thinks of me when he smells the perfume. Perhaps you'll help me again?")
    Dialog.AddOption("Perhaps, what are you talking about?","Offer2")
    Dialog.AddOption("Oh, no. I've had enough from you.")
	Dialog.Start()
end



function Dialog4(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "scheme", 0, 0, Spawn)
	Dialog.AddDialog("And? Has he taken my gift? Have you done it yet?")
    if GetQuestStep(Spawn,ForThatSpecialSomeone) ==2 then
    Dialog.AddOption("Your husband liked it and will thank you later tonight.","Dialog4a")
    else
    Dialog.AddOption("...Not yet. Soon.")
    end
	Dialog.Start()
end

function Dialog4a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "cackle", 0, 0, Spawn)
	Dialog.AddDialog("My husband? He's not my husband! That poisoned wine will show him what happens when he takes another mistress! I'll enjoy hearing his hacking coughs as the toxin slowly eats away his internal organs. Hahahahaha...")
    Dialog.AddOption("You gave him poisoned wine?!?","Dialog4b")
	Dialog.Start()
end


function Dialog4b(NPC,Spawn)
    SetStepComplete(Spawn, ForThatSpecialSomeone, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "chuckle", 0, 0, Spawn)
	Dialog.AddDialog("Well, of course! One must learn that I am not to be trifled with. Show me that sort of disrespect and you're body parts might just start falling off. A price to pay for loyalty, wouldn't you say? Speaking of price, here - I've got some wine from other suitors that are most likley safe. Please, take them. I insist.")
    Dialog.AddOption("Thank you... I'll be sure to stay out of your way from now on.")
	Dialog.Start()
end





--I'm trying to make myself more attractive to my mate. Lately, he has his eye on a certain huss ... er ... courtesan. He likes a wine with a sharp head, so I thought I could make a perfume that smells exactly like this wine. Would you be a dear and gather scent glands from some squalid vermin for my perfume?
--We'll see about that, Zelina.

--Let me have them. Yes, indeed ... he'll never know the difference. These are perfect! Now, I need to distill the slow-acting toxins from the rest of the juices -- so it's not harmful, of course. Thank you so much, my dear friend. Here are the coins I promised you earlier. Now leave me as I concoct this ... perfume.

--Did the perfume work like you expected?
--I see you don't have the scent glands for my "perfume." What's the problem?

--I - uh - used it, but he hasn't - uh - noticed it yet. I want to give him a bottle of wine, so he thinks of me when he smells the perfume. Perhaps you'll help me again?

--He promised he was going to make me dinner that night and I sent him a fine bottle of wine, to which I got a message back saying he was "battling a horde."  You and I both know that he was with someone else.  You know what I want?
--My partner is the banker for this horrid district, so you should find him at the bank--unless he's with that tram ... trainee, I mean. Give him this wine, and tell him I hope he enjoys it. When you return, I'll give you some coin.

--Your husband liked it and will thank you later tonight.
--My husband? He's not my husband! That poisoned wine will show him what happens when he takes another mistress! I'll enjoy hearing his hacking coughs as the toxin slowly eats away his internal organs. Hahahahaha...
--You gave him poisoned wine?!?