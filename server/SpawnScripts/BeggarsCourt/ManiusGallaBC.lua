--[[
	Script Name		: SpawnScripts/BeggarsCourt/ManiusGallaBC.lua
	Script Purpose	: Manius Galla
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.15
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local JoiningtheGang = 5656
local DonationsfromtheBanker = 5657

function spawn(NPC)
	ProvidesQuest(NPC, JoiningtheGang)
	ProvidesQuest(NPC, DonationsfromtheBanker)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","taunt",0,0, Spawn)
elseif GetQuestStep(Spawn,JoiningtheGang)==1 then
 	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","You best be dealing with those raiders, unless you're too much of whimp. We don't allow wimps in our ranks, now scram!","sneer",0,0, Spawn)
elseif GetQuestStep(Spawn,DonationsfromtheBanker)==1 then
 	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","Well, where is it? I don't see our \"donation\" on you. Get to the bank already!","glare",0,0, Spawn)
else
     Dialog1(NPC,Spawn)
   end
end

--Mind your own business.  If you keep gawking, you'll walk away with a limp--and that's because I'm in a good mood today.

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Mind your own business. If you keep gawking, you'll be walking away with a limp. And that's only because I'm in a good mood today.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1004.mp3", 0, 0)
    if CanReceiveQuest(Spawn,JoiningtheGang) then
	Dialog.AddOption("I want to join your gang.", "Dialog2")
    elseif GetQuestStep(Spawn,JoiningtheGang)==2 then
	Dialog.AddOption("I've killed the raiders.", "Dialog4")
    end    
    if CanReceiveQuest(Spawn,DonationsfromtheBanker) then
	Dialog.AddOption("So, can I join your gang now?", "Dialog5")
    elseif GetQuestStep(Spawn,DonationsfromtheBanker)==2 then
	Dialog.AddOption("Here's the money. He said you should eat rotten berries given to you by witches.", "Dialog6")
    end    
    Dialog.AddOption("I didn't see anything.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Did you hear that, boys? This runt wants to join our gang! HA HA HA HA! You couldn't fight your way out of a wet parchment bag let alone join us. HA HA HA! We keep people safe inside the city districts!  You're better off paying us for protection, runt.")
    PlayFlavor(NPC, "","","chuckle",0,0, Spawn)
	Dialog.AddOption("Why don't you give me a test?", "Offer1")
	Dialog.AddOption("I don't need to take this from you. Good bye.")
	Dialog.Start()
end

function Offer1(NPC,Spawn)
    OfferQuest(NPC,Spawn,JoiningtheGang)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Don't even bother coming back if they ain't!")
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
	Dialog.AddOption("Don't worry about it.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Crispin already heard. Hpmh ... You got lucky, I guess. Either way, those Raiders won't bother our clients in the Court anymore. I don't know if I should let you join our gang ... let me think about it.")
    PlayFlavor(NPC, "","","agree",0,0, Spawn)
	Dialog.AddOption("I'll check back.")
	Dialog.Start()
	SetStepComplete(Spawn,JoiningtheGang,2)
end


function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hpmh ... You got lucky, I guess. Either way, those Raiders won't bother our clients in the Court anymore. I don't know if I should let you join our gang ... let me think about it. ")
    PlayFlavor(NPC, "","","ponder",0,0, Spawn)
	Dialog.AddOption("Oh, come on. How else can I prove myself?","Offer2")
	Dialog.AddOption("You're impossible!")
	Dialog.Start()
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC,Spawn,DonationsfromtheBanker)
end

function Dialog6(NPC, Spawn)
	SetStepComplete(Spawn,DonationsfromtheBanker,2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("So he's in with the witches now is he?  I'll keep my eye on all of 'em.  What's this paltry sum?  He's cheated me, he has!  That old miser will have an accident before the sun is down, or I won't rest.  Here's a coin for you.  Get lost while I decide that banker's fate.  GRRRR!!!")
    PlayFlavor(NPC, "","","grumble",0,0, Spawn)
	Dialog.AddOption("Whoa, Don't get angry at me! I'm out of here...")
	Dialog.Start()
end


--
