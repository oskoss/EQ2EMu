--[[
    Script Name    : Spells/Commoner/BrownMistrunnerWargOrangeArmor.lua
    Script Author  : Skywalker646
    Script Date    : 2020.03.30 07:03:59
    Script Purpose : 
                   : 
--]]

function precast(Caster)
 if GetMount(Caster) > 0 then
        return false
    end

    return true
end

-- Summons a mount to ride that increases your ground speed by 130%
function cast(Caster, Target, Speed, SkillAmt, Dmg)   
-- Summons a mount
SetMount(Caster, 7242)
SetMountColor(Caster, 153, 76, 0, 255, 100, 0)


--Increases your ground speed by 130%
    AddSpellBonus(Caster, 611, Speed)
--Increases your Crushing, Disruption, Piercing, Slashing and Ranged by 7.0
    AddSkillBonus(Caster, GetSkillIDByName("Crushing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Disruption"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Piercing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Slashing"), SkillAmt)
    AddSkillBonus(Caster, GetSkillIDByName("Ranged"), SkillAmt)
--Increases damage done by spells and combat arts by upto 75.
    AddSpellBonus(Caster, 704, Dmg)
end

function remove(Caster, Target)
SetMount(Caster, 0)   
RemoveSpellBonus(Caster)
    RemoveSkillBonus(Caster)

end