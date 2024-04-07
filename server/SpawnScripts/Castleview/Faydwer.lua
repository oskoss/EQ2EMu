--[[
    Script Name    : SpawnScripts/Castleview/Faydwer.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.21 03:09:04
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
end

function casted_on(NPC, Spawn, SpellName)
  if SpellName == 'Nuzzle' then
        local choice = MakeRandomInt(1,4) 
        if choice == 1 then
            FaceTarget(NPC,Spawn)
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_02.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 2 then
            FaceTarget(NPC,Spawn)
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_01.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 3 then
            FaceTarget(NPC,Spawn)
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_03.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 4 then
        PlaySound(NPC,"sounds/critters/cat/cat_happy001.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        end      
    end
end

function respawn(NPC)
	spawn(NPC)
end