--[[
    Script Name    : Spells/Commoner/WarBardingGrayCavalryHorse.lua
    Script Author  : Skywalker646
    Script Date    : 2020.01.02 08:01:05
    Script Purpose : 
                   : 
--]]

function precast(Caster)
 if GetMount(Caster) > 0 then
        return false
    end

    return true
end

function cast(Caster, Target, Speed, SkillAmt)
-- Summons a mount to ride
SetMount(Caster, 6840)
SetMountColor(Caster, 111, 111, 111, 55, 55, 55)
-- increases your speed by 135%
AddSpellBonus(Caster, 611, Speed)
-- Increases Focus, Crushing, Piercing, Slashing and Ranged of caster by 7
    AddSkillBonus(Caster, GetSkillIDByName("Focus"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Crushing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Piercing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Slashing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Ranged"), SkillAmt)
end

function remove(Caster, Target)
    RemoveSpellBonus(Caster)
    RemoveSkillBonus(Caster)
SetMount(Caster, 0)
end

