--[[
	Script Name		: SpawnScripts/TempleStreet/ArmsdealerShinska.lua
	Script Purpose	: Armsdealer Shinska
	Script Author	: Dorbin
	Script Date		: 10/31/2023
	Script Notes	: 
--]]
require "SpawnScripts/Generic/DialogModule"

local TrollsAndArms = 5618
local VlepoPlan = 5917
local Netherot = 5918

function spawn(NPC)
    ProvidesQuest(NPC,Netherot)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else
    if GetQuestStep(Spawn, TrollsAndArms) == 1 then
        SetStepComplete(Spawn, TrollsAndArms, 1)
    end
    Dialog1(NPC, Spawn)
end
end

--Ahh ... that is very good. The Shinska will remembers that you offered her helps. You go into the sewers and finds the Netherot Chanters. Kills the beasts. That will teach them not to say bad things about the Shinska. Comes back and I give you reward, yes?
--Yes. I sells many weapons to many people, Shinska do. I consider selling new, enchanted weapons, but since those horrid Netherots told peoples not to do business with the Shinska, no one will makes my enchanted weapons. You help the Shinska with this, no?
--The Shinska doesn'ts buy weapons from trolls. She buys weapons from a humans who makes Shinska a very good deal. I will sells to the troll, but I will not buys from him.  
--You no haves money. You can't buy Shinska weapons. Go away!
--You no kills the beasts? Shinska's not happy! Go kills them now!


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	if GetQuestStep(Spawn,Netherot) ==1 then
        PlayFlavor(NPC, "","","swear",0,0, Spawn)
	    Dialog.AddDialog("You no kills the beasts? Shinska's not happy! Go kills them now!")
        Dialog.AddOption("I'll crawl into the sewer when I'm ready!")
    else
	    Dialog.AddDialog("You need weapons on your journey. You come see Shinska... you come see her now!")
	    Dialog.AddVoiceover("voiceover/english/optional5/arms_dealer_shinska/ks_rarmdlrshinska_callout_64.mp3", 1984880476, 917173949)
        Dialog.AddOption("I am not interested.")
	    end
    if GetQuestStep(Spawn, VlepoPlan)==1 then 
    Dialog.AddOption("[Lie] Haven't you heard? You are in danger!","Dialog2")
    end
    if CanReceiveQuest(Spawn,Netherot)  then 
    Dialog.AddOption("Your buisness appears to be doing well.","Dialog5")
    elseif GetQuestStep(Spawn,Netherot)==2  then
    Dialog.AddOption("I have killed some netherot chanters.","Dialog6")
    end
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Shinska has not heard... Why is Shinska in danger? It better nots be those trolls again! Tell me!")
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
    if GetQuestStep(Spawn, VlepoPlan)==1 then 
    Dialog.AddOption("The gnomes are plotting to take over your business!","Dialog2Gnome")
    Dialog.AddOption("The Overlord is sending the Militia to confiscate your goods!","Dialog3")
    Dialog.AddOption("The trolls! Yes! They are angry about the weapons sold them!","Dialog2Troll")
    end
    Dialog.AddOption("Wait, I was mistakened.")
	Dialog.Start()
end


function Dialog2Gnome(NPC, Spawn)
	Dialog.AddDialog("Gnomes? Hehehe! Shinksa not worried about little gnomes and their business. Shinksa just gut them!")
    PlayFlavor(NPC, "","","chuckle",0,0, Spawn)
    Dialog.AddOption("I mean...the Militia is coming to confiscate your goods!","Dialog3")
    Dialog.AddOption("Actually..the trolls! Yes! They are coming to eat you!","Dialog2Troll")
    Dialog.Start()
end

function Dialog2Troll(NPC, Spawn)
	Dialog.AddDialog("Trolls want to eat me?... No no. Shinksa do business with them! They wouldn't want that...")
    PlayFlavor(NPC, "","","confused",0,0, Spawn)
    Dialog.AddOption("I mean... the Militia is coming to confiscate your goods!","Dialog3")
    Dialog.AddOption("Actually... gnomes are plotting to take over your business!","Dialog2Gnome")
    Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What?! Where?!... They weres already dead when Shinksa found their weapons! Shinksa must knows!")
    PlayFlavor(NPC, "","","boggle",0,0, Spawn)
    Dialog.AddOption("They'll be here soon! Look out behind you!","Dialog4")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
    local zone = GetZone(NPC)
    local Spezi = GetSpawnByLocationID(zone, 420509)
	FaceTarget(NPC, Spezi)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("...")
    PlayFlavor(NPC, "","","doubletake",0,0, Spawn)
    Dialog.AddOption("[ Quietly steal a weapon off the display ]","DialogSwipe")
	Dialog.Start()
end



function DialogSwipe(NPC, Spawn)
    local Heading = GetHeading(NPC)
    if Heading <  100 then
    PlayFlavor(Spawn, "", "", "converse_male06", 0, 0,NPC)
    SendMessage(Spawn,"You've obtained a weapon at random from Shinska's display.")
    SetStepComplete(Spawn,VlepoPlan,1)
    else
        SendPopUpMessage(Spawn,"Shinksa has spotted you!",250,0,0)
        SendMessage(Spawn,"Shinksa has spotted you!","red")
        PlayFlavor(NPC,"","Hey! Shinksa sees you. Pay up or keep your hands off mys weapons!","shakefist",0,0,Spawn)
	    FaceTarget(NPC, Spawn)
        PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
    end
end

function Dialog5(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes. I sells many weapons to many people, Shinska do. I consider selling new, enchanted weapons, but since those horrid Netherots told peoples not to do business with the Shinska, no one will makes my enchanted weapons. You help the Shinska with this, no?")
    PlayFlavor(NPC, "","","agree",0,0, Spawn)
    Dialog.AddOption("Perhaps I could look into this for you.","Offer")
    Dialog.AddOption("I don't think so!")
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,Netherot)
end

function Dialog6(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Shinska says to you, \"thanks you,\" she does. Here is your coin. Now maybes other chanters comes to the Shinska and makes her weapons very magically!")
    PlayFlavor(NPC, "","","scheme",0,0, Spawn)
    Dialog.AddOption("Even so, I hope this helps improve your wares.")
	Dialog.Start()
	SetStepComplete(Spawn,Netherot,2)
end

function RandomGreeting(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/optional5/arms_dealer_shinska/ks_rarmdlrshinska_callout_64.mp3", "You need weapons on your journey. You come see Shinska... you come see her now!", "", 1984880476, 917173949, Spawn, 0)
end