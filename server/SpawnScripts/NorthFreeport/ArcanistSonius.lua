--[[
    Script Name    : SpawnScripts/NorthFreeport/ArcanistSonius.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 06:09:41
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

local Mage1 = 5902
local Sorc = 5904
local Summ = 5905
local Ench = 5903

function spawn(NPC)
    ProvidesQuest(NPC, Mage1)
    ProvidesQuest(NPC, Sorc)
    ProvidesQuest(NPC, Summ)
    ProvidesQuest(NPC, Ench)
end

--The Arcanist sent you to me?  She's made my promotion to sorcerer so easy!	
function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetLevel(Spawn) ==7 and  HasCompletedQuest(Spawn,Mage1) then
    DoneToday(NPC,Spawn)   
    elseif GetLevel(Spawn) >=9 and HasCompletedQuest(Spawn,Mage1) and GetClass(Spawn)==21 and not HasQuest(Spawn, Ench) and not HasQuest(Spawn, Sorc) and not HasQuest(Spawn, Summ) then
    FinalClassTest(NPC,Spawn)
    else
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Don't talk to me unless you're devoted to academic research.  Unlocking the secrets of arcane powers takes devotion. The lazy need not apply in this field...")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius001.mp3",  3905512775, 1010931746)
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
    if GetClass(Spawn)== 21 and GetLevel(Spawn)>=7 and not HasQuest(Spawn,Mage1) and not HasCompletedQuest(Spawn,Mage1) then
    Dialog.AddOption("I am interested in learning how to enhance my magic abilities.","Dialog1")	
    end
    if HasQuest(Spawn,Mage1) and GetQuestStep(Spawn,Mage1)==2 then 
    Dialog.AddOption("The infestation of slimes has been slowed now that I have destroyed a number of the monstrous goos.","Dialog2")	
    end
    if HasQuest(Spawn,Mage1) and GetQuestStep(Spawn,Mage1)==4 then 
    Dialog.AddOption("He's written up a contract for forty bottles at five silver pieces each.","Dialog3")	
    end  
    if GetClass(Spawn)== 21 and GetLevel(Spawn)>=8 and GetQuestStep(Spawn,Mage1)==5 then
    Dialog.AddOption("I would like to continue my lessons, Arcanist.","Dialog4")
    elseif GetClass(Spawn)== 21 and GetLevel(Spawn)< 8 and GetQuestStep(Spawn,Mage1)==5 then
     Dialog.AddOption("I will return once I've reviewed my studies, Arcanist.")
   end  
    if HasQuest(Spawn,Mage1) and GetQuestStep(Spawn,Mage1)==9 then 
    Dialog.AddOption("I have collected the information on what was summoned. It looks like three different things were summoned into existence.","Dialog5")	
    end
    if HasCompletedQuest(Spawn,Ench) or HasCompletedQuest(Spawn,Sorc) or HasCompletedQuest(Spawn,Summ) then
    Dialog.AddOption("Arcanist. I still reflect on your lessons. Thank you.")	
    end
    if GetLevel(Spawn) <9 and HasCompletedQuest(Spawn,Mage1) and GetClass(Spawn)==21 and not HasQuest(Spawn, Ench) and not HasQuest(Spawn, Sorc) and not HasQuest(Spawn, Summ) then
    Dialog.AddOption("I will return for my final exam once I've reviewed my studies, Arcanist.")
    end
    Dialog.AddOption("In that case, I'll let you get back to work.  Goodbye.")	
    Dialog.Start()
end
end

--I convinced Bulz the troll to defeat a couple of Seafuries for me.  I handled the first mate myself.

--Precisely!  The mage summoned an elephant!  One witness felt its ears drape her head, another ran into its tusks, and the last witness felt the elephant's trunk wrap around his neck.  Even though each witness experienced something different, there is only one reality.  A summoner can identify this reality and change it to suit his needs. I know who is responsible for summoning the elephant, but this is not your concern. You completed your lessons, my apt pupil. Now it is time for your final exam.
--I do not have time to speak to you unless you are seriously devoted to academic research. This is not something to take lightly, for true research does not just happen all by itself. You must devote your life to unlocking the secrets of arcane powers. Therefore, the lazy need not apply. 
function Dialog1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Or so you say... Many people dabble in the arcane for the promise of great power.  Yet, when the time comes, they're too lazy to wrest secrets from the grasp of mystery.  How far will you go to unlock the power that knowledge can grant you?")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius002.mp3",  2674482409, 809985473)
    Dialog.AddOption("I will wield powers yet to be seen in this world!","OfferMage1")	
    Dialog.AddOption("I... should be going.")	
	Dialog.Start()
end


function OfferMage1(NPC,Spawn)
    OfferQuest(NPC,Spawn,Mage1)
    FaceTarget(NPC,Spawn)
end

--I would like to continue my lessons, Arcanist.
function Dialog2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Hmmm ... you return and in a timely manner.  You may be a prize pupil after all.  Even though you can't see it, these Slime specimens contain residue of the life force that animated them.  You will learn that life is a never-ending resource that surrounds us.  Knowledge, on the other hand, is far more difficult to obtain. Thus, the lesson learned is knowledge is far more precious than life. Remember this.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius004.mp3",  3551708297, 2303353482)
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("I see. So my path to knowing will be paved by the bodies before me.","Dialog2a")	
	Dialog.Start()
end

function Dialog2a(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Next, I shall teach you how to avoid letting other people's concerns disrupt your research.  The Coalition of Tradesfolke raised the price of ink this morning.  This is unacceptable.  Go speak with Aulus in Torlig's Shop.  Convince him that the price increase of ink shouldn't apply to someone of my stature.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius005.mp3",  4176304101, 1577206553)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("How would I do that?","Dialog2b")	
	Dialog.Start()
end

function Dialog2b(NPC,Spawn)
    SetStepComplete(Spawn,Mage1,2)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("An enchanter would mesmerise Alus with a simple spell, but you haven't learned these skills. It shall be a difficult task, but mesmerizing Aulus will teach you the skills of an enchanter.  Start with the words you use in everyday life, then you will begin to understand how to enhance people with magic.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius006.mp3",  2931456206, 3429721696)
    Dialog.AddOption("Alright. I'll return once I've spoken with them.")	
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Amazing!  He charges ten gold pieces for a bottle and you lowered it to five silver pieces?  Well, my pupil, I think you have what it takes to be an enchanter.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius007.mp3",  1459390682, 2672790255)
    PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn)
    SetStepComplete(Spawn,Mage1,4)
    if GetClass(Spawn)== 21 and GetLevel(Spawn)>=8 and GetQuestStep(Spawn,Mage1)==5 then
    Dialog.AddOption("I rather enjoyed manipulating the conversation to my desire...","Dialog4")   
    elseif GetClass(Spawn)== 21 and GetLevel(Spawn)< 8 and GetQuestStep(Spawn,Mage1)==5 then
    Dialog.AddOption("I rather enjoyed manipulating the conversation to my desire...","DoneToday")   
   end  
	Dialog.Start()
end

function DoneToday(NPC,Spawn)
    if GetQuestStep(Spawn,Mage1)==4 then
    SetStepComplete(Spawn,Mage1,4)
    end
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I'm pleased with your progress. Unfortunately, today's lesson is over. I must write this postulate before I forget it. Please study what I taught you thus far. We can continue your lessons at another time.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius008.mp3",  0, 0)
    PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
    if GetClass(Spawn)== 21 and GetLevel(Spawn)>=8 then
    Dialog.AddOption("I would like to continue my lessons, Arcanist. I'm eager to start","Dialog4")	
    else
    Dialog.AddOption("Thank you. I'll return soon for more lessons.")	
    end  
    Dialog.Start()
end


---MAGE2
function Dialog4(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Excellent! I noticed that one of my students dropped out of my course and is attempting home schooling. Without my signature of academic achievement, I cannot tolerate this. I don't know who this dropout is, but I need you to find out. In turn, you will learn the skills of a summoner.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius009.mp3",  3430145629, 2951724267)
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("What does a dropout have to do with summoning?","Dialog4a")	
	Dialog.Start()
end

function Dialog4a(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I heard that earlier today several people in the districts witnessed the summoning of some kind of creature.  Go question these witnesses.  After interviewing them, identify the summoned creature.  Let me know when you solve this mystery.  When I find out who is responsible, I shall kill him for his disobedience! Let me have your journal. I'll write down the names of the witnesses.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius010.mp3",  1221218294, 850810550)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("Here is my journal. I will get to the bottom of this.","OfferMage2")	
	Dialog.Start()
end



function OfferMage2(NPC,Spawn)
     SetStepComplete(Spawn,Mage1,5)
   FaceTarget(NPC,Spawn)
end

function Dialog5(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("You have a list?  Let me see it. ... One person was draped in a sheet of leather, another was impaled by a stake, and another felt a snake ... this is rubbish!  A novice summoner could never summon three objects at once! From this list, I can tell what that delinquent student summoned. To pass this test, you must understand that people's realities differ. Three objects weren't summoned today, only one was. What was it?")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius011.mp3",  1663368472, 4059713499)
    PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    Dialog.AddOption("a goblin","Wrong")	
    Dialog.AddOption("a really big snake","Wrong")	
    Dialog.AddOption("an orc","Wrong")	
    Dialog.AddOption("a sewer slime","Wrong")	
    Dialog.AddOption("Lucan D'lere","WrongLucan")	
    Dialog.AddOption("an elephant","Correct")	
    Dialog.AddOption("a coat-wearing snake wielding spears?","WrongSnake")	
	Dialog.Start()
end

function Wrong(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Sadly, you fail. Using the facts you presented me, your answer is ridiculous; you obviously put no thought into it. If you continue at this rate, you will never be anything more than a simple mage. Review the clues again, and speak with me when you have the correct answer.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius012.mp3",  2718680677, 1828842152)
    PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
    Dialog.AddOption("I'll consider my list again...","Dialog5")	
	Dialog.Start()
end

function WrongLucan(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
	Dialog.AddDialog("Fool! The Overlord is watching you as we speak.")
	Dialog.AddVoiceover("voiceover/english/optional2/darkelf_eco_evil_3/ft/darkelf/darkelf_eco_evil_3_notcitizen_gf_e5838bd0.mp3", 644059683, 1813641447)
	Dialog.AddVoiceover("voiceover/english/human_eco_evil_1/ft/human/human_eco_evil_1_notcitizen_gf_e5838bd0.mp3", 3487310419, 1932819422)
    PlayFlavor(NPC, "", "", "cringe", 0, 0, Spawn)
    Dialog.AddOption("Err...")	
	Dialog.Start()
end

function WrongSnake(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
	Dialog.AddDialog("...")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius012.mp3",  0, 0)
    PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
    Dialog.AddOption("Uhhh... Only kidding.","Wrong")	
	Dialog.Start()
end

function Correct(NPC,Spawn)
     SetStepComplete(Spawn,Mage1,9)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Precisely!  The mage summoned an elephant!  One witness felt its ears drape her head, another ran into its tusks, and the last witness felt the elephant's trunk wrap around his neck.  Even though each witness experienced something different, there is only one reality.  A summoner can identify this reality and change it to suit his needs. I know who is responsible for summoning the elephant, but this is not your concern. You completed your lessons, my apt pupil. Now it is time for your final exam.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius013.mp3",  1007657081, 1911291450)
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("A final exam? What must I do?","FinalClassTest")	
	Dialog.Start()
end



--FINAL Test
function FinalClassTest(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I taught you three different methods of exploring the secrets of mystical power. Now you must dedicate your arcane studies to one discipline... Which shall it be?")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius014.mp3",  196403467, 3470342687)
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
    Dialog.AddOption("I feel the destructive arts are to my liking. I shall study to be a sorcerer.","Sorcery")	
    Dialog.AddOption("The complex weaves of enchantment are compelling. I will study to be an enchanter.","Enchanter")	
    Dialog.AddOption("Bending truths to create something from nothing is intriguing. I will be a summoner.","Summoner")	
	Dialog.Start()
end



function Summoner(NPC,Spawn)
    FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Summ)
end


function Sorcery(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Craving such immense power is tempting, but beware, others crave it too. They will destroy you in the blink of an eye to obtain even a small portion of your power. Students of the arcane arts must learn to combat these power plays by testing their skills. Now it is your time to test your skills and face your first opponent.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius018.mp3",  2784462451, 4251950023)
    PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn)
    Dialog.AddOption("I am ready. Who will I be testing my skills on?","Sorcery2")	
    Dialog.AddOption("Perhaps I should reconsider this...","FinalClassTest")	
	Dialog.Start()
end



function Sorcery2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Sorc)
end

function Enchanter(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("You'll be an enchanter... yes... perhaps ... First, let's see how you deal with an angry crowd.  Not everyone is cut out to deal with the thought required behind this choice ... we need to make sure that you are.")
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius012.mp3",  0, 0)
    Dialog.AddOption("If it is like my lesson before, I can handle a crowd.","Enchanter2")	
    Dialog.AddOption("Actually, I better rethink this.","FinalClassTest")	
	Dialog.Start()
end

function Enchanter2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
    OfferQuest(NPC,Spawn,Ench)
end

function GoodbyeSumm(NPC,Spawn) -- ALSO SORC
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("You don't need to return to me. You'll have proved your worth and readiness.  Take care, though.  You'll be alone and these elementals will not go down without a fight.  I hope to see you again one day.")
  	Dialog.AddVoiceover("voiceover/english/magister_niksel/qey_south/magister_niksel031.mp3", 980785219, 3713600865)
  PlayFlavor(NPC, "", "", "bye", 0, 0, Spawn)
    Dialog.AddOption("Thank you Magister Niksel.")	
	Dialog.Start()
end


function GoodbyeEnch(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Once you've quelled the crowd you'll have more than proven yourself to be a capable enchanter. You won't need to return to me, but I hope to see you again. Take care, and good luck!")
    PlayFlavor(NPC, "", "", "bye", 0, 0, Spawn)
    Dialog.AddOption("Thank you Magister Niksel.")	
	Dialog.Start()
end
