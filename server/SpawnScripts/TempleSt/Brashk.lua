--[[
    Script Name    : SpawnScripts/TempleSt/Brashk.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.27 12:10:31
    Script Purpose : 
                   : 
--]]
local Makeup = 5925

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "gathering_search")
end


--

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
 Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("A new treasure lurks in every corner! Ooooh! ")
	Dialog.AddVoiceover("voiceover/english/optional1/brashk/fprt_hood03/qst_brashk.mp3", 67711495, 2241704250)
    if GetQuestStep(Spawn, Makeup)==1  then 
    Dialog.AddOption("Brashk said he didn't have any more makeup.","Dialog2")
    end
    Dialog.AddOption("I bet it does... if you treasure filth, that is. Goodbye.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
    SetStepComplete(Spawn,Makeup,1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh no!  OH NO!!!!  I no have any more of the makeup! I ... uh ... I got the makeup from a tall Erudite. She is a magical, magical witch she is, and she makes me some makeup so I can give it to Krysa.  I have no more ... Boooo hooooo hooooo!!!! Now Krysa will never give me a kiss...  WAAAAHHHHHH!!!! ")
	Dialog.AddVoiceover("voiceover/english/optional1/brashk/fprt_hood03/quests/krysa/brashk_krysa_x1_initial.mp3", 0, 0) --NO KEYS
    PlayFlavor(NPC, "","","cry",0,0, Spawn)
    Dialog.AddOption("Get ahold of yourself! She must know about this.")
	Dialog.Start()
end