--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/widgetbox4.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.03 12:11:13
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
		if  GetTempVariable(NPC,"Mask")=="true" and GetQuestStepProgress(Spawn,LukursAntiques,2)==0 then --ShadowedMask
            SetStepComplete(Spawn, LukursAntiques, 2)
            SendMessage(Spawn,"You find a Shadowed Mask wrapped in old rags.")
        else
            SendMessage(Spawn,"This crate's contents are rusted beyond recognition.")
        end
    end
end



function MaskCheck(NPC)
    local zone = GetZone(NPC)
    local Muck1 = GetSpawnByLocationID(zone, 133787343)
    local Muck2 = GetSpawnByLocationID(zone, 133787394)
end

function respawn(NPC)
	spawn(NPC)
end