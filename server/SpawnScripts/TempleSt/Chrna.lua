--[[
	Script Name		: SpawnScripts/TempleStreet/Chrna.lua
	Script Purpose	: Chrna
	Script Author	: torsten
	Script Date		: 2022.07.19
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

local TheMissingBook = 5681
local QwergosPlan = 5916

function spawn(NPC)
waypoints(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else  
 Dialog1(NPC, Spawn)
 end
end





function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Chrna look for hidden treasures.  Maybe you see where they are, yes?  ")
	Dialog.AddVoiceover("voiceover/english/chrna/fprt_hood03/qst_chrna.mp3", 1920372216, 1161082682)
    if GetQuestStep(Spawn, TheMissingBook) == 1 then
    Dialog.AddOption("Treasures, as in a stolen book? Tell me where it is!","Dialog2")
    end
    if GetQuestStep(Spawn, QwergosPlan) == 2 then
    Dialog.AddOption("No, I don't. I need that rumblestick thing that you got from Plordo. It obviously doesn't work!","Dialog3")
    end    
    Dialog.AddOption("I haven't seen any, but will keep an eye out for you.  Good luck!")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "","","happy",0,0, Spawn)
	Dialog.AddDialog("Yesyesyes! I dids it! I confesses, I do! A mighty magi in the Sprawl paidses me to steals the book from the Dark Elf. I am so sorrrrrrry... I feel so horrrrrrible... the GUILT will plagues me till I die.... Waaaaaahhhhh.... how cans I lives with my self?.... Booo Hooo hooo... BOO-HOO-HOOOOOOOO!")
	Dialog.AddVoiceover("voiceover/english/chrna/fprt_hood05/quests/lotniklria/trueratonga_lotni_x1_initial.mp3", 3981798709, 2280901962)
    if GetQuestStep(Spawn, TheMissingBook) == 1 then
       SetStepComplete(Spawn, TheMissingBook, 1)
    end
    Dialog.AddOption("Okay! Okay... I must report this.","Continue")
	Dialog.Start()
    AddTimer(NPC,14500,"Heart",1,Spawn)
    AddTimer(NPC,23000,"Cry",1,Spawn)
end

function Heart(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","heartattack",0,0, Spawn)
end

function Cry(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","cry",0,0, Spawn)
end

function Continue(NPC, Spawn)
end

function Dig(NPC, Spawn)
    PlayFlavor(NPC, "","","gathering_search",0,0)
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
	Dialog.AddDialog("It won't?! Ohhh ... Plordo tell a lie to Chrna.  Maybe I should eat his face.")
	Dialog.AddVoiceover("voiceover/english/chrna/fprt_hood03/quests/qwergotogglesmeet/chrna_qwergo_x1_initial.mp3", 4198507307, 1883427787)
    Dialog.AddOption("Perhaps, but if you don't give it to me you might EXPLODE.","Dialog4")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC, "","","grumble",0,0, Spawn)
	Dialog.AddDialog("Peh!  Take the rumbley!  It scares Chrna.  All it do is make a tick-tick-tick sound, and the little numbers keep changing.")
	Dialog.AddVoiceover("voiceover/english/chrna/fprt_hood03/quests/qwergotogglesmeet/chrna_qwergo_x1_initial2.mp3", 1216429846, 856282773)
    if GetQuestStep(Spawn, QwergosPlan) == 2 then
       SetStepComplete(Spawn, QwergosPlan, 2)
    end
    Dialog.AddOption("Interesting... Thank you.","Continue")
	Dialog.Start()
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 1)
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 0)
	MovementLoopAddLocation(NPC, 28.82, 2.92, 26.42, 2, 0)
	MovementLoopAddLocation(NPC, 29.9, 2.92, 28.28, 2, 0)
	MovementLoopAddLocation(NPC, 31.47, 2.92, 30.86, 2, 1)
	MovementLoopAddLocation(NPC, 31.47, 2.92, 30.86, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 31.47, 2.92, 30.86, 2, 0)
	MovementLoopAddLocation(NPC, 23.96, 2.92, 28.69, 2, 0)
	MovementLoopAddLocation(NPC, 16.06, 2.92, 31.79, 2, 0)
	MovementLoopAddLocation(NPC, 9.15, 2.92, 30.65, 2, 0)
	MovementLoopAddLocation(NPC, 7.32, 2.92, 30.24, 2, 0)
	MovementLoopAddLocation(NPC, 6.18, 2.92, 29.12, 2, 1)
	MovementLoopAddLocation(NPC, 6.18, 2.92, 29.12, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 6.18, 2.92, 29.12, 2, 0)
	MovementLoopAddLocation(NPC, 5.67, 2.92, 31.67, 2, 0)
	MovementLoopAddLocation(NPC, 7.18, 2.92, 35.68, 2, 0)
	MovementLoopAddLocation(NPC, 9.54, 2.92, 38.01, 2, 1)
	MovementLoopAddLocation(NPC, 9.54, 2.92, 38.01, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 9.54, 2.92, 38.01, 2, 0)
	MovementLoopAddLocation(NPC, 11.53, 2.92, 36.02, 2, 0)
	MovementLoopAddLocation(NPC, 21.61, 2.92, 32.4, 2, 0)
	MovementLoopAddLocation(NPC, 28.59, 2.92, 25.76, 2, 0)
	MovementLoopAddLocation(NPC, 32.85, 2.92, 20.43, 2, 0)
	MovementLoopAddLocation(NPC, 36.75, 2.92, 22.19, 2, 1)
	MovementLoopAddLocation(NPC, 36.75, 2.92, 22.19, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 36.75, 2.92, 22.19, 2, 0)
	MovementLoopAddLocation(NPC, 33.74, 2.92, 16.51, 2, 0)
	
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 1)
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 0)
	
	MovementLoopAddLocation(NPC, 36.75, 2.92, 22.19, 2, 0)
	MovementLoopAddLocation(NPC, 32.85, 2.92, 20.43, 2, 0)
	MovementLoopAddLocation(NPC, 28.59, 2.92, 25.76, 2, 0)
	MovementLoopAddLocation(NPC, 21.61, 2.92, 32.4, 2, 0)
	MovementLoopAddLocation(NPC, 11.53, 2.92, 36.02, 2, 0)
	MovementLoopAddLocation(NPC, 9.54, 2.92, 38.01, 2, 1)
	MovementLoopAddLocation(NPC, 9.54, 2.92, 38.01, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 9.54, 2.92, 38.01, 2, 0)
	MovementLoopAddLocation(NPC, 7.18, 2.92, 35.68, 2, 0)
	MovementLoopAddLocation(NPC, 5.67, 2.92, 31.67, 2, 0)
	MovementLoopAddLocation(NPC, 6.18, 2.92, 29.12, 2, 1)
	MovementLoopAddLocation(NPC, 6.18, 2.92, 29.12, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 6.18, 2.92, 29.12, 2, 0)
	MovementLoopAddLocation(NPC, 7.32, 2.92, 30.24, 2, 0)
	MovementLoopAddLocation(NPC, 9.15, 2.92, 30.65, 2, 0)
	MovementLoopAddLocation(NPC, 16.06, 2.92, 31.79, 2, 0)
	MovementLoopAddLocation(NPC, 23.96, 2.92, 28.69, 2, 0)
	MovementLoopAddLocation(NPC, 31.47, 2.92, 30.86, 2, 1)
	MovementLoopAddLocation(NPC, 31.47, 2.92, 30.86, 2, 18,"Dig")
	MovementLoopAddLocation(NPC, 31.47, 2.92, 30.86, 2, 0)
	MovementLoopAddLocation(NPC, 29.9, 2.92, 28.28, 2, 0)
	MovementLoopAddLocation(NPC, 28.82, 2.92, 26.42, 2, 0)
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 1)	
	MovementLoopAddLocation(NPC, 32.24, 2.92, 10.14, 2, 18,"Dig")	
end


