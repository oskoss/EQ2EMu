--[[
    Script Name    : SpawnScripts/GMHall/Toad.lua
    Script Author  : TyroneSWG
    Script Date    : 2019.01.14 03:01:44
    Script Purpose : Test, can be nuked later.
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
	AddConversationOption(conversation, "Morph Me!", "Change")
	AddConversationOption(conversation, "Revert Me!", "Revert")
    AddConversationOption(conversation, "Just saying Hello!", "Hello")
	StartConversation(conversation, NPC, Spawn, "Ah wise warrior. How can I assist you?")
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_1_1006.mp3", "", "wave", 0, 0, Spawn)
end

function Change(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local conversation = CreateConversation()
	
	StartConversation(conversation, NPC, Spawn, "Watch this...")
	v = math.random (200, 300)
	SetIllusion(Spawn, v)
	Say(NPC, "Allakhazam!")
end

function Revert(NPC, Spawn)
        ResetIllusion(Spawn)
end

function Hello(NPC, Spawn)
Say(NPC, "Well hello.")
end

function respawn(NPC)

end

