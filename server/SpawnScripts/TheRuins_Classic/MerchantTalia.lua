--[[
    Script Name    : SpawnScripts/TheRuins_Classic/MerchantTalia.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.04 02:07:29
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

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
	Dialog.AddDialog("What do you want to purchase? Don't be shy.  My fine wares are worth spending your coin.")
	Dialog.AddVoiceover("voiceover/english/merchant_talia_of_the_coalition/fprt_adv04_ruins/merchanttalia000.mp3", 1965549585, 3553254734)
    if GetQuestStep(Spawn,5872)==1 then
	Dialog.AddOption("I hate to be the bearer of bad news, but G'Zule sent me to deliver this death certificate. ", "Dialog2")
    end
	Dialog.AddOption("Give me a moment.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Barel, dead?! Really?! It took too long for that no-good son of a... Well, he deserved to die, you know! I hope it was painful! Now, let me unload some of your coin... I know you need something...")
    PlayFlavor(NPC,"","","boggle",0,0,Spawn)
	Dialog.AddVoiceover("voiceover/english/merchant_talia_of_the_coalition/fprt_adv04_ruins/merchanttalia001.mp3", 871186766, 640332456)
	Dialog.AddOption("I do believe that was the shortest bereavement I've ever witnessed.")
	Dialog.Start()
    SetStepComplete(Spawn,5872,1)
end