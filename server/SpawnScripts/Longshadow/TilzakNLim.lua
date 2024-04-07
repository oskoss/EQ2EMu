--[[
    Script Name    : SpawnScripts/Longshadow/TilzakNLim.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.12 01:10:44
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local QUEST_1 = 386
local InformationGatheringFromaFishmonger = 5677

function spawn(NPC)
	ProvidesQuest(NPC, QUEST_1)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
if GetFactionAmount(Spawn,12) <1 then
		PlayFlavor(NPC, "", "", "threaten", 0, 0, Spawn)
else	
    Dialog1(NPC, Spawn)
end
end



function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("These are my fish so you can't have them! Go... go find your own!")
	Dialog.AddVoiceover("voiceover/english/optional5/standard_dark_elf_male/fprt_hood05/std_de_male_tilzak_nlim.mp3", 3205731528, 2249540299)
    if CanReceiveQuest(Spawn,QUEST_1) then
		Dialog.AddOption("I didn't know the Teir'Dal took mundane jobs like fishing.", "Dialog2")
    end
	if GetQuestStep(Spawn, QUEST_1) == 2 then
		Dialog.AddOption("I have the shark fins you wanted.", "Dialog4")
	end
	if GetQuestStep(Spawn, InformationGatheringFromaFishmonger) == 1 then
		Dialog.AddOption("Word would have it that you know about a meeting. What can you tell me about it?", "Dialog5")
	end
	Dialog.AddOption("Then I'll leave you to your fish.")
	Dialog.Start()
end



function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Only when we have no choice.  I used to be a chef to some of the most important people in Neriak back in the day.  Now I am nothing more than a common fisherman.  This is my lot in life, I guess. If I returned to Neriak with new recipes I might once again regain that prominent position.  If only I had the ingredients to make a new recipe I've come up with.")
	PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
    Dialog.AddOption("Maybe I can offer you a hand. What do you need?", "OfferQuest1")
	Dialog.AddOption("Your wants mean nothing to me.")
	Dialog.Start()
end

function OfferQuest1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	OfferQuest(NPC, Spawn, QUEST_1)
end

function Dialog4(NPC, Spawn)
	SetStepComplete(Spawn, QUEST_1, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, thank you so much, my good friend. These will be wonderful once they're prepared correctly. I need to be careful though, because these shark fins can be highly poisonous if they aren't prepared correctly. Don't worry, though -- I've prepared dishes very similar to this before. If you'd like you can be the first person to try it when I'm done!")
	Dialog.AddVoiceover("voiceover/english/optional5/standard_dark_elf_male/fprt_hood05/quests/tilzaknlim/tilzak_x1_finish.mp3", 1351808605, 3311226361)
	Dialog.AddOption("No thanks. I'll leave that to you. Bye.")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Wait, I assume that this is a secret meeting?  How would you know about it?")
	Dialog.AddOption("My source tells me you might be involved.","Dialog6")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
    SetStepComplete(Spawn, InformationGatheringFromaFishmonger, 1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddDialog("Ahhh... Well tell your 'source' that I have no intention in telling him where any meeting is. Information is power, and the Overlord has intrusted me with a great deal of it. What I will tell you is the house was just a setup to expose some 'rats', but sometimes information gathering is a bit... extreme. If you or your 'source' decides to stick his nose where it doesn't belong, it will be more than furniture that ends up broken. Got it?")
	Dialog.AddOption("Uhh, I'll make sure he knows.")
	Dialog.Start()
end