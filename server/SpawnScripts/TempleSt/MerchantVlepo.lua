--[[
    Script Name    : SpawnScripts/TempleSt/MerchantVlepo.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:43
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local VlepoPlan = 5917

function spawn(NPC)
    ProvidesQuest(NPC, VlepoPlan)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetTempVariable(NPC,"CalloutTimer","false")
    AddTimer(NPC,2000,"Qwergo")
    AddTimer(NPC,MakeRandomInt(2500,4000),"Emotes")
end

function LeaveRange(NPC,Spawn)
    Qwergo(NPC,Spawn)
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
        PlayFlavor(NPC, "","","tantrum",0,0)
    end
        AddTimer(NPC,2200,"Emotes")
        
elseif Choice == 2 then   
    if not IsPlayer(GetTarget(NPC)) then
       PlayFlavor(NPC, "","","shakefist",0,0)
    end
        AddTimer(NPC,5200,"Emotes")
        
elseif Choice == 3 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","point",0,0)
    end
        AddTimer(NPC,5000,"Emotes")
        
elseif Choice == 4 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","taunt",0,0)
    end
        AddTimer(NPC,7300,"Emotes")

elseif Choice == 5 then   
    if not IsPlayer(GetTarget(NPC)) then
        PlayFlavor(NPC, "","","glare",0,0)
    end
        AddTimer(NPC,6300,"Emotes")
    end
    
else --If Recently Called Out to Player
        AddTimer(NPC,7000,"Emotes")
    end    
end

function Qwergo(NPC,Spawn)
    local zone = GetZone(NPC)
    local QwergoGnome = GetSpawnByLocationID(zone,420562)
    SetTarget(NPC,QwergoGnome)
    FaceTarget(NPC, QwergoGnome)
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
    if GetQuestStep(Spawn,VlepoPlan) ==1 then
    PlayFlavor(NPC,"","Why you return? I don't see Shinska's weapon?","shrug",0,0,Spawn)
    else
    Dialog1(NPC,Spawn)
    end
end
end


function Dialog1(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My son and I runs a reputable business. Only good quality items do we sell. Those thieving Togglesmeets will steal from you, so you wants to buy from us!")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1046.mp3",0,0)
	

    if CanReceiveQuest(Spawn, VlepoPlan) then
	Dialog.AddOption("You must have quite the selection!", "Dialog2")
    elseif GetQuestStep(Spawn, VlepoPlan)==2 then
	Dialog.AddOption("Here is a weapon from Shinska's you wanted.", "Dialog3")
    end
	Dialog.AddOption("How about I just browse your wares.")
	Dialog.Start()
end

function Dialog2(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, yes we do. My son and I were here first. We were selling all types of items, then those gnomes moved in. I'll put a stop to it soon! Maybe for some money you help me?")
    PlayFlavor(NPC, "","","agree",0,0, Spawn)
    if CanReceiveQuest(Spawn, VlepoPlan) then
	Dialog.AddOption("If there is coin involved, I would be happy to.", "Offer")
    end
	Dialog.AddOption("Not right now. I'm busy.")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,VlepoPlan)
end

function Dialog3(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Good, good. I know my plan will work. Tonight when the gnomes leave, I slip in and put this weapon in their stall. Later, I call over Ogre Guard and tell him that the Shinska is missing a weapon. Dumb Ogre comes over here and checks my honest and clean merchandise, and then he sees the gnomes and smashes them into the ground. Here's your money. Now, you no say anything, you got it?")
    PlayFlavor(NPC, "","","scheme",0,0, Spawn)
	Dialog.AddOption("See what? I didn't see a thing...")
	Dialog.Start()
	SetStepComplete(Spawn,VlepoPlan,2)
end

--Whydo we even care?  Those gnomes will blow themselves up one of these days, anyway.
--Oh, yes we do. My son and I were here first. We were selling all types of items, then those gnomes moved in. I'll put a stop to it soon! Maybe for some money you help me?
function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "", "You like good wares? You come to my stall!", "", 0, 0, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_2/ft/service/alchemist/ratonga_alchemist_service_evil_2_hail_gm_edc44700.mp3", "I need to get some eye of griffin, a bear's paw, the heart of an innocent man--that'll be tough in this city!", "confused", 3775164756, 640959658, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_2/ft/service/alchemist/ratonga_alchemist_service_evil_2_hail_gm_2a2e86d7.mp3", "Poison testers, it's been my biggest seller for the past several months.  Of course, poison was a close second. ", "ponder", 968328188, 2082601565, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_2/ft/service/alchemist/ratonga_alchemist_service_evil_2_hail_gm_3e1da8c1.mp3", "Be careful what you touch in here.  You're liable to kill us all!", "tapfoot", 299699712, 1352254492, Spawn, 0)
    end
end