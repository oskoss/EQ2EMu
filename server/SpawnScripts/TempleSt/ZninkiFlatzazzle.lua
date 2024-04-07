--[[
    Script Name    : SpawnScripts/TempleSt/ZninkiFlatzazzle.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.01 04:11:39
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

local SinceTheWheel = 5919


function spawn(NPC)
SetPlayerProximityFunction(NPC,9, "InRange", "LeaveRange")		
ProvidesQuest(NPC,SinceTheWheel)
    SetInfoStructString(NPC, "action_state", "gathering_search")
end

function hailed(NPC, Spawn)
    SetTarget(NPC,Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
elseif not HasLanguage(Spawn,6) then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)    
else
    if GetQuestStep(Spawn,SinceTheWheel) ==1 then
    PlayFlavor(NPC,"voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1020.mp3","My tracking device does not show the Bisecter with you! Go and get it!... Please?","confused",0,0,Spawn, 6)
    FaceTarget(NPC, Spawn)
   else
        Dialog1(NPC,Spawn)
    end
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,6)then
        if math.random(0,100)<80 then
        PlayFlavor(NPC, "", "", "gathering_search", 0, 0, Spawn)
        Garbled(NPC,Spawn)
        end
    elseif CanReceiveQuest(Spawn,SinceTheWheel) then
     	FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "", "My Bread Bisector!  My beautiful Bread Bisector!  I'll never rest until it's returned to me!", "grumble", 0, 0, Spawn, 6)
end
end
end



function Dialog1(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    if CanReceiveQuest(Spawn,SinceTheWheel) then
	Dialog.AddDialog("Oh dear!  The riff-raff that's allowed to roam free in this town. Don't just stand there. Help me locate a sprocket that can connect with this flizgig. I must hurry!")
    PlayFlavor(NPC, "","","frustrated",0,0, Spawn)
	else
	Dialog.AddDialog("I wonder if my next invention will ever live up to my Bisector... What if I attached rockets...")
    PlayFlavor(NPC, "","","ponder",0,0, Spawn)	    
	 end   
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_"..MakeRandomInt(1,3).."_1020.mp3",0,0)
	Dialog.AddLanguage(6)

    if CanReceiveQuest(Spawn, SinceTheWheel) then
	Dialog.AddOption("Why do you need it?", "Dialog1a")
    elseif GetQuestStep(Spawn, SinceTheWheel)==2 then
	Dialog.AddOption("Here is the orcish sword you requested.", "Dialog2")
    end
	Dialog.AddOption("I don't have time for this.")
	Dialog.Start()
end



function Dialog1a(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I need it to complete a tracking device to locate some squatter who absconded with my Bread Bisector!  Ah-ha!  Found one!  Now I can activate the anti-theft mechanism on the Bisector ... just so ... it's a good thing I installed that Sanguine Atomizing Locator.")
	Dialog.AddLanguage(6)
    PlayFlavor(NPC, "","","ponder",0,0, Spawn)
    Dialog.AddOption("Sangui-what? Are you mad?", "Dialog1b")
	Dialog.AddOption("I have much better thing to do than listen to this!")
	Dialog.Start()
end

function Dialog1b(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You've never heard of my Sanguine Atomizing Locator?  It's how I keep thieves from using my inventions.  See, if I clink this tuning fork like this, the Locator rockets the thief a mile into the air, where he suddenly explodes in a spectacular burst of blood ... making him much easier to locate.  Ah-ha!  You see that red cloud up there?  That must be the vagrant who took my Bread Bisector!  Oh, I simply must retrieve it!")
	Dialog.AddLanguage(6)
    PlayFlavor(NPC, "","","confused",0,0, Spawn)
	Dialog.AddOption("Impressive! I suppose I could try to find it for you.", "OfferQuest1")
	Dialog.AddOption("Potentional explosions sound too messy for me.")
	Dialog.Start()
end

function OfferQuest1(NPC,Spawn)
    if CanReceiveQuest(Spawn, SinceTheWheel) then
    OfferQuest(NPC, Spawn, SinceTheWheel)
    end
end

function Dialog2(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes! Yes! You've found it! I knew when those squatters moved in they would be trouble... Please, you must accept this prototype as payment. I'll even disable the Sanguine Atomizing Locator so you need not worry about blowing up in the future! I can envision the improvements I can make on this design!")
	Dialog.AddLanguage(6)
    PlayFlavor(NPC, "","","heelclick",0,0, Spawn)
	Dialog.AddOption("It just looks like a knife...","Dialog2a")
	Dialog.Start()
end

function Dialog2a(NPC,Spawn)
    SetTarget(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It's no ordinary knife, my friend.  It's the Bread Bisector!  See, you take an ordinary loaf of bread and, using the Bisector, you slice it in twain!  And if you adjust this little knob here, you can bisect it many many times over ... creating \"slices.\"  Have you ever seen the like?")
  	Dialog.AddLanguage(6)
  PlayFlavor(NPC, "","","scheme",0,0, Spawn)
	Dialog.AddOption("Remarkable!","Finish")
	Dialog.AddOption("Amazing!","Finish")
	Dialog.AddOption("Glorious!","Finish")
	Dialog.Start()
end

function Finish(NPC,Spawn)
    SetStepComplete(Spawn, SinceTheWheel, 2)
end




--
--You've never heard of my Sanguine Atomizing Locator?  It's how I keep thieves from using my inventions.  See, if I clink this tuning fork like this, the Locator rockets the thief a mile into the air, where he suddenly explodes in a spectacular burst of blood ... making him much easier to locate.  Ah-ha!  You see that red cloud up there?  That must be the goblin who took my Bread Bisector!  Oh, I simply must retrieve it!
--Would you?  That would be most satisfactory!  Why yes, I like that idea very much.  I shall eagerly await the return of my ingenious device – the Bread Bisector!
--I've found the Bread Bisector on one of the a Blackshield pillagers.

--My Bread Bisector!  My beautiful Bread Bisector!  I'll never rest until it's returned to me!

--I've managed to find the Bread Bisector, which looks awfully similar to a knife.
--It's no ordinary knife, my friend.  It's the Bread Bisector!  See, you take an ordinary loaf of bread and, using the Bisector, you slice it in twain!  And if you adjust this little knob here, you can bisect it many many times over ... creating "slices."  Have you ever seen the like?
