--[[
    Script Name    : SpawnScripts/SinkingSands/anomadiccarpetkeeper.lua
    Script Author  : premierio015
    Script Date    : 2023.12.15 10:12:23
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Greetings traveler, how can I assist you today?")
	Dialog.AddOption("I would like to travel.", "travel")
	Dialog.AddOption("Nowhere.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_2_1042.mp3", 0, 0)
	Dialog.Start()
end

function travel(NPC, Spawn)
    	Dialog.New(NPC, Spawn)
    	Dialog.AddDialog("Where to?")
	if GetSpawnLocationID(NPC) == 305698 then
		Dialog.AddOption("To Twin Tear's.", "PortOfTearsToTwinTears") 
		Dialog.AddOption("To Onerock Isle.", "PortOfTearsToOnerockIsle")
elseif GetSpawnLocationID(NPC) == 305699 then
    	Dialog.AddOption("To Port of Tear's.", "TwinTearsToPortOfTears")
elseif GetSpawnLocationID(NPC) == 1586028 then
    	Dialog.AddOption("To Port of Tear's.", "UndercityArenaToPortOfTears")
end
		Dialog.AddOption("Nowhere.")    
		Dialog.Start()

end

function PortOfTearsToTwinTears(NPC, Spawn)
	StartAutoMount(Spawn, 540) -- To Twin Tears
	SetMount(Spawn, 1369)
end

function PortOfTearsToOnerockIsle(NPC, Spawn)
	StartAutoMount(Spawn, 539) -- To Onerock Isle
	SetMount(Spawn, 1369)
end

function TwinTearsToPortOfTears(NPC, Spawn)
    	StartAutoMount(Spawn, 543) -- To Port of Tears
	    SetMount(Spawn, 1369)
end

function UndercityArenaToPortOfTears(NPC, Spawn)
    	StartAutoMount(Spawn, 544) -- To Port of Tears
	    SetMount(Spawn, 1369)
end





function respawn(NPC)
	spawn(NPC)
end

