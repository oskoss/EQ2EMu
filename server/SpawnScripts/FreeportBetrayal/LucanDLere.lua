--[[
    Script Name    : SpawnScripts/FreeportBetrayal/LucanDLere.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 08:09:45
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetTempVariable(NPC,"Step1",nil)
SetTempVariable(NPC,"Step2",nil)
end

function hailed(NPC, Spawn)
if GetTempVariable(NPC,"Step1")~= "nil" and GetTempVariable(NPC,"Step2")== "nil" then
Speech1(NPC,Spawn)
elseif GetTempVariable(NPC,"Step2")== "nil" then   
Speech2(NPC,Spawn)
else
end
end

function SpeechCheck(NPC,Spawn)
SetTempVariable(NPC,"Step1",1)
end    

function respawn(NPC)
	spawn(NPC)
end

function Speech1(NPC,Spawn)
local Ken = GetSpawn(NPC,8450028)
local Stilus = GetSpawn(NPC,8450027)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("Enough, you worms!  I did not permit you to speak.  As for you, cur... I commend you for putting on a great show.  Now it's time for you to pay the price for breaking my laws.  You're so quiet... Don't you want to beg for your life, traitor?")
	Dialog.AddVoiceover("voiceover/english/overlord_lucan_d_lere/fprt_ph_3r03/lucan_betrayal001.mp3", 2112584825, 2632081703)
    PlayFlavor(NPC,"","","converse_male12",0,0)
    SetTarget(Spawn,NPC)
    SetTarget(Ken,NPC)
    SetTarget(Stilus,NPC)
    SetTarget(NPC,Spawn)
    Dialog.AddOption("I meant what I said.  I will die knowing there was good in my heart.","Speech2")	
	Dialog.Start()
end

function Speech2(NPC,Spawn)
local Ken = GetSpawn(NPC,8450028)
local Stilus = GetSpawn(NPC,8450027)
    FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)   
 	Dialog.AddDialog("How honorable of you to die for what you believe in.  A long time ago, I would have respected that in my enemies.  Now I view it as a pointless effort.  Executioner, this traitor bores me.  End the drama now.")
	Dialog.AddVoiceover("voiceover/english/overlord_lucan_d_lere/fprt_ph_3r03/lucan_betrayal003.mp3", 3312526214, 3456178374)
    PlayFlavor(NPC,"","","converse_male10",0,0)
    Dialog.AddOption("For Qeynos!!","Continue")	
	Dialog.Start()
    local Sel = GetSpawn(NPC,8450021)
	AddTimer(Sel,18000,"Attention",1,Spawn)
    SetTempVariable(NPC,"Step2",1)
end

function Continue(NPC,Spawn) -- ALLOWS FOR CONTINUED VO
end

