--[[
	Script Name		: SpawnScripts/StonestairByway/StreetWitchAzreana.lua
	Script Purpose	: Street Witch Azreana
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local OgreWatch = 5676

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
	Dialog.AddDialog("Hmmm ... yes ... this is interesting ... interesting indeed...")
	Dialog.AddVoiceover("voiceover/english/streetwitch/fprt_hood02/street_witch_azreana.mp3", 3291813723, 1080848971)
    if GetQuestStep(Spawn, OgreWatch) == 1 then
	Dialog.AddOption("I have a package for you. It is supposedly very important.","Dialog2")
    end
	Dialog.AddOption("Uhh... sure.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes! Just as I've forseen it... A web... deep at work. Not ogres... Secrets... prying in the dark... A meeting of more than what can be seen... I must study this further.  You have aided more than you know by delievering this. Thank you. ")
    SetStepComplete(Spawn, OgreWatch, 1)

	Dialog.AddOption("Sounds like something I should discuss with Orian about sometime.")
	Dialog.Start()
end
