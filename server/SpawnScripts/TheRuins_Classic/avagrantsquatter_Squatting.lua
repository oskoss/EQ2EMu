--[[
    Script Name    : SpawnScripts/TheRuins_Classic/avagrantsquatter_Squatting.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.06 04:07:38
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetInfoStructString(NPC, "action_state", "sit_idle")
    human(NPC)
end

function hailed(NPC, Spawn)
if not IsInCombat(NPC)then
    choice = MakeRandomInt(1,5)
    if choice ==1 then
    SendMessage(Spawn,"The vagrant squatter pays no attention to you.","white")
    elseif choice ==2 then
    SendMessage(Spawn,"The vagrant squatter listlessly stares in your direction.","white")
    elseif choice ==3 then
    SendMessage(Spawn,"The vagrant squatter's sun-scorched face cares little for your hail.","white")
    elseif choice ==4 then
    SendMessage(Spawn,"The vagrant squatter flails in your direction!","white")
    Attack(NPC,Spawn)
    elseif choice ==5 then
    FaceTarget(NPC,Spawn)
    SendMessage(Spawn,"The vagrant squatter eyes you and holds out its hands for an offering.","white")
    PlayFlavor(NPC,"","","beg",0,0)
    end
end
end

function respawn(NPC)
	spawn(NPC)
end

function aggro(NPC,Spawn)
    PlayFlavor(NPC,"","","sit_exit",0,0)
end
