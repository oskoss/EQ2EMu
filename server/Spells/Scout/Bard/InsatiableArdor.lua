--[[
    Script Name    : Spells/Scout/Bard/InsatiableArdor.lua
    Script Author  : LordPazuzu
    Script Date    : 3/29/2024
    Script Purpose : 
                   : 
--]]

-- Increases Defense of group members (AE) by 4.9

function cast(Caster, Target, SkillAmt)
	AddSkillBonus(Target, GetSkillIDByName("Parry"), SkillAmt)
end

function remove(Caster, Target)
    RemoveSkillBonus(Target)
end