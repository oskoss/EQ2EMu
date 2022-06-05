--[[
    Script Name    : Spells/Commoner/RujarkianDestrierGreenSaddle.lua
    Script Author  : Skywalker646
    Script Date    : 2020.04.30 08:04:22
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
--Summons a mount to ride    
SetMount(Caster, 6835)
SetMountColor(Caster, 10, 10, 10, 154, 205, 50)

-- Increases your ground speed by 130%    
AddSpellBonus(Caster, 611, Speed)
-- Increase Focus, Crushing, Piercing & Slashing of caster by 4.75
    AddSkillBonus(Caster, GetSkillIDByName("Focus"), SkillAmt)
 AddSkillBonus(Caster, GetSkillIDByName("Slashing"), SkillAmt)
 AddSkillBonus(Caster, GetSkillIDByName("Piercing"), SkillAmt)
 AddSkillBonus(Caster, GetSkillIDByName("Crushing"), SkillAmt)
end


function remove(Caster, Target)
SetMount(Caster, 0)
    RemoveSpellBonus(Caster)
    RemoveSkillBonus(Caster)
end