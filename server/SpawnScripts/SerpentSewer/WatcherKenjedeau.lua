--[[
    Script Name    : SpawnScripts/SerpentSewer/WatcherKenjedeau.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 06:09:08
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local Part2 = 5890
local Part1 = 5889

function spawn(NPC)

end

function hailed(NPC, Spawn)
if HasQuest(Spawn,Part2) then
Retry(NPC,Spawn)
else
Dialog1(NPC, Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Blast these wretched sewers! Why do I have to lookout for alligators. I don't even know what an alligator LOOKS like!")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau001.mp3", 2265669441, 2172159195)
    PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
    if HasQuest(Spawn,Part1) or HasCompletedQuest(Spawn,Part1) then
    if GetLevel(Spawn)<18 and not HasQuest(Spawn,Part2) and not HasCompletedQuest(Spawn,Part2) then
    Dialog.AddOption("Nobility comes from personal sacrifice, friend.","Dialog2")
    elseif HasQuest(Spawn,Part2) and not HasCompletedQuest(Spawn,Part2) then
    Dialog.AddOption("I need to get to that meeting!","Retry")
    end
    end
    Dialog.AddOption("I have no time for this. Get out of the way!")	
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Shhh!  Don't say that so loud!  So... Stilus welcomed you into our fold.  He has a good eye.  You understand what joining us means, right?  Treason.  You can still back out before it's too late...")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau002.mp3", 1178065540, 4141402431)
    PlayFlavor(NPC, "", "", "wince", 0, 0, Spawn)
    Dialog.AddOption("I've come this far. Let's get on with it.","Dialog3")	
    Dialog.AddOption("On second thought...")	
	Dialog.Start()
end

function Dialog2_1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I thought I smelled a coward. I want nothing to do with you until you come to your senses.")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau003.mp3", 1178065540, 4141402431)
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
    Dialog.AddOption("Fine.")	
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("We need you to complete a task that the rest of us cannot. Before I continue, you must understand the consequences of what I am about to ask you. If you agree to help us, you can never show your face in Freeport again.")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau004.mp3", 3378912922, 919692772)
    Dialog.AddOption("Sound like something I'd be interested in.","Dialog4")	
    Dialog.AddOption("I would much rather keep my head than be a traitor."," Dialog2_1")	
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Since we're asking you to commit treason, you must prove your loyalty. Your only reward is the satisfaction of doing a good deed in this corrupt city. If you live through this, I can only imagine  the severity of your punishment.  Ask yourself: Are you willing to throw away your evil nature to live a life of goodwill?")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau005.mp3", 21064502, 1853527280)
    Dialog.AddOption("Yes. This world needs all the help it can get.","Offer")	
    Dialog.AddOption("Good will? ... err, he idea of it makes me sick.")	
	Dialog.Start()
end

function Offer(NPC,Spawn)
    if GetLevel(Spawn) <18 then
    OfferQuest(NPC,Spawn,Part2)
    FaceTarget(NPC,Spawn)
    else
        CloseConversation(NPC,Spawn)
        SendPopUpMessage(Spawn,"You are too late! The meeting has already occured.",250,50,50)
        SendMessage(Spawn,"You are too late! The meeting has already occured.","red")
        PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))     
    end
end

function Retry(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I'll cast a spell that will transport you to their meeting place.  You  must stop the official, using any means necessary. I think you know what you need to do.")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau007.mp3", 3532484695, 507238338)
    Dialog.AddOption("I'm ready.","Ready")	
	Dialog.Start()
end

function Ready(NPC,Spawn)
    if GetLevel(Spawn) <18 then
    CastSpell(NPC,95,1,1,NPC)
    ApplySpellVisual(Spawn,73)
    AddTimer(NPC,2500,"Port",1,Spawn)
    else
        CloseConversation(NPC,Spawn)
        SendPopUpMessage(Spawn,"You are too late! The meeting has already occured.",250,50,50)
        SendMessage(Spawn,"You are too late! The meeting has already occured.","red")
        PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))  
	if HasQuest(Spawn,5890) and GetQuestStep(Spawn,5890) ==1 then
	    SetStepFailed(Spawn,5890,1)
	end
    end
end

function Port(NPC,Spawn)
           Betrayal = GetZone("FreeportBetrayal")
       Zone(Betrayal,Spawn,3.87, 0.33, 9.64, 44)
end
