--[[
    Script Name    : SpawnScripts/TempleSt/MerchantVleko.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 11:10:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local VlekoPlan = 5873

function spawn(NPC)
    ProvidesQuest(NPC, VlekoPlan)
    Emotes(NPC)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    AddTimer(NPC,MakeRandomInt(2000,4000),"Twergo")
end

function LeaveRange(NPC,Spawn)
    Twergo(NPC,Spawn)
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
    local Choice = MakeRandomInt(1,5)

if GetTempVariable(NPC,"CalloutTimer")=="false" then    
if Choice == 1 then
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","cutthroat",0,0)
    end
        AddTimer(NPC,5200,"Emotes")
        
elseif Choice == 2 then   
    if not IsPlayer(GetTarget(NPC)) then
       PlayFlavor(NPC, "","","chuckle",0,0)
    end
        AddTimer(NPC,5200,"Emotes")
        
elseif Choice == 3 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","neener",0,0)
    end
        AddTimer(NPC,5000,"Emotes")
        
elseif Choice == 4 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","threaten",0,0)
    end
        AddTimer(NPC,7300,"Emotes")

elseif Choice == 5 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","whome",0,0)
    end
        AddTimer(NPC,7300,"Emotes")
    end
    
else --If Recently Called Out to Player
        AddTimer(NPC,7000,"Emotes")
    end    
end

function Twergo(NPC,Spawn)
    local zone = GetZone(NPC)
    local TwergoGnome = GetSpawnByLocationID(zone,420561)
    SetTarget(NPC,TwergoGnome)
    FaceTarget(NPC, TwergoGnome)

end    

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else
    Dialog1(NPC,Spawn)
    end
end


function Dialog1(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Kahhh!!! I hate those Togglesmeets! Their items are shoddy.  We only makes the finest quality items. Togglesmeets will sell you the unsafes!  My poppa sells you good quality!")
	Dialog.AddVoiceover("voiceover/english/merchant_vleko/fprt_hood03/mer_merchantvleko.mp3",4226142003,2683221742)
	

    if CanReceiveQuest(Spawn, VlekoPlan) then
	Dialog.AddOption("Ridiculous! Convince them to move their stall!", "Dialog1a")
    elseif GetQuestStep(Spawn, VlekoPlan)==2 then
	Dialog.AddOption("Here is the orcish sword you requested.", "Dialog2")
    end
	Dialog.AddOption("How about I just browse your wares.")
	Dialog.Start()
end



function Dialog1a(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("We do! We do! We tell them to leave, or they maybe have an accident. Accidents happen all the time. They don't believe us, but poppa says to wait and watch. Geheeea! Maybe you help me pass the time?")
	Dialog.AddVoiceover("voiceover/english/merchant_vleko/fprt_hood03/quests/vleko/vleko_x1_initial.mp3",86797808,1238006206)
    PlayFlavor(NPC, "","","nod",0,0, Spawn)
	Dialog.AddOption("I could be persuaded... What do you have in mind?", "OfferQuest1")
	Dialog.AddOption("I have better thing to do.")
	Dialog.Start()
end

function OfferQuest1(NPC,Spawn)
    if CanReceiveQuest(Spawn, VlekoPlan) then
    OfferQuest(NPC, Spawn, VlekoPlan)
    end
end

function Dialog2(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hide it! Hide it! If Togglesmeets see it then poppa will know what I'm doing! Okay, pass it to me. Good. Now, take this money and keep your mouth shut. I don't know you, and I've never seen you. Hehehehe ... soon, accidents happen to Togglesmeets.")
 	Dialog.AddVoiceover("voiceover/english/merchant_vleko/fprt_hood03/quests/vleko/vleko_x1_finish.mp3",1524753071,3531869216)
    PlayFlavor(NPC, "","","scheme",0,0, Spawn)
	Dialog.AddOption("Thanks. Good luck with your feud, or whatever!")
	Dialog.Start()
    SetStepComplete(Spawn, VlekoPlan, 2)
end