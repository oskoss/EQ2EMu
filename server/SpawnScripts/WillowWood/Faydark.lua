--[[
    Script Name    : SpawnScripts/WillowWood/Faydark.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.21 03:09:33
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function casted_on(NPC, Spawn, SpellName)
  if SpellName == 'Nuzzle' then
      FaceTarget(NPC,Spawn)
        local choice = MakeRandomInt(1,6) 
        if choice == 1 then
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_01.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 2 then
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_02.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 3 then
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_03.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 4 then
        PlaySound(NPC,"sounds/widgets/alarms_clues_traps/alarm_cat_meow1_04.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 5 then
        PlaySound(NPC,"sounds/critters/cat/cat_happy001.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        elseif choice == 6 then
        PlaySound(NPC,"sounds/critters/cat/cat_happy001.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
        end      
    end
end

function respawn(NPC)
	spawn(NPC)
end