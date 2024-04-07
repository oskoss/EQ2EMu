--[[
	Script Name		:	CorporalBatton.lua
	Script Purpose	:	Corporal Batton
	Script Author	:	Jabantiz
	Script Date		:	08/29/2019
	Script Notes	:	Auto-Generated from a chat log using SpawnScriptDesigner
--]]

require "SpawnScripts/Generic/DialogModule"

local PeckettsPatrol = 5715

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I am afraid I must ask you to move along, citizen. This is a place of duty, not chatter.")
	Dialog.AddVoiceover("voiceover/english/corporal_batton/mudlib/vdl/quests/antonica/corporalbatton000.mp3", 3155813947, 2657899917)
     PlayFlavor(NPC,"","","sniff",0,0,Spawn)
   if GetQuestStep(Spawn, PeckettsPatrol) == 6 then
    Dialog.AddOption("Coldwind Point Garrison reporting.", "Option1")
    end
    Dialog.AddOption("Excuse my interruption, guard.")
	Dialog.Start()
end

function Option1(NPC, Spawn)
    SetStepComplete(Spawn, PeckettsPatrol, 6)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Nothing to report here militiaman. Before you proceed with your patrol the General has asked that you patrol Crater Pond also. You'll find Crater Pond just east of the South Gate of Qeynos.")
  	Dialog.AddVoiceover("voiceover/english/corporal_batton/antonica/corporalbatton001.mp3", 77618874, 84026675)
    PlayFlavor(NPC,"","","no",0,0,Spawn)
	Dialog.AddOption("For Qeynos!","Salute")
	Dialog.Start()
end

function Salute(NPC,Spawn)
    PlayFlavor(NPC,"","","salute",0,0,Spawn)
end



