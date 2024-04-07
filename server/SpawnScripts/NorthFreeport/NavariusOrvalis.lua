--[[
    Script Name    : SpawnScripts/NorthFreeport/NavariusOrvalis.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.01 01:07:58
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
if HasQuest(Spawn,5865) and GetQuestStepProgress(Spawn,5865,3) ==0 then --FREEPORT OPPORTUNITY
    SetStepComplete(Spawn,5865,3)
end
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Search for the relics of the past Age of Turmoil.  Their discovery will gain you great power and prestige!")
    if HasQuest(Spawn,5906) and GetQuestStep(Spawn,5906) == 3 then
	Dialog.AddOption("Have you been selling any type of foreign plant?", "Plant")
    end        
    Dialog.AddOption("Thanks for the information, I just might do that.")
	Dialog.Start()
end

function Plant(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	PlayFlavor(NPC, "","", "stare", 0, 0, Spawn)
    Dialog.AddDialog("Look around. What do you see? Plants?... No. I have no plants for you - only knowledge.")
    Dialog.AddOption("Fine! Sorry.")
	Dialog.Start()
end