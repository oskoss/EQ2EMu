--[[
    Script Name    : Spells/Commoner/BlackSpottedWargwithBlackArmor.lua
    Script Author  : Skywalker646
    Script Date    : 2019.12.09 09:12:49
    Script Purpose : 
                   : 
--]]

-- Summons a mount to ride that increases your ground speed by 130%
function precast(Caster)
 if GetMount(Caster) > 0 then
        return false
    end

    return true
end

function cast(Caster, Target, Speed, SkillAmt, Dmg)   
-- Summons a mount
SetMount(Caster, 7220)
SetMountColor(Caster, 0, 0, 0, 0, 0, 0)
--Increases your ground speed by 130%
    AddSpellBonus(Caster, 611, Speed)
--Increases your Crushing, Disruption, Piercing, Slashing and Ranged by 7.0
    AddSkillBonus(Caster, GetSkillIDByName("Crushing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Disruption"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Piercing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Slashing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Ranged"), SkillAmt)
--Increases damage done by spells and combat arts by upto 50.
    AddSpellBonus(Caster, 704, Dmg)
end

function remove(Caster, Target)
SetMount(Caster, 0)   
RemoveSpellBonus(Caster)
    RemoveSkillBonus(Caster)

end
