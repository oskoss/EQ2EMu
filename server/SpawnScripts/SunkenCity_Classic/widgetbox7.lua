--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/widgetbox7.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.03 01:11:48
    Script Purpose : 
                   : 
--]]
local LukursAntiques = 374
function spawn(NPC)
    SetRequiredQuest(NPC, LukursAntiques, 1)
    SetRequiredQuest(NPC, LukursAntiques, 2)
    SetRequiredQuest(NPC, LukursAntiques, 3)
    SetTempVariable(NPC,"Mask","false")
    AddTimer(NPC,2000,"MaskCheck")
end

function casted_on(NPC, Spawn, SpellName)
	if SpellName == 'Search' then
		if  GetTempVariable(NPC,"Mask")=="true" and GetQuestStepProgress(Spawn,LukursAntiques,1)==0 then --DawnMask
            SetStepComplete(Spawn, LukursAntiques, 1)
            SendMessage(Spawn,"You find a Blood Mask inside the barrel.")
        else
            SendMessage(Spawn,"You only see the remains of rotten produce in this barrel.")
        end
    end
end



function MaskCheck(NPC)
    local zone = GetZone(NPC)
    local Muck1 = GetSpawnByLocationID(zone, 133787343)
    local Muck2 = GetSpawnByLocationID(zone, 133787394)
if Muck2 == nil and Muck1 ~= nil
then
    SetTempVariable(NPC,"Mask","true")
    else
end   
end

function respawn(NPC)
	spawn(NPC)
end