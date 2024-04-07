--[[
    Script Name    : SpawnScripts/TheRuins_Classic/SpiritofGurbLandle.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.06 04:07:25
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
AddTimer(NPC,MakeRandomInt(10000,300000),"FairyCheck")
end

function FairyCheck(NPC)
local zone = GetZone(NPC)
if GetSpawnByLocationID(zone, 133785613)==nil  then --WELE
    SpawnByLocationID(zone,133785613)
end
 if GetSpawnByLocationID(zone, 133785612)==nil  then --XEL
    SpawnByLocationID(zone,133785612)
end
end

function respawn(NPC)
	spawn(NPC)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
		PlayVoice(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1020.mp3", 0, 0, Spawn)
	elseif choice == 2 then
		PlayVoice(NPC, "voiceover/english/voice_emotes/greetings/greetings_3_1020.mp3", 0, 0, Spawn)
	elseif choice == 3 then
		PlayVoice(NPC, "voiceover/english/voice_emotes/greetings/greetings_1_1020.mp3", 0, 0, Spawn)
	end
end
		
function hailed(NPC, Spawn)
RandomGreeting(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("The fairies, there here!  They're looking for me.")
    PlayFlavor(NPC,"","","cringe",0,0,Spawn)
	Dialog.AddOption("What fairies, and why are they looking for you? ", "Dialog2")
	Dialog.AddOption("Looks like someone found you already. Be gone!")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("A long time ago, I stole something from the fairies of Faydwer.  I made away with a golden anvil, and with it I could make golden weapons.  I became one of the wealthiest halflings in all of Freeport.")
	Dialog.AddOption("What happened to you?", "Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Using the anvil in life was slowly scarring my soul for what I had done.  The fairies had placed a curse on the anvil to work against those who would use it for personal gain.  With each strike of my hammer, a piece of my soul would absorb into it.")
    PlayFlavor(NPC,"","","sigh",0,0,Spawn)
	Dialog.AddOption("But how did you get... like this?", "Dialog4")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I was murdered in my sleep by a band of thieves who had learned of my golden weapons.  They stole the anvil from me and along with it, a portion of my soul.  I am now cursed to walk these ruins until the anvil is returned to the fairies, and they release my soul from it.")
    PlayFlavor(NPC,"","","grumble",0,0,Spawn)
	Dialog.AddOption("That is aweful, but I need to go.")
	Dialog.Start()
end