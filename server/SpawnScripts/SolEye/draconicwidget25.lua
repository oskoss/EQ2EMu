--[[
    Script Name    : SpawnScripts/SolEye/draconicwidget25.lua
    Script Author  : Dorbin
    Script Date    : 2022.06.01 08:06:03
    Script Purpose : 
                   : 
--]]

local Drag = 5577

function spawn(NPC)
SetRequiredQuest(NPC, Drag, 27)
end


function casted_on(NPC, Spawn, SpellName)
	if SpellName == 'open the scroll' then
    QuestStepIsComplete(Spawn,Drag,27)
end
end

function respawn(NPC)
	spawn(NPC)
end