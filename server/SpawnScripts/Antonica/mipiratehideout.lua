--[[
    Script Name    : SpawnScripts/Antonica/mipiratehideout.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.21 01:05:37
    Script Purpose : 
                   : 
--]]
Brass1 = 5813


function spawn(NPC)
SetRequiredQuest(NPC,Brass1,1)
end

function casted_on(NPC, Spawn, Message)
    if Message == "enter the cellar" then
    if HasQuest(Spawn,Brass1) then
    SetStepComplete(Spawn,Brass1,1)
    ZoneRef = GetZone("BuccaneersRest")
    Zone(ZoneRef,Spawn,2.48, -45.79, -45.68, 48)  
    end
else
    SendMessage(Spawn,"The locked door rattles, but does not budge.","yellow")
end
end

function respawn(NPC)
	spawn(NPC)
end