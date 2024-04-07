--[[
    Script Name    : SpawnScripts/TempleSt/OldManMuckwort.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:16
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local MucksQuest = 5874

function spawn(NPC)
    ProvidesQuest(NPC, MucksQuest)
	SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")
    SetTempVariable(NPC, "CalloutTimer", "false")
    SetTempVariable(NPC, "CalloutTimer1", "false")

end

function InRange(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else    
    if not HasCompletedQuest(Spawn, MucksQuest) then
    if  GetTempVariable(NPC, "CalloutTimer")== "false"then
        SetTempVariable(NPC, "CalloutTimer", "true")
        AddTimer(NPC,10000,"ResetTimer",1,Spawn)
        FaceTarget(NPC, Spawn)
        if  GetTempVariable(NPC, "CalloutTimer1")== "false"then
		PlayFlavor(NPC, "voiceover/english/old_man_muckwort/fprt_hood03/100_oldmanmuckwort_callout_ff44b21f.mp3", "Darn pests... messing up my yard and sneaking up on my porch... What do you need, ya' snot-nosed punk?", "grumble", 3612569160, 2400812732, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "true")
        elseif GetTempVariable(NPC, "CalloutTimer1")== "true"then
		PlayFlavor(NPC, "voiceover/english/old_man_muckwort/fprt_hood03/100_oldmanmuckwort_multhail1_13434115.mp3", "Bah!  Keep your meddling to yourself, leave me be ... and STAY OFF MY PORCH! You heard me, get out of here!", "threaten", 3647820805, 3418409987, Spawn, 0)
            SetTempVariable(NPC, "CalloutTimer1", "false")
        end
    end
    end
end
end

function ResetTimer(NPC) -- 7 SECOND PAUSE BETWEEN VOs
    SetTempVariable(NPC, "CalloutTimer", "false")
end


function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
if GetFactionAmount(Spawn,12) <0 then
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "","","shakefist",0,0, Spawn)
else
    Dialog1(NPC,Spawn)
    end
end


function Dialog1(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Bah!  Keep your meddling to yourself and leave me be.  And STAY OFF MY PORCH!")
    PlayFlavor(NPC, "","","glare",0,0, Spawn)
	Dialog.AddVoiceover("voiceover/english/old_man_muckwort/fprt_hood03/qst_oldmanmuckwort.mp3",3076890390,3782590712)
	

    if CanReceiveQuest(Spawn, MucksQuest) then
	Dialog.AddOption("Let me guess: you live here so you can be the tallest?", "Dialog1a")
    elseif GetQuestStep(Spawn, MucksQuest)==2 then
	Dialog.AddOption("Here's the vial from Crantik. Take it quick, old man.", "Dialog2")
    end

	Dialog.AddOption("Alright! I'm going.")
	Dialog.Start()
end



function Dialog1a(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("For your information, I've always lived here. The Militia told me to move out and I told them to stuff it! You don't live to be my age by following orders from whippersnapper Militia guards! Now all these pesky little gnomes and rats scurry around and wake me up in the middle of the night! BAH!")
	Dialog.AddVoiceover("voiceover/english/old_man_muckwort/fprt_hood03/quests/oldmanmuckwort/muckwort_x1_initial.mp3",4224386696,2671412005)
	Dialog.AddOption("I see. Well, do you have anything that needs doing?", "Dialog1b")
	Dialog.AddOption("Don't worry. I'll see myself out.")
	Dialog.Start()
end

function Dialog1b(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Are you implying I can't take care of myself? I can hold my own, you little punk. Don't make me put up my dukes! I'll knock your socks off doggone it!")
 	Dialog.AddVoiceover("voiceover/english/old_man_muckwort/fprt_hood03/quests/oldmanmuckwort/muckwort_x1_initial2.mp3",2387965843,630955162)
    PlayFlavor(NPC, "","","stare",0,0, Spawn)
	Dialog.AddOption("No, no! I am trying to help cool your temper!", "OfferQuest1")
	Dialog.AddOption("Maybe I'll come back when you're not so angry.")
	Dialog.Start()
end

function OfferQuest1(NPC,Spawn)
    if CanReceiveQuest(Spawn, MucksQuest) then
    OfferQuest(NPC, Spawn, MucksQuest)
    end
end

function Dialog2(NPC,Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("It took you long enough! I'm not getting any younger you know! Now, how much did he make? Good. Good. This is enough for another spray down ... Traipse on my lawn will those gnomes and Ratonga? More like run around screaming with holes burned in their feet! Heee heeee heeeee ... Now, look here, this copper is for you! Don't spend it in one place, you hear? NOW GET OFF MY LAWN!")
 	Dialog.AddVoiceover("voiceover/english/old_man_muckwort/fprt_hood03/quests/oldmanmuckwort/muckwort_x1_finish.mp3",2708189106,591579773)
   PlayFlavor(NPC, "","","lookaway",0,0, Spawn)
   
    if GetRace(Spawn)== 5 then
 	Dialog.AddOption("Well, it won't stop this gnome!...\n\n[Swipe a stien off the table]")
 	elseif GetRace(Spawn)== 13 then
 	Dialog.AddOption("Well, it won't stop this ratonga!...\n\n[Swipe a stien off the table]")
    else      
	Dialog.AddOption("You had me deliver... poison... for this?!...\n\n[Swipe a stien off the table]")
	end
	Dialog.Start()
    SetStepComplete(Spawn, MucksQuest, 2)
end