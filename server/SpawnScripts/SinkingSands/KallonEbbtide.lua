--[[
    Script Name    : SpawnScripts/SinkingSands/KallonEbbtide.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 06:12:03
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local KallonsVengeance = 5938 -- Kallon's Vengeance Quest ID

function spawn(NPC)
ProvidesQuest(NPC, KallonsVengeance)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	if not HasQuest(Spawn, KallonsVengeance) and not HasCompletedQuest(Spawn, KallonsVengeance) then
	Option0(NPC, Spawn)
elseif GetQuestStep(Spawn, KallonsVengeance) == 1 or GetQuestStep(Spawn, KallonsVengeance) == 2 or GetQuestStep(Spawn, KallonsVengeance) == 3 or GetQuestStep(Spawn, KallonsVengeance) == 4 or  GetQuestStep(Spawn, KallonsVengeance) == 5 then
    KallonsVengeanceProgress(NPC, Spawn)
elseif HasCompletedQuest(Spawn, KallonsVengeance) then
    OptionCompleted(NPC, Spawn)
end
   end

function Option0(NPC, Spawn)
    FaceTarget(NPC, Spawn)
    Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Ah, a new face that looks eager to explore these lands! If you're looking for gainful employment, the Courts of Maj'Dul are looking for foreign adventurers to strengthen their ranks.")
	Dialog.AddOption("Hello. I don't believe we've met, who are you?", "Option2")
    Dialog.AddOption("What are the Courts of Maj'Dul?", "Option1")
    Dialog.AddOption("Not interested, I will be on my way now.")
    Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_1_1022.mp3", 0, 0)
    Dialog.Start()
end


function Option1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The courts of Maj'Dul are three separate factions within the city that vie for power over the remnants of the Dervish empire. They have each established an outpost at the docks, and their goal is to attract new arrivals to their competing causes. Mahir Lu'ay represents the Court of the Blade, Thara Bashirah represents the Court of the Coin, and Taj As'ad represents the Court of Truth. I encourage you to converse with these individuals, as collectively the courts are the most powerful political force in these lands.")
	Dialog.AddOption("I would like to hear more of your journey through these lands.", "Option4")
	Dialog.AddOption("I appreciate the advice, but I must take my leave.")
	Dialog.Start()
end

function Option2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My name is Kallon Ebbtide, and I have had many adventures in these lands. Would you like to hear my tale? Perhaps, you would rather hear of the different lands or people? Either way, I would be honored to help a fellow adventurer with whatever information I may have.")
	Dialog.AddOption("I would like to hear the tale of your personal adventures.", "Option5")
	Dialog.AddOption("Another time, perhaps.")
	Dialog.Start()
end




function Option4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My name is Kallon Ebbtide, and I have had many adventures in these lands. Would you like to hear my tale? Perhaps, you would rather hear of the different lands or people? Either way, I would be honored to help a fellow adventurer with whatever information I may have.")
	Dialog.AddOption("I would like to hear the tale of your personal adventures.", "Option5")
	Dialog.AddOption("I would like to hear more about the lands of this foreign shore.", "Option10")
	Dialog.AddOption("I would like to hear more about the people of this land.", "Option21")
	Dialog.AddOption("Another time, perhaps.")
	Dialog.Start()
end

function Option5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
   	Dialog.AddDialog("Much like you, I came here searching for adventure and riches. What I found was a harsh and brutal land with an equally harsh people inhabiting it. My companions and I arrived and immediately sought a guide to take us to Maj'Dul. We found someone at the hunter camp further north of the nomad camp, and he agreed to take us.")
   	Dialog.AddOption("Please continue your story.", "Option6")
	Dialog.AddOption("Unfortunately, I must take my leave.")
	Dialog.Start()
end

function Option6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("This guide asked us to meet him at the oasis nearby. In reality, this person was leading us into a trap for his bandit comrades. We were ambushed at the oasis by a man named Fasul and his bandits. We resisted, and in the course of the fight all of my companions were slain and I was unconscious and left for dead.")
	Dialog.AddOption("That is horrible! How did you survive?", "Option7")
	Dialog.AddOption("That is an unfortunate tale, but I must leave now.")
	Dialog.Start()
end


function Option7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("When I awoke, I had been saved by a merchant traveling to Maj'Dul. In gratitude, I offered to serve this merchant. For the next few moons, I traveled throughout this realm as the merchant's servant. Very recently, he became deathly ill and as a gesture of kindness released me from my service. I have now decided to return home, and I am working as an emissary of the courts for new arrivals to earn my fare home.")
	if not HasQuest(Spawn, KallonsVengeance) and not HasCompletedQuest(Spawn, KallonsVengeance) then
	Dialog.AddOption("What about this bandit? Did you ever avenge your comrades?", "Option9")
	end
	Dialog.AddOption("Please elaborate on these courts.", "Option8")
	Dialog.AddOption("I would like to hear more of your stories.", "Option2")
	Dialog.AddOption("An interesting story, but I must take my leave.")
	Dialog.Start()
end

function Option8(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The courts of Maj'Dul are three separate factions within the city that vie for power over the remnants of the Dervish empire. They have each established an outpost at the docks, and their goal is to attract new arrivals to their competing causes. Mahir Lu'ay represents the Court of the Blade, Thara Bashirah represents the Court of the Coin, and Taj As'ad represents the Court of Truth. I encourage you to converse with these individuals, as collectively the courts are the most powerful political force in these lands.")
	Dialog.AddOption("I would like to hear more of your journey through these lands.", "Option4")
	
	Dialog.AddOption("I appreciate the advice, but I must take my leave.")
	Dialog.Start()
end


function Option9(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("One last thing holds me to this realm. I never found Fasul to exact vengeance for my fallen friends. I expect he is still a menace to new arrivals and nomad merchants alike. Would you be interested in pursuing this man?")
	Dialog.AddOption("Yes, I will be glad to act your stead in this matter.", "offer")
	Dialog.AddOption("I am not interested in fighting someone else's battle.")
	Dialog.Start()
end


function Option10(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Desert of Ro is a harsh and unyielding place. The only major city remaining after the Shattering is Maj'Dul, and it is the seat of the Dervish empire. There are two distinct regions, both different in their harsh landscape. You have arrived here in the Sinking Sands, name for the large area of sandy dunes to our west. Far to the west, beyond the dunes, lie the Pillars of Flame.")
	Dialog.AddOption("I would like to hear more about the city of Maj'Dul.", "Option11")
	Dialog.AddOption("I am interested in hearing more about the Sinking Sands.", "Option17")
	Dialog.AddOption("I am interested in hearing about the Pillars of Flame.", "Option19")
	Dialog.AddOption("I would rather talk about something else.", "Option4")
	Dialog.AddOption("I do not have time for further tales.")
	Dialog.Start()
end

function Option11(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Maj'Dul is the only city in the Desert of Ro. It was created by the first sultan of the Dervish empire, Ahkari. It is now a city of intrigue and danger. After Ahkari's death, his sons could not agree on who should lead, so they formed the Courts of Maj'Dul from their own followers and began to vie for power over the Dervish Empire.")
	Dialog.AddOption("What are these Courts?", "Option12")
	Dialog.AddOption("How did Ahkari die?", "Option16")
	Dialog.AddOption("I would rather hear about other tales.", "Option4")
	Dialog.Start()
end


function Option12(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Courts of Maj'Dul were originally distinct sects, each formed and controlled by a son of Ahkari. After Ahkari's death, each son established a court based on his sect. These are the Court of the Blade, the Court of the Coin, and the Court of Truth.")
	Dialog.AddOption("I would like to hear more about the Court of the Blade.", "Option10")
	Dialog.AddOption("I am interested in hearing more about the Court of the Coin.", "Option14")
	Dialog.AddOption("Please tell me more about the Court of Truth.", "Option15")
	Dialog.AddOption("What about the emissaries of the Courts at the docks?", "Option1")
	Dialog.AddOption("I would like to hear more about Maj'Dul", "Option11")
	Dialog.AddOption("I must take my leave, I will return another time.")
	Dialog.Start()
end


function Option13(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Court of the Blade, currently headed by Dukarem, believes they must lead the Dervish empire through military force to expand it. Dukarem succeeded his father, Dukar, as the leader. Dukarem's son, Dukaris, is rumored to be quite the hero and is called the Champion of the People.")
	Dialog.AddOption("I would like to hear more about the Courts.", "Option12")
	Dialog.AddOption("I need to depart. Perhaps I will have time for tales later.")
	Dialog.Start()
end

function Option14(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Court of the Coin, headed by Neriph, seeks to lead and revive the Dervish Empire through commerce and trading. It is rumored that Neriph was unprepared to lead the Coin when his father, Omren, died. They say that he depends heavily upon his advisors.")
	Dialog.AddOption("I am interested in hearing more about these Courts.", "Option12")
	Dialog.AddOption("Unfortunately, I need to depart.")
	Dialog.Start()
end

function Option15(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Court of Truth, headed by Ishara, seeks to control the Dervish empire through its complex judicial system, and they are also the caretakers of all essential knowledge. Ishara became the caliph of Truth when his father, Ishti, was exiled. It is rumored that the prized aqueducts in Maj'Dul are having problems, and Ishara is looking for help in solving this.")
	Dialog.AddOption("Please tell me more about the Courts of Maj'Dul.", "Option12")
	Dialog.AddOption("I will come back for more tales another time.")
	Dialog.Start()
end
 
 
function Option16(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
		Dialog.AddDialog("Maj'Dul was originally a fortress for Ahkari. As he gathered the various tribes of Dervin under his banner, Maj'Dul slowly became the center of the Dervish empire. It is rumored that Ahkari went insane and leapt from the palace walls to his death. I did not find out exactly what happened, but Akhari's death was the event that led to the formation of the Courts and to the decline and instability of the Dervish empire.")
	Dialog.AddOption("I would like to hear more about Maj'Dul.", "Option11")
	Dialog.AddOption("I must go. Perhaps I can hear your tales another time.")
	Dialog.Start()
end

function Option17(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("The Sinking Sands is the name of this part of the Desert of Ro. It is dominated by the Stilled Sea, a vast landscape of sandy dunes that stretches to our west and north. The route to Maj'Dul starts at the Oasis of Marr nearby and winds along the southwest border of this sea of sand. Within the western area of the Stilled Sea there are two large oases called the Twin Tears. The beaches around us are the eastern edge of the Stilled Sea, and far south along these beaches stands Onerock Isle.")
	Dialog.AddOption("What inhabits the Sinking Sands?", "Option18")
	Dialog.Start()
end

function Option18(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It is the home to various denizens. Besides the ferocious crocodiles along the beach and in the caverns nearby, the Rujarkian orcs and Alliz Raef Ew lizardmen harass any who travel the route to Maj'Dul. There are also the Anaz Mal gnolls who make their home in ancient tombs near one of the Twin Tears. Recent disturbing reports indicate that undead roam the deeper areas of the Stilled Sea.")
	Dialog.AddOption("What of the courts' presence in the Sinking Sands?", "Option8")
	Dialog.AddOption("I would like to hear more of the regions that make up the Desert of Ro.", "Option10")
	Dialog.AddOption("I do not have time for further tales.")
	Dialog.Start()
end


function Option19(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("The Pillars of Flame are located west of us, and northwest of Maj'Dul. Both the Dervish and native denizens war over control of the various plateaus of the region. T'Narev, the home of the Ashen Order monks, is located on the northeastern plateaus. The Ortallian tribe of nomads is located to the south while the Char'gin tribe makes its home on a northwestern plateau, and the Swiftriders have a base camp within the region.")
	Dialog.AddOption("What of the threats native to this area?", "Option20")
	Dialog.AddOption("I would rather talk about other places.", "Option10")
	Dialog.AddOption("I must take my leave.")
	Dialog.Start()
end


function Option20(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("There are various threats in the Pillars of Flame. The goblins dominate the eastern areas and plateaus while the harpies and giants occupy the western plateaus and canyons. These groups are constantly vying for control of the region as well as harassing the nomads and Dervish in the area. The only other significant threats are the cyclopes to the south, and the mysterious naga, of which I know very little, that occupy an island plateau in the north.")
	Dialog.AddOption("I would like to hear of other sights in the Desert of Ro.", "Option10")
	Dialog.AddOption("I must be on my way.")
	Dialog.Start()
end

function Option21(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The Desert of Ro is home to many types of beings, but the dominant civilization and culture is the Dervish empire. This empire was formed from the various nomad tribes and Dervish bandits that inhabited this region well before the Shattering. Interestingly, some nomads have remained independent with tribes in both the Sinking Sands and Pillars of Flame.")
	Dialog.AddOption("I am interested in hearing more about the Dervish empire, specifically Maj'Dul.", "Option11")
	Dialog.AddOption("I would like to hear more about these independent nomad tribes.", "Option22")
	Dialog.AddOption("I would like to hear your assessment of major threats in the Desert of Ro.", "Option24")
	Dialog.AddOption("I must take my leave.")
	Dialog.Start()
end

function Option22(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Some of the nomads in these lands did not join the Dervish empire, or they split off after the death of Ahkari. The Sinking Sands is the home of the Raj'Dur and Hizite tribes of nomads. The Raj'Dur tribe established a crocodile hunter camp north of these docks, but I do not believe that this is their only occupation. The Hizite tribe seems to be peaceful shepherds, occupying the camp to the west of the docks near the Oasis of Marr. Be wary of your dealings with either tribe, as they have no fondness for one another.")
	Dialog.AddOption("What of the other tribes?", "Option23")
	Dialog.AddOption("It sounds like you don't trust the Raj'Dur.", "Option5")
	Dialog.AddOption("I would like to hear about other people in these lands.", "Option19")
	Dialog.AddOption("I must leave and take care of other business")
	Dialog.Start()
end


function Option23(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("There are also two tribes located in the Pillars of Flame. The Char'Gin once occupied and mined in the clefts and valleys that the Rujarkian orcs now control, and they were forced to establish a foothold in the northern plateaus as fishermen. The Ortallians are religious zealots of Solusek Ro. I would be very careful of those fanatics. You may also come across the Swiftriders. They are a loose band of nomads from all tribes that have cast off their individual affiliations and now deliver goods from one tribe to another.")
	Dialog.AddOption("I would like to hear about other people in these lands.", "Option16")
	Dialog.AddOption("I will come back for more tales another time.")
	Dialog.Start()
end


function Option24(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It is my belief that the Courts' in-fighting is the most dangerous threat to themselves and foreigners alike. If you refer to external threats, however, then the Rujarkian orcs occupy and control all that is south of Maj'Dul. There is also a significant presence of gnolls, lizardmen, goblins, harpies, and various giant-kin that are a constant threat to travelers going to and from Maj'Dul. However, I believe there are also unseen threats lurking.")
	Dialog.AddOption("What do you mean?", "Option25")
	Dialog.AddOption("I would like to hear about other people in these lands.", "Option21")
	Dialog.AddOption("I don't have time for your idle speculations.")
	Dialog.Start()
end

function Option25(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("There are myths and stories that seem to have some basis in fact. The recent presence of undead in deeper areas of the Stilled Sea definitely bode ill for the Dervish Empire. I've seen the floating citadel rumored to be controlled by the mysterious djinn, and no one knows what their purpose is within this desert. Lastly, I've heard rumors of a dragon of gold or silver hue making its home in the Desert of Ro. Oddly, no one agrees on whether it is gold or silver, but everyone agrees that it is no myth.")
	Dialog.AddOption("I would like to hear more about people in these lands.", "Option21")
	Dialog.AddOption("I must take my leave.")
	Dialog.Start()
end





function offer(NPC, Spawn)
OfferQuest(NPC, Spawn, KallonsVengeance)   
end


function KallonsVengeanceProgress(NPC, Spawn)
    Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Welcome...  back, adventurer! Did you find the bandits?")
	Dialog.AddOption("Unfortunately, no. I would like to hear of your adventures again, please.", "Option4")
	if GetQuestStep(Spawn, KallonsVengeance) == 5  then
	Dialog.AddOption("Yes, I have avenged your fallen comrades! You can now leave these lands with a clear conscience.", "OptionFinish")
	end
	Dialog.AddOption("No, I am still searching for the bandits.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_1_1022.mp3", 0, 0)
	Dialog.Start()
end

function OptionFinish(NPC, Spawn)
    SetStepComplete(Spawn, KallonsVengeance, 5)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Thank you, my friends! I can now leave these lands without guilt since my comrades have been avenged. I still need to finish earning my passage, but this news makes that a small burden. Thank you again. I shall remember your kindness.")
	Dialog.AddOption("You're welcome. I would be interesed in hearing about the Court's emissaries in Sinking Sands.", "Option2")
	Dialog.AddOption("I am glad i could help. I would like to hear more of your tales.", "Option2")
	Dialog.AddOption("Good luck in your endeavor. Perhaps we'll meet again.")
	Dialog.Start()
end




function OptionCompleted(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Welcome back, my friend. As you can see, I am still working to cover my fees for the voyage home. How fare your adventures?")
	Dialog.AddOption("I am exploring places and meeting people you might have mentioned. May I hear of your adventures again?", "Option2")
	Dialog.AddOption("It is good to see you, Kallon. Unfortunately, I do not have time to chat.")
	Dialog.Start()
end



function respawn(NPC)
	spawn(NPC)
end