--[[
    Script Name    : Spells/Fighter/Brawler/MartialFocus.lua
    Script Author  : LordPazuzu
    Script Date    : 9/2/2023
    Script Purpose : 
                   : 
--]]

function cast(Caster, Target, DefSkills)
    AddSkillBonus(Caster, GetSkillIDByName("Parry"), DefSkills)
    AddSkillBonus(Caster, GetSkillIDByName("Deflection"), DefSkills)
end

function remove(Caster, Target, MaxVal)
     RemoveSkillBonus(Caster)
end