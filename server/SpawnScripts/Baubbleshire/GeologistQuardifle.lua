--[[
	Script Name	: SpawnScripts/Baubbleshire/GeologistQuardifle.lua
	Script Purpose	: Geologist Quardifle 
	Script Author	: Scatman
	Script Date	: 2009.09.27
	Script Notes	: Speaks Gnomish
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	PlayFlavor(NPC, "voiceover/english/geologist_quardifle/qey_village06/geologistquardifle000.mp3", "", "", 1675886861, 3931018482, Spawn)
	AddConversationOption(conversation, "Have fun with your rocks, I'm not interested.")
	StartConversation(conversation, NPC, Spawn, "These rocks here are interesting... I'm not sure where they came from.  It's rather strange... they simply don't fit this area at all...")
end