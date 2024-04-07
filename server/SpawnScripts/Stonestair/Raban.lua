--[[
	Script Name		: SpawnScripts/StonestairByway/Raban.lua
	Script Purpose	: Raban
	Script Author	: torsten
	Script Date		: 2022.07.21
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

local AWorthyTeacher = 5687
local EnchantedEvening = 5926

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
	Dialog.AddDialog("Can't you adventurers find some other place to drink?")
	Dialog.AddVoiceover("voiceover/english/optional1/tavern_patron,_erudite_female/fprt_hood02/tavern_patron_erudite_raban.mp3", 2922822950, 250860244)
    if GetQuestStep(Spawn, AWorthyTeacher) == 1 then
	    Dialog.AddOption("I am not here to drink, madam. I bring a message from the Iksar Zekvila.", "Dialog2")
    end
    if GetQuestStep(Spawn, EnchantedEvening) == 1 then
	    Dialog.AddOption("Krysa is offering you more money to make the two other Ratonga \"more ugly\".", "Dialog3")
    end
    Dialog.AddOption("Whatever.")
	Dialog.Start()
end

--

function Dialog2(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You mean Zekvila the incompetent? The one who fancies herself a powerful mage? Ha! Let me read her message. Hmm ... hmm ... ah, yes. It's clear her impatience has finally caught up with her. Tell her this: If she wants my help, she will have to come to me in person, face me, and confess the full extent of her pathetic ignorance. I can almost hear the indignant shrieks already. Now ... leave me to my drink.")
	Dialog.AddOption("I'll let her know.")
	Dialog.Start()
    SetStepComplete(Spawn, AWorthyTeacher, 1)
end

function Dialog3(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hahahaaaa! It's so adorable when those little creatures fight each other...so emotional...so angry...perfect little beasts. Well, you tell Krysa that I'll do it for free. Considering all three of them, plus some little love-smitten ratonga, came to me for enchantments, it's worth it.  As I was saying, it's so charming to see those feral little beasts stab each other in the back. Haaahaaaahaaa.")
    PlayFlavor(NPC, "","","chuckle",0,0, Spawn)
	Dialog.AddOption("Interesting. I'll let her know.")
	Dialog.Start()
    SetStepComplete(Spawn, EnchantedEvening, 1)
end
