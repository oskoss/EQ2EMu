--[[
	Script Name     : SpawnScripts/FarJourneyFreeport/CaptainVarlos.lua
	Script Author   : Cynnar
	Script Date     : 2019.09.28 03:09:56
	Script Notes    : 
	Script Purpose  : 
--]]
dofile("SpawnScripts/Generic/SubClassToCommoner.lua")

get_attention_animation = true
needs_selection_help = true
finished_hailed = false
finished_where_am_I = false
finished_who_are_you = false
finished_how_did_I_get_here = false
finished_where_are_we_headed = false
finished_high_winds_1 = false
finished_high_winds_2 = false
finished_high_winds_3 = false
seen_quest_praise = false

function GenerateStateDefines(player)
    local bLegacy = (GetClientVersion(player) <= 526)
    
    if bLegacy then
        VSTATE_WAVE = 883
        VSTATE_HELLO = 318
        VSTATE_DOUBLETAKE = 250
        VSTATE_CROUCH_ENTER = 219
        VSTATE_CROUCH_EXIT = 220
        VSTATE_SQUEAL = 631
        VSTATE_POINT = 429
        VSTATE_COMBAT_TURN_LEFT = 210
        VSTATE_OUCH = 403
        VSTATE_CRINGE = 218
        VSTATE_SALUTE = 520
        VSTATE_SQUARE = 630
    else
        VSTATE_WAVE = 13287
        VSTATE_HELLO = 11682
        VSTATE_DOUBLETAKE = 11415
        VSTATE_CROUCH_ENTER = 219
        VSTATE_CROUCH_EXIT = 220
        VSTATE_SQUEAL = 12979
        VSTATE_POINT = 12028
        VSTATE_COMBAT_TURN_LEFT = 11210
        VSTATE_OUCH = 11911
        VSTATE_CRINGE = 11256
        VSTATE_SALUTE = 12167
        VSTATE_SQUARE = 12978
    end
end

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)

end

function get_attention_init(NPC, player)
	InstructionWindow(player, -1.0, "Captain Varlos looks like he is trying to get your attention.", "voiceover/english/narrator/boat_06p_tutorial02/narrator_027_30c39009.mp3", 2146230300, 3258594756, "captain_attention", "", "continue")
	AddTimer(NPC, 100, "get_attention", 1, player)
end

function get_attention(NPC, player)	
	FaceTarget(NPC, player)
	GenerateStateDefines(player)
	SendStateCommand(NPC, VSTATE_WAVE)
	AddTimer(NPC, math.random(2000, 3000), "stop_get_attention", 1, player)	
end

function stop_get_attention(NPC, player)
	SendStateCommand(NPC, 0)
	if get_attention_animation and HasQuest(player, 524) and GetQuestStep(player, 524) == 7 then
		AddTimer(NPC, 500, "get_attention", 1, player)
	end
end

function hailed(NPC, player)
    FaceTarget(NPC, player)
    GenerateStateDefines(player)
	SendStateCommand(GetSpawn(NPC, 270000), VSTATE_HELLO)
	SendStateCommand(GetSpawn(NPC, 270000), 0)
	if not HasQuest(player, 524) and not HasCompletedQuest(player, 524) then
	SetTarget(NPC,player)    
    if GetClientVersion(player)<= 546 then --GOBLIN ANIMATIONS
	AddTimer(GetSpawn(NPC, 270008), 100, "idle_loop")
	else
	AddTimer(GetSpawn(NPC, 270008), 100, "NonDoF_idle_loop")
    end	    
        InstructionWindowClose(player)
		needs_selection_help = true
		finished_hailed = false
		finished_where_am_I = false
		finished_who_are_you = false
		finished_how_did_I_get_here = false
		finished_where_are_we_headed = false
		finished_high_winds_1 = false
		finished_high_winds_2 = false
		finished_high_winds_3 = false
		Dialog.New(NPC, player)
		Dialog.AddDialog("Ahoy! 'Tis good to see you awake. Ya seem a little squiffy, least ya' cheated death!")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_001.mp3", 1930075150, 2666442405)
		Dialog.AddEmote("hello")
        if GetClass(player)>0 then
 	    Dialog.AddOption("There must be a mistake.  I'm just a commoner. [CLASSIC CLASS CHANGE]", "Commoner")
        end    
		Dialog.AddOption("Where am I?", "where_am_I")
		Dialog.Start()		
		AddTimer(NPC, 8000, "hailed_instructions", 1, player)
	elseif HasQuest(player, 524) and GetQuestStep(player, 524) <= 6  then
        PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_010.mp3", "Back ye up a few paces. I be needin' this room.", "", 2009097517, 3594231199, player, 0)	    
	elseif HasQuest(player, 524) and GetQuestStep(player, 524) == 7 then
		SetTutorialStep(player, 32)
		Dialog.New(NPC, player)
		Dialog.AddDialog("Avast ye! We need to talk.")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_011.mp3", 570868734, 3287597835)
		Dialog.AddOption("What is it?", "quest_step_7a")
		Dialog.Start()
		get_attention_animation = false
	elseif HasQuest(player, 524) and GetQuestStep(player, 524) == 8 then
		PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_015.mp3", "Blimey! Ya' tryin to cause a mutiny? I told you to kill those rats, now do it ya landlubber!", "", 1239213594, 177688376, player, 0)
	elseif HasQuest(player, 524) and GetQuestStep(player, 524) == 10 then
		PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_023.mp3", "You still need to kill that landlubber of a goblin! Get to it mate!", "", 3269557913, 3104212801,player)
	elseif HasQuest(player, 524) and GetQuestStep(player, 524) == 9 then
		SetTutorialStep(player, 51)
		Dialog.New(NPC, player)
		Dialog.AddDialog("Ya' made quick work of them vermin.")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_016.mp3", 1130776869, 4119313971)
		Dialog.AddOption("Thanks.", "quest_step_9")
		Dialog.Start()
	elseif HasCompletedQuest(player, 524) and not seen_quest_praise then
		seen_quest_praise = true
		Dialog.New(NPC, player)
		Dialog.AddDialog("Arr! Ya saved the Far Journey and me crew! Seems ya' proved ta' be quite a hero.  Well, with the help of that young lass there, ya' do.")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_024.mp3", 998172564, 1159207795)
		-- Todo: Add missing gesture/emote
		Dialog.AddOption("It was nothing.", "quest_completed")
		Dialog.Start()
	elseif HasCompletedQuest(player, 524) then
		Dialog.New(NPC, player)
		Dialog.AddDialog("So, ya' ready ta go ashore matey?")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_027.mp3", 2285948102, 2994720481)
		Dialog.AddOption("Yes. Send me to the Isle of Refuge!", "ready_to_go_ashore")
		Dialog.AddOption("No. I would like some more time.", "conversation8_2")
		Dialog.Start()
	end
end


function Commoner(NPC, player)
		FaceTarget(NPC, player)
		Dialog.New(NPC, player)
		Dialog.AddDialog("Me apologies. Are you sure?  This can't be undone. We'll take you to The Isle of Refuge if that is the case.")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_002.mp3", 2054400186, 1976167819)
		Dialog.AddEmote("ponder")
		Dialog.AddOption("Yes, I am a Commoner.", "Commoner2")
		Dialog.AddOption("Nevermind.  Who are you?","who_are_you")
		Dialog.Start()
end


function Commoner2(NPC,player)
    PlayFlavor(NPC, "", "", "grumble", 0, 0, player, 0)
	Dialog.New(NPC, player)
	Dialog.AddDialog("Ya' know, me hates doing paperwork! Arrrr!")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/tutorial_island02_fvo_hail2.mp3", 724307296, 1739482284)
	Dialog.AddOption("Thank you.  Now, where are am I?", "who_are_you")
	Dialog.Start()
    RemoveGear(NPC,player)
    AddTimer(NPC,2000,"ClassSet",1,player)
end

function ClassSet(NPC,player)
	SetAdventureClass(player,0)
	SendMessage(player, "You are now a Commoner.")
    SendPopUpMessage(player, "You are now a Commoner.", 255, 255, 255)
    SetPlayerLevel(player,1)
if GetTradeskillClass(player)>0 then
    SetTradeskillClass(player,0)
end
end

function quest_completed(NPC, player)
	Dialog.New(NPC, player)
	Dialog.AddDialog("There be the Island of Refuge, get ready ta' drop anchor. Just let me know when ya' want ta' go ashore.")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_025.mp3", 3643967618, 2645907420)
	Dialog.AddOption("Ok.", "drop_anchor")
	Dialog.Start()
end

function drop_anchor(NPC, player)
    
	Dialog.New(NPC, player)
	Dialog.AddDialog("Ingrid! Swing the lead and prepare to drop anchor!")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_026.mp3", 3011518245, 3851752713)
	Dialog.AddOption("[Continue]", "hailed")
	Dialog.Start()
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 4.21, -2.07, 3.72, 4,0)
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 1.97, 0.59, 16.73, 4,0)
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 1.07, 0.66, 18.69, 4,20)
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 1.07, 0.66, 18.69, 2,0)
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 1.97, 0.59, 16.73, 2,0)
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 4.21, -2.07, 3.72, 2,0)
		MovementLoopAddLocation(GetSpawn(NPC, 270001), 2.91, -2.07, -3.61, 2,120)
	end

function ready_to_go_ashore(NPC, player)
	Dialog.New(NPC, player)
	Dialog.AddDialog("Don't ya' mind, we get paid ta' do that.")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_028.mp3", 1009737776, 2173458794)
	Dialog.AddOption("Good point.", "zone_to_isle")
	Dialog.Start()
end

function zone_to_isle(NPC, player)
	serverType = GetRuleFlagInt32("R_World", "StartingZoneRuleFlag")
	-- if no server type is set (default of 0 wildcard) or odd number means bit 1 is set
	if serverType == 0 or (serverType % 2) == 1 then
		-- DoF alignment, 0 = evil (Outpost of Overlord), 1 = good (Queens Colony)
		alignment = GetAlignment(player)
		if GetClass(player) == 0 then -- isle of refuge (Commoners are sent here automatically)
          ZoneRef = GetZone("IsleRefuge1")
            Zone(ZoneRef,player)  
		
		elseif alignment == 0 then
			Zone(GetZone(278), player) -- outpost of overlord
		else
			Zone(GetZone(253), player) -- queens colony
		end
	        -- even value serverType > 0 (return 0) means isle of refuge (bit 2) is set
	    else
		Zone(GetZone(325), player) -- isle of refuge (Commoners are sent here automatically)
	end
end

function quest_step_9(NPC, player)	
    if GetClientVersion(player)<= 546 then
	AddTimer(GetSpawn(NPC, 270013), 100, "attack")
	else
	AddTimer(GetSpawn(NPC, 270013), 100, "NonDoFattack")
    end	    
	AddTimer(NPC, 1000, "quest_step_9b", 1, player)	
end

function quest_step_9b(NPC, player)
	FaceTarget(NPC, GetSpawn(NPC, 270013))
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_017.mp3", "Wait. Tis that a... No, it cain' be!", "", 1253231512, 1752159147)
	AddTimer(NPC, 4000, "quest_step_9c", 1, player)	
	GenerateStateDefines(player)
	SendStateCommand(GetSpawn(NPC, 270005), VSTATE_DOUBLETAKE)	
end

function quest_step_9c(NPC, player)	
	Drake = GetSpawn(NPC, 270013)
	
	Anikra = GetSpawn(NPC, 270006)	
	Valik = GetSpawn(NPC, 270005)	
	Geredo = GetSpawn(NPC, 270004)
	Vim = GetSpawn(NPC, 270007)
	
	FaceTarget(Anikra, Drake)
	FaceTarget(Valik, Drake)	
	FaceTarget(Geredo, Drake)		
	
	GenerateStateDefines(player)
	SendStateCommand(Anikra, VSTATE_POINT)
	SendStateCommand(Valik, VSTATE_POINT)
	SendStateCommand(Geredo, VSTATE_POINT)
	
	SendStateCommand(GetSpawn(NPC, 270001), VSTATE_CROUCH_ENTER)
	SendStateCommand(GetSpawn(NPC, 270007), VSTATE_SQUEAL)
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_018.mp3", "Quick! Ingrid, secure th'loot! Thar be a Drakota off the bow! Quick now! Secure those chests!", "", 3607547478, 39534308)
    MoveToLocation(Vim, -0.27, 0.56, 15.78,4)
    MoveToLocation(Vim, 2.15, 0.55, 15.60,4)
    MoveToLocation(Vim, 5.84, -1.82, 9.84,4)
	AddTimer(NPC, 8000, "VimHeading")	
	AddTimer(NPC, 9000, "quest_step_9d", 1, player)	
end

function VimHeading(NPC, player)	
	Vim = GetSpawn(NPC, 270007)
	SetHeading(Vim, 78)
end

function quest_step_9d(NPC, player)	
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_019.mp3", "Everyone down! Watch it!", "", 2065401462, 2542613809)
	GenerateStateDefines(player)
	SendStateCommand(GetSpawn(NPC, 270007), VSTATE_CROUCH_ENTER)
	SendStateCommand(GetSpawn(NPC, 270001), VSTATE_CROUCH_EXIT)
	SendStateCommand(GetSpawn(NPC, 270004), VSTATE_COMBAT_TURN_LEFT)
	SendStateCommand(GetSpawn(NPC, 270006), VSTATE_OUCH)
	SendStateCommand(GetSpawn(NPC, 270005), VSTATE_CRINGE)
	SendStateCommand(GetSpawn(NPC, 270002), VSTATE_CRINGE)
	AddTimer(NPC, 3500, "quest_step_9e", 1, player)
	i=1
	spawns = GetSpawnListBySpawnID(player, 270011)
	repeat
		cage = GetSpawnFromList(spawns, i-1)
		if cage then
			Despawn(cage)			
		end
		i = i + 1
	until cage == Nil
end

function quest_step_9e(NPC, player)
	PerformCameraShake(player, 0.699999988079071)	
	PerformCameraShake(player, 0.5)	
	PerformCameraShake(player, 0.30000001192092896)
	PerformCameraShake(player, 0.10000000149011612)
	AddTimer(NPC, 3500, "quest_step_9f", 1, player)
end

function quest_step_9f(NPC, player)		
	AddTimer(NPC, 3500, "quest_step_9g", 1, player)
end

function quest_step_9g(NPC, player)	
	AddTimer(NPC, 3000, "quest_step_9h", 1, player)	
end

function quest_step_9h(NPC, player)
    GenerateStateDefines(player)
	SendStateCommand(GetSpawn(NPC, 270001), 0)
	SendStateCommand(GetSpawn(NPC, 270004), 0)
	SendStateCommand(GetSpawn(NPC, 270006), 0)
	SendStateCommand(GetSpawn(NPC, 270005), 0)
	SendStateCommand(GetSpawn(NPC, 270002), 0)	
	SendStateCommand(GetSpawn(NPC, 270007), VSTATE_CROUCH_EXIT)
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_020.mp3", "Blimey! That was close! It has been near two months since the last reported sightings of one of them.", "", 814285897, 1688547621)
	AddTimer(NPC, 6000, "quest_step_9i", 1, player)	
end

function quest_step_9i(NPC, player)	
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_021.mp3", "That damnable goblin has escaped. An' look, me beautiful ship is on fire!", "", 1401094820, 2183903275)
	AddTimer(NPC, 6000, "quest_step_9j", 1, player)
end

function quest_step_9j(NPC, player)	
	SetStepComplete(player, 524, 9)
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_022.mp3", "Ye must put an end to 'is life, afore he tears me ship apart!", "", 2385052787, 1324494518)
end

function quest_step_7a(NPC, player)
	Dialog.New(NPC, player)
	Dialog.AddDialog("Well, 'tis a bit of a problem. Ya' see, there be rats on board. The vermin keep eating the supplies and I need ya' to go feed them to the deep, afore they eat anything else.")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_012.mp3", 705765462, 3202743441)
	Dialog.AddOption("So you want me to kill them?", "quest_step_7b")
	Dialog.Start()
end

function quest_step_7b(NPC, player)
	Dialog.New(NPC, player)
	Dialog.AddDialog("Yar! That's what we be needin'.")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_013.mp3", 3880459741, 170861362)
	Dialog.AddOption("How do you expect me to kill them?", "quest_step_7c")
	Dialog.Start()
end

function quest_step_7c(NPC, player)
	Dialog.New(NPC, player)
	Dialog.AddDialog("Wit this 'ere club. It is nice and splintered, sure ta' cause them some pain.")
	Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_014.mp3", 2083163804, 202693960)
    Dialog.AddOption("Aye, aye, Captain!", "quest_step_7d")
	Dialog.Start()
end

function quest_step_7d (NPC,player)
	SetStepComplete(player, 524, 7) 
end

function hailed_instructions(NPC, player)	
	if needs_selection_help then
		InstructionWindowGoal(player,0)	
		InstructionWindowClose(player)
		InstructionWindow(player, -1.0, "To respond to the Captain and other characters you will meet, left click on the response text.", "voiceover/english/narrator/boat_06p_tutorial02/narrator_006_7521b625.mp3", 3936228257, 1877316160, "tutorial_stage_8", "Left click on one of the response options.", "server")
		needs_selection_help = false
	end
end

function where_am_I(NPC, player)
	finished_hailed = true
	--[[Say(NPC, "Testing function call")
	drake = GetSpawn(player, 270013)
	SendStateCommand(drake,65")
	Say(drake, "attacking")
	AddTimer(drake, 40000, "drake_rain")
	--]]
	if needs_selection_help then
		needs_selection_help = false
	else
		InstructionWindowGoal(player, 0)	
		InstructionWindowClose(player)	
	end
	if not finished_where_am_I then
		FaceTarget(NPC, player)
		Dialog.New(NPC, player)
		Dialog.AddDialog("Me apologies.")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_002.mp3", 2054400186, 1976167819)
		Dialog.AddEmote("bow")
		Dialog.AddOption("Who are you?", "who_are_you")
		Dialog.Start()
	end
end

function who_are_you(NPC, player)
	if not finished_who_are_you then
		finished_where_am_I = true
		FaceTarget(NPC, player)
		Dialog.New(NPC, player)
		Dialog.AddDialog("I am Captain Draik Varlos, and this 'ere fine ship is the Far Journey.")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_003.mp3", 2565389482, 560555759)
		Dialog.AddOption("How did I get here?", "how_did_I_get_here")
		Dialog.Start()
	end
end

function how_did_I_get_here(NPC, player)
	finished_who_are_you = true
	if not finished_how_did_I_get_here then
		FaceTarget(NPC, player)
		Dialog.New(NPC, player)
		Dialog.AddDialog("Me hearties pulled ya' from the sea, you an those other bilge rats. Do ya' remember?")
		Dialog.AddVoiceover("voiceover/english/captain_varlos/boat_06p_tutorial02/varlos_0_004.mp3", 29296168, 2709023783)
		Dialog.AddOption("Vaguely. Where are we headed?", "where_are_we_headed")
		Dialog.Start()
	end
end

function where_are_we_headed(NPC, player)
	finished_how_did_I_get_here = true
	if not finished_where_are_we_headed then
		FaceTarget(NPC, player)
		PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_005.mp3", "We are heading to the Island of Refuge.", "", 1602680439, 2810422278)
		AddTimer(NPC, 500, "shake_camera_medium", 1, player)
		AddTimer(NPC, 1500, "shake_camera_low", 1, player)
		AddTimer(NPC, 2500, "shake_camera_low", 1, player)	
		AddTimer(NPC, 3100, "shake_camera_low", 1, player)	
		AddTimer(NPC, 3600, "high_winds_1", 1, player)
	end
end

function shake_camera_low(NPC, player)
	PerformCameraShake(player, 0.10000000149011612)
end

function shake_camera_medium(NPC, player)
	PerformCameraShake(player, 0.20000000298023224)	
end

function shake_camera_high(NPC, player)
	PerformCameraShake(player, 0.699999988079071)
end

function high_winds_1(NPC, player)	
	finished_where_are_we_headed = true
	if finished_high_winds_1 == false then
		FaceTarget(NPC, GetSpawn(NPC, 270001))
		PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_006.mp3", "Ingrid! Quit gawking at the shorty and fix that yard-arm!", "", 2753489262, 3183736171)
		SendStateCommand(GetSpawn(NPC, 270001), 0)
		--This should be improved w/ MovementLoop to remove delay when walking
		MoveToLocation(GetSpawn(NPC, 270001), -1.86, -2.03, -8.17, 8, "", true)
		MoveToLocation(GetSpawn(NPC, 270001), -2.31, 1.21, -15.09, 8, "", true)
		MoveToLocation(GetSpawn(NPC, 270001), 1.24, 1.21, -14.47, 8, "", true)
		MoveToLocation(GetSpawn(NPC, 270001), 1.40, 1.18, -11.82, 8, "", false)
		AddTimer(NPC, 4500, "high_winds_2", 1, player)
	end
end

function high_winds_2(NPC, player)
	finished_high_winds_1 = true
	if not finished_high_winds_2 then
		FaceTarget(GetSpawn(NPC, 270001), NPC)
		SetTarget(GetSpawn(NPC, 270001), NPC)
		FaceTarget(NPC, GetSpawn(NPC, 270001))
		SetTarget( NPC,GetSpawn(NPC, 270001))
		PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_007.mp3", "Don't want the ship to come apart in these high winds, do ya'?!", "scold", 517097409, 4194681002)
		SendStateCommand(GetSpawn(NPC, 270001), 0)
		AddTimer(NPC, 4000, "high_winds_3", 1, player)
	end
end

function high_winds_3(NPC, player)
	finished_high_winds_2 = true
	if not finished_high_winds_3 then
		PlayFlavor(GetSpawn(NPC, 270001), "voiceover/english/ingrid/boat_06p_tutorial02/020_deckhand_ingrid_010_1637e047.mp3", "Aye, aye, Captain!", "salute", 1250282628, 237171958)
		GenerateStateDefines(player)
		SendStateCommand(GetSpawn(NPC, 270001), VSTATE_SALUTE)
		AddTimer(NPC, 2500, "high_winds_4", 1, player)
	end
end

function high_winds_4(NPC, player)
	finished_high_winds_3 = true
	--This should be improved w/ MovementLoop to remove delay when walking
	MoveToLocation(GetSpawn(NPC, 270001), 1.40, 1.18, -11.82, 8, "", true)
	MoveToLocation(GetSpawn(NPC, 270001), 1.24, 1.21, -14.47, 8, "", true)
	MoveToLocation(GetSpawn(NPC, 270001), -2.31, 1.21, -15.09, 8, "", true)
	MoveToLocation(GetSpawn(NPC, 270001), -1.86, -2.03, -8.17, 8, "", true)
	MoveToLocation(GetSpawn(NPC, 270001), 2.48, -2.07, -3.26, 8, "", false)
	FaceTarget(NPC, player)
	GetSpawn(nil, NPC)
	SetTarget( NPC,nil)
	SetTarget(GetSpawn(NPC, 270001), nil)
	PlayFlavor(NPC, "voiceover/english/captain_varlos/boat_06p_tutorial02_fvo_008.mp3", "Ya think she'd never seen a gnome afore.", "", 2447879193, 4289147535)
	GenerateStateDefines(player)
	SendStateCommand(GetSpawn(NPC, 270001), VSTATE_SQUARE)
	AddTimer(NPC, 500, "shake_camera_medium", 1, player)
	AddTimer(NPC, 3500, "shake_camera_high", 1, player)
	AddTimer(NPC, 5500, "shake_camera_medium", 1, player)
	AddTimer(NPC, 9500, "shake_camera_low", 1, player)	
	AddTimer(NPC, 5000, "offer_quest", 1, player)
end

function offer_quest(NPC, player)
	if HasQuest(player, 524) == false then
		OfferQuest(NPC, player, 524)
		AddTimer(NPC, 10000, "Accepted_Tutorial_Instructions", 1, player)	
	end
end

function Accepted_Tutorial_Instructions(NPC, player)
	InstructionWindowClose(player)
	ShowWindow(player, "Journals.JournalsQuest", 0)
	InstructionWindow(player, -1.0, "The Captain has given you a quest. Left click on the quest journal button to open your quest journal.", "voiceover/english/narrator/boat_06p_tutorial02/narrator_007_59f6d83b.mp3", 1470829818, 519016852, "tutorial_stage_9", "Open your quest journal. (click on the journal button)", "open JournalsQuest")
	ShowWindow(player, "MainHUD.StartMenu", 1)
	FlashWindow(player, "MainHUD.StartMenu.quest_journal", 20.0)
	SetTutorialStep(player, 8)
end

function respawn(NPC)

end
