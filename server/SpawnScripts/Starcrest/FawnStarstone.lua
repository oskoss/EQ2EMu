--[[
	Script Name	: SpawnScripts/Starcrest/FawnStarstone.lua
	Script Purpose	: Fawn Starstone 
	Script Author	: John Adams
	Script Date	: 2008.09.23
	Script Notes	: Recreated dialog / movement loop - 07.04.2022
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
ProvidesQuest(NPC,241)
waypoints(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,11)<0 then
    FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
elseif not HasCompletedQuest(Spawn,241) then
   Dialog2(NPC, Spawn)
else
DialogFinish(NPC, Spawn)
end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Wonderful! Thank you so much.")
	Dialog.AddOption("I'll be back.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "", "", "hello", 0, 0, Spawn)
	Dialog.AddDialog("Welcome to the village!  I hope you find everything you need.  I wish I had!")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_3_1051.mp3", 0, 0)
    if not HasQuest(Spawn,241) and not HasCompletedQuest(Spawn,241) and GetLevel(Spawn) >= 8 then
	Dialog.AddOption("What do you mean, you wish you had?", "Dialog4")
    end
    if GetQuestStep(Spawn,241)==4 then
	Dialog.AddOption("I've managed to gather all the components you needed to start your garden.","Turnin")
    end        
	Dialog.AddOption("Thanks for the welcome!  See you around!")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
	Dialog.AddDialog("Oh I suppose I'll need some seeds too. And I don't just need soil, I need things to enrich the soil I already have. I'd like to get some diatomaceous sand from the crabs of Antonica. I believe fish eggs would help with that too, so I'd like some of those as well. As for seeds, I'm sure you can collect some stuck to the fur of some of the mammals that wander around Antonica. If you could bring me all of these items it would help me greatly!")
	Dialog.AddOption("I can get them.", "QuestOffer")
	Dialog.AddOption("Ugh! Animal bits and dirt are not my kind of thing. Sorry")
	Dialog.Start()
end

function QuestOffer(NPC, Spawn)
    OfferQuest(NPC, Spawn, 241)
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "", "", "sigh", 0, 0, Spawn)
	Dialog.AddDialog("Well ... I hate to complain, but I thought the village would have more trees. Yes, I know ... I could move elsewhere, but I've come to love my new home.  Hmm... I wonder... would you help me bring a little more greenery to the area?")
	Dialog.AddOption("What do you have in mind?", "Dialog5")
	Dialog.AddOption("I'm sorry, I haven't time right now.")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddDialog("It would be nice to have more trees, but that's not practical. I'm building a garden behind my house, so I can look at it and imagine the whole village is verdant. The first thing I need is soil.")
	Dialog.AddOption("Where can I find some?", "Dialog3")
	Dialog.Start()
end

function Turnin(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "", "", "happy", 0, 0, Spawn)
    SetStepComplete(Spawn, 241,4)
	Dialog.AddDialog("Bless you! This is wonderful.  They say one good turn deserves another. This isn't much payment considering what you've done for me, but I hope you put it to good use.")
	Dialog.AddOption("Good luck with your garden.")
	Dialog.Start()	
end	


function DialogFinish(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I love sitting in my garden and listening to the birds sing.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_2_1051.mp3", 0, 0)
	Dialog.AddOption("Your garden is looking great! Good day, Fawn.")
	Dialog.Start()	
end	


function waypoints(NPC)
	MovementLoopAddLocation(NPC, 790.03, -24.51, 319.99, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 787.37, -24.37, 319.13, 2, 0)
	MovementLoopAddLocation(NPC, 786.44, -24.37, 319.93, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 786.18, -24.39, 320.32, 2, 0)
	MovementLoopAddLocation(NPC, 786.67, -24.41, 320.92, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 789.61, -24.48, 319.66, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 788.61, -24.49, 321.21, 2, 0)
	MovementLoopAddLocation(NPC, 787.63, -24.45, 321.31, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 788.55, -24.43, 319.33, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 787.63, -24.45, 321.31, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 788.61, -24.49, 321.21, 2, 0)
	MovementLoopAddLocation(NPC, 789.61, -24.48, 319.66, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 786.67, -24.41, 320.92, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 786.18, -24.39, 320.32, 2, 0)
	MovementLoopAddLocation(NPC, 786.44, -24.37, 319.93, 2, 15,"InitialPause")
	MovementLoopAddLocation(NPC, 787.37, -24.37, 319.13, 2, 0)
	MovementLoopAddLocation(NPC, 790.03, -24.51, 319.99, 2, 15,"InitialPause")
end





function InitialPause(NPC)
    local GatherSpawn = GetSpawn(NPC, 2340032)	-- Get Paula Marx

    math.randomseed(os.time())
    local pause = math.random (1, 4)

            if pause == 1 then
                    AddTimer(NPC, 100, "stop_gathering")  
            else
                    AddTimer(NPC, 1000, "Gather")
            end 
end


function Gather(NPC)
    local GatherSpawn = GetSpawn(NPC, 2340032)	--
    PlayFlavor(NPC,"","","gathering_search",0,0)
    AddTimer(NPC, 5000, "Collect")	        -- for 5 seconds, then stop
end

function Collect(NPC)
    local GatherSpawn = GetSpawn(NPC, 2340032)
    PlayFlavor(NPC,"","","gathering_success",0,0)
    AddTimer(NPC, 2000, "stop_gathering")	-- for 5 seconds, then stop
end

function stop_gathering(NPC)
    local GatherSpawn = GetSpawn(NPC, 2340032)
    SpawnSet(NPC, "visual_state", "0") 	        -- Stop her from gathering
end

--[[346077)[Sun Apr 24 08:34:37 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"Welcome to the village!  I hope you find everything you need.  I wish I had!"
	Line  129215: (1114346077)[Sun Apr 24 08:34:37 2005] You say,"Hail, Fawn Starstone"
	Line  129216: (1114346080)[Sun Apr 24 08:34:40 2005] You say to Fawn Starstone,"What do you mean, you wish you had?"
	Line  129217: (1114346080)[Sun Apr 24 08:34:40 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"Well ... I hate to complain, but I thought the village would have more trees. Yes, I know ... I could move elsewhere, but I've come to love my new home.  Hmm... I wonder... would you help me bring a little more greenery to the area?"
	Line  129218: (1114346082)[Sun Apr 24 08:34:42 2005] You say to Fawn Starstone,"What do you have in mind?"
	Line  129219: (1114346082)[Sun Apr 24 08:34:42 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"It would be nice to have more trees, but that's not practical. I'm building a garden behind my house, so I can look at it and imagine the whole village is verdant. The first thing I need is soil."
	Line  129220: (1114346084)[Sun Apr 24 08:34:44 2005] You say to Fawn Starstone,"The soil?"
	Line  129222: (1114346087)[Sun Apr 24 08:34:47 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"Yes, the soil. I need you to get the scat of fifteen young timber wolves. I'll use it as fertilizer to nourish the plants in my new garden. Sure you don't mind?"
	Line  129223: (1114346100)[Sun Apr 24 08:35:00 2005] You say to Fawn Starstone,"Not at all; it's a pleasure."
	Line  129224: (1114346100)[Sun Apr 24 08:35:00 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"Bless you! You'll find the wolves all over Antonica. I'll meet you back here later. I wonder what I should plant first...?"
	Line  129225: (1114346102)[Sun Apr 24 08:35:02 2005] You say to Fawn Starstone,"See you soon."
	Line  130162: (1114350616)[Sun Apr 24 09:50:16 2005] \aPC 4087435 Trotsky:Trotsky\/a says,"Hail, Fawn Starstone"
	Line  131105: (1114354648)[Sun Apr 24 10:57:28 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"That was quick!  Thank you very much!  Oh, this is perfect!  Putting this into the soil allows it to drain much better, you know.  And it adds essential nutrients to help the little plants get off to a good start."
	Line  131106: (1114354648)[Sun Apr 24 10:57:28 2005] You say,"Hail, Fawn Starstone"
	Line  131107: (1114354651)[Sun Apr 24 10:57:31 2005] You say to Fawn Starstone,"It was nothing.  Did you need anything else?"
	Line  131108: (1114354651)[Sun Apr 24 10:57:31 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"No, no! You've done plenty for me already ... But, lately my back has been hurting me terribly. Gracious! I'm complaining again! I hate to impose ... but you can do one more thing for me."
	Line  131109: (1114354655)[Sun Apr 24 10:57:35 2005] You say to Fawn Starstone,"Glad to be of assistance.  What can I do?"
	Line  131110: (1114354655)[Sun Apr 24 10:57:35 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"I appreciate you going out of your way like this.  A handful of Coldwind octopus beaks would add more vigor to the garden, or so I'm told. You'll find the octopi near the coast outside of Qeynos. One of my neighbors thinks I'm part wood elf with all my fiddling in my garden! Maybe she's right!"
	Line  131111: (1114354657)[Sun Apr 24 10:57:37 2005] You say to Fawn Starstone,"No problem; I'll be back soon."
	Line  131860: (1114358210)[Sun Apr 24 11:56:50 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"Welcome to the village!  I hope you find everything you need.  I wish I had!"
	Line  131861: (1114358210)[Sun Apr 24 11:56:50 2005] You say,"Hail, Fawn Starstone"
	Line  131862: (1114358214)[Sun Apr 24 11:56:54 2005] You say to Fawn Starstone,"I've got what you needed."
	Line  131865: (1114358215)[Sun Apr 24 11:56:55 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says to you,"Bless you! This is wonderful.  They say one good turn deserves another. This isn't much payment considering what you've done for me, but I hope you put it to good use."
	Line  131866: (1114358220)[Sun Apr 24 11:57:00 2005] You say to Fawn Starstone,"Good luck with your garden."
	Line  131867: (1114358221)[Sun Apr 24 11:57:01 2005] \aNPC 10502 Fawn Starstone:Fawn Starstone\/a says,"I love sitting in my garden and listening to the birds sing."
	Line  131868: (1114358221)[Sun Apr 24 11:57:01 2005] You say,"Hail, Fawn Starstone"
Search "Starstone" (4 hits in 1 file of 1 searched)
  C:\Users\JasGr\OneDrive\Desktop\Old Desktop\EQ2 Emu Stuff\EmemJR's EQ2 Logs\eq2log_Shellie.txt (4 hits)
	Line  5136: (1118602782)[Sun Jun 12 14:59:42 2005] \aNPC 11128 Fawn Starstone:Fawn Starstone\/a says to you,"Welcome to the village!  I hope you find everything you need.  I wish I had!"
	Line  5137: (1118602782)[Sun Jun 12 14:59:42 2005] You say,"Hail, Fawn Starstone"
	Line  5138: (1118602784)[Sun Jun 12 14:59:44 2005] You say to Fawn Starstone,"Thanks for the welcome!  See you around!"
--]]