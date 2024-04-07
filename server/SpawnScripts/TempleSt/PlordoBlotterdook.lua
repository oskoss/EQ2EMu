--[[
	Script Name		: SpawnScripts/TempleStreet/PlordoBlotterdook.lua
	Script Purpose	: Plordo Blotterdook
	Script Author	: torsten
	Script Date		: 2022.07.21
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

local DoortoDoorAnger = 5688
local QwergosPlan = 5916

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else
    if GetQuestStep(Spawn, DoortoDoorAnger) == 1 then
        SetStepComplete(Spawn, DoortoDoorAnger, 1)
    end
    Dialog1(NPC, Spawn)
end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes, yes, I am hurrying.  What can good 'ole Plordo sell you today?")
	Dialog.AddVoiceover("voiceover/english/merchant_plordo_blotterdook/fprt_hood03/mer_merchantplordoblotterdook.mp3", 438412116, 3436978899)
     if GetQuestStep(Spawn, QwergosPlan)==1 then 
    Dialog.AddOption("Qwergo wants a rumblestick or whatever it is.","Dialog2")
    end
    Dialog.AddOption("I am not interested.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("An igniter rumblerod, my friend, and I regret I have sold my last one.  To Chrna, that is.  Yes, I sold it to Chrna ... ehh ... she may be around here, someplace, if you have the will to go looking for her.  Qwergo must want this item quite badly.")
	Dialog.AddVoiceover("voiceover/english/merchant_plordo_blotterdook/fprt_hood03/quests/qwergotogglesmeet/ploordo_qwergo_x1_initial.mp3", 939756391, 1996785139)
    PlayFlavor(NPC, "","","agree",0,0, Spawn)
    SetStepComplete(Spawn, QwergosPlan, 1)
    Dialog.AddOption("Fine. I'll try to get it from her.")
	Dialog.Start()
end