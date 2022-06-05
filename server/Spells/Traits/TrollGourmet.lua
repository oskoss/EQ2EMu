--[[
    Script Name    : Spells/Traits/TrollGourmet.lua
    Script Author  : neatz09
    Script Date    : 2020.12.18 01:12:17
    Script Purpose : 
                   : 
--]]

-- Increases Artistry of caster by 5.0

function cast(Caster, Target, SkillAmt)
    AddSkillBonus(Target, GetSkillIDByName("Artistry"), SkillAmt)
end

function remove(Caster, Target)
    RemoveSkillBonus(Target)
end