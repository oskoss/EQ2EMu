--[[
    Script Name    : SpawnScripts/NorthQeynos/TaraIronforge.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.26 11:01:00
    Script Purpose : Jewelery Pickup for Taneran quest
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local Taneran = 5459

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "artificing_idle")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hello, friend! I've just received some fine gems from the hard-working dwarves in the village! Take a look. See if anything strikes your fancy.")
	Dialog.AddVoiceover("voiceover/english/tara_ironforge/qey_north/taraironforge.mp3", 1778772317, 1476685213)
	if GetQuestStep (Spawn, Taneran)==1 then
	Dialog.AddOption("I'm here to pick up an order for Taneran. Here is the order form.","Order")
	end    
	Dialog.AddOption("Thank you. I'll browse around. ")
	Dialog.Start()
	end


function respawn(NPC)
	spawn(NPC)
end

function Order(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh! Let's look. Yes, I believe I have just what he's looking for. Take this to him. I am certain he will be pleased.")
	Dialog.AddVoiceover("voiceover/english/tara_ironforge/qey_north/taraironforge001.mp3", 829541547, 700812740)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn)
	Dialog.AddOption("I'll get it to him. Thank you.","Pickup")
	Dialog.Start()
	end
	
	function Pickup(NPC, Spawn)
    	SetStepComplete(Spawn, Taneran, 1)
    end