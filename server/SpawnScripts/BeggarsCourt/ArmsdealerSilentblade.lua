--[[
	Script Name		: SpawnScripts/BeggarsCourt/ArmsdealerSilentblade.lua
	Script Purpose	: Armsdealer Silentblade
	Script Author	: torsten\\Dorbin -- Dialogs added
	Script Date		: 2022.07.15
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"

local FreeWaresforSilentblade = 5654
local GetRichQuick = 5655

function spawn(NPC)
    ProvidesQuest(NPC, FreeWaresforSilentblade)
    ProvidesQuest(NPC, GetRichQuick)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
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
	Dialog.AddDialog("You need adventuring gear? Look no further. I got everything you could possibly want.")
	Dialog.AddVoiceover("voiceover/english/armsdealer_silentblade/fprt_hood04/mer_arms_dealer_silentblade.mp3", 679994876, 2333783393)
    PlayFlavor(NPC,"","","hello",0,0,Spawn)
    if CanReceiveQuest(Spawn, FreeWaresforSilentblade) then 
    Dialog.AddOption("Hey, have any tips on making coin?","Dialog1_Quest1")
    end
    if GetQuestStep(Spawn, FreeWaresforSilentblade) == 2 then
    Dialog.AddOption("Here are the maces from the battlepriests.","Dialog3_Quest1")
    end
    if CanReceiveQuest(Spawn, GetRichQuick)then
    Dialog.AddOption("Have any other tricks to make quick coin?","Dialog1_Quest2")
    end
    if GetQuestStep(Spawn, GetRichQuick) == 2 then
    Dialog.AddOption("Blort said he'll soon make a profit.","Dialog2_Quest2")
    end
    Dialog.AddOption("I'll take a look.")
	Dialog.Start()
end

function Dialog1_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmph...like I'd give you my trade secret, punk. Now go away, you're bothering me.")
	Dialog.AddVoiceover("voiceover/english/arms_dealer_silentblade/fprt_hood04/quests/armsdealersilentblade/silentblade_x1_initial.mp3", 1423744061, 732792019)
 	PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
    Dialog.AddOption("You just seemed to know your stuff. I was just curious.","Dialog2_Quest1")
    Dialog.AddOption("Fine! I didn't want to do buisness anyway.")
	Dialog.Start()
end

function Dialog2_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well at least you know a winner when you see one...fine. You can work for me. I'll tell you my trade secret as long as you finish a job for me, understand?")
	Dialog.AddVoiceover("voiceover/english/arms_dealer_silentblade/fprt_hood04/quests/armsdealersilentblade/silentblade_x1_initial2.mp3", 1974340371, 3987326918)
    Dialog.AddOption("Okay. What do you need?","Offer1")
    Dialog.AddOption("Nope. I wanted answers, not work.")
	Dialog.Start()
end

function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, FreeWaresforSilentblade)
end


function Dialog3_Quest1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    SetStepComplete(Spawn, FreeWaresforSilentblade, 2)
	Dialog.AddDialog("Good job, kid. Now, here's my secret: Take the maces and soak them in acid for about an hour. The acid will burn off the gunk. After that, apply some paint to the dented spots ... TADA!!! Good as new. Then mark up the price and you're a rich man! Make sure you don't accidentally use the mace on yourself -- those things can kill you. Here's some coin for your time.")
	Dialog.AddVoiceover("voiceover/english/arms_dealer_silentblade/fprt_hood04/quests/armsdealersilentblade/silentblade_x1_finish.mp3", 2995073623, 2307732444)
 	PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("Well, I suppose that's something...","Continue")
	Dialog.Start()
end

function Dialog1_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Didn't I tell you enough secrets? I don't want you stealing my business! But, I do need some help. Since you're here, I'll teach you another valuable trade secret -- if you'll put in some effort. So, are you willing to work, kid?")
	Dialog.AddVoiceover("voiceover/english/arms_dealer_silentblade/fprt_hood04/quests/armsdealersilentblade/silentblade_x2_initial.mp3", 0, 0) --NO KEYS
    Dialog.AddOption("If it helps me make money, sure.","Offer2")
    Dialog.AddOption("More work? Nope.")
	Dialog.Start()
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, GetRichQuick)
end

function Dialog2_Quest2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    SetStepComplete(Spawn, GetRichQuick, 2)
	Dialog.AddDialog("Sure he'll make some cash! Okay, kid, here's your payment.  Now, the true secret of a good arms dealer is to not sell weapons to customers, but to sell them to other arms dealers. If you get enough arms dealers under you, you'll be rich. Now, I must get more weapons from my sponsor, so run along, okay? Good luck with your career...")
	Dialog.AddVoiceover("voiceover/english/arms_dealer_silentblade/fprt_hood04/quests/armsdealersilentblade/silentblade_x2_finish.mp3", 0, 0) --NO KEYS
 	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("Thanks for the tip.")
	Dialog.Start()
end

