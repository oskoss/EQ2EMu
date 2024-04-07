--[[
    Script Name    : SpawnScripts/EastFreeport/StilusGraphium.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.27 04:09:26
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local Part1 = 5889

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "tapfoot")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
if GetAlignment(Spawn)~=0 then
    PlayFlavor(NPC,"","","shakefist",0,0,Spawn)
else
    Dialog1(NPC,Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end


function Dialog1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Hail, hail, and all that.  I'm very busy right now.  I must get today's edition out by at least tomorrow.  If you want to chat, try the guards.  They're always up for good banter.")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium.mp3", 626338698, 3291446303)
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
    Dialog.AddOption("I'm looking for more than gossip. Surely this place has more to offer.","Intro1")	
    Dialog.AddOption("Fine. I was just leaving.")	
	Dialog.Start()
end

function Intro1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("The Observer has been here for generations.  No matter which way the wind blows at the time, people hunger for the truth.  As the editor of the Observer, I give the people the REAL truth, not the kind the Quintet would have you hear.")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/quests/stilusgraphium/stilus_x1_finish.mp3", 3836403748, 1513651252)
    Dialog.AddOption("I get around. Have any leads I can help with?","Intro1A")	
    Dialog.AddOption("What kind of truth does the Quintet supply?","Intro2")	
    Dialog.AddOption("Well, unless I do something amazing leave me out of it!")	
	Dialog.Start()
end

function Intro1A(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("The Overlord and the Quintet detest freelancers. If you want real power in this city, the only place to find it is in the arms of the Quintet.")
 	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/quests/stilusgraphium/stilus_x1_finish3.mp3", 4067542453, 3603700039)
   PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
    Dialog.AddOption("What kind of truth does the Quintet supply?","Intro2")	
    Dialog.AddOption("Well, I've lost interest anyway.")	
	Dialog.Start()
end

function Intro2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Their usual fare of propaganda - \"We're your only hope\", \"The Overlord likes us more than the other four\", \"Join us or die\".  Well, they're right about that last one, at least.  Anyone who's someone has to choose a side one of these days.")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/quests/stilusgraphium/stilus_x1_finish2.mp3", 2443543125, 1280249851)
    PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    Dialog.AddOption("That all sounds like my kind of news!")	
    Dialog.AddOption("What if I don't want to choose a side?","Dialog2")	
	Dialog.Start()
end





function Dialog2(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("People who don't choose a side end up breathing dirt in some fitlhy alley. This is the one thing the Quintet agree on. Choose a side when they tell you, or die.  Then again, there is another way...")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium000.mp3", 343230773, 2344751061)
    if GetLevel(Spawn)<18 then
    Dialog.AddOption("My side is the best side. Leave me out of yours!")
    if CanReceiveQuest(Spawn,Part1) then
    Dialog.AddOption("Whose side are you on, anyway?","Dialog3")
    end
    elseif GetLevel(Spawn)>=18 then
    Dialog.AddOption("I've picked my side. I want NOTHING to do with yours!")	
    end
	Dialog.Start()
end

function Dialog3(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Qeynos.  You can always choose Qeynos.  Look around you, friend!  Do what the guards say, or they kill you.  Carry out the evil wishes of the Quintet, or they kill you.  Worship Lucan as a god, or he kills you.  We're all slaves to the Overlord in this godsforsaken city!  Is that how you want to live?")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium001.mp3", 2011282956, 1928628774)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
    Dialog.AddOption("No way!  I don't want to go to Qeynos.")	
    Dialog.AddOption("Are you some sort of spy?","Dialog4")	
	Dialog.Start()
end

function Dialog4(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("If by spy you mean someone who wants the evil ways of Freeport stopped, then yes, I am a spy.  I fight for the ideals of goodwill rather than the empty promises of evil.  If you feel the same way, then you must join us in Qeynos, friend.  What do you say? ")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium002.mp3", 393133427, 3433323586)
    Dialog.AddOption("Qeynos is for the weak.  My home is Freeport.  And you are a traitor!","Dialog5")	
    Dialog.AddOption("Yes.  I cannot stand the evil of Freeport.  I want to fight for good, not evil!","Betray1")	
	Dialog.Start()
end

function Dialog5(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("A traitor?  How am I a traitor?  I'm not the refugee who hopped off a boat not too long ago, you are.  I'm not the one who was snooping around town asking lots of questions about the Quintet, you are.")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium003.mp3", 1760281781, 1305326262)
    PlayFlavor(NPC, "", "", "whome", 0, 0, Spawn)
    Dialog.AddOption("You are the one who brought up Qeynos!","Dialog6")	
	Dialog.Start()
end

function Dialog6(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("I am, however, the one who informed the Lucanic Knights that you are the spy they're looking for. As we speak, they're waiting to hear from me.")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium004.mp3", 3111410834, 984123691)
    PlayFlavor(NPC,"","","shakefist",0,0,Spawn)
    Dialog.AddOption("I should kill you where you stand.","Dialog7")	
    Dialog.AddOption("I want nothing more to do with this!")	
	Dialog.Start()
end

function Dialog7(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("If you kill me, I'll never get the chance to clear your name, will I?  On the other hand, if you walk away and pretend we never talked, I'll tell Lucan's Knights that the spy was someone else.  So walk away, keep your mouth shut, and we're both happy.  Good bye, stranger.")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium005.mp3", 2090418381, 2124257979)
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
    Dialog.AddOption("Fine, but sleep with one eye open.")	
	Dialog.Start()
end

function Betray1(NPC,Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("You must understand that just speaking these words makes you a traitor.  You know what the Overlord does to traitors, right? Do you believe in your heart that following the path of goodwill to  Qeynos is for you?")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium006.mp3", 730354074, 1124651336)
    Dialog.AddOption("What was I thinking?!  I would never choose to leave Freeport!  TRAITOR!","Dialog5")	
    Dialog.AddOption("Yes.  I wish to forsake evil by helping Qeynos in their struggle!","Offer")	
	Dialog.Start()
end

function Offer(NPC,Spawn)
    OfferQuest(NPC,Spawn,Part1)
end

