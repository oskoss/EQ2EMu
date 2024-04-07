--[[
    Script Name    : SpawnScripts/FarJourneyFreeport/Anikra.lua
    Script Author  : Ememjr
    Script Date    : 2019.05.11 03:05:38
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetTempVariable(NPC, "GoblinCheck", nil) -- Checks for Goblin attack and resets POST rain spell.
AddTimer(NPC,6000,"DrakeLoop",1)
end

function hailed(NPC, Spawn)
	goblin = GetSpawn(NPC, 270008)
	if goblin == nil or IsAlive(goblin) == false and GetTempVariable(NPC,"GoblinCheck") == nil then
		FaceTarget(NPC, Spawn)	
		choice = MakeRandomInt(1, 2) 	    
		if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/anikra/boat_06p_tutorial02_fvo_001.mp3", "Thanks for saving me", "thanks", 3802219844, 3242323771)
		else
		PlayFlavor(NPC, "voiceover/english/anikra/boat_06p_tutorial02/anikra_0_003.mp3", "I don't know how I did that. What was that?", "confused", 927876289, 3048340606)
	    end	
    elseif IsAlive(goblin) == true and GetSpawn(NPC, 270011)== nil and GetTempVariable(NPC, "GoblinCheck") == nil then --Stops hails during goblin attack
    elseif  IsAlive(goblin) == true and GetSpawn(NPC, 270011)~= nil then
		PlayFlavor(NPC, "voiceover/english/anikra/boat_06p_tutorial02_fvo_002.mp3", "I really miss my husband. Why did those smugglers have to throw him overboard?", "sigh", 1493499523, 2767493059)
	end
end

function DrakeLoop(NPC)
    Drake = GetSpawn(NPC,270011)
    Goblin = GetSpawn(NPC,270008)
    if Drake == nil then
    AddTimer(NPC,6000,"GoblinLoop",1)
    SetTempVariable(NPC, "GoblinCheck", 1)
    else    
    AddTimer(NPC,6000,"DrakeLoop",1)
end
end

function GoblinLoop(NPC)
    Drake = GetSpawn(NPC,270011)
    Goblin = GetSpawn(NPC,270008)
    if IsAlive(Goblin) == false or Goblin == nil then
    AddTimer(NPC,3000,"RainPath",1)
    else    
    AddTimer(NPC,6000,"GoblinLoop",1)
end
end

function RainPath(NPC)
	MoveToLocation(NPC, -2.32, -2.07, 6.77, 2)
	MoveToLocation(NPC, -2.32, -2.07, 6.77, 2,"RainTimer")
end

function RainTimer(NPC)
    SetHeading(NPC,180)
	AddTimer(NPC, 1500, "Rain")
end

function Rain(NPC)
    CastSpell(NPC,20)
	AddTimer(NPC, 6000, "Rain2",1)
	AddTimer(NPC, 8000, "Reset",1)
	AddTimer(NPC, 10000, "Boggle",1)
end

function Rain2(NPC)
Boxes = GetSpawn(NPC, 270013)
    PlaySound(NPC,"sounds/widgets/triggered_environmental/enviro_thunderroll001.wav",GetX(NPC),GetY(NPC),GetZ(NPC))
    PlayFlavor(Boxes,"","","rain")
	AddTimer(NPC, 14000, "Rain3",1)
end

function Reset(NPC)
SetTempVariable(NPC, "GoblinCheck", nil)
end

function Boggle(NPC)
    PlayFlavor(NPC,"","","boggle")
end

function Rain3(NPC)
Boxes = GetSpawn(NPC, 270013)
    PlayFlavor(Boxes,"","","kill_rain")
end



function respawn(NPC)
spawn(NPC)
end
