--[[
    Script Name    : SpawnScripts/Commonlands/astackofbooks.lua
    Script Author  : torsten\\Dorbin
    Script Date    : 2022.07.16 07:07:46
    Script Purpose : 
                   : 
--]]

DeliverHelptoJanusFieri = 5660

function casted_on(NPC, Spawn, SpellName)
    if SpellName == 'Pick up journal' then
	    if  GetQuestStep(Spawn, DeliverHelptoJanusFieri) == 2 then
            SetStepComplete(Spawn, DeliverHelptoJanusFieri, 2)
            SendMessage(Spawn,"You find a tattered journal amidst this stack of materials in the nomads' camp.")
        end
    end
end

function spawn(NPC)
    SetRequiredQuest(NPC, DeliverHelptoJanusFieri, 2)
end


function respawn(NPC)
	spawn(NPC)
end