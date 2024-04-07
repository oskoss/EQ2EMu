--[[
    Script Name    : SpawnScripts/TempleSt/MerchantQwergoTogglesmeet.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.30 04:10:40
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local QwergosPlan = 5916

function spawn(NPC)
    ProvidesQuest(NPC, QwergosPlan)
    Emotes(NPC)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    AddTimer(NPC,MakeRandomInt(2000,4000),"Vlepo")
end

function LeaveRange(NPC,Spawn)
    Vlepo(NPC,Spawn)
if GetTempVariable(NPC,"CalloutTimer")=="true" then    
   SetTempVariable(NPC,"CalloutTimer","false")
end
end

function InRange(NPC,Spawn)
if CanReceiveQuest(Spawn,QwergosPlan) and GetTempVariable(NPC,"CalloutTimer") ~= "true"  then    
    SetTempVariable(NPC,"CalloutTimer","true")
    SetTarget(NPC,Spawn)
    FaceTarget(NPC,Spawn)
	PlayFlavor(NPC, "voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/100_merchantqwergobtogglesmeet_callout_3ca72d41.mp3", "I have something so very important to say to you! Will you not hear me out?", "wave", 892700118, 2368875233, Spawn, 0)
    AddTimer(NPC,24000,"ResetCallout",1,Spawn)
end
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function Emotes(NPC,Spawn)
    local Choice = MakeRandomInt(1,4)

if GetTempVariable(NPC,"CalloutTimer")=="false" then    
if Choice == 1 then
    if not IsPlayer(GetTarget(NPC)) then
        FaceTarget(NPC)
        PlayFlavor(NPC, "","","heckno",0,0)
    end
        AddTimer(NPC,3200,"Emotes")
        
elseif Choice == 2 then   
    if not IsPlayer(GetTarget(NPC)) then
       PlayFlavor(NPC, "","","shakefist",0,0)
    end
        AddTimer(NPC,5200,"Emotes")
        
elseif Choice == 3 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","grumble",0,0)
    end
        AddTimer(NPC,5000,"Emotes")
        
elseif Choice == 4 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","flex",0,0)
    end
        AddTimer(NPC,7000,"Emotes")
    end
    
else --If Recently Called Out to Player
        AddTimer(NPC,7000,"Emotes")
    end    
end

function Vlepo(NPC,Spawn)
    local zone = GetZone(NPC)
    local VlepoRatonga = GetSpawnByLocationID(zone,420536)
    SetTarget(NPC,VlepoRatonga)
    FaceTarget(NPC, VlepoRatonga)

end    


function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn, QwergosPlan) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, QwergosPlan) and GetQuestStep(Spawn,QwergosPlan) <=2 then  
    Dialog2(NPC,Spawn)
elseif HasQuest(Spawn, QwergosPlan) and GetQuestStep(Spawn,QwergosPlan) ==3 then  
    Dialog1 (NPC,Spawn)
else  
     Dialog1(NPC,Spawn)
   end
end



function respawn(NPC)
	spawn(NPC)
end

function Dialog1(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Buy from the Togglesmeets!  Those rats have inferior goods made from shoddy workmanship. Don't believe their lies, I tell you.")
	Dialog.AddVoiceover("voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/mer_merchantqwergobtogglesmeet.mp3", 2636370755, 418957991)
 	PlayFlavor(NPC, "", "", "scold", 0, 0, Spawn)
    if CanReceiveQuest(Spawn, QwergosPlan) then 
    Dialog.AddOption("Why don't you move your stall somewhere else?","Dialog1a")
    end
     if GetQuestStep(Spawn, QwergosPlan)==3 then 
    Dialog.AddOption("Chrna gave me the Rumblebumbler... I should have asked her why it was ticking.","Dialog3")
    end
    Dialog.AddOption("Let me see your wares and judge for myself.")
	Dialog.Start()
end

function Dialog1a(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Move my stall?  Why should I move it?  Especially when this is a prime location, precisely selected by careful analysis of current marketing parameters.  The solution to this problem is not for us Togglesmeets to move but for those rats to be dislodged!  And I could do it at once, but for lack of an igniter rumblerod, which I have not.  Perhaps you would get one for me?")
	Dialog.AddVoiceover("voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/quests/qwergotogglesmeet/qwergo_x1_initial.mp3", 1165405636, 3920431354)
 	PlayFlavor(NPC, "", "", "whome", 0, 0, Spawn)
    Dialog.AddOption("Perhaps I could. What am I looking for again?","Offer1")
    Dialog.AddOption("You should just move! No need for crazy gadgets!")
	Dialog.Start()
end



function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, QwergosPlan)
end

function Dialog2(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddDialog("I do not see the igniter rumblerod in your possession.  Perhaps I must explain to you again its significance to my family's overall business plan.  Or ... you could simply go and get it, as I asked.")
    Dialog.AddOption("Hold on! I'm still looking!")
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, good-good-good!  Oh dear!  You triggered the bi-toggle capacitance diode!  I must deactivate it at once, or the entire city will be blown well into the sky ... now let's see ... was it the blue rod or the red ... I think the red, yes ... no!  The blue!  It's the blue!  There ... snap that in place ... and (*whew*) ... I have just averted a disaster of municipal proportions.")
	Dialog.AddVoiceover("voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/quests/qwergotogglesmeet/qwergo_x1_finish.mp3", 79547774, 518183957)
 	PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    Dialog.AddOption("Well... good! What could have started it? I didn't ask Chrna.","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
    SetTarget(NPC,Spawn)
    SetStepComplete(Spawn, QwergosPlan, 3)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ah, perhaps it was joggled in transport, then.  Delicate little items these are.  If it's still operational, I will carry out my original plan.  Otherwise, if it's not, I will cleverly offer it to the rats in exchange for their relocation.  Yes, yes, ingenious, that is!  Think like a rat when dealing with rats.  Oh, you're still here.  Take your payment.")
	Dialog.AddVoiceover("voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/quests/qwergotogglesmeet/qwergo_x1_finish2.mp3", 1828195215, 1976528953)
 	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
    Dialog.AddOption("How clever of you... I'll take my coin. Thanks.")
	Dialog.Start()
end
