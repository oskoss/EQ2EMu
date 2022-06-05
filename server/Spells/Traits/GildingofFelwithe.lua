--[[
    Script Name    : Spells/Traits/GildingofFelwithe.lua
    Script Author  : neatz09
    Script Date    : 2020.12.19 02:12:10
    Script Purpose : 
                   : 
--]]

-- Increases Artificing of caster by 5.0

function cast(Caster, Target, SkillAmt)
    AddSkillBonus(Target, GetSkillIDByName("Artificing"), SkillAmt)
end

function remove(Caster, Target)
    RemoveSkillBonus(Target)
end