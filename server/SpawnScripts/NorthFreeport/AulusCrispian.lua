--[[
    Script Name    : SpawnScripts/NorthFreeport/AulusCrispian.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.19 12:06:37
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"
local Mage1 = 5902

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Welcome to Torlig's Herbs and Potions.  I sell many magicial reagents and herbs.  But, I warn you, you must possess amazing skill to handle them properly.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian.mp3", 3874372728, 2977782311)
	Dialog.AddOption("These herbs are not my cup of tea.  I think I will look elsewhere.")
    if HasQuest(Spawn,Mage1) and GetQuestStep(Spawn,Mage1) == 3 then
	Dialog.AddOption("Arcanist Sonius is concerned with the price increases on research supplies.", "Dialog3")
    end
    if HasQuest(Spawn,5906) and GetQuestStep(Spawn,5906) == 3 then
	Dialog.AddOption("Have you been selling any type of foreign plant?", "Plant")
    end        
	Dialog.AddOption("Do you know how to handle them properly?", "Dialog2")
	Dialog.Start()
end




function Plant(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "","", "heckno", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian000.mp3", 0, 0)
    Dialog.AddDialog("I will NOT expose my suppliers to the likes of you! So, unless you have an order from the Overlord, take up your questions with Torlig.")
	Dialog.AddOption("Fine! Sorry.")
	Dialog.Start()
end



function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "","", "scold", 0, 0, Spawn)
    Dialog.AddDialog("Of course I do.  I'm very knowledgeable in the ways of magic.  Why, if it wasn't for those instructors at the Academy denying my admission, I'd be on my way to becoming a famous arch mage! That fire was not my fault!")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian000.mp3", 2154034769, 640127952)
	Dialog.AddOption("Okay.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
    SetTempVariable(NPC,"TalkCheck",nil)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Well the Arcanist can stuff it. She can pay the same price as everyone else - ten pieces of gold for a bottle of ink. What do you expect me to do? I've got seven mouths to feed at home!")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian002.mp3", 229896023, 3473249453)
	PlayFlavor(NPC, "","", "glare", 0, 0, Spawn)
	Dialog.AddOption("Surely, you can make an exception for someone of such standing as the Arcanist.","Fail1")
	Dialog.AddOption("Then I won't disturb you.  Farewell.")
	Dialog.AddOption("If she paid half the price, but bought twice as much, would that be acceptable?","Dialog5")
	Dialog.Start()
end

function Fail1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Not a chance, buddy. Either she pays the same price, or she doesn't get any supplies.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian003.mp3", 1664391901, 419184967)
	Dialog.AddOption("Then I won't disturb you.  Farewell.")
	PlayFlavor(NPC, "","", "heckno", 0, 0, Spawn)
	Dialog.AddOption("If she paid half the price, but bought twice as much, would that be acceptable?","Dialog5")
	Dialog.Start()	
end	

function Fail1a(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Not a chance, buddy. Either she pays the same price, or she doesn't get any supplies.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian003.mp3", 1664391901, 419184967)
	Dialog.AddOption("Then I won't disturb you.  Farewell.")
	PlayFlavor(NPC, "","", "heckno", 0, 0, Spawn)
	Dialog.AddOption("You wouldn't lose half the price unless she buys eight of them for one fourth the price.","Dialog6")
	Dialog.Start()	
end	

function Fail2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Not a chance, buddy. Either she pays the same price, or she doesn't get any supplies.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian003.mp3", 1664391901, 419184967)
	Dialog.AddOption("Then I won't disturb you.  Farewell.")
	PlayFlavor(NPC, "","", "heckno", 0, 0, Spawn)
	Dialog.AddOption("If she orders twenty for one tenth the price, you wouldn't.","Dialog7")
	Dialog.Start()	
end	

function Fail3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Not a chance, buddy. Either she pays the same price, or she doesn't get any supplies.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian003.mp3", 1664391901, 419184967)
	Dialog.AddOption("Then I won't disturb you.  Farewell.")
	PlayFlavor(NPC, "","", "heckno", 0, 0, Spawn)
	Dialog.AddOption("Think about it... If you lock her into a contract, the more you sell, the more you make!","Dialog8")
	Dialog.Start()	
end	


function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("No, because I'd still be making only half the profit on the deal.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian004.mp3", 646291804, 527889935)
	PlayFlavor(NPC, "","", "no", 0, 0, Spawn)
	Dialog.AddOption("I see. Sorry for bothering you.")
	Dialog.AddOption("Not unless she buys eight of them for one fourth the price.","Dialog6")
	Dialog.AddOption("But she is the Arcanist! She deserves respect!","Fail1a")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("No... uh... I think I might still lose money on that deal.")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian005.mp3", 1685923289, 1600136933)
	Dialog.AddOption("Perhaps I should let you think about this.")
	Dialog.AddOption("But not by much. Surely you could accept that?","Fail2")
	Dialog.AddOption("If she orders twenty for one tenth the price, you wouldn't.","Dialog7")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Umm... lemme think about that one... if she orders twenty - umm... won't I still lose money on that one?")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian006.mp3", 766951483, 1605764330)
	PlayFlavor(NPC, "","", "confused", 0, 0, Spawn)
	Dialog.AddOption("Only a little bit, but you would be serving a greater purpose than your own.","Fail3")
	Dialog.AddOption("If you lock her into a contract, you won't. The more you sell, the more you make!","Dialog8")
	Dialog.AddOption("Wait. On second thought, that might not be a good idea.")
	Dialog.Start()
end


function Dialog8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Good thinking... Heh heh heh.... I can make her sign a contract to buy them at one tenth the price, but she'll have to buy twenty, right? So what you're saying is that... if I change it to.... one twentieth the price... she'll have to buy FORTY!  FORTY BOTTLES!!! I'll be rich!")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian007.mp3", 1563774963, 3399420898)
	PlayFlavor(NPC, "","", "scheme", 0, 0, Spawn)
	Dialog.AddOption("Well, you better create a contract now then! You don't want to miss out on this opportunity, do you?","Dialog9")
	Dialog.Start()
end

function Dialog9(NPC, Spawn)
    SetTempVariable(NPC,"TalkCheck",nil)
    SetStepComplete(Spawn,Mage1,3)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Of course, of course, of course I do!  Just sign this paper here... and here. HA! I'm rich!  I'm rich!!!  You let Miss Stuffy-Britches know that this contract is permanent! She HAS to buy all forty bottles from me!!! HAHAHA!!! Leave me alone while I count all of my upcoming money.  let's see... one twentieth of ten gold pieces times forty... hmmm... carry the four.... add three... nonono... let me start over...")
	Dialog.AddVoiceover("voiceover/english/alchemist_aulus_crispian/fprt_north/mer_auluscrispian009.mp3", 3567139814, 490741090)
	PlayFlavor(NPC, "","", "happy", 0, 0, Spawn)
	Dialog.AddOption("Nice doing business with you...","continue")
	Dialog.Start()
end

function continue(NPC,Spawn)
end