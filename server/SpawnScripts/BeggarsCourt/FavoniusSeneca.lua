--[[
	Script Name		: SpawnScripts/BeggarsCourt/FavoniusSeneca.lua
	Script Purpose	: Favonius Seneca
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"
local Fighter = 5898

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
	Dialog.AddDialog("Mind your own business.  If you keep gawking, you'll walk away with a limp--and that's because I'm in a good mood today.")
	Dialog.AddVoiceover("voiceover/english/favonius_seneca/fprt_hood04/favoniusseneca000.mp3", 4143618696, 2550129080)
	if HasQuest(Spawn,Fighter) and GetQuestStep(Spawn,Fighter)>=7 and  GetQuestStep(Spawn,Fighter)<=97  and GetQuestStepProgress(Spawn,Fighter,7)==0 then
	Dialog.AddOption("Overlord Lucan would prefer that you didn't allow the Guttersnipes into Beggars Court.","Dialog2")
	end
	Dialog.AddOption("Some mood... ")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh yeah?  Well, I'd \"prefer\" that the Overlord pay me some of his cold hard cash before I stop serving the Guttersnipes. You know what I'm saying?")
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/favonius_seneca/fprt_hood04/favoniusseneca001.mp3", 2651374016, 1797185719)
	Dialog.AddOption("Offering a bribe! That's another charge we can add to your file.","Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hey! That's not what I said!  Don't you dare tell the Overlord or anyone else that I said that!  If you do, I swear to you that I'll...")
    PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/favonius_seneca/fprt_hood04/favoniusseneca002.mp3", 2763282382, 509438701)
	Dialog.AddOption("Or you'll what?","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "stare", 0, 0, NPC)
    AddTimer(NPC,800,"Dialog4",1,Spawn)
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	SetStepComplete(Spawn,Fighter,7)
	Dialog.AddDialog("Umm ... I'll ... uh ... I'll make ... I'll make sure that the Guttersnipes don't show up here in Beggar's Court, okay?")
    PlayFlavor(NPC, "", "", "cringe", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/favonius_seneca/fprt_hood04/favoniusseneca003.mp3", 1546990870, 1516965845)
	Dialog.AddOption("Finally, you see reason. All hail the Overlord!")
	Dialog.Start()
end

--

