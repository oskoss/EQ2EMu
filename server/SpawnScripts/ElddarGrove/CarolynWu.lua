--[[
    Script Name    : SpawnScripts/ElddarGrove/CarolynWu.lua
    Script Author  : Dorbin
    Script Date    : 2022.05.09 11:05:46
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SpawnSet(NPC, "mood_state", 11852)
    SpawnSet(NPC, "visual_state", "11420")
    AddTimer(NPC, 4000, "EmoteLoop")
end

function hailed(NPC, Spawn)

end

function respawn(NPC)
    spawn(NPC)
end

function EmoteLoop(NPC)
    SpawnSet(NPC, "action_state", 0)
    local choice = MakeRandomInt(1,10)

        if choice == 1 then
            PlayFlavor(NPC,"","","bostaff_attack")
            AddTimer(NPC, 2100, "Idle")
        elseif choice == 2 then
            PlayFlavor(NPC,"","","bostaff_attack01")
            AddTimer(NPC, 1700, "Idle")
        elseif choice == 3 then
            PlayFlavor(NPC,"","","bostaff_attack02")
            AddTimer(NPC, 2400, "Idle")
        elseif choice == 4 then
            PlayFlavor(NPC,"","","bostaff_attack03")
            AddTimer(NPC, 3200, "Idle")
        elseif choice == 5 then
            PlayFlavor(NPC,"","","bostaff_kick")
            AddTimer(NPC, 3700, "Idle")
        elseif choice == 6 then
            PlayFlavor(NPC,"","","bostaff_dodge_forehand")
            AddTimer(NPC, 1500, "Idle")
        else
            PlayFlavor(NPC,"","","bostaff_taunt_combat_art")
            AddTimer(NPC, 3500, "Idle")
        end
end

function Idle(NPC)
    PlayAnimation(NPC, 101) 
    SpawnSet(NPC, "action_state", 101)

    local timer = MakeRandomInt(500,1400)
    AddTimer(NPC, timer, "EmoteLoop")
end