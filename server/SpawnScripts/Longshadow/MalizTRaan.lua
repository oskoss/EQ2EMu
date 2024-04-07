--[[
	Script Name		: SpawnScripts/LongshadowAlley/MalizTRaan.lua
	Script Purpose	: Maliz T`Raan
	Script Author	: torsten
	Script Date		: 2022.07.19
	Script Notes	: 
--]]

local TakingitOutontheRaiders = 5678
local ADramaticPerformance = 5679

function spawn(NPC)
    ProvidesQuest(NPC, TakingitOutontheRaiders)
    ProvidesQuest(NPC, ADramaticPerformance)
end

function respawn(NPC)
	spawn(NPC)
end

require "SpawnScripts/Generic/DialogModule"


function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn, TakingitOutontheRaiders) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, TakingitOutontheRaiders) and GetQuestStep(Spawn,TakingitOutontheRaiders) ==1 then  
    Dialog2(NPC,Spawn)
elseif HasQuest(Spawn, TakingitOutontheRaiders) and GetQuestStep(Spawn,TakingitOutontheRaiders) ==2 then  
    Dialog1(NPC,Spawn)
elseif CanReceiveQuest(Spawn, ADramaticPerformance) then  
    Dialog1 (NPC,Spawn)
elseif HasQuest(Spawn, ADramaticPerformance)and GetQuestStep(Spawn,ADramaticPerformance) ==1   then  
    Dialog4 (NPC,Spawn)
elseif HasQuest(Spawn, ADramaticPerformance)and GetQuestStep(Spawn,ADramaticPerformance) ==2   then  
    Dialog1 (NPC,Spawn)
else     
     Dialog1(NPC,Spawn)
   end
end
 

function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    if CanReceiveQuest(Spawn, TakingitOutontheRaiders) then 
	Dialog.AddDialog("Living in these nasty slums makes me want to smash things ... things like your pea-brained skull! Get out of my sight, fool!")
	Dialog.AddVoiceover("voiceover/english/optional1/maliz_t_raan/fprt_hood05/100_std_de_male_maliz_traan_multhail1_eba9917.mp3",3299447227, 613482411)
 	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
    Dialog.AddOption("Get over yourself!")
   else
	Dialog.AddDialog("Living in these slums is sickening! What do you want from me?")
	Dialog.AddVoiceover("voiceover/english/optional1/maliz_t_raan/fprt_hood05/100_std_de_male_maliz_traan_callout_927f5c89.mp3",1122076255, 1993662428)
	PlayFlavor(NPC, "", "", "pout", 0, 0, Spawn)
    Dialog.AddOption("Nothing right now.")
    end
    if CanReceiveQuest(Spawn, TakingitOutontheRaiders) then 
    Dialog.AddOption("If you have such a problem here, then why haven't you moved out?","Dialog1a")
    end
    if CanReceiveQuest(Spawn, ADramaticPerformance) then 
    Dialog.AddOption("You mentioned you had more work for me?","Dialog3b")
    end
    if HasQuest(Spawn, TakingitOutontheRaiders) and GetQuestStep(Spawn,TakingitOutontheRaiders)==2 then 
    Dialog.AddOption("Have you noticed I've removed a number of raiders from the area?","Dialog3")
    end
    if HasQuest(Spawn, ADramaticPerformance) and GetQuestStep(Spawn,ADramaticPerformance)==2 then 
    Dialog.AddOption("[Give him Pavo's message]","Dialog5")
    end   
	Dialog.Start()
end


function Dialog1a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What kind of stupid question is that? Move where? There IS nowhere to go, fool! Neriak is gone! GONE! We're forced to live like common overlanders ... worse yet, we must live WITH them! ARRRG!!! I want to rip something apart -- like those human raiders out in the Sunken City! That would calm me down.")
 	PlayFlavor(NPC, "", "", "grumble", 0, 0, Spawn)
    Dialog.AddOption("If it would scilence your hollering, I will do something about it.","Offer1")
    Dialog.AddOption("No need to shout, fool! Enjoy living in refuse!")
	Dialog.Start()
end


function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, TakingitOutontheRaiders)
end

function Offer2(NPC,Spawn)
    OfferQuest(NPC, Spawn, ADramaticPerformance)
end

function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You didn't kill the Raiders! Return to the Sunken City and destroy them!")
    Dialog.AddOption("Their death will come soon!")
	Dialog.Start()
	PlayFlavor(NPC, "", "", "frustrated", 0, 0, Spawn)
end

function Dialog3(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn)
	Dialog.AddDialog("Oh yes. Yes.  I knew you wouldn't let me down.  I could just tell that about you..about you.  Not like those useless raiders...untrustworthy pusses.  I'll never trust them again.")
    Dialog.AddOption("So... How about some payment?","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
    SetStepComplete(Spawn, TakingitOutontheRaiders, 2)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddDialog("I suppose your skills warrent something... Here. It is not much, but I could still use your help... This incedent with the raiders has been... unsettling. I can make it worth your while in the end!")
    Dialog.AddOption("I could be persuaded.","Dialog3b")
    Dialog.AddOption("I'd rather tickle an orc than do more for you!")
	Dialog.Start()
end

function Dialog3b(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
	Dialog.AddDialog("You have calmed my nerves some, but my friend and I have recently been moved by a performance we witnessed earlier today. We can't shake what we've witnessed and need to express our emotions to the performers...")
    Dialog.AddOption("I would be glad to help.","Offer2")
    Dialog.AddOption("I'm no messanger. Find someone else.")
	Dialog.Start()
end

function Dialog4(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You haven't spoken with Pavo yet, have you. I don't like to be kept waiting...")
    Dialog.AddOption("I'm still heading that way.")
	Dialog.Start()
	PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
end

function Dialog5(NPC,Spawn)
    SetStepComplete(Spawn, ADramaticPerformance, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
	Dialog.AddDialog("Good... Very good. We will certainly prepare for our next step. You, on the other hand, have proved to be quite useful. Take this, and if you're interested in more work speak to my friend here. He'll have one last opportunity for you before the 'show' reaches its climax.")
    Dialog.AddOption("I might just do that.")
	Dialog.Start()
end

