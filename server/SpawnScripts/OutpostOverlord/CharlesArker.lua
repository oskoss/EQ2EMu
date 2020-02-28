--[[
    Script Name    : SpawnScripts/OutpostOverlord/CharlesArker.lua
    Script Author  : Cynnar
    Script Date    : 2018.10.14 07:10:58
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	conversation = CreateConversation()
	AddConversationOption(conversation, "Release the mole rat.", "ReleaseRat")
    AddConversationOption(conversation, "Let him be for now.")
    StartDialogConversation(conversation, 1, NPC, Spawn, "This cute little guy would be perfect as bait to lure down the cliffdiver hawks.")
end

function respawn(NPC)

end

