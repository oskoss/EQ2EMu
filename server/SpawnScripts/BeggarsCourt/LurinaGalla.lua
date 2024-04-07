--[[
	Script Name		: SpawnScripts/BeggarsCourt/LurinaGalla.lua
	Script Purpose	: Lurina Galla
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.17
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local RunningForACandidate = 5666

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
	Dialog.AddDialog("You had better leave before my husband gets home. I'm not supposed to have guests while he's not around.")
	Dialog.AddVoiceover("voiceover/english/lurina_galla/fprt_hood04/std_lurina_galla.mp3", 2277358416, 3185524841)
    if GetQuestStep(Spawn, RunningForACandidate) ==1 then
	Dialog.AddOption("Mariana said Elowyn is a perfect candidate.","Dialog2")
	end
	Dialog.AddOption("I guess I'll leave then.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
    SetStepComplete(Spawn, RunningForACandidate, 1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Elowyn? You know, I never thought of him ... but yes, he is perfect! Great! Now, look, you must leave before my husband sees you. Please, go!")
 	PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
	Dialog.AddOption("Not sure what this is about, but I'm done with this.")
	Dialog.Start()
end
