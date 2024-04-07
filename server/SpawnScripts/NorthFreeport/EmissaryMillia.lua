--[[
    Script Name    : SpawnScripts/NorthFreeport/EmissaryMillia.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.06 05:10:10
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"
local Quest1 = 5910
local Bard = 5911
local Predator = 5912
local Rogue = 5913

function spawn(NPC)
    ProvidesQuest(NPC, Quest1)
    ProvidesQuest(NPC, Bard)
    ProvidesQuest(NPC, Predator)
    ProvidesQuest(NPC, Rogue)
end

function hailed(NPC, Spawn)
    local int = MakeRandomInt(1,3)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Are you certain you wish to speak to me? One of the Overlord's eyes? If you're not careful, you may find your coin pouch a bit lighter... in the name of the Overlord, of course.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..int.."_1043.mp3", 0, 0)
    PlayFlavor(NPC,"","","sniff",0,0,Spawn)
    if GetClass(Spawn)== 31 and GetLevel(Spawn)>=7 and not HasQuest(Spawn,Quest1) and not HasCompletedQuest(Spawn,Quest1) then
    Dialog.AddOption("I'd like to add to my repertoire of tricks. Maybe you're the one who could show me?","Dialog1")	
    end
    if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1)==2 then 
    Dialog.AddOption("I've cleared out some of the rust monsters. The sticky situation has been dealt with.","Dialog2")	
    end
    if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1)==5 then 
    Dialog.AddOption("The other bartender wasn't paying attention to his money. Here's a gold coin I swiped right from underneath his nose... I got this for you as proof.","Dialog3")	
    end
     if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1)==7 then 
    Dialog.AddOption("I was more than willing to slay the Darkblades on your behalf.","Dialog4")	
    end   
   
    if HasCompletedQuest(Spawn,Quest1) and not HasQuest(Spawn,Bard) and not HasQuest(Spawn,Rogue) and not HasQuest(Spawn,Predator) and GetClass(Spawn)==31 and GetLevel(Spawn) >= 9 then
    Dialog.AddOption("I think I understand what you're saying.  Sooo... what should I do now??","Decide")	
    end       
    if HasQuest(Spawn,Rogue) and GetQuestStep(Spawn,Rogue)==2 then 
    Dialog.AddOption("I managed to grab the lieutenant's orders out from under the watchful eye of the Qeynos guard.  I'm sure they'll be put through some rigorous training after this to help them keep a sharper eye out in the future, but that's not my concern now!","RogueDone")	
    end 
--[[    if not HasCompletedQuest(Spawn, Rogue) and not HasCompletedQuest(Spawn, Predator) and not HasCompletedQuest(Spawn, Bard) then
    Dialog.AddOption("I've got more important things to do than watch people. Good day.")
    else
    Dialog.AddOption("Never a dull moment with you, Counselor. Good to see you again.","RogueDone2")
    end]]--
	Dialog.AddOption("My coins are my business! I'm out of here.")
	Dialog.Start()
end


function Dialog1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Shifty eyes, spry fingers... yes... Yes!... Perhaps?... You... that ODER! Bleh!! Did you just come off a boat?! I've been looking to add some new skilled blood into the mix, but you still have sea water coming out of your ears! Do you think you can stomach some scouting tricks?")
    PlayFlavor(NPC, "", "", "stinky", 0, 0, Spawn)
    Dialog.AddOption("I bet I could run circles around you! Give me a challenge!","Quest1Offer")	
    Dialog.AddOption("I'm still pouring water out of my shoes! Perhaps another time.")	
	Dialog.Start()
end



function Quest1Offer(NPC,Spawn)
    FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Quest1)
end

function respawn(NPC)
	spawn(NPC)
end

function Dialog2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Anyone can defeat a mighty adversary in battle, but being remembered for it is an entirely different matter.  A bard regales others with tales of the past through their melodies and stories.  The bard who writes the past is the same one who guides the future.  And don't forget all the attention you get, too!  That's my favorite part!")
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("That sounds easy! I'll wrap this up quick.","Dialog2a")	
	Dialog.Start()
end

function Dialog2a(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Famous last words.  You're young so I'm gonna give ya a break.  A rogue is somethin' everyone needs.  We are the ones who pick the locks, opening vast treasure chests or hallways that would otherwise go unexplored.  Thieves are rogues that concentrate on their physical prowess.  They can backstab or wield weapons effectively, and can sneak around things others might find impassable.  Bards are rogues as well, but they concentrate on performing inspirational poems and songs to inspire themselves, and cause their enemies to despair.")
    PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    Dialog.AddOption("Writting a song? What must I do?","Dialog2b")	
	Dialog.Start()
end

function Dialog2b(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I want you to go to a few of the taverns around the city and charm the patrons with your beautiful voice.  Heheheee... You do have one, don't you?  Go visit these two taverns and convince the bartenders that you're the life of the party. I don't care how you embarrass yourself -- sing a ballad, dance a jig -- just make them think you're an idiot. And if you don't, then no more tricks from me, got it?")
    PlayFlavor(NPC, "", "", "giggle", 0, 0, Spawn)
    Dialog.AddOption("Of course! I'll bring the tavern down.","Leg")	
    Dialog.AddOption("I suppose I can improvise.","Leg")	
    Dialog.AddOption("Uhh... wish me luck?","Leg")	
	Dialog.Start()
end

function Leg(NPC,Spawn)
    SetStepComplete(Spawn,Quest1,2)
    PlayFlavor(NPC, "", "Break a leg!... Just don't break anyone's I know.", "wink", 0, 0, Spawn)
    FaceTarget(NPC, Spawn)
end



function Dialog3(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I'll take your word that you stole this from him. Well, since you pulled off the other tricks, I guess I teach you a few more. Instead of being a freelance rogue or a deceptive bard, you can also ply your trade as a hunter or a predator. After I show you the tricks they use, maybe you decide what kind of scout you wants to be.")
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("What should I know about predators?","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Predators are only happy when they are pursuing their quarry. Once they catch what they're tracking, well, the game's over, so they say.  Therefore, a smart predator always finds something else to hunt down.  If you've got a big imagination, then being a predator might be for you.")
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("[Continue]","Dialog3b")
	Dialog.Start()
end

function Dialog3b(NPC,Spawn)
    SetStepComplete(Spawn,Quest1,5)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Predators stay in the shadows; they know that the best way to defeat an enemy is to sneak up on it and slit its throat! You can practice skulking by heading down into the sewer and looking for your competitors - the ones called the Darkblade Scouts. Hunt down some of these creatures and dispose of them before they even see you.  ")
    Dialog.AddOption("Alright. They won't know what hit them.")
	Dialog.Start()
end

function Dialog4(NPC,Spawn)
    SetStepComplete(Spawn,Quest1,7)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Yes. yes. The Overlord will certainly be pleased to have a few less annoyances. Hopefully the hunt proved insightful enough to help you decide your next steps... A tavern will only take you so far.")
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("I could go for a drink right about now.","Decide")
    Dialog.AddOption("A lie down sounds pretty nice right about now.","Decide")
    Dialog.AddOption("Perhaps. I'd rather go make a bit of coin anyway.","Decide")
	Dialog.Start()
end


function Decide(NPC,Spawn)
    if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1) ==7 then
        SetStepComplete(Spawn,Quest1,7)
    end
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I didn't teach you the tricks of the trade just so you could waste my time! Choose a scouting technique and start practicing! Scouts are a silver a dozen around here. Some people with less class might even call them thieves. Is this what you want to be? A common thief?  No! No! I think you know what you want to be.  Am I right?")
    PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
    Dialog.AddOption("Thief is such a vulgar word. I think the term rogue is more to my liking.","Rogue2")	
    Dialog.AddOption("I feel the bard's art of deception through entertainment is in my future.","Bard1")	
    Dialog.AddOption("I confess - I enjoyed stalking my prey... a little too much, perhaps. I'm a predator at heart.","Predator1")	
	Dialog.Start()
end


--ROGUE CLASS
function Rogue1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("One does not choose to be a rogue, but rather life makes that choice for them. Rogues live lives free of the bonds that society places on others. Tricky little fellows, rogues are always around when you need them.  Look behind you and you just might find one... So, is this where you will focus your talents?")
    PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
    Dialog.AddOption("I'm pretty certain the life of a rogue will be quite... rewarding.  Yes, I'm a rogue.","Rogue2")	
    Dialog.AddOption("I'm not too sure anymore.  Do you advise I specialize somewhere else?","Decide")	
	Dialog.Start()
end

function Rogue2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Ahh, the life of the rogue!  Stealth, cunning and  wealth -- if you're successful in your endeavors.  Why don't I arrange a test for you?  We'll see if you have what it takes to be a thief.")
    PlayFlavor(NPC, "", "", "smirk", 0, 0, Spawn)
    Dialog.AddOption("Bring it on! I will pass any test you can muster.","RogueOffer")	
    Dialog.AddOption("I'm not too sure anymore.  Do you advise I specialize somewhere else?","Decide")	
	Dialog.Start()
end

function RogueOffer(NPC,Spawn)
     FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Rogue)
end

function Rogue3(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Grab their mission orders. The lieutenant will have them guarded. Knowing him, he'll keep them behind a locked door guarded by his most brawny men. Return to me when you're done, and I'll verify the orders.")
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("Alright. I'll bring you the documents as quick as I can!")	
	Dialog.Start()
end

function RogueDone(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Let me make certain that you didn't just forge these ... No you succeeded where others before you have failed. The lieutenant will have to double his efforts.  You certainly deserve the title of \"rogue.\"")
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("Thank you Counselor. I will use my new skills wisely.","RogueDone2")	
	Dialog.Start()
end

function RogueDone2(NPC,Spawn)
     FaceTarget(NPC, Spawn)
    if HasQuest(Spawn,Rogue) then
    SetStepComplete(Spawn,Rogue,2)
    end
    PlayFlavor(NPC, "", "", "wink", 0, 0, Spawn)
end

--BARD CLASS 

function Bard1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Successful bards have a sharp tongue and a quick wit. I must test you to see if you possess these qualities. A small party of wealthy merchants from the Coalition of Tradesfolke has gathered together...")
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("A group of wealthy merchants? I enjoy being the center of attention...","BardOffer")	
    Dialog.AddOption("I'm not too sure anymore.  Do you advise I specialize somewhere else?","Decide")	
	Dialog.Start()
end



function BardOffer(NPC,Spawn)
     FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Bard)
end

--PREDATOR CLASS

function Predator1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("So, a predator? Can you smell your prey far before you see it? If you close your eyes, can you hear the heartbeat of your game and know how many beats are left, yes? Yes ... a stalker's instinct runs in your blood.  You are the top of the food chain.")
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("I'm too focused to be anything other than a predator.","PredatorOffer")	
    Dialog.AddOption("I'm not too sure anymore.  Do you advise I specialize somewhere else?","Decide")	
	Dialog.Start()
end


function PredatorOffer(NPC,Spawn)
     FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Predator)
end