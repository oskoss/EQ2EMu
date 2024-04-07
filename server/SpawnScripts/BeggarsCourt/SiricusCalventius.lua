--[[
	Script Name		: SpawnScripts/BeggarsCourt/SiricusCalventius.lua
	Script Purpose	: Siricus Calventius
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.17
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
require "SpawnScripts/Generic/DialogModule"

local SiricusandtheMilitia = 5663

function spawn(NPC)
    ProvidesQuest(NPC, SiricusandtheMilitia)
    SetPlayerProximityFunction(NPC, 8, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    SetInfoStructString(NPC, "action_state", "artificing_idle")
end

function InRange(NPC,Spawn)
if CanReceiveQuest(Spawn,SiricusandtheMilitia) and GetTempVariable(NPC,"CalloutTimer") ~= "true" then    
    SetTempVariable(NPC,"CalloutTimer","true")
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "voiceover/english/siricus_calventius/fprt_hood04/100_std_siricus_calventius_hum_m_callout1_12a2e93c.mp3", "How dare you enter my house, scoundrel! This time you're not destroying my figurines!", "shakefist", 2618163617, 4254987101, Spawn, 0)
   AddTimer(NPC,45000,"ResetCallout",1,Spawn)
elseif HasCompletedQuest(Spawn,SiricusandtheMilitia) and GetTempVariable(NPC,"CalloutTimer") ~= "true" then
    SetTempVariable(NPC,"CalloutTimer","true")
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "voiceover/english/siricus_calventius/fprt_hood04/100_std_siricus_calventius_hum_m_multhail1_577c7e4c.mp3", "Get out of my house! I'm calling the Militia!", "glare", 1299689554, 3591558619, Spawn, 0)
   AddTimer(NPC,45000,"ResetCallout",1,Spawn)
end
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetQuestStep(Spawn, SiricusandtheMilitia)>=1 then
    Dialog_Wait(NPC, Spawn) 
    else    
    Dialog1(NPC, Spawn)
end
end

function Offer(NPC, Spawn)
	OfferQuest(NPC, Spawn, SiricusandtheMilitia)
end

function Dialog_Wait(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("So, did my application go through? It's been weeks! I must know! Please hurry and find Sentius!")
	Dialog.AddVoiceover("voiceover/english/siricus_calventius/fprt_hood04/std_siricus_calventius.mp3", 0, 0)
	if GetQuestStep(Spawn,SiricusandtheMilitia) ==2 then
	Dialog.AddOption("Sentius said he's still working on it but it will take time.", "Dialog4")
	else
	Dialog.AddOption("I'm still looking for him.")
    end	    
	Dialog.Start()
end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Get out of my house, before I call the Militia and tell them you attacked me!")
	Dialog.AddVoiceover("voiceover/english/siricus_calventius/fprt_hood04/std_siricus_calventius.mp3", 606767278, 3005517410)
    if CanReceiveQuest(Spawn,SiricusandtheMilitia) then
	Dialog.AddOption("I'm not here to hurt you.", "Dialog2")
	elseif GetQuestStep(Spawn,SiricusandtheMilitia) ==2 then
	Dialog.AddOption("Sentius said he's still working on it but it will take time.", "Dialog4")
    end	    
	Dialog.AddOption("Alright! I'm going.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That's what you guys said last time, then you destroyed my glass figurines! By your looks I bet you're one of Manius Galla's guys. What are you going to break now?! ")
	Dialog.AddVoiceover("voiceover/english/siricus_calventius/fprt_hood04/quests/siricuscalventius/siricus_x1_initial.mp3", 541429721, 1155169623)
	PlayFlavor(NPC, "", "", "cringe", 0, 0, Spawn, 0)
	Dialog.AddOption("Seriously, I'm not here to hurt you.", "Dialog3")
	Dialog.AddOption("You most likely deserved it, you snivelling fool.","Fool")
	Dialog.Start()
end


function Fool(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/siricus_calventius/fprt_hood04/100_std_siricus_calventius_hum_m_multhail1_577c7e4c.mp3", "Get out of my house! I'm calling the Militia!", "point", 1299689554, 3591558619, Spawn, 0)
end


function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Really? Please, accept my apology. I thought you were with Manius. Just for fun, he sends his guys here to rough me up. In fact, I'm paying my way through the Freeport Militia. One day I'll take pleasure in arresting that tyrant for his cruelty. Hey, would you do me a favor and ask my friend how my bribe is coming along?")
	Dialog.AddVoiceover("voiceover/english/siricus_calventius/fprt_hood04/quests/siricuscalventius/siricus_x1_initial2.mp3", 1937410613, 2279067190)
	PlayFlavor(NPC, "", "", "sigh", 0, 0, Spawn, 0)
	Dialog.AddOption("Sure. Why not.", "Offer")
	Dialog.AddOption("Nope. You should learn your place!","Fool")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh no. I've waited several weeks now ... Gosh, I didn't know the Militia had such a long waiting list. I guess I have no choice but to wait. Thank you for your help, good friend. ")
	Dialog.AddVoiceover("voiceover/english/siricus_calventius/fprt_hood04/quests/siricuscalventius/siricus_x1_finish.mp3", 1070794522, 2366770692)
	PlayFlavor(NPC, "", "", "pout", 0, 0, Spawn, 0)
	Dialog.AddOption("Yeah, good luck with that.")
	Dialog.Start()
	SetStepComplete(Spawn,SiricusandtheMilitia,2)
end
