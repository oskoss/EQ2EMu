--[[
    Script Name    : SpawnScripts/SinkingSands/Jaza.lua
    Script Author  : premierio015
    Script Date    : 2023.12.16 04:12:14
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
local KallonsVengeance = 5938 -- Kallon's Vengeance Quest ID

function spawn(NPC)
  if GetSpawnLocationID(NPC) == 308200 then
	SetPlayerProximityFunction(NPC, 15, "InRange")
	end
end

function prespawn(NPC)
    if GetSpawnLocationID(NPC) == 308201 then
	SpawnSet(NPC, "model_type", 4922)
	SetTempVariable(NPC, "NoDupe", "true")
end
   end


function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
    if GetSpawnLocationID(NPC) == 308200 then
	if not HasQuest(Spawn, KallonsVengeance) and not HasCompletedQuest(Spawn, KallonsVengeance) then
	PlayFlavor(NPC, "", "Go away, I am busy.", "heckno", 0, 0, Spawn)
	elseif  GetQuestStep(Spawn, KallonsVengeance) == 1 then
	Option0(NPC, Spawn)
	elseif GetQuestStep(Spawn, KallonsVengeance) == 2 then
	PlayFlavor(NPC, "", "We shall meet at the oasis as i have indicated! Please leave so that i can prepare.", "", 0, 0, Spawn)
	elseif GetQuestStep(Spawn, KallonsVengeance) == 5 then
	PlayFlavor(NPC, "", "Thank you for sparing me, barrashar!", "", 1689589577, 4560189, Spawn)
	end
   elseif GetSpawnLocationID(NPC) == 308201 then
    if HasQuest(Spawn, KallonsVengeance) then
	Option2(NPC, Spawn)
	elseif GetQuestStep(Spawn, KallonsVengeance) == 4 then
	Option4(NPC, Spawn)
    elseif not HasQuest(Spawn, KallonsVengeance) then
    PlayFlavor(NPC, "", "There is nothing around here that interests you, move along!", "", 0, 0, Spawn)
    Despawn(308201, 60000)
    elseif GetQuestStep(Spawn, KallonsVengeance) == 5 or HasCompletedQuest(Spawn, KallonsVengeance) then
    PlayFlavor(NPC, "", "I have heeded your warning, please do not harm me!", "", 1231512930, 1030010135, Spawn)
    end
end
      end

function Option0(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    Dialog.AddDialog("Greetings, barrashar, my name is Jaza. Perhaps you are looking for a guide to Maj'Dul? This desert can be quite deadly without proper direction.")
    Dialog.AddOption("Yes, I could use a guide.", "Option1")
    Dialog.AddOption("No, I am not interested at this time.")
    Dialog.Start()
end    


function Option1(NPC, Spawn)
    SetStepComplete(Spawn, KallonsVengeance, 1)
    JazaSpawn(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Excellent! I am your man for this. I will meet you at the beginning of the route to Maj'Dul within the Oasis of Marr in a short while. We can negotiate payment at that time.")
	Dialog.AddOption("I will meet you there.")
	Dialog.Start()
end

function JazaSpawn(NPC, Spawn)
if HasQuest(Spawn, KallonsVengeance) then
local zone = GetZone(Spawn)
local JazaID = GetSpawnByLocationID(zone, 308201)
if JazaID == nil then
SpawnByLocationID(zone, 308201)
end
end
  end


function Option2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ah, welcome barrashar. Our escorts should be arriving any moment.")
	Dialog.AddOption("Escorts?", "Option3")
	Dialog.AddOption("I am not quite ready, I will return shortly.")
	Dialog.Start()
end


function Option3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well, perhaps I am being a bit unclear. MY escorts are coming. I suspect you will be none too pleased to meet them, especially Fasul.")
	Dialog.AddOption("We shall see about that!", "escort_arriving")
	Dialog.Start()
end

function Option4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Please do not kill me! Please! They forced me to do this, I did not wish to lure people here. Please spare me!")
    Dialog.AddOption("Why should I?", "Option5")
    Dialog.AddOption("I do not have time for your begging.")
    Dialog.AddEmote("cringe")
    Dialog.Start()
end

function Option5(NPC, Spawn)
    SetStepComplete(Spawn, KallonsVengeance, 4)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Because you are a just and kind person! If you spare me, I swear never to mislead travelers. Give me a chance, please!")
	Dialog.AddOption("I'll let you live. However, if I hear of another incident involving you...")
	Dialog.AddEmote("beg")
	Dialog.Start()
end


function InRange(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "",  "Welcome barrashar! Do you need a guide for this desert? If so, speak to me.", "", 1689589577, 4560189, Spawn)
end


function escort_arriving(NPC, Spawn) -- Spawns Fasul gang
if GetTempVariable(NPC, "NoDupe") == "true" then
AddTimer(NPC, 6000, "check")
end
   end


function check(NPC, Spawn)
if GetTempVariable(NPC, "NoDupe") == "true" then
local zone = GetZone(NPC)    
SpawnGroupByID(zone, 1056891)
SetTempVariable(NPC, "NoDupe", "false")
end
   end

function respawn(NPC)
	spawn(NPC)
end

