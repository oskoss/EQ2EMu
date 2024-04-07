--[[
	Script Name		: SpawnScripts/LongshadowAlley/ImnatDVren.lua
	Script Purpose	: Imnat D`Vren
	Script Author	: torsten
	Script Date		: 2022.07.19
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

local ADramaticPerformance = 5679
local AShadyClearing = 5680
local TheTruthisoutThere = 5684

function spawn(NPC)
    ProvidesQuest(NPC, AShadyClearing)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else
    if GetQuestStep(Spawn,AShadyClearing) >= 1 then
        QuestCheck(NPC,Spawn)
    else
    Dialog1(NPC,Spawn)
    end
    end   
end    
 
function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Bah! That Maliz keeps breaking everything. He's not allowed near what little furniture we have left! What do you want? Can't you see I'm busy!")
    PlayFlavor(NPC, "","","grumble",0,0, Spawn)
	Dialog.AddVoiceover("voiceover/english/imnat_d_vren/fprt_hood05/100_std_de_male_imnat_dvren_callout_c7828a4.mp3",3649396705, 3766219054)
    if GetQuestStep(Spawn, TheTruthisoutThere)==1 then
	Dialog.AddOption("I'm here to investigate information for the Militia.", "Dialog2")
    end
    if CanReceiveQuest(Spawn, AShadyClearing) then
	Dialog.AddOption("Maliz said that you might have some work for me?", "Dialog3")
    end
	Dialog.AddOption("I was just leaving.")
	Dialog.Start()
end 

function QuestCheck(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Is the way clear? The sewers must be rid of this vermin that would get in the way of our shipment!")
    PlayFlavor(NPC, "","","ponder",0,0, Spawn)
    if GetQuestStep(Spawn, AShadyClearing)==2 then
	Dialog.AddOption("The sewers should be clear enough for your delivery now.", "Dialog6")
    else
	Dialog.AddOption("They will be soon.")
    end
	Dialog.Start()
end 


function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I wondered if the Militia would ever confront this menace.  It's about time!  I grow weary of all this chatter about Thexians rebuilding Neriak.  Neriak is gone forever!  We must forget it!  Freeport is our home now.  Tell your dear Captain to arrest one Kirs G'Vis who nests with his fellow Thexian vermin right here in Longshadow.  He's your liar. May he face the wrath of Lucan.")
	Dialog.AddVoiceover("voiceover/english/imnat_d_vren/fprt_hood05/quests/captainlnek/imnat_lnek_x1_initial.mp3",3046593267,1007171639)
    PlayFlavor(NPC, "","","sniff",0,0, Spawn)
	Dialog.AddOption("Your information is most welcome.")
	Dialog.Start()
	if GetQuestStep(Spawn, TheTruthisoutThere) == 1 then
        SetStepComplete(Spawn, TheTruthisoutThere, 1)
    end
end
    
 function Dialog3(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Perhaps... I do wonder why are you so interested in helping us? It seems odd that you would put yourself in such harms way to deal with our affairs.")
    PlayFlavor(NPC, "","","sniff",0,0, Spawn)
	Dialog.AddOption("I'm just looking for coin. Is that too much to ask?","Dialog4")
	Dialog.Start()
end

 function Dialog4(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I suppose not, and you have proved yourself so far. You have been privy to more than you know. We have been expecting a delivery of an important treasure, but you proved that the hired hands charged in protecting it could not stand up to a real challenge.")
    PlayFlavor(NPC, "","","shrug",0,0, Spawn)
	Dialog.AddOption("So you were using me?","Dialog5")
	Dialog.Start()
end 

 function Dialog5(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You got paid, didn't you?! We had to see if the hired goons could protect this vital delivery... We are grateful for your assistance in identifying their failure. Now, we need to be certain the deilvery can happen without hindrance. Are you willing to assist with this?")
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
	Dialog.AddOption("We've come this far. What must I do?","Offer")
	Dialog.AddOption("I've had enough of this! Get out of my face!")
	Dialog.Start()
end 

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,AShadyClearing)
end

 function Dialog6(NPC,Spawn)
    SetStepComplete(Spawn, AShadyClearing, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I trust your skills, therefore I will send word to Pavo to begin the transport of the treasure. Unfortunately, I cannot tell you anymore about the mission, but I promise that when our treasure is here, the Teir'Dal will no longer grovel before Lucan D'Lere. I may need your services later, but for now we best not speak to one another. Until then, farewell...")
    PlayFlavor(NPC, "","","thanks",0,0, Spawn)
	Dialog.AddOption("Fair enough. I've had enough skulking about anyways.")
	Dialog.AddOption("Hah! Good luck with that!")
	Dialog.Start()
end 

--[[    if HasCompletedQuest(Spawn, ADramaticPerformance) then
        if not HasQuest(Spawn, AShadyClearing) and not HasCompletedQuest(Spawn, AShadyClearing) then
           OfferQuest(NPC, Spawn, AShadyClearing)
        end
    end
    
	if GetQuestStep(Spawn, AShadyClearing) == 2 then
        SetStepComplete(Spawn, AShadyClearing, 2)
    end
    
	if GetQuestStep(Spawn, TheTruthisoutThere) == 1 then
        SetStepComplete(Spawn, TheTruthisoutThere, 1)
    end

		PlayFlavor(NPC, "voiceover/english/imnat_d_vren/fprt_hood05/100_std_de_male_imnat_dvren_callout_c7828a4.mp3", "Bah! That Maliz keeps breaking everything. He's not allowed near what little furniture we have left! What do you want? Can't you see I'm busy!", "", 3649396705, 3766219054, Spawn, 0)
	end
end]]--