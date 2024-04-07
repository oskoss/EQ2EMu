--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatterHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.06 04:07:33
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    IdleBeggar(NPC)
end

function hailed(NPC, Spawn)
if not IsInCombat(NPC)then
    choice = MakeRandomInt(1,4)
    if choice ==1 then
    SendMessage(Spawn,"The vagrant squatter pays no attention to you.","white")
    elseif choice ==2 then
    SendMessage(Spawn,"The vagrant squatter listlessly stares in your direction.","white")
    elseif choice ==3 then
    SendMessage(Spawn,"The vagrant squatter's sun-scorched face cares little for your hail.","white")
    elseif choice ==4 then
    SendMessage(Spawn,"The vagrant squatter eyes you and holds out its hands for an offering.","white")
    FaceTarget(NPC,Spawn)
    PlayFlavor(NPC,"","","beg",0,0)
    end
end
end

function respawn(NPC)
	spawn(NPC)
end
