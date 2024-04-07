--[[
    Script Name    : SpawnScripts/SunkenCity/widgetbox4.lua
    Script Author  : torsten
    Script Date    : 2022.07.16 04:07:26
    Script Purpose : 
                   : 
--]]

local LukursAntiques = 374

function casted_on(NPC, Spawn, SpellName)
	if SpellName == 'Search' then
		if  GetTempVariable(Spawn,"Mask1")=="1" then --ShadowedMask
            SetStepComplete(Spawn, LukursAntiques, 1)
        end
    end
end

function spawn(NPC)
    SetRequiredQuest(NPC, LukursAntiques, 2)
end

function respawn(NPC)
	spawn(NPC)
end