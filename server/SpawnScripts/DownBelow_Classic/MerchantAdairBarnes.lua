--[[
    Script Name    : SpawnScripts/DownBelow_Classic/MerchantAdairBarnes.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.09 03:11:55
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local WorkingTheDownBelow = 5365
local Goods = 5376


function hailed(NPC, Spawn)
    if HasQuest(Spawn,Goods) then
    NoWork(NPC,Spawn)    
    elseif not HasQuest(Spawn, WorkingTheDownBelow) then
    StartingHail(NPC,Spawn)
    elseif GetQuestStep(Spawn, WorkingTheDownBelow) == 2 or GetQuestStep(Spawn, WorkingTheDownBelow) == 3 or  GetQuestStep(Spawn, WorkingTheDownBelow) == 1 then
    Quest_Progress(NPC, Spawn)
    elseif GetQuestStep(Spawn, WorkingTheDownBelow) == 4 then
    Again(NPC,Spawn)
    end
end

function NoWork(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Now listen here, Falin and I have an agreement. This means while you're helping him, you're not helping me. Got it? Now, when you're done helping him, that's another story...")
	Dialog.AddVoiceover("voiceover/english/merchant_adair_barnes/qey_catacomb01/merchant_barnes/merchant_barnes006.mp3", 3753500674, 2879312497)
    PlayFlavor(NPC, "", "", "scold", 0, 0, Spawn)
	Dialog.AddOption("Sure, I understand.")
	Dialog.Start()
end

function StartingHail(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Are you looking for anything in particular?")
	Dialog.AddVoiceover("voiceover/english/merchant_adair_barnes/qey_catacomb01/merchant_barnes/merchant_barnes001.mp3", 1654451675, 1398785579)
	Dialog.AddOption("What are you doing down here?", "Option1")
	Dialog.AddOption("Not really.")
	Dialog.Start()	
end

function Again(NPC,Spawn)
    SetStepComplete(Spawn, WorkingTheDownBelow, 4)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I see that you got everything. Good. Keep in mind that I always need help retrieving goods. If you're ever looking for something to do that'll pass the time, think of me!")
	Dialog.AddVoiceover("voiceover/english/merchant_adair_barnes/qey_catacomb01/merchant_barnes/merchant_barnes005.mp3", 1632932876, 2455444862)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddOption("I still don't see why you're down here.", "Option1")
	Dialog.AddOption("Ok.")
	Dialog.Start()
end 

function Option1(NPC, Spawn)
    local count = GetQuestCompleteCount(Spawn, WorkingTheDownBelow) 
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Aren't you a curious bugger! I'll tell you why, it fills my pockets with coin. You'd be surprised by the folks who come down here to buy this or that.  Say, why don't you help me fill some orders? There's coin in it for you.")
	Dialog.AddVoiceover("voiceover/english/merchant_adair_barnes/qey_catacomb01/merchant_barnes/merchant_barnes002.mp3", 1226253735, 3601518165)
    if not HasQuest(Spawn, WorkingTheDownBelow) and count <= 5 then
	Dialog.AddOption("Yeah, I'll help.", "offer")
    end
	Dialog.AddOption("Not now.")
	Dialog.Start()
end

function offer(NPC, Spawn)
OfferQuest(NPC, Spawn, WorkingTheDownBelow)
end


function Quest_Progress(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("No time for dawdling! Hurry up and fill those orders.")
	Dialog.AddVoiceover("voiceover/english/merchant_adair_barnes/qey_catacomb01/merchant_barnes/merchant_barnes004.mp3", 1486605195, 3427920459)
    PlayFlavor(NPC, "", "", "no", 0, 0, Spawn)
	Dialog.AddOption("Ok.")
	Dialog.Start()
end

function spawn(NPC)
    ProvidesQuest(NPC, WorkingTheDownBelow)
	SetPlayerProximityFunction(NPC, 10, "InRange")
end

function respawn(NPC)
spawn(NPC)
end

function InRange(NPC, Spawn)
    if not HasQuest(Spawn, WorkingTheDownBelow) then
    PlayFlavor(NPC, "voiceover/english/merchant_adair_barnes/qey_catacomb01/merchants/qey_catacombs01_merchants_adair_barnes_aoi_callout_4830e9a5.mp3", "Ahhh... bringing yourself down into the muck, eh? Gets mighty dark down these parts. Interest you in a fine torch?", "", 3184947609, 3872372210, Spawn)
    end
end

