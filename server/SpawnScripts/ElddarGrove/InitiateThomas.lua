--[[
    Script Name    : SpawnScripts/ElddarGrove/InitiateThomas.lua
    Script Author  : Dorbin
    Script Date    : 2022.05.09 11:05:07
    Script Purpose : 
                   : 
--]]
function spawn(NPC)
    SpawnSet(NPC, "action_state", 372)
    AddTimer(NPC, math.random(2000,5000), "EmoteLoop")
end

function EmoteLoop(NPC)
    SpawnSet(NPC, "action_state", 0)
    local choice = MakeRandomInt(1,8)
         if choice == 1 then
        PlayFlavor(NPC,"","","pugilist_attack")
          AddTimer(NPC, 2550, "Idle")
        elseif choice == 2 then
        PlayFlavor(NPC,"","","pugilist_attack02")
          AddTimer(NPC, 3100, "Idle")
        elseif choice == 3 then
        PlayFlavor(NPC,"","","monk_attack02")
          AddTimer(NPC, 3050, "Idle")
        elseif choice == 4 then
        PlayFlavor(NPC,"","","monk_wild_swing")
            AddTimer(NPC, 3100, "Idle")
        elseif choice == 5 then
        PlayFlavor(NPC,"","","monk_attack01")
            AddTimer(NPC, 2450, "Idle")
        elseif choice == 6 then
        PlayFlavor(NPC,"","","monk_attack")
            AddTimer(NPC, 2550, "Idle")
        elseif choice == 7 then
        PlayFlavor(NPC,"","","monk_attack03")
            AddTimer(NPC, 4400, "Idle")
        else
        PlayFlavor(NPC,"","","pugilist_wild_swing")
            AddTimer(NPC, 3300, "Idle")
        end       
        
end

function Idle(NPC)
    PlayAnimation(NPC, 372) 
    SpawnSet(NPC, "action_state", 372)

    local timer = MakeRandomInt(500,2500)
    AddTimer(NPC, timer, "EmoteLoop")
end