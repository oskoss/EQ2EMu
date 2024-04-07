--[[
    Script Name    : SpawnScripts/TempleSt/SparzitCogsnibble.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.08 03:07:42
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local Teeth = 5876
local Design = 5920


function spawn(NPC)
    ProvidesQuest(NPC,Teeth)
    ProvidesQuest(NPC,Design)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC,Spawn)
if GetTempVariable(NPC,"CalloutTimer")=="false" then
    if CanReceiveQuest(Spawn,Teeth) or CanReceiveQuest(Spawn,Design) then    
    SetTempVariable(NPC,"CalloutTimer","true")
    SetTarget(NPC,Spawn)
    FaceTarget(NPC,Spawn)
    if CanReceiveQuest(Spawn,Teeth)  then    
	PlayFlavor(NPC, "voiceover/english/sparzit_cogsnibble/fprt_hood03/100_barpatronsparzitcogsnibble_callout_ba239822.mp3", "Those voices ... why I do I keep hearing those maddening voices? You there ... do you hear the voices?", "scream", 2305242707, 1619320864, Spawn, 0)
    elseif CanReceiveQuest(Spawn,Design) then
	PlayFlavor(NPC, "voiceover/english/sparzit_cogsnibble/fprt_hood03/100_barpatronsparzitcogsnibble_callout2_db4179dc.mp3", "Hmmm ... let's see ... yes ... yes ... these teeth are very basic. I must extend the teeth of my snake and draw out its tips ... yesssss ... I see where I went wrong. The barbs I use stick after puncturing a person's vitals. Woohoo! I'm on to something. Here, friend, take this coin for your time.", "tapfoot", 3052258109, 3734604849, Spawn, 0)
    end
    AddTimer(NPC,24000,"ResetCallout",1,Spawn)
    end
end
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else  
     Dialog1(NPC,Spawn)
   end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What? Of course I would like a beer. All of those nasty little voices are so much easier to ignore after I've had a few. Now serve up, my good rat.")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/qst_barpatronsparzitcogsnibble.mp3", 1913284555, 4209865742)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
        if CanReceiveQuest(Spawn,Teeth) then
        Dialog.AddOption("What voices are you talking about?","Dialog2")
        elseif GetQuestStep(Spawn,Teeth) == 2 then
        Dialog.AddOption("Here are some of fine snake teeth you asked for.","Quest1Done")
        end        
         if CanReceiveQuest(Spawn,Design) then
        Dialog.AddOption("Tell me. How are your contraption improvements coming along?","Dialog4")
        elseif GetQuestStep(Spawn,Design) == 2 then
        Dialog.AddOption("Here are your \"fresh Bone-Rot\" samples.","Quest2Done")
        end        
    Dialog.AddOption("Perhaps you've had enough...")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, just the voice that whispers in my ear while I whip up gadgets. They say things like, \"more spikes\" and \"make a larger explosion\" ... Hee hee hee ... little things like that. On my latest gadget, the voice says: \"make the fangs sharper\" and \"kill, kill, kill!\"")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x1_initial.mp3", 3048716634, 4074203837)
    PlayFlavor(NPC,"","","shrug",0,0,Spawn)
    Dialog.AddOption("Those voices must keep you busy! What are you working on?","Dialog3")
    Dialog.AddOption("Right. I should be going... now.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm building a contraption to solve an annoying problem. Living in such a small neighborhood, people constantly barge into my home, thinking it's theirs. In turn, I'm creating a clockwork snake that keeps people from glancing -- AHA! You can help me!")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x1_initial2.mp3", 2187428014, 4274175998)
    PlayFlavor(NPC,"","","orate",0,0,Spawn)
    Dialog.AddOption("What is it your voices... er you need?","Offer")
    Dialog.AddOption("Clockwork snake? I'll pass.")
	Dialog.Start()
end

function Offer(NPC,Spawn)
if CanReceiveQuest(Spawn,Teeth) then
    FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Teeth)
    end
end

function Quest1Done(NPC, Spawn)
    SetStepComplete(Spawn,Teeth,2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmmm ... let's see ... yes ... yes ... these teeth are very basic. Hmmm ... I must extend the teeth and draw out its tips ... yesssss ... I see where I went wrong. The barbs I use stick after puncturing a person's vitals. Woohoo! I'm on to something. Here, friend, take this coin for your time.")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x1_finish.mp3", 2748213193, 2852199972)
    PlayFlavor(NPC,"","","ponder",0,0,Spawn)
    Dialog.AddOption("I'll be sure to stay away once you've perfected them.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Marvelously!  I re-plated the teeth with a corrosion resistant, super hard conducting alloy that delivers an electrical shock while piercing the toughest conventional armor!  The silly people who encounter my mechanisnake will hardly know what bit 'em!  Hoo-hoo!  Hear that scream?  Another victim!")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x2_initial.mp3", 3138412668, 1958117669)
    PlayFlavor(NPC,"","","scheme",0,0,Spawn)
    Dialog.AddOption("Doesn't that seem a bit... harsh?","Dialog5")
    Dialog.AddOption("Keep your mad ideas away from me!")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Not at all!  Why, it's an act of mercy, in my opinion.  Those who escape the metallic jaws of my snake will be more careful in the future, thus better ensuring their own survival.  And those who do not escape ... well, the snake is swift.  Performing a public service, I am!")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x2_initial2.mp3", 2211265631, 4238303201)
    Dialog.AddOption("I suppose that would teach them a lesson before a painful death.","Dialog6")
    Dialog.AddOption("You AND your ideas are insane! Stay away from me!")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm glad you follow my logic.  Although, the lesson would be more clear if the victims didn't die quite so suddenly.  If they had time to go into the streets and tell their neighbors ... perhaps because of a slow-acting poison. That's it!  My mechanisnake needs a venom that will kill only after the victim has had time to tell others what has happened!  Perhaps you will help me get some venom?")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x2_initial3.mp3", 2455502637, 3404107398)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
    Dialog.AddOption("Sounds like a worthy cause. What do you need?","Offer2")
    Dialog.AddOption("No! I don't think so.")
	Dialog.Start()
end

function Offer2(NPC,Spawn)
if CanReceiveQuest(Spawn,Design) then
    FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Design)
    end
end

function Quest2Done(NPC, Spawn)
    SetStepComplete(Spawn,Design,2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Spectacular! With all of this grubby matter, I should be able to find a way to inject it into their skin. With a little help from an alchemist, this'll be just dandy! Hollow out the teeth, add this poison ... no, it needs to be excruciating so that those who don't speak their language can still understand. Whoohoo ... this will be great. Here's some coin for your time, friend.")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x2_finish.mp3", 3769729864, 234643773)
    PlayFlavor(NPC,"","","yes",0,0,Spawn)
    Dialog.AddOption("Thanks. Just keep your inventions away from me!")
	Dialog.Start()
end