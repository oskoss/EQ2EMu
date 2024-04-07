--[[
    Script Name    : SpawnScripts/TempleSt/MerchantTwergoTogglesmeet.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.30 03:10:09
    Script Purpose : 
                   : 
--]]
--
require "SpawnScripts/Generic/DialogModule"

local TwergosPlan = 5915

function spawn(NPC)
    ProvidesQuest(NPC, TwergosPlan)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    AddTimer(NPC,2000,"Vleko")
    AddTimer(NPC,MakeRandomInt(2000,4000),"Emotes")
end

function LeaveRange(NPC,Spawn)
    Vleko(NPC,Spawn)
if GetTempVariable(NPC,"CalloutTimer")=="true" then    
   SetTempVariable(NPC,"CalloutTimer","false")
end
end

function InRange(NPC,Spawn)
end

function ResetCallout(NPC,Spawn)
   SetTempVariable(NPC,"CalloutTimer","false")
end

function Emotes(NPC,Spawn)
    local Choice = MakeRandomInt(1,6)

if GetTempVariable(NPC,"CalloutTimer")=="false" then    
if Choice == 1 then
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","shame",0,0)
    end
        AddTimer(NPC,5200,"Emotes")
        
elseif Choice == 2 then   
    if not IsPlayer(GetTarget(NPC)) then
       PlayFlavor(NPC, "","","sulk",0,0)
    end
        AddTimer(NPC,5200,"Emotes")
        
elseif Choice == 3 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","point",0,0)
    end
        AddTimer(NPC,5000,"Emotes")
        
elseif Choice == 4 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","threaten",0,0)
    end
        AddTimer(NPC,7300,"Emotes")

elseif Choice == 5 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","swear",0,0)
    end
        AddTimer(NPC,7300,"Emotes")
elseif Choice == 6 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","peer",0,0)
    end
        AddTimer(NPC,7300,"Emotes")
    end
else --If Recently Called Out to Player
        AddTimer(NPC,7000,"Emotes")
    end    
end

function Vleko(NPC,Spawn)
    local zone = GetZone(NPC)
    local VlekoRatonga = GetSpawnByLocationID(zone,420537)
    SetTarget(NPC,VlekoRatonga)
    FaceTarget(NPC, VlekoRatonga)

end    

function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif CanReceiveQuest(Spawn, TwergosPlan) then  
    Dialog1(NPC,Spawn)
elseif HasQuest(Spawn, TwergosPlan) and GetQuestStep(Spawn,TwergosPlan) ==1 then  
    Dialog2(NPC,Spawn)
elseif HasQuest(Spawn, TwergosPlan) and GetQuestStep(Spawn,TwergosPlan) ==2 then  
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
	Dialog.AddDialog("My dad runs the best shop in town!  A much better shop, mind you, than those ratmen trying to ruin our business.")
	Dialog.AddVoiceover("voiceover/english/merchant_twergo_togglesmeet/fprt_hood03/mer_merchanttwergobtogglesmeet.mp3", 1379589936, 3170428831)
    if CanReceiveQuest(Spawn, TwergosPlan) then 
    Dialog.AddOption("What makes you so sure you're better than them?","Dialog1a")
    end
     if GetQuestStep(Spawn, TwergosPlan)==2 then 
    Dialog.AddOption("Here are your ripe zombie brains, just as you ordered.","Dialog3")
    end
    Dialog.AddOption("Let me see you wares and judge for myself.")
	Dialog.Start()
end

function Dialog1a(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My father always has some plan in the works but never quite gets the bugs out of the details.  I, on the other hand, have thought up a flawless scheme.  I'm building a device that redirects the neuro-synaptic pathways of anyone who approaches within 10.24 decapaces of our shop, inducing an externally triggered behavioral modification to our benefit.")
	Dialog.AddVoiceover("voiceover/english/merchant_twergo_togglesmeet/fprt_hood03/quests/twergotogglesmeet/twergo_x1_initial.mp3", 3607729720, 766730315)
 	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
    Dialog.AddOption("What on Norrath are you going on about?","Dialog1b")
    Dialog.AddOption("Tell me more! What does it do?","Dialog1b")
    Dialog.AddOption("I've no time for your schemes! I'm busy with my own!")
	Dialog.Start()
end

function Dialog1b(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It's a mind controller!  Brilliant, yes?  Everyone who comes near will feel an unstoppable urge to buy from us!  And it's almost completed, but I still need a bioadaptive energy source.  Perhaps you'll help me?")
	Dialog.AddVoiceover("voiceover/english/merchant_twergo_togglesmeet/fprt_hood03/quests/twergotogglesmeet/twergo_x1_initial2.mp3", 3740705944, 3329604525)
 	PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn)
    if CanReceiveQuest(Spawn, TwergosPlan) then 
    Dialog.AddOption("That DOES sound interesting. What do you need?","Offer1")
    end
    Dialog.AddOption("I'd rather not improve YOUR ability to control my mind!")
	Dialog.Start()
end

function Offer1(NPC,Spawn)
    OfferQuest(NPC, Spawn, TwergosPlan)
end

function Dialog2(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddDialog("Good friend, those zombie brains are not going to gallump over here by themselves!  You must fetch them for me!")
    Dialog.AddOption("I'll be back with some fresh juicy ones soon.")
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Delightful!  They're nice and smelly too ... exactly what I need.  If they meet my specifications as a bioadaptive energy source, my device will control the minds of people everywhere ... within this trading plaza, that is.  I shall call it my \"Anti-Ratonga Transaction Detractor!\"")
	Dialog.AddVoiceover("voiceover/english/merchant_twergo_togglesmeet/fprt_hood03/quests/twergotogglesmeet/twergo_x1_finish.mp3", 657641506, 1581390099)
 	PlayFlavor(NPC, "", "", "smile", 0, 0, Spawn)
    Dialog.AddOption("Why don't you make it so that it would work everywhere? You could rule the world!","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC,Spawn)
    SetTarget(NPC,Spawn)
    SetStepComplete(Spawn, TwergosPlan, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What's that?  Rule the world?  Now, that would be silly.  If we had that many customers our little shop could never keep up with the demand!")
	Dialog.AddVoiceover("voiceover/english/merchant_twergo_togglesmeet/fprt_hood03/quests/twergotogglesmeet/twergo_x1_finish2.mp3", 1105993552, 3488280823)
 	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
    Dialog.AddOption("Good point... and good luck.")
	Dialog.Start()
end
