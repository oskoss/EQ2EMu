--[[
    Script Name    : SpawnScripts/EastFreeport/RanikCalman.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.05 03:10:05
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"
local Fighter = 5898
local Scout = 5910

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
 end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aye. Welcome to the Seafarer's Roost. Been out at sea for a while, or just stopping through? Put some coin in my hand and I'll sell ye drinks until ye sail out again.")
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman000.mp3", 2125799617, 970361473)
	if HasQuest(Spawn,Fighter) and GetQuestStep(Spawn,Fighter)>=3 and  GetQuestStep(Spawn,Fighter)<=5  and GetQuestStepProgress(Spawn,Fighter,4)==0 then
	Dialog.AddOption("I have a message for you from the Overlord.","Dialog2")
	end
	if HasQuest(Spawn,Scout) and GetQuestStep(Spawn,Scout)>=3 and  GetQuestStep(Spawn,Scout)<=4  and GetQuestStepProgress(Spawn,Scout,4)==0 then
	Dialog.AddOption("I can sing you songs! I have such tales to tell!","Dialog4")
	end
	Dialog.AddOption("Thanks for the info.")
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("From the Overlord? Really? Umm ... I'm afraid to ask what the message is...")
    PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman001.mp3", 2775106195, 3777373516)
	Dialog.AddOption("You should be. How about a kick to the groin!","Dialog2a")
	Dialog.Start()
end

function Dialog2a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "kick", 0, 0, NPC)
    AddTimer(NPC,800,"Dialog2b",1,Spawn)
end


function Dialog2b(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(NPC, "", "", "gutcramp", 0, 0, Spawn)
    ApplySpellVisual(NPC,249)
    AddTimer(NPC,800,"Dialog3",1,Spawn)
end


function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ow! What kind of message was that?")
	SetStepComplete(Spawn,Fighter,4)
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman002.mp3", 2302749969, 1537670483)
	Dialog.AddOption("No more serving Guttersnipes!")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
    local Race = GetRace(Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Take it to the theater, you silly fop!  We don't want to hear any stupid lullabies, and I sure as heck am not gonna pay you to do it, either.  Now, leave me alone. I'm counting my daily earnings.")
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman004.mp3", 3300208815, 926648094)
	Dialog.AddOption("[ Wrack your brain for a sad love song ]","Dialog4a")
	Dialog.Start()
end

function Dialog4a(NPC, Spawn)
    local Race = GetRace(Spawn)
	FaceTarget(Spawn, NPC)
	FaceTarget(NPC, Spawn)
if Race == 0 then -- Barbarian
    PlayFlavor(Spawn, "", "In Freeport's clash, where steel and shadows entwine, Barbarian's heart yearns for Halas, a love divine.", "orate", 0, 0)
    elseif Race == 1 then -- Dark Elf 
    PlayFlavor(Spawn, "", "Beneath Neriak's shadows, where Fallen Gate crumbled low, Teir'Dal heart, once ablaze, now cloaked in woe.", "orate", 0, 0)
    elseif Race == 3 then -- Erudite
    PlayFlavor(Spawn, "", "In Freeport's shadow, where brilliance meets disdain, Erudite's heart, an unsung symphony of intellectual pain.", "orate", 0, 0)
    elseif Race == 5 then--Gnome
    PlayFlavor(Spawn, "", "In Temple Street's embrace, where ratonga shadows play, Gnome's heart, a cog amiss, love's invention led astray.", "orate", 0, 0)
    elseif Race == 6 then -- Half Elf
    PlayFlavor(Spawn, "", "In Barggar's Court's twilight, where shadows dance with strife, Half-elf's heart, a blend of races, a turbulent life.", "orate", 0, 0)
    elseif Race == 9 then -- Human
    PlayFlavor(Spawn, "", "In Freeport's embrace, where shadows silently weep, Love's loyalty shattered, in betrayal's deep.", "orate", 0, 0)
    elseif Race == 10  then -- Iksar
    PlayFlavor(Spawn, "", "In Freeport's shadow, where the past lies entwined, Iksar's heart echoes for an empire left behind.", "orate", 0, 0)
    elseif Race == 11 then -- Kerra
    PlayFlavor(Spawn, "", "In Freeport's alleys, where shadows twist and turn, Kerran's heart aches, for a lover they yearn.", "orate", 0, 0)
    elseif Race == 12 then -- Ogre
    PlayFlavor(Spawn, "", "In Freeport's shadows, where vengeance breeds might, Ogre's heart, a battlefield, love in the fight.", "orate", 0, 0)
    elseif Race == 13 then-- Ratonga 
    PlayFlavor(Spawn, "", "From caves I fled, where shadows held their sway, Ratonga heart, in the city, lost its way.", "orate", 0, 0)
    elseif Race == 14 then -- Troll
    PlayFlavor(Spawn, "", "In Freeport's chaos, where my hunger reigns, Troll heart pounds, love's feast in my veins.", "orate", 0, 0)
    elseif Race == 17 then -- Arasai
    PlayFlavor(Spawn, "", "In Freeport's shadowed realm where allegiance binds, Arasai heart in servitude, love's fate unwinds.", "orate", 0, 0)
    elseif Race == 19 then -- Vampire
    PlayFlavor(Spawn, "", "In Freeport's cloak, where shadows veil my plight, A silent yearning, love cloaked in the night.", "orate", 0, 0)
    else
    PlayFlavor(Spawn, "", "On waves of sorrow, The Sundering's cruel divide, Lost love's echo, in the ocean's somber tide.", "orate", 0, 0)
end
    AddTimer(NPC,4300,"Dialog5",1,Spawn)
end

function Dialog5(NPC, Spawn)
    local Race = GetRace(Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hey... what kind of love song is this?")
    PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman005.mp3", 160002062, 3362984864)
	Dialog.AddOption("[ Grasp at the chords of lost love ]","Dialog5a")
	Dialog.Start()
end

function Dialog5a(NPC, Spawn)
    local Race = GetRace(Spawn)
	FaceTarget(Spawn, NPC)
	FaceTarget(NPC, Spawn)
if Race == 0 then -- Barbarian
    PlayFlavor(Spawn, "", "Northern winds whisper tales of snow-kissed lore, Longing for home, in Freeport's turbulent roar.", "orate", 0, 0)
    elseif Race == 1 then -- Dark Elf 
    PlayFlavor(Spawn, "", "In the rubble's embrace, love's demise took its toll, Lost in the echoes, swallowed by the blackened soul.", "orate", 0, 0)
    elseif Race == 3 then -- Erudite
    PlayFlavor(Spawn, "", "Among the unseeing, genius sparks dimly burn, Love for knowledge unreturned, a scholar's yearn.", "orate", 0, 0)
    elseif Race == 5 then--Gnome
    PlayFlavor(Spawn, "", "Among rat folk whispers, dreams of gears gone awry, Tinkering hands fumbled, like a broken lullaby.", "orate", 0, 0)
    elseif Race == 6 then -- Half Elf
    PlayFlavor(Spawn, "", "Caught between disdain, in the alleys' disdainful gaze, Love's harmony falters in a world of mixed-race malaise.", "orate", 0, 0)
    elseif Race == 9 then -- Human
    PlayFlavor(Spawn, "", "To Qeynos they journeyed, leaving loyalty behind, A city's grief echoes, in a broken heart confined.", "orate", 0, 0)
    elseif Race == 10  then -- Iksar
    PlayFlavor(Spawn, "", "Amidst the alleys, yearning for a bygone reign, Love's lament weaves through scales, a nostalgic pain.", "orate", 0, 0)
    elseif Race == 11 then -- Kerra
    PlayFlavor(Spawn, "", "Erudite experiments, a twisted fate, Love's sacrifice in a lab of cold debate.", "orate", 0, 0)
    elseif Race == 12 then -- Ogre
    PlayFlavor(Spawn, "", "Crushing foes, but a tender ache remains, Lost in war drums, love's haunting refrains.", "orate", 0, 0)
    elseif Race == 13 then-- Ratonga 
    PlayFlavor(Spawn, "", "In Freeport's maze, love's scent begins to fade, Echoes of escape, a love betrayed.", "orate", 0, 0)
    elseif Race == 14 then -- Troll
    PlayFlavor(Spawn, "", "Not too bright, but I feel the yearning sting, To devour love, a clumsy, wild thing.", "orate", 0, 0)
    elseif Race == 17 then -- Arasai
    PlayFlavor(Spawn, "", "Dark Elf's command, a haunting melody, Love's wings clipped, in loyalty's decree.", "orate", 0, 0)
    elseif Race == 19 then -- Vampire
    PlayFlavor(Spawn, "", "Amongst mortals' throng, my heart a whispering ghost, Love's crimson ache, a secret engrossed.", "orate", 0, 0)
    else
    PlayFlavor(Spawn, "", "To the Isle of Refuge, my heart drifts alone, Torn continents, a love forever overthrown.", "orate", 0, 0)
end
    AddTimer(NPC,4300,"Dialog6",1,Spawn)
end



function Dialog6(NPC, Spawn)
    local Race = GetRace(Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That is one heck of a sad song, buddy.  Why don't you ... uh ... quit singing already, okay?")
    PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman006.mp3", 471096328, 2312190469)
	Dialog.AddOption("[ Wrap up your woeful melody ]","Dialog7")
	Dialog.Start()
end



function Dialog7(NPC, Spawn)
    local Race = GetRace(Spawn)
	FaceTarget(Spawn, NPC)
	FaceTarget(NPC, Spawn)
if Race == 0 then -- Barbarian
    PlayFlavor(Spawn, "", "Halas' echoes resonate in a barbarian's croon, A song of sorrow, in Freeport's city, beneath the cold shattered moon.", "heartattack", 0, 0)
    elseif Race == 1 then -- Dark Elf 
    PlayFlavor(Spawn, "", "Hate's bitter symphony, in the ruins' cruel fate, A Teir'Dal weeps for a love entwined with Fallen Gate.", "heartattack", 0, 0)
    elseif Race == 3 then -- Erudite
    PlayFlavor(Spawn, "", "In the city's noise, Erudite laments in tune, A mind unappreciated, beneath the indifferent broken moon.", "heartattack", 0, 0)
    elseif Race == 5 then--Gnome
    PlayFlavor(Spawn, "", "Temple Street echoes a gnome's melancholy croon, Tinkering sans love, in ratonga shadows, under the fractured moon.", "heartattack", 0, 0)
    elseif Race == 6 then -- Half Elf
    PlayFlavor(Spawn, "", "Barggar's Court weeps beneath the moon's indifferent boon, A half-elf's sorrow, in the echoes of a love lost too soon.", "heartattack", 0, 0)
    elseif Race == 9 then -- Human
    PlayFlavor(Spawn, "", "Under Freeport's watchful towers, love's melody is strewn, A betrayed soul laments, beneath the moon's cold tune.", "heartattack", 0, 0)
    elseif Race == 10  then -- Iksar
    PlayFlavor(Spawn, "", "Under Freeport's banner, a reptilian croon, Longing for the empire, 'neath the shattered Luclin moon.", "heartattack", 0, 0)
    elseif Race == 11 then -- Kerra
    PlayFlavor(Spawn, "", "Beneath Freeport's towers, a Kerran mourns, A feline soul weeps, as their lover's essence is torn.", "heartattack", 0, 0)
    elseif Race == 12 then -- Ogre
    PlayFlavor(Spawn, "", "With fists like thunder, still, a heart yearns true, In the battlefield's chaos, love's war cries pursue.", "heartattack", 0, 0)
    elseif Race == 13 then-- Ratonga 
    PlayFlavor(Spawn, "", "Through alleys dark, where secrets intertwine, Ratonga weeps, in the city's lonely design.", "heartattack", 0, 0)
    elseif Race == 14 then -- Troll
    PlayFlavor(Spawn, "", "Amidst the hunt, I seek what I can't name, In the taste of sorrow, love becomes my game.", "heartattack", 0, 0)
    elseif Race == 17 then -- Arasai
    PlayFlavor(Spawn, "", "Through Teir'Dal whispers, my heart's lament, In shadows cast, a forlorn love, forever spent.", "heartattack", 0, 0)
    elseif Race == 19 then -- Vampire
    PlayFlavor(Spawn, "", "In the depths of shadows, I fade away, Lost in echoes of love, in the cold dark's sway.", "heartattack", 0, 0)
    else
    PlayFlavor(Spawn, "", "Amidst the sea's lament, a whispering plea, In the abyss of parting, love sank beneath the Tranquil Sea.", "heartattack", 0, 0)	
end
    AddTimer(NPC,4300,"Dialog7a",1,Spawn)
end


function Dialog7a(NPC, Spawn)
	CloseConversation(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("[Your song has distracted Ranik away from his accounting. A gold coin rests on the edge of the counter. If you are sly enough, you might just...]")
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddOption("[ Casually slip the coin into your palm ]","CoinSwipe")
	Dialog.Start()
end

function CoinSwipe(NPC,Spawn)
    PlayFlavor(Spawn, "", "", "converse_male06", 0, 0,NPC)
    SendMessage(Spawn,"You slip Ranik's coin off the counter and into your pocket.")
    SendPopUpMessage(Spawn,"You slip the coin into your palm",220,220,220)
    AddTimer(NPC,1700,"Dialog7b",1,Spawn) 
end


function CoinSwipe3(NPC,Spawn)
end

function Dialog7b(NPC, Spawn)
	SetStepComplete(Spawn,Scout,4)
    CloseConversation(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hey ... just ... just shut up, already, okay?  Wow, you've got it bad.  I guess ... I guess you can sing here if you want ... but please try to lighten it up some, okay? ")
    PlayFlavor(NPC, "", "", "sigh", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/merchant_ranik_calman/fprt_east/ranikcalman007.mp3", 1462727142, 588866905)
	Dialog.AddOption("Perhaps next time. I'm off for now!")
	Dialog.Start()
end