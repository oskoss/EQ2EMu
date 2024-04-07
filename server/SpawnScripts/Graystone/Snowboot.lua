--[[
	Script Name	: SpawnScripts/Graystone/Snowboot.lua
	Script Purpose	: Snowboot <Armorsmith>
	Script Author	: Dorbin
	Script Date	: 2022.03.07
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"


local Pickup = 5501

function spawn(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")    
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
if math.random(1, 100) <= 80 then
         choice = math.random(1,3)
            if choice ==1 then
            PlayFlavor(NPC, "", "", "square", 0, 0, Spawn)
            elseif choice ==2 then
            PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)            
            else
            PlayFlavor(NPC, "", "", "woo", 0, 0, Spawn)
            
            end
    end
end


function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,11) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "", "", "heckno", 0, 0, Spawn)
    else
    Dialog1(NPC, Spawn)
    end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aye, what is it? I've got to be fitting this elven lass, and I haven't got all day! Come on, out with it!")
	Dialog.AddVoiceover("voiceover/english/armorsmith_snowboot/qey_village03/armorsmithsnowboot.mp3", 3584987348, 1438770677)
	if GetQuestStep(Spawn,Pickup)==1 then
	Dialog.AddOption("I'm here to pick up Watchman Fiercecry's suit of armor.","Armor")
    end	
    Dialog.AddOption("Sorry to disturb you!")
	Dialog.Start()
end


function Armor(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, you are, are you?  And why should I believe you? I can't let every last soul run off with a full suit of armor just because they say they're here to pick it up for someone! Go on, give me a reason! Why should I give it to you?  Come on! Out with it already! Why?")
	Dialog.AddVoiceover("voiceover/english/armorsmith_snowboot/qey_village03/armorsmithsnowboot000.mp3", 2002270290, 3759394726)
	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddOption("Fiercecry is a part of the Graystone Watch. Don't you want him protected?","Armor2")
	Dialog.AddOption("Please? I am just trying to do a job.","Armor2")
	Dialog.AddOption("I'm sure 'Old Snowboot' helps those who helps others.","Armor2")
	Dialog.Start()
end

function Armor2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Blast my good nature! All right, just a moment while I get it for you. Now, don't let me hear about this suit going missing!")
	Dialog.AddVoiceover("voiceover/english/armorsmith_snowboot/qey_village03/armorsmithsnowboot001.mp3", 3372293691, 3262827310)
	PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
	Dialog.AddOption("I'll deliver it right away.","ArmorDone")
	Dialog.Start()
end


function ArmorDone(NPC,Spawn)
  	FaceTarget(NPC, Spawn)  
    SetStepComplete(Spawn, Pickup, 1)
	PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
end
