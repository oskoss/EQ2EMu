--[[
    Script Name    : SpawnScripts/TempleSt/CaptainMolacus.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 05:10:00
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
--	waypoints(NPC)
end

function hailed(NPC, Spawn)
Dialog3(NPC, Spawn)
end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("If what you say is true, then the agent's death will be of little consequence. However, if you have compromised our position, you will pay to the fullest extent of the law for your obstruction.")
	Dialog.AddVoiceover("voiceover/english/captain_molacus/fprt_hood03/quests/captainmolacus/lordbounty_captainmolacus_x1_initial2.mp3", 3062246809, 1928262327)
	Dialog.AddOption("I think Lord Darkblade's head will be sufficient proof.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Move along - you wouldn't want us to arrest you for loitering, would you?")
	Dialog.AddVoiceover("voiceover/english/captain_molacus/fprt_hood03/guard_captain_molacus_hail.mp3", 1657379715, 3189650077)
	Dialog.AddOption("Nope, I sure wouldn't.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Move along - you wouldn't want us to arrest you for loitering, would you?")
	Dialog.AddVoiceover("voiceover/english/captain_molacus/fprt_hood03/guard_captain_molacus_hail.mp3", 1657379715, 3189650077)
--	Dialog.AddOption("I have fulfilled the mission to kill Lord Darkblade.", "Dialog4")
	Dialog.AddOption("Nope, I sure wouldn't.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What are you talking about, citizen?  If you value your freedom, you had better explain yourself quickly.")
	Dialog.AddVoiceover("voiceover/english/captain_molacus/fprt_hood03/quests/captainmolacus/lordbounty_captainmolacus_x1_initial.mp3", 1461056082, 1946417825)
	Dialog.AddOption("Your agent is dead. I found his mission and completed it.", "Dialog1")
	Dialog.Start()
end



function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 5.9, 2.92, 34.72, 2, 25)
	MovementLoopAddLocation(NPC, 21.31, 2.92, 25.84, 2, 0)
	MovementLoopAddLocation(NPC, 33.73, 2.92, 15.95, 2, 25)
	MovementLoopAddLocation(NPC, 26.42, 2.92, 22.19, 2, 0)
	MovementLoopAddLocation(NPC, 24.6, 2.92, 32.3, 2, 25)
	MovementLoopAddLocation(NPC, 23.49, 2.92, 30.63, 2, 0)
	MovementLoopAddLocation(NPC, 4.26, 2.92, 32.36, 2, 0)
	MovementLoopAddLocation(NPC, 4.26, 2.92, 32.36, 2, 25)
	MovementLoopAddLocation(NPC, 9.11, 2.92, 31.25, 2, 0)
	MovementLoopAddLocation(NPC, 22.83, 2.92, 34.03, 2, 25)
	MovementLoopAddLocation(NPC, 21.81, 2.92, 31.83, 2, 0)
	MovementLoopAddLocation(NPC, 32.32, 2.92, 10.48, 2, 1)
	MovementLoopAddLocation(NPC, 32.32, 2.92, 10.48, 2, 25)
	MovementLoopAddLocation(NPC, 20.39, 2.92, 25.93, 2, 0)
end


