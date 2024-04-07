--[[
    Script Name    : SpawnScripts/NorthFreeport/ClaudiaQuarto.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.15 04:11:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local ShivosRod = 5928

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
local ShivosRod = 5928
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Who goes there?  Are you a true believer in the Powers?  Have you conviction enough to smite your enemies and empower your allies?  Only those who are worthy may touch these magical wares.  If you  dare defile them, then be gone!")
	Dialog.AddVoiceover("voiceover/english/claudia_quarto/fprt_north/mer_claudiaquarto.mp3", 2823488041, 2173657542)
    if GetQuestStep(Spawn,ShivesRod)==1 then
	Dialog.AddOption("I found this rod on a ratonga in the Sprawl. Can you determine its magical properties?","Dialog2")
    end
	Dialog.AddOption("I may be back later.  I haven't decided yet.  Until we meet again!")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
    SetStepComplete(Spawn,ShivosRod,1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("A ratonga, you say? A ratonga was slinking about, pretending to be a mage.  He stole a magic rod from me and although the item had little power, he committed a grave insult.  I'll reward you for its return.")
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("Certainly better than nothing. Thank you.")
	Dialog.Start()
end

