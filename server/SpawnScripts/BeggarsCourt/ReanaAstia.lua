--[[
	Script Name		: SpawnScripts/BeggarsCourt/ReanaAstia.lua
	Script Purpose	: Reana Astia
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"
local Mage1 = 5902

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12) >0 then
    Dialog3(NPC, Spawn)
    else
    PlayFlavor(NPC,"","","cutthroat",0,0,Spawn)
    end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Me?!  A farmer?!  HA!  I just sell the stuff to make a little money.  You can't have fun in this place without a little bit of the cold, hard coin. You know?  If I can get this all sold off, I'll have enough to throw a decent party down by the docks.  Cazic knows, this place needs some action!")
	Dialog.AddVoiceover("voiceover/english/reana_astia/fprt_hood04/std_reana_astia000.mp3", 3252979034, 309845439)
	Dialog.AddOption("When's the party?", "Dialog2")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That all depends on when I can get this all sold, doesn't it?  So are you going to take this off my hands or what?  I know you have some money in your pockets.  Just one sack of grain and you can eat for days.")
	Dialog.AddVoiceover("voiceover/english/reana_astia/fprt_hood04/std_reana_astia001.mp3", 4204669996, 3295304812)
	Dialog.AddOption("Okay.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hey! Do you want some grain?  Nothing's wrong with it.  Come on, it'll be good for making beer or something.")
	Dialog.AddVoiceover("voiceover/english/reana_astia/fprt_hood04/std_reana_astia.mp3", 3795939248, 4147514993)
	Dialog.AddOption("Then I have no need to talk to you.")
	Dialog.AddOption("Are you a farmer?", "Dialog1")
	if HasQuest(Spawn,Mage1) and GetQuestStepProgress(Spawn,Mage1,7)== 0 then
	Dialog.AddOption("I understand you witnessed a summoning today. What was summoned?", "Dialog4")
	end
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
    SetStepComplete(Spawn,Mage1,7)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Dunno for certain.  There was this bright light right before it showed up, so we couldn't see it. That's what made it hard to run out of there, too... this guy summoned up a whole bunch of enormous spears!  I know they were spears, because as I was running away, I ran right into one of them!  I was gored open by that spear and barely made it to a Priest in time... if you find out who did it, kill them for me, got it?")
	Dialog.AddVoiceover("voiceover/english/merchant_reana_astia/fprt_hood04/std_reana_astia002.mp3", 1441981908, 166520196)
    PlayFlavor(NPC,"","","shrug",0,0,Spawn)
	Dialog.AddOption("I'll consider it. So this person summoned some spears... thank you.")
	Dialog.Start()
end

