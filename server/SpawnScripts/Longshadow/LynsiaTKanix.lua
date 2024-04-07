--[[
	Script Name	: SpawnScripts/Longshadow/LynsiaTKanix.lua
	Script Purpose	: Lynsia T'Kanix <Provisioner>
	Script Author	: Dorbin
	Script Date	: 2023.05.2023
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
	Dialog.AddDialog("The wine I serve tastes like the wines of Neriak. Ah ... how I miss drinking the fine wine of my homeland. Now, what do you want, peasant?")
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix000.mp3", 2924549472, 3132470359)
	if HasQuest(Spawn,Fighter) and GetQuestStep(Spawn,Fighter)>=7 and  GetQuestStep(Spawn,Fighter)<=97  and GetQuestStepProgress(Spawn,Fighter,9)==0 then
	Dialog.AddOption("Guttersnipes are not welcome within Longshadow Alley.  Spread the information among your patrons.","Dialog2")
	end
	Dialog.AddOption("I am just taking a look around.  ")
	Dialog.Start()
end


function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'm sorry, but you've mistaken me for a commoner. Now, if you want to leave my tavern in one piece, rephrase what you just said, peon.")
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix001.mp3", 680476097, 430953950)
	Dialog.AddOption("I'm sorry. My message did not come across appropriately...","Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Much better, peasant.  Go ahead.")
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix002.mp3", 1026399992, 3299923746)
	Dialog.AddOption("The Overlord demands you obey his will, or your limbs are forfeit.","Dialog4")
	Dialog.Start()
end



function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("How dare you!  No one speaks to me like that!")
    PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix003.mp3", 2477356156, 1945555715)
	Dialog.AddOption("I could always use another set of hands...","Dialog5")
	Dialog.AddOption("I wonder if there is a market for fresh feet...","Dialog5")
	Dialog.AddOption("I'm sure Boomba could pickle your legs nicely...","Dialog5")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You don't scare me!")
    PlayFlavor(NPC, "", "", "stare", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix004.mp3", 2732968485, 3600918602)
	Dialog.AddOption("It is not me you should be afraid of, it is defying the Overlord's will!","Dialog6")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I am a Teir'Dal of high standing!  You cannot threaten me!!!  Get out before, you're sorry!")
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix005.mp3", 943738693, 3313629273)
    PlayFlavor(NPC, "", "", "scold", 0, 0, Spawn)
	Dialog.AddOption("Perhaps you would rather your head be removed? I can work with that.","Dialog7")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You wouldn't dare! With all of these people around!")
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix006.mp3", 3429807310, 4260575088)
    PlayFlavor(NPC, "", "", "boggle", 0, 0, Spawn)
	Dialog.AddOption("Hmm... the head of a traitor might earn me more favor-","Dialog7a")
	Dialog.Start()
end

function Dialog7a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "brandish", 0, 0, NPC)
    AddTimer(NPC,1200,"Dialog8",1,Spawn)
end

function Dialog8(NPC, Spawn)
	SetStepComplete(Spawn,Fighter,9)
    PlayFlavor(Spawn, "", "", "feint", 0, 0, NPC)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("OKAY!!  OKAY, OKAY!  I'll ... I'll let everyone know ... please don't hurt me ... go ... please just go ... I'll do anything the Overlord wants, just don't hurt me...")
	Dialog.AddVoiceover("voiceover/english/lynsia_t_kanix/fprt_hood05/lynsiatkanix007.mp3", 1694809092, 73901509)
    PlayFlavor(NPC, "", "", "heckno", 0, 0, Spawn)
	Dialog.AddOption("Good. Have a wonderufl day.")
	Dialog.Start()
end



