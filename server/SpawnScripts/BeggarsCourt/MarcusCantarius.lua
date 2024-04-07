--[[
	Script Name		: SpawnScripts/BeggarsCourt/MarcusCantarius.lua
	Script Purpose	: Marcus Cantarius
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.16
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local MarcusMonumentalHatred = 5659
local DeliverHelptoJanusFieri = 5660

function spawn(NPC)
    ProvidesQuest(NPC, MarcusMonumentalHatred)
    ProvidesQuest(NPC, DeliverHelptoJanusFieri)
    SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    SetTempVariable(NPC, "CalloutTimer1", "false")
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if not HasCompletedQuest(Spawn, MarcusMonumentalHatred) then

    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,40000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/marcus_cantarius/fprt_hood04/qst_marcus_cantarius_aoicallout01_fece1813.mp3", "Death to the dervish thugs!  Who's with me?!", "fient", 1434684372, 2320572215, Spawn, 0)

       end
    end
end
end


function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
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
	Dialog.AddDialog("I've dedicated my life to eradicating the dervishes.")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcuscantarius001.mp3", 1085537039, 2873606329)
    if CanReceiveQuest(Spawn, MarcusMonumentalHatred) then
	Dialog.AddOption("I would gladly slay some dervish thugs!","Dialog2")
    end
    if CanReceiveQuest(Spawn, DeliverHelptoJanusFieri) then
 	Dialog.AddOption("That must keep you busy. Have anything I can do?","Dialog4")
    end 
    if GetQuestStep(Spawn, MarcusMonumentalHatred) == 2 then
 	Dialog.AddOption("Here are the dervish scalps. They got what they deserved.","Dialog3")
    end
	Dialog.AddOption("I'll keep that in mind.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Very well then. You had better be prepared for battle!")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcuscantarius002.mp3", 2375491986, 3205126535)
	PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn, 0)
	Dialog.AddOption("I am more than ready for bloodshed.", "Offer1")
	Dialog.AddOption("Wait, nevermind...")
	Dialog.Start()
end

function Offer1(NPC, Spawn)
	OfferQuest(NPC, Spawn, MarcusMonumentalHatred)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ha HA! Yes! These will do nicely on my wall! Well done on ending the lives of these dervish filth! I hope you made them squirm during their last breath. Please, take one of the as a sign of my thanks for helping the cause.")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcuscantarius004.mp3", 0, 0) --NO KEYS
	PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn, 0)
	Dialog.AddOption("Thanks. The only good dervish is a dead one.")
	Dialog.Start()
    SetStepComplete(Spawn,MarcusMonumentalHatred,2)
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Perhaps.  Want to do me a favor?")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcus_cantarius2_000.mp3", 3613294861, 4212596636) 
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn, 0)
	Dialog.AddOption("What do you need?","Dialog5")
	Dialog.AddOption("No. I don't do favors, fool.")
	Dialog.Start()
end

function Dialog5 (NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Nothing too big and there's a reward in it for you.  I need to send a note to my friend Janus Fieri out in the Crossroads.  He's working on a murder investigation.  I have a lead for him.")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcus_cantarius2_001.mp3", 3005578740, 3392739960) 
	Dialog.AddOption("If there is pay... Where is Janus?","Dialog6")
	Dialog.AddOption("Nope. Find someone else.")
	Dialog.Start()
end

function Dialog6 (NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Out in the Commonlands.  It's a fairly safe location, considering what's out in the wilds.  Delivering this note to him will speed up his investigation.  Maybe you could even do some detective work for me. What do you say?")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcus_cantarius2_002.mp3", 3250398674, 3776310471) 
	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn, 0)
	Dialog.AddOption("Okay, I'll take the note.","Offer2")
	Dialog.AddOption("I've got better things to do than poke around.")
	Dialog.Start()
end

function Offer2(NPC, Spawn)
	OfferQuest(NPC, Spawn, DeliverHelptoJanusFieri)
end
