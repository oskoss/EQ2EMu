--[[
    Script Name    : SpawnScripts/DownBelow_Classic/MerchantFalinShaloon.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.09 03:11:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local GoodsDownBelow = 5376
local WorkingTheDownBelow = 5365

function spawn(NPC)
    ProvidesQuest(NPC, GoodsDownBelow)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end


function hailed(NPC, Spawn)
    if HasQuest(Spawn,WorkingTheDownBelow) then
    NoWork(NPC,Spawn)    
    elseif not HasQuest(Spawn, GoodsDownBelow) then
    StartingHail(NPC,Spawn)
    elseif GetQuestStep(Spawn, GoodsDownBelow) < 5 then
    Quest_Progress(NPC, Spawn)
    elseif GetQuestStep(Spawn, GoodsDownBelow) == 5 then
    Again(NPC,Spawn)
    end
end


function StartingHail(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Buy something or be on your way!  I don't have time to chat with the likes of you...")
	Dialog.AddVoiceover("voiceover/english/merchant_falin_shaloon/qey_catacomb01/merchant_shaloon/merchant_shaloon001.mp3", 2831988431, 2273687060)
	Dialog.AddOption("How are you able to do business down here?", "Option1")
    
	Dialog.AddOption("I'll be on my way. ")
	Dialog.Start()
end

function Option1(NPC, Spawn)
    local count = GetQuestCompleteCount(Spawn, WorkingTheDownBelow) 

	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I get requests for this or that, used for who knows what.  It seems that the majority of my clientele have to get their supplies here, 'cause it just ain't available top side. Say, how would you like to make yourself useful?")
	Dialog.AddVoiceover("voiceover/english/merchant_falin_shaloon/qey_catacomb01/merchant_shaloon/merchant_shaloon002.mp3", 2160282903, 1448473468)
	if GetLevel(Spawn) <= 20 and count <= 5 then
	Dialog.AddOption("I'm interested.", "offer")
    end
    Dialog.AddOption("Not today.")
	Dialog.Start()
end


function NoWork(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Word gets around quickly down here; so don't think about trying to pull one over on me.  I won't have you working for me while you're doing work for Barnes, got it!?")
	Dialog.AddVoiceover("voiceover/english/merchant_falin_shaloon/qey_catacomb01/merchant_shaloon/merchant_shaloon006.mp3", 176112027, 123486081)
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddOption("Maybe I'll come back when I'm through.")
	Dialog.Start()
end


function offer(NPC, Spawn)
OfferQuest(NPC, Spawn, GoodsDownBelow)
end


function Quest_Progress(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You're not going back on your word, are you?  I expect you to deliver them goods!")
	Dialog.AddVoiceover("voiceover/english/merchant_falin_shaloon/qey_catacomb01/merchant_shaloon/merchant_shaloon004.mp3", 718963330, 3239432203)
	Dialog.AddOption("Yeah, I'm on it.")
	Dialog.Start()
end

function Again(NPC, Spawn)
	SetStepComplete(Spawn, GoodsDownBelow, 5)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It's hard to imagine anyone wanting this stuff, let alone paying for it.  Anyway, you kept up your end of the bargain. Take this for your trouble.")
	Dialog.AddVoiceover("voiceover/english/merchant_falin_shaloon/qey_catacomb01/merchant_shaloon/merchant_shaloon005.mp3", 1650487324, 124661569)
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddOption("What do most folks ask you for?", "Option1")
	Dialog.AddOption("Thanks.")
	Dialog.Start()
end

function InRange(NPC, Spawn)
    FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/merchant_falin_shaloon/qey_catacomb01/merchants/qey_catacomb01_dwarf_merchant_aoi_callout_2aa4e27e.mp3", "If I don't have what you want, you don't need it!", "", 1298570469, 653865762, Spawn)
end

function LeaveRange(NPC, Spawn)
end
