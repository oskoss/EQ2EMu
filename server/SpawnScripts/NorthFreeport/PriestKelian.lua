--[[
    Script Name    : SpawnScripts/NorthFreeport/PriestKelian.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.02 12:10:44
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local Quest1 = 5906
local Cleric = 5907
local Druid = 5908
local Shaman = 5909

function spawn(NPC)
    ProvidesQuest(NPC, Quest1)
    ProvidesQuest(NPC, Cleric)
    ProvidesQuest(NPC, Druid)
    ProvidesQuest(NPC, Shaman)
end

function hailed(NPC, Spawn)
 
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Speak to me if you are one of the faithful. If you are devoid of any spiritual guidance, you are lost to me, for I cannot save your soul if you've sold it.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian000.mp3", 1741103906, 2475357432)
    if GetClass(Spawn)== 11 and GetLevel(Spawn)>=7 and not HasQuest(Spawn,Quest1) and not HasCompletedQuest(Spawn,Quest1) then
    Dialog.AddOption("I am still possession of my soul and my faith. What can you offer me?","Dialog1")	
    end
    if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1)==2 then 
    Dialog.AddOption("I have stopped the suffering of five Diseased Ratonga by sending them to the sweet embrace of death.","Dialog2")	
    end
    if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1)==4 then 
    Dialog.AddOption("The only foreign plant I was able to find was a purple flower given to me by Annia Kaeso.","Dialog3")	
    end 
    if HasQuest(Spawn,Quest1) and GetQuestStep(Spawn,Quest1)==6 then 
    Dialog.AddOption("I have collected the venom sacs.","Dialog4")	
    end  
    if GetQuestStep(Spawn,Cleric)==1 or GetQuestStep(Spawn,Druid)==1 or GetQuestStep(Spawn,Shaman)==1 then
    Dialog.AddOption("I am still working to complete my trial. I will return.")
    end
    if HasCompletedQuest(Spawn,Cleric) or HasCompletedQuest(Spawn,Druid) or HasCompletedQuest(Spawn,Shaman) then
    Dialog.AddOption("My soul is still my own thanks to you, Kelian.","Thanks")	
    else
            Dialog.AddOption("My soul is to use as I wish!")
    end
    if GetLevel(Spawn) >=9 and HasCompletedQuest(Spawn,Quest1) and GetClass(Spawn)==11 and not HasQuest(Spawn, Cleric) and not HasQuest(Spawn, Druid) and not HasQuest(Spawn, Shaman) then
    Dialog.AddOption("My soul is ready. What paths lie before me?","FinalClassTest")	
    end
	Dialog.Start()
end

function Thanks(NPC)
    FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Dialog1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("One of the greatest gifts we possess is the freedom to pursue spiritual enlightenment. You may spend your entire life seeking enlightenment and think you failed, but in your heart you know you succeeded. If you want to continue on this path, then I offer you my guidance.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian001.mp3", 3572439854, 118398468)
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("I must succeed! I will listen to your words for now.","OfferQuest1")	
    Dialog.AddOption("I don't need 'guidance' from you or anyone else!","Shrug")	
	Dialog.Start()
end

function Shrug(NPC,Spawn)
      PlayFlavor(NPC, "", "", "shrug", 0, 0, Spawn)
end  


function OfferQuest1(NPC,Spawn)
    OfferQuest(NPC,Spawn,Quest1)
    FaceTarget(NPC,Spawn)
end

function Dialog2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Ahh ... You have a good soul, child. You performed a brave and merciful act down in the sewers. Remember, sometimes death is the only cure, no matter how much it hurts you. Though we couldn't save those poor diseased creatures, we can try to stop the illness from spreading by finding its source.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian003.mp3", 597628700, 3290145578)
    PlayFlavor(NPC, "", "", "thanks", 0, 0, Spawn)
    Dialog.AddOption("Surely the gods will answer for this! Although, I did not see another priest spreading the disease in the sewer...","Dialog2a")	
	Dialog.Start()
end

function Dialog2a(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Hehehehee ... so innocent, you are. Not all spirituality comes from divine origin, child.  The world around us holds power within its soil, plants and rain, which the druids know well. I suspect that the ratongas' disease came from these tempestuous forces. I want you to speak with some merchants in town who may have imported some type of foreign plant. Let me write the list in your journal.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian004.mp3", 412624098, 719870239)
    PlayFlavor(NPC, "", "", "chuckle", 0, 0, Spawn)
    Dialog.AddOption("A plant? I will ask the merchants if someone has been selling such things.","Dialog2b")	
	Dialog.Start()
end

function Dialog2b(NPC,Spawn)
    SetStepComplete(Spawn,Quest1,2)
end


function Dialog3(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Let me see those flowers ... ahh ... yes, I'm familiar with this blossom. No, this didn't cause the ratongas' disease. This flower makes people happy through its odd... errr... appearance.  I thought about what we can do for the diseased ratonga in the sewers. I think I have a solution. Are you ready for the rest of your guidance?")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian005.mp3", 3413963093, 236391412)
    PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn)
    Dialog.AddOption("So if not the plant, what else could I do about the disease?","Dialog3a")	
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
    SetStepComplete(Spawn,Quest1,4)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("The last path is that of the shaman. The shaman forsakes both the divine and the natural and looks to the spirits surrounding us. You must go to the Sprawl and find the Gravel Vipers that reside there. Let the spirits guide you to the asps with the most poisonous venom.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian006.mp3", 3929146556, 1034072743)
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("As you wish.")	
	Dialog.Start()
end

function Dialog4(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Good, good. Hopefully an alchemist can recreate this poison in quantities large enough to fill the water in the sewers below. The ratongas' disease will no longer threaten the citizens of Freeport. As for you, my eager child, I cannot guide your spiritual development much further. It is time for you to decide what path moves your soul.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian007.mp3", 2544827648, 3067664425)
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("I'm glad the ratongas' fate is decided, but my soul is still needs direction.","FinalClassTest")	
	Dialog.Start()
    SetStepComplete(Spawn,Quest1,6)
end



--CLASS QUESTS 
 function FinalClassTest(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("What shall it be? Do you believe in the gods? Perhaps the forces of nature move your soul, or do you feel the pull of the spirit world?")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian008.mp3", 3156932879, 525367195)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("I have faith in the gods. I believe I am a Cleric.","Cleric1")	
    Dialog.AddOption("I realize now that my calling is to the forces of nature.  I think I'm a Druid!","Druid1")	
    Dialog.AddOption("The spirits speak to me and tell me that my destiny lies in being a Shaman. ","Shaman1")	
	Dialog.Start()
end

--CLERIC
function Cleric1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Clerics devote themselves to a god and give their life and soul to that deity. In return for this small sacrifice, the divine force provides a touch of its powers. Only those who believe that the gods are still with us should take this route, for an apathetic believer believes in an apathetic god. Do you have faith in the gods?")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian009.mp3", 1397579314, 3728059728)
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("With the help of the gods, I accept.  There is nothing I cannot do as long as they are with me.  I shall become a cleric.","OfferCleric" )	
    Dialog.AddOption("What were my options again?","FinalClassTest" )	
	Dialog.Start()    
end

function OfferCleric(NPC,Spawn)
    OfferQuest(NPC,Spawn,Cleric)
    FaceTarget(NPC,Spawn)
end

function ClericAccept(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Then I will facilitate a prayer trance for you.  You will experience a struggle unlike any you've known before... but upon exiting the trance, should you prove successful, you will emerge with the emotional strength to survive and prosper in the re-forged Norrath.  Are you ready?")
	--Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad017.mp3", 2729819197, 1238324646) WE DON"T HAVE THE VO FOR THIS
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("I am.","ClericPort" )	
    Dialog.AddOption("I will be shortly. I will return.")	
	Dialog.Start()    
end

function ClericFail(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Though you were not successful in your previous attempt, one of the most valuable lessons an aspiring cleric can learn is perseverance.  Are you ready to attempt the trial again?")
	--Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad017.mp3", 2729819197, 1238324646) WE DON"T HAVE THE VO FOR THIS
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("Yes, Aldalad, I am.","ClericPort" )	
    Dialog.AddOption("I will be shortly. I will return.")	
	Dialog.Start()    
end

function ClericPort(NPC,Spawn)
    Trial = GetZone("TheDisconcertingMeditation")
    Zone(Trial,Spawn,-47.02, -45.79, -49.3, 272)
end


--DRUID
function Druid1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("As a druid, you will become Nature's servant and companion, not her master.  Nature is everywhere.  If you respect her, she will become the greatest ally you have ever known. With your wisdom and her power, nothing shall defeat you.")
	Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad021.mp3", 2608345231, 3745599287)
    PlayFlavor(NPC, "", "", "orate", 0, 0, Spawn)
    Dialog.AddOption("It is clear to me.  I am called to be a druid.","Druid2" )	
    Dialog.AddOption("What were my options again?","FinalClassTest" )	
	Dialog.Start()    
end


function Druid2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("The path of a druid often requires more than just nurturing the land and its inhabitants.  Often blights will have to be physically driven out, and this requires not only an awareness of one's surroundings, but also the strength to perform these feats.  To this end, I have devised a test to determine your readiness to become a druid.")
	Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad028.mp3", 774916388, 145472560)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("What sort of challenges must I face?","Druid3" )	
	Dialog.Start()    
end



function Druid3(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I cannot tell you exactly what you will face - only that you must use the skills and spells you have learned up to this point in order to win your way past it and become a druid.  Remember that you will be alone with this.  Are you ready to begin?")
	Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad029.mp3", 3326972063, 1689451744)
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("I am.","OfferDruid" )	
    Dialog.AddOption("I will be shortly. I will return.")	
	Dialog.Start()    
end

function OfferDruid(NPC,Spawn)
    OfferQuest(NPC,Spawn,Druid)
    FaceTarget(NPC,Spawn)
end


function DruidAccepted(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("There will be no need to return to me when you have completed this trial, but go forth and put what you have learned into practice.  You will know when you have earned the right to call yourself a druid. I will send you to where you need to go.")
	Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad030.mp3", 110213528, 850594761)
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("I am ready.","DruidPort" )
    Dialog.Start()   
end


function DruidPort(NPC,Spawn)
    Trial = GetZone("BurningAbode")
    Zone(Trial,Spawn,6.91, -0.20, 3.77, 348.55)
end
--SHAMAN
function Shaman1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("A shaman knows that death is but a journey to another adventure.  If you choose this path, then those who have gone before you will guide your way through this mortal coil.  By communing with your ancestors, the wisdom of the past is always within reach.  The shaman speaks for the dead, and acts as a vessel to help others.")
	Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad022.mp3", 921764949, 3161713723)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("The spirits are with me and will always be my guide.  I am a shaman.","OfferShaman" )	
    Dialog.AddOption("What were my options again?","FinalClassTest" )	
	Dialog.Start()    
end


function OfferShaman(NPC,Spawn)
    OfferQuest(NPC,Spawn,Shaman)
    FaceTarget(NPC,Spawn)
end

function ShamanAccept(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Then you must travel to the Southern part of the city where a home has reportedly become a site of restless spirits. Use the skills you have gained to unshackle them from this world and you will have proven yourself as a shaman.  There will be no need to return to me, but be wary, spirits have powers even they can fathom.")
--	Dialog.AddVoiceover("voiceover/english/hierophant_aldalad/qey_north/hierophant_aldalad030.mp3", 110213528, 850594761)
    PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("Thank you, Aldalad. I will pass this trial." )	
	Dialog.Start()    
end


