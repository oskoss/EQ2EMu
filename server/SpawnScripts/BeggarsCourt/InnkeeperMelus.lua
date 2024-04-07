--[[
	Script Name		: SpawnScripts/BeggarsCourt/InnkeeperMelus.lua
	Script Purpose	: Innkeeper Melus
	Script Author	: Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
	 if MakeRandomInt(1, 100) <= 18 and GetFactionAmount(Spawn,12) >0 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "", "", "hello", 2131223265, 1605898906, Spawn)
 elseif  GetFactionAmount(Spawn,12) <=0 then
	    FaceTarget(NPC, Spawn)
	    PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_notcitizen_gm_85c35337.mp3", "We don't serve your pathetic kind here.  Get out of my sight!", "heckno", 4267987983, 4115199119, Spawn, 0)
    end
end   
	 

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12) >0 then
    Dialog1(NPC, Spawn)
	else
	 FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_notcitizen_gm_85c35337.mp3", "We don't serve your pathetic kind here.  Get out of my sight!", "heckno", 4267987983, 4115199119, Spawn, 0)
    end	    
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,4)
	    FaceTarget(NPC, Spawn)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_hail_gm_252bf582.mp3", "Room rates are by the night not by the hour!", "scold", 1428065610, 3259602252, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_hail_gm_a81dfaee.mp3", "Can't you see I'm busy doing some very important things now.  I don't care if there's any hot water! ", "stare", 2206861027, 3893730348, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_hail_gm_c58b0e.mp3", "What!  What do you want?", "boggle", 1358705787, 1083758044, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_hail_gm_cac7726b.mp3", "Look I'm no cook, but I was going to have some fresh kidneys myself.  You want me to get you a pair?", "shrug", 2253071510, 109270441, Spawn, 0)
	end
end

--[[function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hello, I am the Innkeeper for this district. We have received word of your arrival and have a room prepared for you.  Would you like to know more about housing?")
	Dialog.AddVoiceover("innkeeper_melus/fprt_hood04/innkeeper010.mp3", 328655352, 2391913046)
	Dialog.AddOption("Yes.", "Dialog9")
	Dialog.AddOption("No thanks.")
	Dialog.Start()
end]]--

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	local choice = MakeRandomInt(1,3)

	if choice == 1 then
    	Dialog.AddDialog("Room rates are by the night not by the hour!")
	    Dialog.AddVoiceover("voiceover/english/human_eco_evil_1/ft/service/innkeeper/human_innkeeper_service_evil_1_hail_gm_252bf582.mp3", 925112517, 1550850765)
		PlayFlavor(NPC, "", "", "scold", 0, 0, Spawn, 0)
	elseif choice == 2 then
	    Dialog.AddDialog("Can't you see I'm busy doing some very important things now.  I don't care if there's any hot water! ")
	    Dialog.AddVoiceover("voiceover/english/human_eco_evil_1/ft/service/innkeeper/human_innkeeper_service_evil_1_hail_gm_a81dfaee.mp3", 575045448, 3537343785)
		PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn, 0)
	elseif choice == 3 then
    	Dialog.AddDialog("What!  What do you want?")
	    Dialog.AddVoiceover("voiceover/english/human_eco_evil_1/ft/service/innkeeper/human_innkeeper_service_evil_1_hail_gm_c58b0e.mp3", 1602010016, 1978444643)
		PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn, 0)
	end
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What kind of housing is available to me?", "Dialog10")
	Dialog.AddOption("What is the marketboard for?", "Dialog6")
	Dialog.AddOption("What is my house for?", "Dialog5")
	Dialog.AddOption("Nothing right now.")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("To place an item in your house you must first find the item in your inventory, once you have done so right-click on the item and select the â€˜placeâ€™ option.  You will then see a tinted outline of your item in your house, when the item is highlighted green you may place it in that location, if it is highlighted red you cannot.")
	Dialog.AddVoiceover("innkeeper_uglar_splinterthumb/fprt_hood04/innkeeper002.mp3", 1857367756, 71125254)
	Dialog.AddOption("What kind of housing is available to me?", "Dialog8")
	Dialog.AddOption("What is the marketboard for?", "Dialog6")
	Dialog.AddOption("What is my house for?", "Dialog5")
	Dialog.AddOption("That's enough for now, thanks.")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The marketboard is a house item, similar to books, beds, pets and other such items.  What sets the marketboard apart from the rest however is that once your marketboard is mounted on a wall in your home you can use it to sell items to other citizens of Freeport.  These items can be purchased by your fellow citizens at a Broker.  Brokers can be found in all primary districts of the city as well as in the Tradeskill wholesalers.")
	Dialog.AddVoiceover("innkeeper_uglar_splinterthumb/fprt_hood04/innkeeper005.mp3", 2660278888, 1868873136)
	Dialog.AddOption("How do I sell items using my marketboard?", "Dialog4")
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What kind of housing is available to me?", "Dialog8")
	Dialog.AddOption("What is my house for?", "Dialog5")
	Dialog.AddOption("That's enough for now, thanks.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes.  For a fee, brokers are willing to post the goods you are willing to sell to other adventurers.  Brokers can be found in all primary districts of the city as well as in the Tradeskill wholesalers.")
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What kind of housing is available to me?", "Dialog10")
	Dialog.AddOption("What is the marketboard for?", "Dialog6")
	Dialog.AddOption("That's enough for now, thanks.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Selling through your market board works the same way as directly selling through a broker, it just allows you to do it from the comfort of your home.")
	Dialog.AddVoiceover("innkeeper_uglar_splinterthumb/fprt_hood04/innkeeper006.mp3", 2214886491, 395905537)
	Dialog.AddOption("I can sell things through a broker?", "Dialog2")
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What kind of housing is available to me?", "Dialog10")
	Dialog.AddOption("What is my house for?", "Dialog5")
	Dialog.AddOption("That's enough for now, thanks.")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You will find that your house has many uses, the first of which is the ability to store house items.  Each house has a limit to the number of house items you can place in it, so as you gain more possessions you wish to display you will need larger houses to do so.")
	Dialog.AddVoiceover("innkeeper_uglar_splinterthumb/fprt_hood04/innkeeper007.mp3", 2480708099, 1450070298)
	Dialog.AddOption("Anything else?")
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What kind of housing is available to me?", "Dialog10")
	Dialog.AddOption("What is the marketboard for?", "Dialog6")
	Dialog.AddOption("That's enough for now, thanks.")
	Dialog.Start()
end

function Dialog8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Many different kinds of housing are available in the city of Freeport.  In reward for your services, the Overlord has awarded you a one bedroom house for free at this time.")
	Dialog.AddVoiceover("innkeeper_uglar_splinterthumb/fprt_hood04/innkeeper003.mp3", 3512269476, 1166894802)
	Dialog.AddOption("Is any other housing available?", "Dialog10")
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What is the marketboard for?", "Dialog6")
	Dialog.AddOption("What is my house for?", "Dialog5")
	Dialog.AddOption("That's enough for now, thanks.")
	Dialog.Start()
end

function Dialog10(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes, the grand city of Freeport has houses ranging from the basic one bedroom model on up to 5 bedroom apartments, although the most ostentatious of these are only available to the most prestigious citizens of the city.")
	Dialog.AddVoiceover("innkeeper_uglar_splinterthumb/fprt_hood04/innkeeper004.mp3", 1780122794, 3374523197)
	Dialog.AddOption("How can I place an item in my house?", "Dialog7")
	Dialog.AddOption("What is the marketboard for?", "Dialog6")
	Dialog.AddOption("What is my house for?", "Dialog5")
	Dialog.AddOption("Thatâ€™s enough for now, thanks.")
	Dialog.Start()
end

